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
    <link href="javascripts/html5shiv.js" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Cabin:400,400i,500,600,700" rel="stylesheet">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/webcomponentsjs/0.7.5/webcomponents.min.js"></script>
    <link rel="import" href="awesome-slider.html">
    <style type="text/css">
        .clearfix:after {
            content: ".";
            display: block;
            height: 0;
            clear: both;
            visibility: hidden;
        }
    </style>
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
                        In un ottica di trasparenza, di avvicinamento alla clientela e di miglioramento dei nostri servizi abbiamo aperto quest'area dove i clienti possono lasciare un messaggio, un commento, un complimento o una critica al funzionamento del sito internet, una recensione sui prodotti di illuminazione acquistati ma anche ai servizi dello staff stesso.<br />Per inviare un commento si dovr&agrave; essere registrati sul sito internet e i messaggi inviati saranno approvati dallo staff per evitare che siano pubblicati testi offensivi o inserire link pubblicitari verso altri siti internet.
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
                        <div class="panel-footer"><a href="/cristalensi/commenti_form.asp" class="btn btn-success">Inserisci anche te un commento! <i class="fa fa-chevron-right"></i></a></div>
                        </ul>

                    </div>
                    <%
                    end if
                    com_rs.close
                    %>
                </div>
                <div class="col-md-4">
                    <div class="banner preventivi overflowContainer">
                        <h3 class="title">Preventivi personalizzati</h3>
                        <p class="text">Per ordini superiori a 500&euro; contatta il nostro personale... <strong>sconti speciali!</strong></p>
                    </div>
                    <div class="banner pagamenti overflowContainer">
                        <h3 class="title">Sito internet e pagamenti sicuri</h3>
                        <p class="text">Contrassegno, Bonifico Bancario, PostePay e Carte di Credito con Sistema Garantito di PayPal
                        </p>
                    </div>
                    <div class="banner consegne overflowContainer">
                        <h3 class="title">Consegne</h3>
                        <p class="text">confezionamento accurato e spedizione assicurata GRATUITA in tutta Italia per ordini superiori a 250&euro;</p>
                    </div>

    								<!--condizioni di vendita-->
    								<div class="panel panel-default payment-list">
    										<!-- Default panel contents -->
    										<div class="panel-heading">
    											<h5>Condizioni di vendita</h5>
    										</div>
    										<ul class="list-group">
    											<li class="list-group-item"><strong>PAGAMENTI SICURI</strong></li>
    											<li class="list-group-item"><i class="fa fa-check"></i> <em>Bonifico e PostePay: 0&euro;</em></li>
    											<li class="list-group-item"><i class="fa fa-check"></i> <em>Carte di credito e prepagate: 0&euro;</em></li>
    											<li class="list-group-item"><i class="fa fa-check"></i> <em>Contrassegno in contanti: 4&euro;</em></li>
    											<li class="list-group-item">&nbsp;</li>
    											<li class="list-group-item"><strong>SPEDIZIONE IN TUTTA ITALIA ASSICURATA</strong></li>
    											<li class="list-group-item"><i class="fa fa-check"></i> <em>Per ordini superiori a 250&euro;: 0&euro;</em></li>
    											<li class="list-group-item"><i class="fa fa-check"></i> <em>Per ordini fino a  250&euro;: 10&euro;</em></li>
    											<li class="list-group-item"><i class="fa fa-check"></i> <em>Ritiro in sede: 0&euro;</em></li>
    										</ul>
    										<div class="panel-footer"><a href="#" class="btn btn-success">Condizioni di vendita <i class="fa fa-chevron-right"></i></a></div>
    								</div>
                    <div class="alert alert-success" role="alert" style="text-align: center;">
                      <em>Hai bisogno di aiuto? Contattaci!</em><br /><br /><a href="tel: 0571.911163" class="alert-link"><span class="glyphicon glyphicon-earphone"></span> 0571.911163</a> - <a href="mailto:info@cristalensi.it" class="alert-link"><span class="glyphicon glyphicon-envelope"></span> info@cristalensi.it</a>
                      <br /><br />Lun. - Ven.: 9.00 - 12.30 | 14.30 - 19.30<br />Sab.: 9.00 - 12.30 | 15.30 - 19.30<br />Domenica CHIUSI<br />Giugno/Luglio CHIUSI Sabato Pomeriggio<br />
                    </div>
                </div>
            </div>
            <div class="row top-buffer">
                <div class="col-xl-12 clearfix">
                    <h4 class="subtitle pull-left"><div class="dot"></div><span>Cosa stai cercando?</span></h4>
                </div>
                <div class="col-xs-6 col-sm-4 col-md-3 ">
                    <article class="col-item">
                        <div class="photo">
                            <a href="/cristalensi/illuminazione-interni-ed-esterni/1ng-lampade-da-interno.asp" class="prod-img-replace" style="background-image: url(images/slider1.png)" title="Lampade da interno"><img alt="Lampade da interno" src="images/blank.png"></a>
                        </div>
                        <div class="info">
                            <div class="row">
                                <div class="category col-md-6">
                                    <a href="/cristalensi/illuminazione-interni-ed-esterni/1ng-lampade-da-interno.asp" title="Lampade da interno"><h1>Lampade da interno</h1></a>
                                </div>
                            </div>
                        </div>
                    </article>
                </div>
                <div class="col-xs-6 col-sm-4 col-md-3">
                    <article class="col-item">
                        <div class="photo">
                            <a href="/cristalensi/illuminazione-interni-ed-esterni/2ng-lampade-da-esterno.asp" class="prod-img-replace" style="background-image: url(images/LED.jpg)" title="Lampade da esterno"><img alt="Lampade da esterno" src="images/blank.png"></a>
                        </div>
                        <div class="info">
                            <div class="row">
                                <div class="category col-md-6">
                                    <a href="/cristalensi/illuminazione-interni-ed-esterni/2ng-lampade-da-esterno.asp" title="Lampade da esterno"><h1>Lampade da esterno</h1></a>
                                </div>
                            </div>
                        </div>
                    </article>
                </div>
                <div class="col-xs-6 col-sm-4 col-md-3">
                    <article class="col-item">
                        <div class="photo">
                            <a href="#" class="prod-img-replace" style="background-image: url(images/est.jpg)"><img alt="900x550" src="images/blank.png"></a>
                        </div>
                        <div class="info">
                            <div class="row">
                                <div class="category col-md-6">
                                    <a href="#"><h1>Ventilatori</h1></a>
                                </div>
                            </div>
                        </div>
                    </article>
                </div>
                <div class="col-xs-6 col-sm-4 col-md-3 ">
                    <article class="col-item">
                        <div class="photo">
                            <a href="#" class="prod-img-replace" style="background-image: url(images/slider1.png)"><img alt="descrizione lampadario" src="images/blank.png"></a>
                        </div>
                        <div class="info">
                            <div class="row">
                                <div class="category col-md-6">
                                    <a href="#"><h1>Lampadine, driver e strisce</h1></a>
                                </div>
                            </div>
                        </div>
                    </article>
                </div>
            </div>

        </div>
    </div>
    <!--#include file="inc_footer.asp"-->
</body>
<!--#include file="inc_strClose.asp"-->