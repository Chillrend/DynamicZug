package com.chillrend.zugticket;

import com.itextpdf.text.DocumentException;
import com.itextpdf.text.Image;
import com.itextpdf.text.pdf.AcroFields;
import com.itextpdf.text.pdf.PdfReader;
import com.itextpdf.text.pdf.PdfStamper;
import com.itextpdf.text.pdf.PushbuttonField;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.net.MalformedURLException;
import java.net.URL;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

@WebServlet(name = "printPass")
public class printPass extends HttpServlet {
    Connection conn;
    Statement stmt;
    Statement stot;
    Statement stat;
    HttpSession session;
    String paths = "/resource/reiseticket.pdf";
    String price = null;
    PdfReader reader;
    PdfStamper stamper;
    OutputStream streamToResponse = new ByteArrayOutputStream();
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String inv_id = request.getParameter("id");
        session = request.getSession();
        String uname = (String) session.getAttribute("username");
        try{
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/trendb", "akar", "akarpohon");
            stmt = conn.createStatement();
            stot = conn.createStatement();
                stat = conn.createStatement();

            ResultSet res = stmt.executeQuery("SELECT * FROM invoicepass WHERE inv_id ='" + inv_id +"';");
            while(res.next()){
                String suuids = res.getString("inv_id");
                String pass_id = res.getString("pass_id");
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
                URL url = cl.getResource("resource/reiseticket.pdf");

                try {
                    reader = new PdfReader(cl.getResource("resource/reiseticket.pdf"));
                    stamper = new PdfStamper(reader,streamToResponse);
                }catch(IOException iox){
                    iox.printStackTrace();
                }catch(DocumentException docx){
                    docx.printStackTrace();
                }
                AcroFields form = stamper.getAcroFields();

                form.setField("uuid",suuids);
                ResultSet ros = stot.executeQuery("SELECT name FROM user WHERE username = '" + uname + "';");
                while(ros.next()){
                    form.setField("PassengerName", ros.getString(1));
                }
                form.setField("Identification", res.getString("identification"));
                form.setField("FirstDay", res.getDate("date_start").toString());
                form.setField("LastDay", res.getDate("date_end").toString());
                form.setField("Country", res.getString("country"));
                form.setField("issued", res.getDate("date_issued").toString());
                form.setField("Validity", res.getDate("valid_until").toString());
                ResultSet rus = stat.executeQuery("SELECT name,price FROM railpass WHERE id='" + pass_id +"';");
                while(rus.next()){
                    form.setField("PassName", rus.getString("name"));
                    form.setField("price", rus.getString("price"));
                }

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
        }catch(Exception e){
            e.printStackTrace();
        }
    }
}
