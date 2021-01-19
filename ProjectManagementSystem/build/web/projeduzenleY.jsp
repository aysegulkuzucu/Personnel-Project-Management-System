<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>Anasayfa | Personel/Proje Islemleri Takip Sistemi</title>
        <link href="assets/vendor/fontawesome/css/fontawesome.min.css" rel="stylesheet">
        <link href="assets/vendor/fontawesome/css/solid.min.css" rel="stylesheet">
        <link href="assets/vendor/fontawesome/css/brands.min.css" rel="stylesheet">
        <link href="assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
        <link href="assets/css/master.css" rel="stylesheet">
        <link href="assets/vendor/chartsjs/Chart.min.css" rel="stylesheet">
        <link href="assets/vendor/flagiconcss/css/flag-icon.min.css" rel="stylesheet">
    </head>
    
    <body>
        
        <div class="wrapper">
        <nav id="sidebar" class="active">
            <div class="sidebar-header">
               <img src="assets/img/pps.png" >
            </div>
            <ul class="list-unstyled components text-secondary">
                <li>
                    <a href="anasayfaY.jsp"><i class="fas fa-home"></i> Anasayfa</a>
                </li>
                <li>
                    <a href="hakkimizdaY.jsp"><i class="fas fa-file-alt"></i> Hakkimizda</a>
                </li>
                <li>
                    <a href="iletisimY.jsp"><i class="fas fa-file-alt"></i> Iletisim</a>
                </li>

                <li>
                    <a href="#uielementsmenu" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle no-caret-down"><i class="fas fa-layer-group"></i> Yeni Olustur</a>
                    <ul class="collapse list-unstyled" id="uielementsmenu">
                        <li>
                            <a href="personelekleY.jsp"><i class="fas fa-angle-right"></i> Personel Ekle</a>
                        </li>
                        <li>
                            <a href="projeekleY.jsp"><i class="fas fa-angle-right"></i> Proje Ekle</a>
                        </li>
                    </ul>
                </li>
                
                
                <li>
                    <a href="#pagesmenu" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle no-caret-down"><i class="fas fa-copy"></i> Durumlari Görüntüle</a>
                    <ul class="collapse list-unstyled" id="pagesmenu">
                        <li>
                            <a href="personelgoruntuleY.jsp"><i class="fas fa-file"></i> Personelleri Görüntüle</a>
                        </li>
                        <li>
                            <a href="projegoruntuleY.jsp"><i class="fas fa-info-circle"></i> Projeleri Görüntüle</a>
                        </li>
                        <li>
                            <a href="projeraporlariY.jsp"><i class="fas fa-info-circle"></i> Proje Raporlarini Görüntüle</a>
                        </li>
                        
                    </ul>
                </li>
          
                <li>
                    <a href="#authmenu" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle no-caret-down"><i class="fas fa-user-shield"></i> Kimlik Dogrulama</a>
                    <ul class="collapse list-unstyled" id="authmenu">
                        <li>
                            <a href="yoneticiGiris.jsp"><i class="fas fa-lock"></i> Giris Yap</a>
                        </li>
                        <li>
                            <a href="yoneticiKaydol.jsp"><i class="fas fa-user-plus"></i> Kaydol</a>
                        </li>
                        <li>
                            <a href="sifremiunuttumY.jsp"><i class="fas fa-user-lock"></i> Sifremi Unuttum</a>
                        </li>
                    </ul>
                </li>
                
                
                <li>
                    <a href="ayarlarY.jsp"><i class="fas fa-cog"></i>Ayarlar</a>
                </li>
            </ul>
        </nav>
        <div id="body" class="active">
            <nav class="navbar navbar-expand-lg navbar-white bg-white">
                <button type="button" id="sidebarCollapse" class="btn btn-light"><i class="fas fa-bars"></i><span></span></button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="nav navbar-nav ml-auto">
                        
                        <li class="nav-item dropdown">
                            <div class="nav-dropdown">
                                <a href="" class="nav-item nav-link dropdown-toggle text-secondary" data-toggle="dropdown"><i class="fas fa-user"></i> <span>Yonetici</span> <i style="font-size: .8em;" class="fas fa-caret-down"></i></a>
                                <div class="dropdown-menu dropdown-menu-right nav-link-menu">
                                    <ul class="nav-list">
                                        <li><a href="" class="dropdown-item"><i class="fas fa-address-card"></i> Profil</a></li>
                                        <li><a href="" class="dropdown-item"><i class="fas fa-envelope"></i> Mesajlar</a></li>
                                        <li><a href="" class="dropdown-item"><i class="fas fa-cog"></i> Ayarlar</a></li>
                                        <div class="dropdown-divider"></div>
                                        <li><a href="cikisyapY.jsp" class="dropdown-item"><i class="fas fa-sign-out-alt"></i> Cikis Yap</a></li>
                                    </ul>
                                </div>
                            </div>
                        </li>
                    </ul>
                </div>
            </nav>
            <div class="content">
                <div class="container">
                    <div class="row">
                        
                    </div>
        
                        <%

                           Connection con;     
                           String msg = "";
                           String color = "";

                           if(request.getMethod().compareToIgnoreCase("post")==0)
                               {
                                    try
                                    {
                                         String kayitNo = request.getParameter("kayitNo");
                                         String projeAdi = request.getParameter("projeAdi");
                                         String projeTuru = request.getParameter("projeTuru");
                                         String projeAciklama = request.getParameter("projeAciklama");

                                         Class.forName("com.mysql.jdbc.Driver");
                                         con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ppyonetim","root","root");
                                         String query = "update proje set projeAdi = ?, projeTuru = ?, projeAciklama = ? where kayitNo = ?";

                                         PreparedStatement pst = con.prepareStatement(query);



                                         pst.setString(1, projeAdi);
                                         pst.setString(2, projeTuru);
                                         pst.setString(3, projeAciklama);
                                         pst.setString(4, kayitNo);

                                         pst.executeUpdate();

                                         color = "green";
                                         msg = "Seçilen Proje Başarıyla Düzenlendi ve Kaydedildi...";


                                    }catch(Exception ex){
                                            ex.printStackTrace();
                                            color = "red";
                                            msg = "Kayıtlı Proje Üzerinde Yapılan Değişiklikler Kaydolurken Bir Hata Oluştu...";
                                    }
                               }
                        %>    
        
    <div class="form-group col-12 p-0">
        <h4 style="color:<%= color %>"><%= msg %></h4>
        <a href="anasayfaY.jsp"><button class="btn btn-secondary mb-2"><i class="fas fa-times"></i> Anasayfaya Don</button></a>
        <a href="projegoruntuleY.jsp"><button  class="btn btn-primary mb-2"><i class="fas fa-save"></i> Projeleri Goruntule</button></a>
    </div>
        
        <form id="form" method="post" action="projeduzenleY.jsp" class="form-horizontal">

            
                                <% 

                                        PreparedStatement pst;
                                        ResultSet rs;

                                        Class.forName("com.mysql.jdbc.Driver");
                                        con = DriverManager.getConnection("jdbc:mysql://eu-cdbr-west-03.cleardb.net:3306/heroku_601e272c485ad47","b1b5e4dbb545d7","a66fbac1");

                                       String id = request.getParameter("id");

                                        pst = con.prepareStatement("select * from proje where kayitNo = ?");
                                        pst.setString(1, id);
                                        rs = pst.executeQuery();

                                        while(rs.next())
                                        {

                                %>   
         	
                            <div class="col-lg-12">
                            <div class="card">
                                <div class="card-header">Kayitli Projenin Personelin Uzerinde Degisiklikler Yapin...</div>
                                <div class="card-body">
                                    <h5 class="card-title"></h5>
                                    <form class="form-horizontal">
                                        
                                        
                                      
                                        <div class="form-group row">
                                            <label class="col-sm-2">Kayit Numarasi </label>
                                            <div class="col-sm-10">
                                                <input type="text" name="kayitNo" class="form-control" id="kayitNo" value="<%= rs.getString("kayitNo") %>"
                                                <small class="form-text text-muted">Yeni projenin kayit numarasini yaziniz...</small>
                                            </div>
                                        </div>
                                        
                                        <div class="line"></div><br>
                                        
                                        <div class="form-group row">
                                            <label class="col-sm-2">Projenin Adi </label>
                                            <div class="col-sm-10">
                                                <input type="text" name="projeAdi" class="form-control" id="projeAdi" value="<%= rs.getString("projeAdi") %>"
                                                <small class="form-text text-muted">Yeni projenin adini yaziniz...</small>
                                            </div>
                                        </div>
                                        
                                          <div class="line"></div><br>
                                          
                                          <div class="form-group row">
                                            <label class="col-sm-2">Projenin Turu </label>
                                            <div class="col-sm-10">
                                                <input type="text" name="projeTuru" class="form-control" id="projeTuru"  value="<%= rs.getString("projeTuru") %>">
                                                <small class="form-text text-muted">Yeni projenin turunu yaziniz...</small>
                                            </div>
                                        </div>
                                        
                                          <div class="line"></div><br>
                                          
                                          <div class="form-group row">
                                            <label class="col-sm-2">Projenin Aciklaması  </label>
                                            <div class="col-sm-10">
                                                <input type="text" name="projeAciklama" class="form-control" id="projeAciklama" value="<%= rs.getString("projeAciklama") %>">
                                                <small class="form-text text-muted">Proje hakkinda kisa aciklama yaziniz...</small>
                                            </div>
                                        </div>

                                          <div class="line"></div><br>
                                        
                                          <div class="form-group row">
                                            <div class="col-sm-4 offset-sm-2">
                                                <a href="anasayfaY.jsp"><button class="btn btn-secondary mb-2"><i class="fas fa-times"></i> Anasayfa</button></a>
                                                <a href="projeduzenleY.jsp"><button  class="btn btn-primary mb-2"><i class="fas fa-save"></i> Kaydet</button></a>
                                            </div>
                                        </div>

                                        
                                    </form>
                                </div>
                            </div>
                        </div> 

            <br/>
 
                                <% 
                                    }
                                %>
                    </form>
                </div>
            </div>
    </body>
</html>