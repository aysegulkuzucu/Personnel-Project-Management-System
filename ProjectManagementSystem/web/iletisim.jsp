<!doctype html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Iletisim | Personel/Proje Islemleri Takip Sistemi</title>
    <link href="assets/vendor/fontawesome/css/fontawesome.min.css" rel="stylesheet">
    <link href="assets/vendor/fontawesome/css/solid.min.css" rel="stylesheet">
    <link href="assets/vendor/fontawesome/css/brands.min.css" rel="stylesheet">
    <link href="assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="assets/css/master.css" rel="stylesheet">
    <link href="assets/vendor/chartsjs/Chart.min.css" rel="stylesheet">
    <link href="assets/vendor/flagiconcss/css/flag-icon.min.css" rel="stylesheet">
        
    <style>
        body {
          font-family: Arial, Helvetica, sans-serif;
        }

        * {
          box-sizing: border-box;
        }

        /* Style inputs */
        input[type=text], select, textarea {
          width: 100%;
          padding: 12px;
          border: 1px solid #ccc;
          margin-top: 6px;
          margin-bottom: 16px;
          resize: vertical;
        }

        input[type=submit] {
          background-color: #4CAF50;
          color: white;
          padding: 12px 20px;
          border: none;
          cursor: pointer;
        }

        input[type=submit]:hover {
          background-color: #45a049;
        }

        /* Style the container/contact section */
        .container {
          border-radius: 5px;
          background-color: #f2f2f2;
          padding: 10px;
        }

        /* Create two columns that float next to eachother */
        .column {
          float: left;
          width: 50%;
          margin-top: 6px;
          padding: 20px;
        }

        /* Clear floats after the columns */
        .row:after {
          content: "";
          display: table;
          clear: both;
        }

        /* Responsive layout - when the screen is less than 600px wide, make the two columns stack on top of each other instead of next to each other */
        @media screen and (max-width: 600px) {
          .column, input[type=submit] {
            width: 100%;
            margin-top: 0;
          }
        }
    </style>       
</head>
<body>
    <div class="wrapper">
        <nav id="sidebar" class="active">
            <div class="sidebar-header">
                <img src="assets/img/pps.png" >
            </div>
            <ul class="list-unstyled components text-secondary">
                <li>
                    <a href="index.jsp"><i class="fas fa-home"></i> Anasayfa</a>
                </li>
                <li>
                    <a href="hakkimizda.jsp"><i class="fas fa-file-alt"></i> Hakkimizda</a>
                </li>
                
                <li>
                    <a href="iletisim.jsp"><i class="fas fa-file-alt"></i> Iletisim</a>
                </li><!-- comment -->
                
                <li>
                    <a href="yoneticiGiris.jsp"><i class="fas fa-lock"></i> Giris Yap</a>
                </li>
                <li>
                    <a href="yoneticiKaydol.jsp"><i class="fas fa-user-plus"></i> Kaydol</a>
                </li>
            </ul>
        </nav>
        <div id="body" class="active">
            <nav class="navbar navbar-expand-lg navbar-white bg-white">
                <button type="button" id="sidebarCollapse" class="btn btn-light"><i class="fas fa-bars"></i><span></span></button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="nav navbar-nav ml-auto"></ul>
                </div>
            </nav>
            <div class="content">
                <div class="container">
                    <div class="row">
                        
                    </div>
                    <p>Size daha iyi bir hizmet verebilmemiz icin,</p>
                    <h2>Bizimle Hemen Iletisime Gecin!</h2>

                    <div class="container">
                      <div style="text-align:center">
                        <h5>Sivas Cumhuriyet Universitesi Muhendislik Fakultesi Bilgisayar Muhendisligi Bolumu</h5>
                        <p>0 346 219 1010 </p>
                      </div>
                      <div class="row">
                        <div class="column">
                          <img src="assets/img/iletisim.jpg" style="width:100%">
                        </div>
                        <div class="column">
                          <form action="/action_page.php">
                            <label for="fname">Adiniz :</label>
                            <input type="text" id="fname" name="firstname" placeholder="Adinizi yaziniz..">
                            <label for="lname">Soy Adiiz :</label>
                            <input type="text" id="lname" name="lastname" placeholder="Soy adinizi yaziniz..">
                            <label for="country">Sehir</label>
                            <select id="country" name="country">
                              <option value="australia">Istanbul</option>
                              <option value="canada">Ankara</option>
                              <option value="usa">Izmir</option>
                              <option value="usa">Sivas</option>
                              <option value="usa">Yozgat</option>
                            </select>
                            <label for="subject">Mesajiniz :</label>
                            <textarea id="subject" name="subject" placeholder="Mesajinizi yaziniz.." style="height:170px"></textarea>
                            <button><a href="">Gonder</a> </button>
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

