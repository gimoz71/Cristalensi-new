<!--#include file="inc_strConn.asp"-->
<!DOCTYPE html>
<html>

<head>
    <title>Commenti prodotti illuminazione recensioni lampadari acquistati Cristalensi</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="description" content="Lascia un commento per i prodotti di illuminazione acquistati. Inserisci una recensione di un lampadario comprato. In un ottica di trasparenza, di avvicinamento alla clientela e di miglioramento dei nostri servizi abbiamo aperto quest'area dove i clienti possono lasciare un messaggio, un commento, un complimento o una critica al funzionamento del sito internet, ai prodotti di illuminazione comprati ma anche ai servizi dello staff stesso.">
    <meta name="keywords" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta property="og:description" content="Cristalensi.">
    <link rel="apple-touch-icon" sizes="57x57" href="/apple-touch-icon-57x57.png">
    <link rel="apple-touch-icon" sizes="60x60" href="/apple-touch-icon-60x60.png">
    <link rel="apple-touch-icon" sizes="72x72" href="/apple-touch-icon-72x72.png">
    <link rel="apple-touch-icon" sizes="76x76" href="/apple-touch-icon-76x76.png">
    <link rel="apple-touch-icon" sizes="114x114" href="/apple-touch-icon-114x114.png">
    <link rel="apple-touch-icon" sizes="120x120" href="/apple-touch-icon-120x120.png">
    <link rel="apple-touch-icon" sizes="144x144" href="/apple-touch-icon-144x144.png">
    <link rel="apple-touch-icon" sizes="152x152" href="/apple-touch-icon-152x152.png">
    <link rel="apple-touch-icon" sizes="180x180" href="/apple-touch-icon-180x180.png">
    <link rel="icon" type="image/png" href="/favicon-32x32.png" sizes="32x32">
    <link rel="icon" type="image/png" href="/android-chrome-192x192.png" sizes="192x192">
    <link rel="icon" type="image/png" href="/favicon-16x16.png" sizes="16x16">
    <link rel="manifest" href="/manifest.json">
    <link rel="mask-icon" href="/safari-pinned-tab.svg" color="#2790cf">
    <meta name="msapplication-TileColor" content="#2790cf">
    <meta name="msapplication-TileImage" content="/mstile-144x144.png">
    <meta name="theme-color" content="#ffffff">
    <link href="stylesheets/styles.css" media="screen" rel="stylesheet" type="text/css">
    <link rel="stylesheet" type="text/css" href="stylesheets/customization.css" shim-shadowdom>
    <link rel="stylesheet" type="text/css" href="stylesheets/camera.css" shim-shadowdom>
    <!--[if lt IE 9]><script src="javascripts/html5shiv.js"></script><![endif]-->
    <link href="https://fonts.googleapis.com/css?family=Cabin:400,400i,500,600,700" rel="stylesheet">
    <style type="text/css">
        .clearfix:after {
            content: ".";
            display: block;
            height: 0;
            clear: both;
            visibility: hidden;
        }
    </style>
    <!--#include virtual="/inc_funzioni_head.asp"-->
</head>

<body>
    <!--#include file="inc_header_1.asp"-->
    <!--#include file="inc_header_2.asp"-->
    <div class="container content">
        <div class="col-md-12">
            <div class="row top-buffer">
                <div class="col-md-8">
                    <h1 class="slogan">Commenti su i prodotti di illuminazione acquistati</h1>
                    <p class="main-description">
                        In un ottica di trasparenza, di avvicinamento alla clientela e di miglioramento dei nostri servizi abbiamo aperto quest'area dove i clienti possono lasciare un messaggio, un commento, un complimento o una critica al funzionamento del sito internet, una recensione sui prodotti di illuminazione acquistati ma anche ai servizi dello staff stesso.<br />Per inviare un commento si dovr&agrave; essere registrati sul sito internet e i messaggi inviati saranno approvati dallo staff per evitare che siano pubblicati testi offensivi o inserire link pubblicitari verso altri siti internet.<br />
                        <a href="/commenti_form.asp" class="btn btn-default btn-warning pull-right" title="Lascia il tuo commento!">Inserisci anche te un commento! <i class="fa fa-chevron-right"></i></a>
                    </p>
                    <%
                    Set com_rs = Server.CreateObject("ADODB.Recordset")
                    sql = "SELECT * FROM Commenti_Clienti WHERE Pubblicato=1 ORDER BY PkId DESC"
                    com_rs.open sql,conn, 1, 1
                    if com_rs.recordcount>0 then
                    %>
                    <div class="panel panel-default user-comment">
                        <!-- Default panel contents -->
                        <div class="panel-heading">
                            <h5><i class="fa fa-users"></i> Dicono di noi...</h5>
                        </div>
                        <ul class="list-group">
                        <%Do While not com_rs.EOF%>
                        <li class="list-group-item"><i class="fa fa-user"></i> <em><%=NoHTML(com_rs("Testo"))%><br />Voto: <%=com_rs("Valutazione")%>/5</em></li>
                        <%
                        com_rs.movenext
                        loop
                        %>
                        <div class="panel-footer"><a href="/commenti_form.asp" class="btn btn-warning">Inserisci anche te un commento! <i class="fa fa-chevron-right"></i></a></div>
                        </ul>

                    </div>
                    <%
                    end if
                    com_rs.close
                    %>
                </div>
                <div class="col-md-4">
                  <div class="banner preventivi overflowContainer">
                      <h3 class="title">Super Promo d'Inverno</h3>
                      <p class="text"><strong><em>Sconti Extra in Carrello</em></strong><br />-2% Oltre 300&nbsp&euro;<br />-3% Oltre 600&nbsp&euro;<br />-4% Oltre 900&nbsp&euro;</strong></p>
                  </div>
                  <div class="banner pagamenti overflowContainer">
                      <h3 class="title">Paga in sicurezza!</h3>
                      <p class="text"><strong><em>PAGAMENTO CON BONIFICO: -2%</em></strong><br />Altri pagamenti disponibili:<br />Carte di Credito e PayPal, PostePay e Contrassegno in contanti alla consegna.
                      </p>
                  </div>
                  <div class="banner consegne overflowContainer">
                      <h3 class="title">SPEDIZIONI ASSICURATE</h3>
                      <p class="text">Consegna <u>GRATUITA</u> in tutta Italia per ordini superiori a 250&euro;<br />Per ordini fino a 250&euro;: 10&euro;</p>
                  </div>


                    <!--#include file="inc_box_contatti.asp"-->
                </div>
            </div>
        </div>
    </div>
    <!--#include file="inc_footer.asp"-->
</body>
<!--#include file="inc_strClose.asp"-->
