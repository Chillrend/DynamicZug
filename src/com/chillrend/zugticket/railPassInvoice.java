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
import java.util.Calendar;
import java.util.Date;
import java.util.UUID;

@WebServlet(name = "railPassInvoice")
public class railPassInvoice extends HttpServlet {
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
    OutputStream streamToResponse = new ByteArrayOutputStream();
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        session = request.getSession();

        String passName = (String) session.getAttribute("passName");
        String days = (String) session.getAttribute("days");
        String passengerName = (String) session.getAttribute("passengerName");
        String identification = (String) session.getAttribute("identification");
        String countryOrigin = (String) session.getAttribute("countryOrigin");
        Date dateStart = (Date) session.getAttribute("dateStart");


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

            ResultSet rs = stat.executeQuery("SELECT id,name,price FROM railpass WHERE name='" + passName + "' AND days='" + days +"';");

            while(rs.next()){
                stmt.setString(3, rs.getString(1));
                price = rs.getString("price");
            }

            stmt.setDate(4, new java.sql.Date(dateStart.getTime()));

            Date dateEnd = DateUtils.addDays(dateStart,Integer.parseInt(days));

            stmt.setDate(5, new java.sql.Date(dateEnd.getTime()));
            stmt.setDate(6, new java.sql.Date(dateEnd.getTime()));
            stmt.setDate(7, new java.sql.Date(new Date().getTime()));
            stmt.setString(8, countryOrigin);
            stmt.setString(9, identification);

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

                    form.setField("uuid",suuide);
                    form.setField("PassengerName", passengerName);
                    form.setField("Identification", res.getString("identification"));
                    form.setField("FirstDay", res.getDate("date_start").toString());
                    form.setField("LastDay", res.getDate("date_end").toString());
                    form.setField("Country", res.getString("country"));
                    form.setField("issued", res.getDate("date_issued").toString());
                    form.setField("Validity", res.getDate("valid_until").toString());
                    form.setField("PassName", passName);
                    form.setField("price", price);

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

        }catch(Exception E){
            E.printStackTrace();
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
