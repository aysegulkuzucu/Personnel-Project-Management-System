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
                            <a href="projerapolariP.jsp"><i class="fas fa-angle-right"></i> Proje Raporlarini Görüntüle</a>
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
                    
                <div class="content">
                    <div class="container">
                        <div class="page-title">
                            <h3>PROJE RAPORLARI</h3>
                        </div>
                        
                        <div class="box box-primary">
                            <div class="box-body">
                                <table width="100%" class="table table-hover" id="dataTables-example">
                                    <thead>
                                        <tr>
                                            <th>Kayıt Num.</th>
                                            <th>Proje Adı</th>
                                            <th>Proje Türü</th>
                                            <th>Proje Açıklaması</th>
                                            <th>Projenin Son Durumu</th>
                                            <th>Kullanılan Teknoloji</th>
                                            <th>Personel Adı</th>
                                            <th>Personel Soyadı</th>
                                            <th>Departman</th>
                       
                                            <th></th>
                                        </tr>
                                    </thead>
                                <tbody>
                                
                                    
                                 <% 
                                    Connection con;
                                        PreparedStatement pst;
                                        ResultSet rs;
                                        Class.forName("com.mysql.jdbc.Driver");
                                        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ppyonetim","root","root");

                                        String query = "Select * from projepersonel";
                                        pst = con.prepareStatement(query);
                                        rs = pst.executeQuery();

                                        while(rs.next()){
                                %>
                                
                                <tr>
                                    <<th scope="row"><%= rs.getString("kayitNo") %></th>
                                    <td><%=rs.getString("projeAdi")%></td>
                                    <td><%=rs.getString("projeTuru")%></td>
                                    <td><%=rs.getString("projeAciklama")%></td>
                                    <td><%=rs.getString("durum")%></td>
                                    <td><%=rs.getString("kullanim")%></td>
                                    <td><%=rs.getString("personelAdi")%></td>
                                    <td><%=rs.getString("personelSoyadi")%></td>
                                    <td><%=rs.getString("departman")%></td>
                                    
                                    <td class="text-right">
                                        <a href="raporduzenleP.jsp?id=<%=rs.getString("kayitNo") %>" class="btn btn-outline-info btn-rounded"><i class="fas fa-pen"></i></a>
                                        <a href="raporsilP.jsp?id=<%=rs.getString("kayitNo") %>" class="btn btn-outline-danger btn-rounded"><i class="fas fa-trash"></i></a>
                                    </td>
                                    
                                </tr>
                                <% 
                                    }
                                %>  
       
                                </tbody>
                                
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
   
                </div>
            </div>
        </div>
    </div>
    <script src="assets/vendor/jquery/jquery.min.js"></script>
    <script src="assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
    <script src="assets/vendor/datatables/datatables.min.js"></script>
    <script src="assets/js/initiate-datatables.js"></script>
    <script src="assets/js/script.js"></script>
</body>

</html>
