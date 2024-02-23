package gash.socket;

import java.io.IOException;
import java.net.ConnectException;
import java.net.Socket;
import java.net.SocketException;
import java.net.UnknownHostException;

import gash.payload.BasicBuilder;
import gash.payload.Message;

public class BasicClient {
    private String name;
    private String ipaddr;
    private int port;
    private String group = "public";

    private Socket clt;

    public BasicClient(String name) {
        this(name, "127.0.0.1", 2000);
    }

    public BasicClient(String name, String ipaddr, int port) {
        this.name = name;
        this.ipaddr = ipaddr;
        this.port = port;
    }

    public void stop() {
        if (this.clt != null) {
            try {
                this.clt.close();
            } catch (IOException e) {
                System.err.println("Error closing client socket: " + e.getMessage());
            }
        }
        this.clt = null;
    }

    public void join(String group) {
        this.group = group;
    }

	public boolean isConnected() {
		return this.clt != null && this.clt.isConnected() && !this.clt.isClosed();
	}
	
	public void reconnect() {
        stop(); // Close the current connection if any
        connect(); // Attempt to establish a new connection
    }

    public void connect() {
        if (this.clt != null) {
            return;
        }

        try {
            this.clt = new Socket(this.ipaddr, this.port);
            System.out.println("Connected to " + clt.getInetAddress().getHostAddress());
        } catch (UnknownHostException e) {
            System.err.println("Server not found: " + e.getMessage());
        } catch (ConnectException e) {
            System.err.println("Connection refused: " + e.getMessage());
        } catch (SocketException e) {
            System.err.println("Socket error: " + e.getMessage());
        } catch (IOException e) {
            System.err.println("I/O error: " + e.getMessage());
        }
    }

    public void sendMessage(String message) {
        if (this.clt == null ) {
            System.out.println("No connection, text not sent");
            return;
        }

        try {
            BasicBuilder builder = new BasicBuilder();
            byte[] msg = builder.encode(new Message(name, group, message)).getBytes();
            this.clt.getOutputStream().write(msg);
        } catch (IOException e) {
            System.err.println("Error sending message check below stack trace and error message:  " + e.getMessage());
			e.printStackTrace();
			System.err.println("Closing connection:");
            stop();
        }
    }
}
