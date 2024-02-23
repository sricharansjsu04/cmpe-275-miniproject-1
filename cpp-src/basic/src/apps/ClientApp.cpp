#include <iostream>
#include <string>
#include "socket/client.hpp" // Adjust this include path as needed
#include <chrono>

int main() {
    basic::BasicClient clt("cpp-client", "127.0.0.1", 2000);
    try {
        clt.connect();

        
        std::string message;
        auto start = std::chrono::high_resolution_clock::now();
        do {
            
            std::cout << "\nenter ('exit' to quit): ";
            std::getline(std::cin, message);

            if (message.empty()) {
                std::cout << "Message is empty, try again." << std::endl;
                continue;
            }

            if (message == "exit") {
                std::cout << "Exiting..." << std::endl;
                break;
            }

            std::cout<< " client status "<< clt.isConnected();

            // Use the 'good' variable or an equivalent getter method if 'isConnected' is not available
            if (!clt.isConnected()) { // This assumes 'good' is public. Adjust if it's private and has a getter.
                std::cout << "You have been disconnected. Would you like to reconnect? (y/n): ";
                std::string answer;
                std::getline(std::cin, answer);
                if (answer == "y") {
                    clt.connect();
                    if (!clt.isConnected()) { // Again, assuming 'good' is public.
                        std::cout << "Failed to reconnect to the server." << std::endl;
                        break;
                    }
                } else {
                    std::cout << "Exiting due to disconnection..." << std::endl;
                    break;
                }
            }

            clt.sendMessage(message);
            auto end = std::chrono::high_resolution_clock::now();
            std::chrono::duration<double, std::milli> latency = end - start;
            std::cout << "Latency: " << latency.count() << " ms" << std::endl;
        } while (true);
    } catch (const std::exception& e) {
        std::cerr << "Exception: " << e.what() << std::endl;
    }

    // 'clt' is in scope here because it was declared before the 'try' block
    clt.stop(); // Ensure the client is stopped and resources are freed regardless of how the loop exits
    return 0;
}
