package gash.app;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.IOException;

import gash.socket.BasicClient;

public class ClientApp {
    public ClientApp() {
    }

    public static void main(String[] args) {
        var myClient = new BasicClient("app", "127.0.0.1", 2000);
        myClient.connect();

        // Check if the client is connected before proceeding
        if (myClient.isConnected()) {
            myClient.join("tricode");

            try (var br = new BufferedReader(new InputStreamReader(System.in))) {
                while (true) {
                    System.out.print("\nenter ('exit' to quit): ");
					
                    var m = br.readLine();
                    if (m == null || "exit".equalsIgnoreCase(m)) {
                        System.out.println("Exiting...");
                        break;
                    }

                    if (!m.isEmpty()) {
						if(!myClient.isConnected())
						{
							System.out.println("You have been disconnected. Would you like to reconnect? (y/n): ");
							String answer = br.readLine();
							if ("y".equalsIgnoreCase(answer)) {
								myClient = new BasicClient("java-client", "127.0.0.1", 2000);
								myClient.connect();
								if (myClient.isConnected()) {
									System.out.println("Reconnected to the server.");
									myClient.join("tricode");
								} else {
									System.out.println("Failed to reconnect to the server.");
									break;
								}
							} else {
								System.out.println("Exiting due to disconnection...");
								break;
							}
						}
						long startTime = System.nanoTime();
                        myClient.sendMessage(m);
						long endTime = System.nanoTime();
						long latency = (endTime - startTime) / 1_000_000;
						System.out.println("Message send latency: " + latency + " ms");
                    } else {
                        System.out.println("Message is empty, try again.");
                    }
                }
            } catch (IOException e) {
                System.err.println("Error reading from input: " + e.getMessage());
            } finally {
                myClient.stop(); // Ensure the client is stopped and resources are freed
            }
        } else {
            System.out.println("Failed to connect to the server.");
        }
    }
}
