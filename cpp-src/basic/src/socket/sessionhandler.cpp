
#include <iostream>
#include <sstream>
#include <thread>
#include <sys/socket.h>
#include <unistd.h>
#include <string>
#include <cstring>
#include <algorithm>

#include "socket/sessionhandler.hpp"
#include "payload/basicbuilder.hpp"


   void basic::Session::incr(unsigned int by) {
      if (by > 0) this->count += by;
   }

   basic::Session::Session(const basic::Session& s) : fd(s.fd), count(s.count) {}

   basic::Session& basic::Session::operator=(const Session& from) {
      this->fd = from.fd; 
      this->count = from.count;
      return *this;
   }

  basic::SessionHandler::SessionHandler() {
         this->good = true;
         this->refreshRate = 0;
   }

   void basic::SessionHandler::stop() {
      this->good = false;
      for (auto& sitr : this->sessions) {
         Session& session = sitr;
         try {if (session.fd >= 0) ::close(session.fd);} catch (...) {}
         session.fd = -1;
      }
      this->sessions.clear();

      // wait for the thread to complete before ending
      try {this->sessionThread->join();} catch (...) {}
   } 

   void basic::SessionHandler::start() {
      // C++17 lambda dependent
      this->sessionThread = std::make_shared<std::thread>([this]{run(); });
   }

   void basic::SessionHandler::addSession(int sessionSock) {
      this->sessions.emplace_back(std::move(Session(sessionSock,0)));
   }

   /**
    * 
   */
   void basic::SessionHandler::run() {
      while (this->good) {
         auto idle = true;
         try {
            idle=cycle();
         } catch (const std::exception &e) {
            // for purposes of the lab only. Normally, we would
            // try to manage (contain) the error and continue running.
            std::cerr << "---> aborting handler failure: " << e.what() << std::endl;
            if (sDebug > 0) std::abort();
         }

         // This is a hook for adaptive polling strategies. You can
         // experiment with priorization and fairness algorithms.
         optimizeAndWait(idle);
      }
   }

   /**
    * 
   */
   bool basic::SessionHandler::cycle() {
      bool idle = true;
      char raw[2048] = {0};
      for (auto& session : this->sessions ) {
         if (session.fd == -1) continue;

         /*
            important errno values:
            35 (EWOULDBLOCK)  - nonblocking mode, no data is available (not an error)
            38 (ENOTSOCK)     - socket descriptor (fd) is not valid
            42 (EPROTOTYPE)   - socket option not supported
            54 (ECONNRESET)   - connection not available (bad)
            60 (ETIMEDOUT)    - connection (read) timed out (maybe bad)

            Ref: https://www.ibm.com/docs/en/zos/2.2.0?topic=errnos-sockets-return-code
         */

         // reusable buffer to minimize memory fragmentation
         std::memset(raw,0,2048);

         //auto n = ::recv(session.fd,raw,Session::sOFSize-1,0);
         auto n = ::read(session.fd,raw,2047);

         if ( sDebug > 0 && n > 0 ) {
            std::cerr << "---> session " << session.fd << " got n = " 
                        << n << ", errno = " << errno << std::endl;
         }
         
         if (n > 0) {
            idle = false;
            // std::cout << "Raw is" << raw;
            raw[n] = '\0';
            auto results = splitter(session,raw,n);
            session.incr(results.size());
            process(results);
            results.clear();
         } else if (n == -1) {
            if (errno == EWOULDBLOCK) {} /*read timeout - okay*/
            else if (errno == ECONNRESET) {
               std::cerr << "--> a session was closed, [id: " 
                           << session.fd << ", cnt: " << session.count 
                           << "]" << std::endl;
               
               // ref: https://en.wikipedia.org/wiki/Erase–remove_idiom
               auto xfd = session.fd;
               this->sessions.erase(std::remove_if(this->sessions.begin(), 
                                    this->sessions.end(), [&xfd](const Session& s) {
                                       return s.fd == xfd;}),this->sessions.end());
               idle = false;
               break;
            }
         } else {
            // no data
         } 
      }

      return idle;
   }

   /**
    * 
   */
   void basic::SessionHandler::process(const std::vector<std::string>& results) {
      if (results.size() == 3) {
        basic::BasicBuilder b;
        auto m = b.decode(results[0] + "," + results[1] + "," + results[2]);
        
        // Now do something with the message
        std::cerr << "M: [" << m.group() << "] " << m.name() << " - " << m.text() << std::endl;
        std::cerr.flush();
    }
   }

   /**
    * 
   */
   void basic::SessionHandler::optimizeAndWait(bool idle) {

      // if (optimize) {
      //    // todo add code to optimize processing
      // }
      
      if (idle) {
         // gradually slow down polling while no activity
         if (this->refreshRate < 3000) this->refreshRate += 250;
      
         if (sDebug > 0) {
            std::cerr << this->sessions.size() << " sessions, sleeping " 
                      << this->refreshRate << " ms..." << std::endl;
         }

         std::this_thread::sleep_for(std::chrono::milliseconds(this->refreshRate));
      } else 
         this->refreshRate = 0;
   }

   /**
    * 
   */
   // splitter method
std::vector<std::string> basic::SessionHandler::splitter(Session& s, const char* raw, int len) {
    std::vector<std::string> results;
    if (raw == NULL || len <= 0) return results;



    std::string buffer(raw, len); // Construct a string from the raw char array
    std::istringstream stream(buffer);
    std::string segment;

   //  std::cout<< " Raw message is splitter is"<< raw << "\n";

    // Split the message by commas
    while (std::getline(stream, segment, ',')) {
        results.push_back(segment);
    }

    std::cout<< " result is "<< results[0] << "\n";


    // Check for a valid message
    if (results.size() != 3) {
        std::cerr << "Invalid message format: " << buffer << std::endl;
        results.clear(); // Clear results to indicate an invalid message
    }

    return results;
}
