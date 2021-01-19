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
                                        String durum = request.getParameter("durum");
                                        String kullanim = request.getParameter("kullanim");
                                        String personelAdi = request.getParameter("personelAdi");
                                        String personelSoyadi = request.getParameter("personelSoyadi");
                                        String departman = request.getParameter("departman");



                                        Class.forName("com.mysql.jdbc.Driver");
                                        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ppyonetim","root","root");
                                        String query = "INSERT INTO projepersonel(kayitNo,projeAdi,projeTuru,projeAciklama,durum,kullanim,personelAdi,personelSoyadi,departman) VALUES (?,?,?,?,?,?,?,?,?)";

                                        PreparedStatement pst = con.prepareStatement(query);

                                        pst.setString(1, kayitNo);
                                        pst.setString(2, projeAdi);
                                        pst.setString(3, projeTuru);
                                        pst.setString(4, projeAciklama);
                                        pst.setString(5, durum);
                                        pst.setString(6, kullanim);
                                        pst.setString(7, personelAdi);
                                        pst.setString(8, personelSoyadi);
                                        pst.setString(9, departman);

                                        pst.executeUpdate();

                                        color = "green";
                                        msg = "Yeni Projenizin Raporu Başarıyla Oluşturuldu...";

                                    }catch(Exception ex){
                                            ex.printStackTrace();
                                            color = "red";
                                            msg = "İşlem başarısız...";
                                    }
                            }
                    %>       
    
    <div class="form-group col-12 p-0">
        <h4 style="color:<%= color %>"><%= msg %></h4>
    </div>
    
    <form id="form" method="post" action="raporolusturP.jsp" class="form-horizontal">
            <hr/>
  
                    <div class="col-lg-12">
                            <div class="card">
                                <div class="card-header">Yeni Proje Raporu Olustur</div>
                                <div class="card-body">
                                    <h5 class="card-title"></h5>
                                    <form class="form-horizontal">    
                                        <div class="form-group row">
                                            <label class="col-sm-2">Projenin Kayit Numarasi </label>
                                            <div class="col-sm-10">
                                                <input type="text" name="kayitNo" class="form-control" id="kayitNo"/>
                                                <small class="form-text text-muted">Yeni Proje Raporunun kayit numarasini giriniz...</small>
                                            </div>
                                        </div>
                                        
                                        <div class="line"></div><br>
                                        
                                        <div class="form-group row">
                                            <label class="col-sm-2">Projenin Adi </label>
                                            <div class="col-sm-10">
                                                <input type="text" name="projeAdi" class="form-control" id="projeAdi">
                                                <small class="form-text text-muted">Projenin adini yaziniz...</small>
                                            </div>
                                        </div>
                                        
                                          <div class="line"></div><br>
                                          
                                          <div class="form-group row">
                                            <label class="col-sm-2">Projenin Turu </label>
                                            <div class="col-sm-10">
                                                <input type="text" name="projeTuru" class="form-control" id="projeTuru">
                                                <small class="form-text text-muted">Projenin turunu yaziniz...</small>
                                            </div>
                                        </div>
                                        
                                          <div class="line"></div><br>
                                          
                                          <div class="form-group row">
                                            <label class="col-sm-2">Projenin Aciklamasi </label>
                                            <div class="col-sm-10">
                                                <input type="text" name="projeAciklama" class="form-control" id="projeAciklama">
                                                <small class="form-text text-muted">Proje hakkinda kisa bir aciklama yaziniz...</small>
                                            </div>
                                        </div>
                                        
                                          <div class="line"></div><br>
                                          
                                          <div class="form-group row">
                                            <label class="col-sm-2">Projenin Suanki Durumu </label>
                                            <div class="col-sm-10">
                                                <input type="text" name="durum" class="form-control" id="durum">
                                                <small class="form-text text-muted">Projenin suanki durumu hakkinda bilgi veriniz...</small>
                                            </div>
                                        </div>
                                        
                                          <div class="line"></div><br><!-- comment -->
                                          
                                          <div class="form-group row">
                                            <label class="col-sm-2">Projede Kullanılan Teknolojiler </label>
                                            <div class="col-sm-10">
                                                <input type="text" name="kullanim" class="form-control" id="kullanim">
                                                <small class="form-text text-muted">Proje yapilirken kullanilan teknolojilerden bahsediniz...</small>
                                            </div>
                                        </div>

                                          <div class="line"></div><br><!-- comment -->
                                          
                                          <div class="form-group row">
                                            <label class="col-sm-2">Personelin Adi </label>
                                            <div class="col-sm-10">
                                                <input type="text" name="personelAdi" class="form-control" id="personelAdi">
                                                <small class="form-text text-muted">Proje Raporunu olusturan Personelin adini yaziniz...</small>
                                            </div>
                                        </div>
                                          
                                          <div class="line"></div><br><!-- comment -->
                                          
                                          <div class="form-group row">
                                            <label class="col-sm-2">Personelin Soyadi </label>
                                            <div class="col-sm-10">
                                                <input type="text" name="personelSoyadi" class="form-control" id="personelSoyadi">
                                                <small class="form-text text-muted">Proje Raporunu olusturan Personelin soyadini yaziniz...</small>
                                            </div>
                                          </div><!-- comment -->
                                          
                                          <div class="line"></div><br><!-- comment -->
                                          
                                          <div class="form-group row">
                                            <label class="col-sm-2">Personelin Calistigi Departman </label>
                                            <div class="col-sm-10">
                                                <input type="text" name="departman" class="form-control" id="departman">
                                                <small class="form-text text-muted">Proje Raporunu olusturan Personelin calistigi departmani yaziniz...</small>
                                            </div>
                                        </div>
                                        
                                          <div class="line"></div><br>
                                        
                                          
                                          <div class="form-group row">
                                            <div class="col-sm-4 offset-sm-2">
                                                <a href="anasayfaP.jsp"><button class="btn btn-secondary mb-2"><i class="fas fa-times"></i> Anasayfa</button></a>
                                                <a href="raporolusturP.jsp"><button type="submit" class="btn btn-primary mb-2"><i class="fas fa-save"></i> Kaydet</button></a>
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