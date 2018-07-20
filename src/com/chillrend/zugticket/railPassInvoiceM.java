package com.chillrend.zugticket;

import com.itextpdf.text.BadElementException;
import com.itextpdf.text.DocumentException;
import com.itextpdf.text.Image;
import com.itextpdf.text.pdf.AcroFields;
import com.itextpdf.text.pdf.PdfReader;
import com.itextpdf.text.pdf.PdfStamper;
import com.itextpdf.text.pdf.PushbuttonField;
import org.apache.commons.io.IOUtils;
import org.apache.commons.lang3.time.DateUtils;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.*;
import java.net.MalformedURLException;
import java.net.URL;
import java.nio.file.Files;
import java.sql.*;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.UUID;

@WebServlet(name = "railPassInvoiceM")
public class railPassInvoiceM extends HttpServlet {
    Connection conn;
    PreparedStatement stmt;
    Statement stat;
    Statement stot;
    Statement stet;
    HttpSession session;
    String paths = "/resource/reiseticket.pdf";
    String price = null;
    PdfReader reader;
    PdfStamper stamper;
     PdfReader reader2;
    PdfStamper stamper2;
    OutputStream streamToResponse = new ByteArrayOutputStream();
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
         railpasscontainer varContainer = new railpasscontainer();
        int konter = 0;
        session = request.getSession();
        String passName = "is this pass";
        String days = (String) session.getAttribute("days");
        ArrayList<String> passengerName = (ArrayList<String>)session.getAttribute("passengerName");
        ArrayList<String> identification = (ArrayList<String>)session.getAttribute("identification");
        String countryOrigin = (String) session.getAttribute("countryOrigin");
        String dateStart = (String) session.getAttribute("dateStart");
        int htm = (Integer) session.getAttribute("htm");
        for (int b=0;b<=htm;b++){
        try {
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/trendb", "akar", "akarpohon");
            stmt = conn.prepareStatement("INSERT INTO invoicepass VALUES (?,?,?,?,?,?,?,?,?)");
            stat = conn.createStatement();
            stet = conn.createStatement();
            stot = conn.createStatement();
            String SUUID = UUID.randomUUID().toString();
            stmt.setString( 1, SUUID);
            stmt.setString(2, (String) session.getAttribute("username"));
             stmt.setString(3, Integer.toString(9));

            stmt.setString(4, dateStart);

                 stmt.setString(5, dateStart);
                      stmt.setString(6, dateStart);
            stmt.setDate(7, new java.sql.Date(new Date().getTime()));
            stmt.setString(8, countryOrigin);
            stmt.setString(9, identification.get(konter));

            int i = stmt.executeUpdate();
            
    
            if(i>0){
                ResultSet res = stat.executeQuery("SELECT * FROM invoicepass WHERE inv_id='" + SUUID + "';");
                while(res.next()){
                    String serverIP = request.getLocalAddr();
                    String suuide = res.getString("inv_id");
                    String suuids = "http://" + serverIP + ":8080/DynamicZug/activate.jsp?suuid=" + suuide;
                    qrgenerate qrGen = new qrgenerate();

                    byte[] qrcode = qrGen.getQr(suuids,50,50);

                    Image qrImage = null;
                    try{
                        qrImage = Image.getInstance(qrcode);
                    }catch(MalformedURLException malform){
                        malform.printStackTrace();
                    }catch (IOException io){
                        io.printStackTrace();
                    }

                    ClassLoader cl = getClass().getClassLoader();
                    URL url = cl.getResource("resource/reiseticket"+konter+".pdf");

                    try {
                        reader = new PdfReader(cl.getResource("resource/reiseticket"+konter+".pdf"));
                        stamper = new PdfStamper(reader,streamToResponse);
                    }catch(IOException iox){
                        iox.printStackTrace();
                    }catch(DocumentException docx){
                        docx.printStackTrace();
                    }
                    AcroFields form =  stamper.getAcroFields();

                    form.setField("uuid",suuide);
                    form.setField("PassengerName", passengerName.get(konter));
                    form.setField("Identification", identification.get(konter));
                    form.setField("FirstDay", res.getDate("date_start").toString());
                    form.setField("LastDay", res.getDate("date_end").toString());
                    form.setField("Country", res.getString("country"));
                    form.setField("issued", res.getDate("date_issued").toString());
                    form.setField("Validity", res.getDate("valid_until").toString());
                    form.setField("PassName", "test");
                    form.setField("price", "255");

                    PushbuttonField ad = form.getNewPushbuttonFromField("imagebtn");
                    ad.setLayout(PushbuttonField.LAYOUT_ICON_ONLY);
                    ad.setProportionalIcon(true);
                    ad.setImage(qrImage);
                    form.replacePushbuttonField("imagebtn", ad.getField());

                    stamper.setFormFlattening(true);
                    stamper.close();


                    response.setContentType("application/pdf");
                    response.getOutputStream().write(((ByteArrayOutputStream)streamToResponse).toByteArray());
               
                }
         
            }else{
                // Do Something if insert fails
            }

        }
        catch(Exception E){
                              response.setContentType("text/html");
    PrintWriter out = response.getWriter();
        
            out.println(E);
            out.println(dateStart);
        }
        konter++;
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
