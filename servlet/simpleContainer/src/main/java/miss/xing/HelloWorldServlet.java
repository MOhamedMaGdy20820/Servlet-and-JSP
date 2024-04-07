package miss.xing;

import miss.xing.container.Httpservlet;
import miss.xing.container.Request;
import miss.xing.container.Response;

import java.io.PrintWriter;

public class HelloWorldServlet extends Httpservlet {

    @Override
    public void init() {
        System.out.println("HelloWorldServlet init() called.....");
    }


    @Override
    public void doGet(Request request, Response response) {
        PrintWriter out = response.getPrintWriter();
        out.println("<html><body>");
        out.println("doGet() int hello worldServlet");
        out.println("</body></html>");
    }

    @Override
    public void destory() {
        System.out.println("clean up resources in HelloWorldServlet destory()....");
    }
}
