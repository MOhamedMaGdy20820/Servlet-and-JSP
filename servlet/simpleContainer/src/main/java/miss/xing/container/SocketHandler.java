package miss.xing.container;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.net.Socket;
import java.sql.SQLOutput;
import java.time.LocalDateTime;
import java.util.Map;

public class SocketHandler extends Thread{

    private Socket socket;
    private  Map<String ,Httpservlet> handlers;

    public SocketHandler(Socket socket,Map<String ,Httpservlet> handlers) {
        this.socket = socket;
        this.handlers=handlers;
    }

    @Override
    public void run() {
        BufferedReader in = null;   // قارء موقت
        try {
            in = new BufferedReader(new InputStreamReader(socket.getInputStream()));
            Request request = new Request(in);

            if(!request.parse()){
                PrintWriter out = new PrintWriter(socket.getOutputStream());
                out.println("HTTP/1.1 500 Internal Server Error");
                out.println("Content-Type: text/plain");
                out.println();
                out.println("<html><body> Cannot process your request </body></html>");
                out.flush();                                       //  اخراج بعض المعلومات للكلاينت
            }
            else {

                Httpservlet servlet = handlers.get(request.getPath());

                if(servlet==null){

                    PrintWriter  out = new PrintWriter(socket.getOutputStream());
                    out.println("HTTP/1.1 404 Not Found");
                    out.println("Content-Type: text/html");
                    out.println();// \r\n
                    out.println("<html><body>Not Servlet handle your request</body></html>");
                    out.flush();
                }
                else {
                    Response response = new Response(socket.getOutputStream());
                    PrintWriter  out =response.getPrintWriter();


                    out.println("HTTP/1.1 200 OK");
                    out.println("Content-Type: text/html");
                    out.println();// \r\n
                   /* out.println("<html><body>Current Time:   ");
                    out.println(LocalDateTime.now());
                    out.println("</body></html>");*/

                    servlet.service(request,response);
                    out.flush();


                }
            }


           /* String line = in.readLine();
            while (!line.isEmpty()) {
                System.out.println(line);
                line = in.readLine();
            }    */                                               // قرائه المعلومات اللي جايه من الكلاينت

            // في ال console
           /* System.out.println("Method: "+request.getMethod());
            System.out.println("Path: " +request.getPath());
            request.getRequestParameters().forEach((key,value)-> System.out.println("param name: "+key+" param value: "+value));
            request.getHeaders().forEach((key,value)-> System.out.println("header name: "+key+" header value: "+value));
*/
            // في ال browser
                                          //  اخراج بعض المعلومات للكلاينت


        } catch (IOException e) {
            throw new RuntimeException(e);
        } finally {
            try {
                socket.close();
            } catch (IOException e) {
                throw new RuntimeException(e);
            }
        }


    }
}
