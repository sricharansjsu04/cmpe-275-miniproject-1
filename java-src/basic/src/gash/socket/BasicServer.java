package gash.socket;

import java.io.IOException;
import java.net.ServerSocket;
import java.net.Socket;
import gash.socket.SessionHandler;

/**
 * server to manage incoming clients
 * 
 * @author gash
 * 
 */
public class BasicServer {
    private String host;
    private int port;
    private ServerSocket socket;
    private boolean forever = true;

    public BasicServer(String host, int port) {
        this.host = host;
        this.port = port;
    }

    public void start() {
        try {
            socket = new ServerSocket(port);
            System.out.println("Server Host: " + socket.getInetAddress().getHostAddress());

            while (forever) {
                try {
                    Socket s = socket.accept();
                    System.out.println("--> server got a client connection");
                    var sh = new SessionHandler(s);
                    sh.start();
                } catch (IOException e) {
                    System.err.println("Exception accepting client connection: " + e.getMessage());
                    if (!forever) break; // Exit if server is stopping
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            stopServer(); // Ensure resources are released
        }
    }

    public void stopServer() {
        forever = false;
        if (socket != null && !socket.isClosed()) {
            try {
                socket.close();
            } catch (IOException e) {
                System.err.println("Error closing server socket: " + e.getMessage());
            }
        }
    }
}
