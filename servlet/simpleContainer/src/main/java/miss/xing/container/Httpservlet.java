package miss.xing.container;

public abstract class Httpservlet {
     public void init(){
         System.out.println("HttpServlet Init Default Impl....");
     }


     public void service(Request request,Response response){  // TODO : Request , Response Object as Parameters
         String method = request.getMethod();
         if("GET".equals(method)){
             this.doGet(request,response);
         }else if("POST".equals(method)) {
             this.doPost(request, response);
         }else {
             throw new RuntimeException("Mehod not supported ");
         }
     }
     public void doGet(Request request,Response response){
         System.out.println("HttpServlet doGet Default Impl....");

     }

    public void doPost(Request request,Response response){
        System.out.println("HttpServlet doPost Default Impl....");

    }
    public void destory(){
        System.out.println("HttpServlet destory() Default Impl...");
    }
}
