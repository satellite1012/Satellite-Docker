package main.java.Controllers;
//Author: Doan Duc Tin

import org.json.JSONObject;
import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.nio.charset.StandardCharsets;

public class Validation {

    public static void validateToken(String s) throws Exception{
        if (s==null) throw new Exception("Please using the API to perform this action");
        String[] temp=s.split("/");
        String urlAuthorize=temp[2].replaceAll("/","");
        if (!(
            urlAuthorize.equalsIgnoreCase("satellite-fpt.azurewebsites.net")||
            urlAuthorize.equalsIgnoreCase("localhost:8080")))
            throw new Exception("This request is not authorize, make sure you using the HTTPS LINK");
    }

    public static void validateString(String a) throws Exception {
        if (a == null || a.equals("")) {
            throw new Exception("Không được để trống các trường");
        }
        if (a.contains("<") || a.contains(">") || a.contains("\"") || a.contains("'") || a.contains("`")) {
            throw new Exception("Bạn không được nhập các ký tự [\",\"]|[',']|[<,>]");
        }
    }

    public static void validateNumber(String a, int min, int max) throws Exception {
        if (!a.matches("[0-9]+")) {
            throw new Exception("Chỉ được nhập số");
        }
        int temp = Integer.parseInt(a);
        if (temp < min || temp > max) {
            throw new Exception("Bạn đã nhập số quá lớn hoặc quá nhỏ so với giới hạn [" + min + " - " + max + "]");
        }
    }

    public static void validatePhone(String a) throws Exception {
        if ((!a.matches("[0-9]+"))||(a.length()<9)||(a.length()>11)) {
            throw new Exception("Số điện thoại của bạn hơi lạ");
        }
    }
    public static void validateEmpty(String a) throws Exception {
        if (a == null || a.equals("")) {
            throw new Exception("Không được để trống các trường");
        }
    }

    public synchronized boolean isCaptchaValid(String secretKey, String response) {
        try {
            String url = "https://www.google.com/recaptcha/api/siteverify",
                    params = "secret=" + secretKey + "&response=" + response;

            HttpURLConnection http = (HttpURLConnection) new URL(url).openConnection();
            http.setDoOutput(true);
            http.setRequestMethod("POST");
            http.setRequestProperty("Content-Type",
                    "application/x-www-form-urlencoded; charset=UTF-8");
            OutputStream out = http.getOutputStream();
            out.write(params.getBytes(StandardCharsets.UTF_8));
            out.flush();
            out.close();

            InputStream res = http.getInputStream();
            BufferedReader rd = new BufferedReader(new InputStreamReader(res, StandardCharsets.UTF_8));

            StringBuilder sb = new StringBuilder();
            int cp;
            while ((cp = rd.read()) != -1) {
                sb.append((char) cp);
            }
            JSONObject json = new JSONObject(sb.toString());
            res.close();

            return json.getBoolean("success");
        } catch (Exception e) {
            //e.printStackTrace();
        }
        return false;
    }
}
