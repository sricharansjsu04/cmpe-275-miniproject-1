package gash.socket;

import java.io.BufferedInputStream;
import java.io.IOException;
import java.io.InterruptedIOException;
import java.net.Socket;

import gash.payload.BasicBuilder;
import gash.payload.Message;


/**
 * 
 * @author gash
 * 
 */
public class SessionHandler extends Thread {
    private Socket connection;

    public SessionHandler(Socket connection) {
        this.connection = connection;
        this.setDaemon(true); // Allow server to exit if this is the only thread running
    }

    public void run() {
        System.out.println("Session " + this.getId() + " started");
        try {
        //   connection.setSoTimeout(2000);
            var in = new BufferedInputStream(connection.getInputStream());

            byte[] raw = new byte[2048];
            BasicBuilder builder = new BasicBuilder();

            int len;
            while ((len = in.read(raw)) != -1) {
                if (len > 0) {
                    Message msg = builder.decode(new String(raw, 0, len).getBytes());
                    System.out.println(msg);
                }
            }
        } catch (IOException e) {
            System.err.println("Session " + this.getId() + " I/O error: hello  " + e.getMessage());
        } catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
            System.out.println("Session " + this.getId() + " ending");
            stopSession();
        }
    }

    public void stopSession() {
        if (connection != null) {
            try {
                connection.close();
            } catch (IOException e) {
                System.err.println("Error closing connection in session " + this.getId() + ": " + e.getMessage());
            }
        }
    }
}
