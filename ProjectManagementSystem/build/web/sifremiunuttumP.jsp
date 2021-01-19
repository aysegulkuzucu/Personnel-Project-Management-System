<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.sql.Connection" %>
<%@page import="java.sql.DriverManager" %>
<%@page import="java.sql.SQLException" %>
<%@page import="java.util.logging.Level" %>
<%@page import="java.util.logging.Logger" %>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet" %>
<%@page import="java.util.ArrayList" %>

<!doctype html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
                    <a href="anasayfaP.jsp"><i class="fas fa-home"></i> Anasayfa</a>
                </li>
                <li>
                    <a href="hakkimizdaP.jsp"><i class="fas fa-file-alt"></i> Hakkimizda</a>
                </li>
                
                <li>
                    <a href="iletisimP.jsp"><i class="fas fa-file-alt"></i> Iletisim</a>
                </li>
               
                <li>
                    <a href="#uielementsmenu" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle no-caret-down"><i class="fas fa-layer-group"></i> Proje Raporlari</a>
                    <ul class="collapse list-unstyled" id="uielementsmenu">
                        <li>
                            <a href="raporolusturP.jsp"><i class="fas fa-angle-right"></i> Yeni Proje Raporu Olustur</a>
                        </li>
                        <li>
                            <a href="projeraporlariP.jsp"><i class="fas fa-angle-right"></i> Proje Raporlarini Görüntüle</a>
                        </li>
                    </ul>
                </li>
                <li>
                    <a href="#pagesmenu" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle no-caret-down"><i class="fas fa-copy"></i> Listeleri Görüntüle</a>
                    <ul class="collapse list-unstyled" id="pagesmenu">
                        <li>
                            <a href="personelgoruntuleP.jsp"><i class="fas fa-file"></i> Personel Listesi</a>
                        </li>
                        <li>
                            <a href="projegoruntuleP.jsp"><i class="fas fa-info-circle"></i> Proje Listesi</a>
                        </li>
                        
                    </ul>
                </li>
          
                <li>
                    <a href="#authmenu" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle no-caret-down"><i class="fas fa-user-shield"></i> Kimlik Dogrulama</a>
                    <ul class="collapse list-unstyled" id="authmenu">
                        <li>
                            <a href="personelGiris.jsp"><i class="fas fa-lock"></i> Giris Yap</a>
                        </li>
                        <li>
                            <a href="personelKaydol.jsp"><i class="fas fa-user-plus"></i> Kaydol</a>
                        </li>
                        <li>
                            <a href="sifremiunuttumP.jsp"><i class="fas fa-user-lock"></i> Sifremi Unuttum</a>
                        </li>
                    </ul>
                </li>
                <li>
                    <a href="ayarlarP.jsp"><i class="fas fa-cog"></i>Ayarlar</a>
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
                                <a href="" class="nav-item nav-link dropdown-toggle text-secondary" data-toggle="dropdown"><i class="fas fa-user"></i> <span>Personel</span> <i style="font-size: .8em;" class="fas fa-caret-down"></i></a>
                                <div class="dropdown-menu dropdown-menu-right nav-link-menu">
                                    <ul class="nav-list">
                                        <li><a href="" class="dropdown-item"><i class="fas fa-address-card"></i> Profil</a></li>
                                        <li><a href="" class="dropdown-item"><i class="fas fa-envelope"></i> Mesajlar</a></li>
                                        <li><a href="" class="dropdown-item"><i class="fas fa-cog"></i> Ayarlar</a></li>
                                        <div class="dropdown-divider"></div>
                                        <li><a href="cikisyapP.jsp" class="dropdown-item"><i class="fas fa-sign-out-alt"></i> Cikis Yap</a></li>
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
    if("POST".equalsIgnoreCase(request.getMethod()))
    {
        if(request.getParameter("sifreDegis")!=null)
        {
            if(request.getParameter("sifreDegis").equals("Sifre Degistir"))
            {
                String kullaniciAdip = request.getParameter("kullaniciAdip");
                String yenisifrep = request.getParameter("yenisifrep");
                String yenisifretekrarp = request.getParameter("yenisifretekrarp");
                
                if((!kullaniciAdip.isEmpty()) && (!yenisifrep.isEmpty()) && (!yenisifretekrarp.isEmpty()))
                {
                    if(yenisifrep.equals(yenisifretekrarp))
                    {
                        Connection con = null;
                        PreparedStatement ps;
                        ResultSet rs;
                        String query;
                        
                        try
                        {
                            Class.forName("com.mysql.jdbc.Driver");
                        }
                        catch(Exception e)
                        {
                            System.out.println(e);
                            
                        }
                        try
                        {
                            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ppyonetim","root","root");
                            query = "select * from personelreg where kullaniciAdip=?";
                            ps = con.prepareStatement(query);
                            ps.setString(1, kullaniciAdip);

                            
                            rs = ps.executeQuery();
                            
                            if(rs.next())
                            {
                                query = "update personelreg set sifrep=? where kullaniciAdip=?";
                                ps = con.prepareStatement(query);
                                ps.setString(1,yenisifrep);
                                ps.setString(2,request.getParameter("kullaniciAdip"));
                                ps.executeUpdate();
                                out.println("<br> Sifreniz Basariyla Guncellendi.. Dilerseniz <a href=\"anasayfaP.jsp\"> Buradan </a> Anasayfaya Gidebilirsiniz... <br>");
                            }
                            else
                            {
                                out.println("Bir aksilik Olustu. Sireniz Degistirilemedi!!!!");
                            }

                        }
                        catch(SQLException e)
                        {
                            System.out.println(e);
                        }
                        
                        
                        
                        
                    }
                }
            }
        }
    }
    
    
%>  

    <form id="form" method="post" action="" class="form-horizontal">
            <hr/>
 
                    <div class="col-lg-12">
                            <div class="card">
                                 <div class="card-header">Sifrenizi Unuttuysaniz Hemen Degisin!</div>
                                <div class="card-body">
                                    <h5 class="card-title"></h5>
                                    <form class="form-horizontal">
                                        
                                        
                                      
                                        <div class="form-group row">
                                            <label class="col-sm-2">Kullanici Adiniz </label>
                                            <div class="col-sm-10">
                                                <input  type="text" name="kullaniciAdip" class="form-control"   size="50"/>
                                                <small class="form-text text-muted">Kullanici adinizi yaziniz...</small>
                                            </div>
                                        </div>
                                        
                                        <div class="line"></div><br>
                                        
                                        <div class="form-group row">
                                            <label class="col-sm-2">Yeni Sifreniz </label>
                                            <div class="col-sm-10">
                                                <input  type="password" name="yenisifrep" class="form-control"  size="50">
                                                <small class="form-text text-muted">Yeni bir sifre belirleyiniz...</small>
                                            </div>
                                        </div>
                                        
                                          <div class="line"></div><br>
                                          
                                          <div class="form-group row">
                                            <label class="col-sm-2">Yeni Sifreniz </label>
                                            <div class="col-sm-10">
                                                <input  type="password" name="yenisifretekrarp" class="form-control"   size="50">
                                                <small class="form-text text-muted">Belirlediginiz sifreyi tekrar giriniz...</small>
                                            </div>
                                        </div>
                                        
                                          <div class="line"></div><br>
                                        
                                        
                                        
                                          
                                          <div class="form-group row">
                                            <div class="col-sm-4 offset-sm-2">
                                              
                                                            <br><br>            
                                            <input type="submit" name="sifreDegis" value="Sifre Degistir">
                                                
                                            </div>
                                        </div>

                                        
                                    </form>
                                    
                                </div>
                            </div>
                    </div>       
                    
                </div>
            </div>
            
           
        </div>
    </div>
    <script src="assets/vendor/jquery/jquery.min.js"></script>
    <script src="assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
    <script src="assets/vendor/chartsjs/Chart.min.js"></script>
    <script src="assets/js/dashboard-charts.js"></script>
    <script src="assets/js/script.js"></script>
</body>
</html>