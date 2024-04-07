package miss.xing.container;

import java.io.BufferedReader;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

public class Request {

    private BufferedReader in;
    private String method;// get or post
    private String path;                                             //   V
    private Map<String ,String >RequestParameters = new HashMap<>();  // عشان اخزن فيها اجزاء ال url ذي   hello?user=missxxing&pwd=1234&birht=2010-10-10&country=Egypt
    private Map<String ,String >headers = new HashMap<>();



    public Request(BufferedReader in) {
        this.in = in;
    }

    public String getMethod() {
        return method;
    }

    public String getPath() {
        return path;
    }

    public Map<String, String> getHeaders() {
        return headers;
    }

    public Map<String, String> getRequestParameters() {
        return RequestParameters;
    }


    public String getRequestParameter(String name){
        return RequestParameters.get(name);
    }



    // فتمشت لمعالجه ال باث  hello?user=missxxing&pwd=1234&birht=2010-10-10&country=Egypt
    private void parseRequestParams(String queryString){
        for (String pair : queryString.split("&")){
            String [] pairArr = pair.split("=");
            RequestParameters.put(pairArr[0],pairArr[1]);
        }
    }


    public boolean parse() throws IOException {
        String line = in.readLine(); // GET /hello?user=missxxing&pwd=1234 http/1.1
        //                              |     |
        //                          method   path

        String [] firstLineArray =  line.split(" ");
        if(firstLineArray.length !=3) return false;

        // sitting
        method = firstLineArray[0];
        String url = firstLineArray[1];


        // GET /hello?user=missxxing&pwd=1234 http/1.1
        // GET /hello http/1.1

        // في بعض العنواوين بتبقي قصيره مش بيبقي فيها -1 ف ده عشان نشوف فيها ولا لا
        // url.indexOf("?") بتعرفني هيه موجوده في الاندكش الكام لو مش موجوده بترجع ب -1



        int queryStringIndex = url.indexOf("?");
        if(queryStringIndex>-1){
           path = url.substring(0,queryStringIndex);
           parseRequestParams(url.substring(queryStringIndex+1));
        }else {
            path = url;
        }

        while (!line.isEmpty()){  // for headers
            line = in.readLine(); // request headers
            // in   مش بعرف اقرا بيها البضي بتاع الطلب
            if(! "".equals(line)) {
                String[] headerPair = line.split(":");
                headers.put(headerPair[0], headerPair[1]);
            }
        }

        if("POST".equals(method)){   // for body
            StringBuilder body = new StringBuilder();
            while (in.ready()){
                body.append((char)in.read());
            }
 //           System.out.println(body.toString());
            parseRequestParams(body.toString());
        }







        // TODO: parse POST request body info into requrestparameters

        return true;
    }
}

