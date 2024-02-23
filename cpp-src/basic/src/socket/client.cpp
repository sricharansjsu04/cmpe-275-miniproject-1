#include <iostream>
#include <sstream>
#include <stdexcept>
#include <cstring> // for strerror
#include <cerrno>  // for errno
#include <unistd.h> // for close
#include <arpa/inet.h> // for inet_pton
#include <sys/socket.h>

#include "client.hpp" // Adjust this include path as needed
#include "payload/basicbuilder.hpp" // Adjust this include path as needed

namespace basic {

BasicClient::BasicClient(std::string name, std::string ipaddr, unsigned int port) : name(std::move(name)), ipaddr(std::move(ipaddr)), portN(port), good(false), clt(-1) {
    if (this->portN <= 1024) {
        throw std::out_of_range("Port must be greater than 1024");
    }
}

void BasicClient::connect() {
    if (this->good) return;

    this->clt = ::socket(AF_INET, SOCK_STREAM, 0);
    if (this->clt == -1) {
        throw std::runtime_error("Socket creation failed: " + std::string(strerror(errno)));
    }

    struct sockaddr_in serv_addr;
    std::memset(&serv_addr, 0, sizeof(serv_addr));
    serv_addr.sin_family = AF_INET;
    serv_addr.sin_port = htons(this->portN);

    if (inet_pton(AF_INET, this->ipaddr.c_str(), &serv_addr.sin_addr) <= 0) {
        throw std::runtime_error("Invalid address/ Address not supported");
    }

    if (::connect(this->clt, (struct sockaddr *)&serv_addr, sizeof(serv_addr)) < 0) {
        throw std::runtime_error("Connection Failed: " + std::string(strerror(errno)));
    }

    this->good = true;
    std::cout << "Connected to the server successfully." << std::endl;
}

bool  BasicClient::isConnected() {
    return this->good;
}

void BasicClient::sendMessage(const std::string& message) {
    if (!this->good) {
        std::cerr << "Connection is not established." << std::endl;
        return;
    }

    BasicBuilder builder;
    auto msg = builder.encode(Message(name, "tricode", message));
    ssize_t totalSent = 0;
    size_t msgLength = msg.size();
    while (totalSent < msgLength) {
        
        std::cout<< " message sending "<< msg.c_str();
        ssize_t sent = ::send(this->clt, msg.c_str() + totalSent, msgLength - totalSent, 0);
        if (sent == -1) {
            throw std::runtime_error("Send failed: " + std::string(strerror(errno)));
        }
        totalSent += sent;
    }
}

void BasicClient::stop() {
    if (this->clt != -1) {
        ::close(this->clt);
        this->clt = -1;
        this->good = false;
        std::cout << "Connection closed." << std::endl;
    }
}

} // namespace basic
