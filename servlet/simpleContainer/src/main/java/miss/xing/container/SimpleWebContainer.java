package miss.xing.container;

import java.io.*;
import java.lang.reflect.InvocationTargetException;
import java.net.ServerSocket;
import java.net.Socket;
import java.util.HashMap;
import java.util.Map;
import java.util.Properties;

public class SimpleWebContainer {
    private final int port;
    private final String  configFileName;
    private Map<String ,Httpservlet> handlers = new HashMap<>();
    public SimpleWebContainer(int port,String configFileName){
        this.port=port;
        this.configFileName=configFileName;
    }
    private void start(){
        try {
            ServerSocket serverSocket = new ServerSocket(port); // بيعمل اتصال بالشبكه بتشأ سرقر
            while (true) {
                  Socket socket = serverSocket.accept();                // قبول طلب الاتصال ة هحفظ فيه بيانات الاتصال
                  Thread socketHandler = new SocketHandler(socket,handlers);     //
                  socketHandler.start();
            }
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    private void loadPropertiesFile() throws IOException { // step 4

        InputStream input = getClass().getClassLoader().getResourceAsStream(configFileName);
        if (input == null) {
            throw new RuntimeException("Unable to find file: " + configFileName);
        }
        Properties properties = new Properties();
        properties.load(input);

        properties.forEach((url, address) -> {
            System.out.println((String) address);
            Httpservlet servlet = getServletInstance((String) address);
            System.out.println("servlet" + servlet);
            servlet.init();
            handlers.put((String) url, servlet);
            // ببعت ل getServletInstance عنوان ال class
        });
    }

    private Httpservlet getServletInstance(String className){  // step 5
        // مهمه ال class دي ان ابعتلها عنوان ال class as string return to me httpservlet
        try {
            return (Httpservlet) Class.forName(className).getDeclaredConstructor().newInstance();
        } catch (InstantiationException e) {
            throw new RuntimeException(e);
        } catch (IllegalAccessException e) {
            throw new RuntimeException(e);
        } catch (InvocationTargetException e) {
            throw new RuntimeException(e);
        } catch (NoSuchMethodException e) {
            throw new RuntimeException(e);
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
        // ال class اللي اسمها class name حتلي الحاجات اللي جواها , حتلي منها نسخه جديده

    }

    public static void main(String[] args) throws IOException {
        SimpleWebContainer container = new SimpleWebContainer(8888,"config.properties");
        container.loadPropertiesFile();
       /* container.handlers.forEach((url,httpservlet)-> {
            System.out.println(url);
            httpservlet.doGet();
        });*/

        Runtime.getRuntime().addShutdownHook(new Thread(){

            @Override
            public void run() {
                container.handlers.forEach((url,servlet)-> servlet.destory());
            }
        });






        container.start();

    }
}










































