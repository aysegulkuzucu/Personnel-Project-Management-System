<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.sql.Connection" %>
<%@page import="java.sql.DriverManager" %>
<%@page import="java.sql.SQLException" %>
<%@page import="java.util.logging.Level" %>
<%@page import="java.util.logging.Logger" %>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet" %>
<%@page import="java.util.ArrayList" %>


<html>
    <head>    
        <title>Personel/Proje İslemleri Takip Sistemi</title>		
        <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet"/>    
    </head>
    
    <style>
        img {
            display: block;
            margin-left: auto;
            margin-right: auto;
        }
    </style>  
        <div class="container">
            <img src="assets/img/logom.png" width="850" height="150" alt="bootraper logo" style="width:65%"></img>
             
        <div class="row">
            <div class="col-lg-11 offset-1">                    
                <ul class="nav nav-pills nav-fill">                  
                    <li class="nav-item">
                        <a class="nav-link active" href="yoneticiKaydol.jsp">Yönetici Olarak Kaydol</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link " href="personelKaydol.jsp">Personel Olarak Kaydol</a>
                    </li>                
                </ul>                       
            </div>           
        </div>
        
            <%   
                Connection con;     
                String msg = "";
                String color = "";
                if(request.getMethod().compareToIgnoreCase("post")==0)
   		{
                    try
                    {
                        String isim = request.getParameter("isim");
                        String soyisim = request.getParameter("soyisim");
                        String kullaniciAdi = request.getParameter("kullaniciAdi");
                        String email = request.getParameter("email");
                        String sifre = request.getParameter("sifre");
                        String adres = request.getParameter("adres");
                        String tel = request.getParameter("tel");



                        Class.forName("com.mysql.jdbc.Driver");
                        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ppyonetim","root","root");
                        String query = "INSERT INTO yoneticireg(isim,soyisim,kullaniciAdi,email,sifre,adres,tel) VALUES (?,?,?,?,?,?,?)";

                        PreparedStatement pst = con.prepareStatement(query);

                        pst.setString(1, isim);
                        pst.setString(2, soyisim);
                        pst.setString(3, kullaniciAdi);
                        pst.setString(4, email);
                        pst.setString(5, sifre);
                        pst.setString(6, adres);
                        pst.setString(7, tel);

                        pst.executeUpdate();

                        color = "green";
                        msg = "Yönetici Olarak Kaydınız Başarılya Gerçekleştirilmiştir. Artık Sisteme Giriş Yapabilirsiniz...";
	
   			}catch(Exception ex){
   				ex.printStackTrace();
   				color = "red";
   				msg = "Yönetici Olarak Kaydınız Oluşturulurken Beklenmedik Bir Sorun Çıktı, Daha Sonra Tekrar Deneyiniz...";
   			}
   		}
            %>       
    
            <div class="form-group">
                <h4 style="color:<%= color %>"><%= msg %></h4>
            </div>
            <div class="row">
                <div class="col-lg-11 offset-1 jumbotron">
                    <h3 class="text-primary">Yönetici Olarak Kaydol</h3><br />
       
                <form id="form" method="post" action="yoneticiKaydol.jsp" class="form-horizontal">
         	<hr/>
            
                    <div class="form-group">
                  	<label >İsminiz :</label>
  			<input type="text" name="isim" class="form-control" id="isim" placeholder="İsminizi yazınız..."/>
                    </div>
		
                    <div class="form-group">
                  	<label >Soy İsminiz :</label>
  			<input type="text" name="soyisim" class="form-control" id="soyisim" placeholder="Soyisminizi yazınız..."/>
                    </div>
                 
                    <div class="form-group">
                        <label>Kullanıcı Adınız:</label>
                        <input type="text" name="kullaniciAdi" class="form-control" id="kullaniciAdi" placeholder="Kullanıcı adınızı belirleyiniz..."/>
                     </div>
                 

                    <div class="form-group">
                        <label>E-Mail Adresiniz :</label>
                        <input type="text" name="email" class="form-control" id="email" placeholder="E-Mail adresinizi yazınız...">
                    </div>
            
                    <div class="form-group">
                        <label>Şifreniz :</label>
                        <input type="password" name="sifre" class="form-control" id="sifre" placeholder="Şifrenizi oluşturunuz...">
                    </div>

                    <div class="form-group">
                        <label>Adresiniz :</label>
                        <input type="text" name="adres" class="form-control" id="adres" placeholder="Adres bilgilerinizi yazınız...">
                    </div>

                    <div class="form-group">
                        <label>İletişim Numaranız :</label>
                        <input type="text" name="tel" class="form-control" id="tel" placeholder="İletişim numaranızı yazınız...">
                    </div>

                    <a href="index.jsp"><button type="submit" class="btn btn-primary ">KAYDOL</button><a/>
                        
                    <br>

            </form>
                  
            <a href="yoneticiGiris.jsp">Zaten Bir Hesabınız var? Hemen Yönetici Olarak Giriş Yapın!</a>
</html>