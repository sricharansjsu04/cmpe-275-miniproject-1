#include <iostream>
#include <sstream>
#include <iomanip>

#include "payload/basicbuilder.hpp"

std::vector<std::string> basic::BasicBuilder::split(const std::string& s) {
    std::vector<std::string> rtn;
    std::istringstream iss(s);
    std::string segment;

    while (std::getline(iss, segment, ',')) {
        rtn.push_back(segment);
    }

    return rtn;
}


std::string basic::BasicBuilder::encode(const basic::Message& m) {

   // payload
   std::string r = m.group();
   r += ",";
   r += m.name();
   r += ",";
   r += m.text();

   // a message = header + payload
   // std::stringstream ss;
   // ss << std::setfill('0') << std::setw(4) << r.length() 
   //    << "," << r; // NO! << std::ends;
   
   return r;
}

basic::Message basic::BasicBuilder::decode(std::string raw) {

   // std::cout<< "Decoding string  " << raw << "\n"; 
   auto parts = split(raw);
   if (parts.size() != 3) {
        throw std::runtime_error("Malformed message: " + raw);
    }
   basic::Message m(parts[1],parts[0],parts[2]);
   return m;
}

