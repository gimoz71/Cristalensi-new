<!--#include file="inc_strConn.asp"-->
<!DOCTYPE html>
<html>

<head>
    <title>Vendita lampadari online illuminazione da interni illuminazione da esterni</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="description" content="Cristalensi, showroom di lampade vicino Firenze, specialzzato in vendita di lampari online, prodotti per illuminazione da interno, illuminazione da esterno, piantane, plafoniere, ventilatori.">
    <meta name="keywords" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta property="og:description" content="Cristalensi, showroom di lampade vicino Firenze, specialzzato in vendita di lampari online, prodotti per illuminazione da interno, illuminazione da esterno, piantane, plafoniere, ventilatori.">
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
    <!--[if lt IE 9]>
    	<script src="javascripts/html5shiv.js"></script>
    <![endif]-->
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
    <!--#include virtual="/cristalensi/inc_funzioni_head.asp"-->
</head>

<body>
    <!--#include file="inc_header_1.asp"-->
    <!--#include file="inc_header_2.asp"-->
    <div class="container content">
        <div class="col-md-12">
            <!--#include file="inc_slider.asp"-->
            <div class="row top-buffer">
                <div class="col-md-8">
                    <h1 class="slogan">Cristalensi, vendita lampadari.<br />Showroom aperto da oltre 50 anni!</h1>
                    <p class="main-description">
                        A portata di click una vasta e raffinata gamma di prodotti per illuminazione da interno ed esterno per arredare la casa, il giardino, un locale...<br />Naviga nel catalogo online oppure visita il nostro Showroom, soddisferemo tutte le tue esigenze: dai <b>lampadari</b>
                        moderni e classici, alle <b>applique</b>, alle <b>plafoniere</b> e <b>piantane</b> ma anche <b>faretti</b> e <b>ventilatori con luce</b>. Tanti prodotti per <b>illuminazione a LED</b>, <b>in cristallo</b> e <b>vetro Murano</b>, in stile
                        <b>Tiffany</b>, <b>rustici</b> o <b>vintage</b>. Abbiamo un'ampia esposizione di lampade da esterno sia <b>moderne</b> che <b>classiche</b> e articoli specifici <b>per bambini</b>, camerette e tutti gli altri ambienti della casa. Sono presenti anche lampade per l'ufficio.<br />
                        Uno staff cordiale e professionale &egrave; sempre pronto a consigliarti l'acquisto pi&ugrave; adatto alle tue richieste.
                    </p>
                </div>
                <%
                Set com_rs = Server.CreateObject("ADODB.Recordset")
                sql = "SELECT TOP 3 * FROM Commenti_Clienti WHERE Pubblicato=1 ORDER BY PkId DESC"
                com_rs.open sql,conn, 1, 1
                if com_rs.recordcount>0 then
                %>
                <div class="col-md-4 ">
                    <div class="panel panel-default user-comment">
                        <!-- Default panel contents -->
                        <div class="panel-heading">
                            <h5><i class="fa fa-users"></i> Dicono di noi...</h5>
                        </div>
                        <ul class="list-group">
                            <%Do While not com_rs.EOF%>
                            <li class="list-group-item"><i class="fa fa-user"></i> <em><%=Left(NoHTML(com_rs("Testo")), 90)%>... Voto: <%=com_rs("Valutazione")%>/5</em></li>
                            <%
                            com_rs.movenext
            								loop
                            %>
                        </ul>
                        <div class="panel-footer"><a href="commenti_elenco.asp" class="btn btn-default">leggi tutti i commenti <i class="fa fa-chevron-right"></i></a></div>
                    </div>
                </div>
                <%
                end if
                com_rs.close
                %>
            </div>
            <div class="row top-buffer">
                <div class="col-xl-12 clearfix">
                    <h4 class="subtitle pull-left"><div class="dot"></div><span>Cosa stai cercando?</span></h4>
                </div>
                <div class="col-xs-6 col-sm-4 col-md-3 ">
                    <article class="col-item">
                        <div class="photo">
                            <a href="/cristalensi/illuminazione-interni-ed-esterni/1ng-lampade-da-interno.asp" class="prod-img-replace" style="background-image: url(images/home-lampade-da-interno.jpg)" title="Lampade da interno"><img alt="Lampade da interno" src="images/blank.png"></a>
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
                            <a href="/cristalensi/illuminazione-interni-ed-esterni/2ng-lampade-da-esterno.asp" class="prod-img-replace" style="background-image: url(images/home-lampade-da-esterno.jpg)" title="Lampade da esterno"><img alt="Lampade da esterno" src="images/blank.png"></a>
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
                            <a href="/cristalensi/illuminazione-interni-ed-esterni/3ng-ventilatori.asp" class="prod-img-replace" style="background-image: url(images/home-ventilatori.jpg)" title="Ventilatori"><img alt="Ventilatori" src="images/blank.png"></a>
                        </div>
                        <div class="info">
                            <div class="row">
                                <div class="category col-md-6">
                                    <a href="/cristalensi/illuminazione-interni-ed-esterni/3ng-ventilatori.asp" title="Ventilatori"><h1>Ventilatori</h1></a>
                                </div>
                            </div>
                        </div>
                    </article>
                </div>
                <div class="col-xs-6 col-sm-4 col-md-3 ">
                    <article class="col-item">
                        <div class="photo">
                            <a href="/cristalensi/illuminazione-interni-ed-esterni/4ng-lampadine.asp" class="prod-img-replace" style="background-image: url(images/home-lampadine.jpg)" title="Lampadine"><img alt="Lampadine" src="images/blank.png"></a>
                        </div>
                        <div class="info">
                            <div class="row">
                                <div class="category col-md-6">
                                    <a href="/cristalensi/illuminazione-interni-ed-esterni/4ng-lampadine-componenti-illuminazione.asp" title="Lampadine"><h1>Lampadine, driver e strisce</h1></a>
                                </div>
                            </div>
                        </div>
                    </article>
                </div>
            </div>
            <div class="row top-buffer">
                <div class="col-xl-12 clearfix">
                    <h4 class="subtitle pull-left"><div class="dot"></div><span>Offerte e prodotti in promozione</span></h4> <a href="/cristalensi/offerte.asp" class="btn btn-default pull-right" title="Offerte e prodotti in promozione">Vedi tutte le Offerte <i class="fa fa-chevron-right"></i></a>
                </div>
                <%
                'random prodotti in offerta
                Set prod_rs = Server.CreateObject("ADODB.Recordset")
                sql = "SELECT pkid,codicearticolo,titolo,prezzoprodotto,prezzolistino,nomepagina,offerta,fkproduttore FROM Prodotti WHERE Offerta=1 OR Offerta=2 ORDER BY Titolo ASC"
                prod_rs.open sql,conn, 1, 1

                Randomize()
                constnum = 8

                if prod_rs.recordcount>0 then
                  IF NOT prod_rs.EOF THEN
                  rndArray = prod_rs.GetRows()
                  prod_rs.Close
                %>
                <%
  								Lenarray =  UBOUND( rndArray, 2 ) + 1
  								skip =  Lenarray  / constnum
  								IF Lenarray <= constnum THEN skip = 1
  								FOR i = 0 TO Lenarray - 1 STEP skip
  									numero = RND * ( skip - 1 )
  									id = rndArray( 0, i + numero )
  									codicearticolo = rndArray( 1, i + numero )
  									titolo_prodotto = rndArray( 2, i + numero )
  									prezzoarticolo = rndArray( 3, i + numero )
                    if prezzoarticolo="" or isNull(prezzoarticolo) then prezzoarticolo=0
  									prezzolistino = rndArray( 4, i+ numero )
                    if prezzolistino="" or isNull(prezzolistino) then prezzolistino=0

  									NomePagina = rndArray( 5, i+ numero )
  									if Len(NomePagina)>0 then
  										NomePagina="public/pagine/"&NomePagina
  										'NomePagina="/public/pagine/inc_scheda_prodotto.asp?id="&id
  									else
  										NomePagina="#"
  									end if

                    fkproduttore_pr = rndArray( 7, i + numero )
                    if fkproduttore_pr="" then fkproduttore_pr=0
                    'response.write("fkproduttore:"&fkproduttore)

                      if fkproduttore_pr>0 then
                        Set pr_rs = Server.CreateObject("ADODB.Recordset")
                        sql = "SELECT * FROM Produttori WHERE PkId="&fkproduttore_pr&""
                        pr_rs.open sql,conn, 1, 1
                        if pr_rs.recordcount>0 then
                          produttore=pr_rs("titolo")
                          url_produttore="/produttori-illuminazione/"&ConvertiTitoloInUrlProduttore(produttore, fkproduttore_pr)
                        end if
                        pr_rs.close
                      end if


  									'recupero l'immagine
  									Set img_rs = Server.CreateObject("ADODB.Recordset")
  									sql = "SELECT * FROM Immagini WHERE Record="&id&" AND Tabella='Prodotti' Order by PkId_Contatore ASC"
  									img_rs.open sql,conn, 1, 1
  									if img_rs.recordcount>0 then
  										tot_img=img_rs.recordcount
  										titolo_img=img_rs("titolo")
  										file_img=NoLettAcc(img_rs("file"))
                    end if
                    img_rs.close

  							%>
                <div class="col-xs-12 col-sm-4 col-md-3">
                  <article class="col-item">
                      <div class="photo">
                          <a href="/cristalensi/<%=NomePagina%>" class="prod-img-replace" style="background-image: url(https://www.cristalensi.it/public/<%=file_img%>)" title="<%=titolo_prodotto%>"><img alt="<%=titolo_prodotto%>" src="/cristalensi/images/blank.png"></a>
                      </div>
                      <div class="info">
                          <div class="row">
                              <div class="price-details col-md-6">
                                  <a href="/cristalensi/<%=NomePagina%>" title="<%=titolo_prodotto%>"><h1><%=titolo_prodotto%></h1></a>
                                  <p class="details">codice: <b><%=codicearticolo%></b><br /><span>produttore: <b><a href="<%=url_produttore%>"><%=produttore%></a></b></span></p>
                                  <div class="price-box separator">
                                      <%if prezzoarticolo<>0 then%>
                                        <span class="price-new"><i class="fa fa-tag"></i>&nbsp;<%=prezzoarticolo%> &euro;</span><br />
                                        <%if prezzolistino<>0 then%><span class="price-old">invece di  <b><%=prezzolistino%> &euro;</b></span><%else%>&nbsp;<%end if%>
                                      <%else%>
                                        <span class="price-new">&nbsp;<br /></span>
                                        <span class="price-old">Prezzo di listino: <b><%=prezzolistino%> &euro;</b></span>
                                      <%end if%>
                                  </div>
                              </div>
                          </div>
                          <div class="separator clear-left">
                              <p class="btn-add">
                                  <a href="#" class="hidden-lg" data-toggle="tooltip" data-placement="top" title="Aggiungi ai preferiti"><i class="fa fa-heart"></i></a>
                              </p>
                              <p class="btn-details">
                                  <a href="/cristalensi/<%=NomePagina%>" class="hidden-lg" data-toggle="tooltip" data-placement="top" title="vedi ed aggiungi al carrello">vedi scheda <i class="fa fa-chevron-right"></i></a>
                              </p>
                          </div>
                          <div class="clearfix"></div>
                      </div>
                  </article>
                </div>
                <%
                  NEXT
                  end if
                  else
                  prod_rs.close
                  end if
                %>
            </div>
            <%
            Set prod_rs = Server.CreateObject("ADODB.Recordset")
            sql = "SELECT Top 8 * FROM Prodotti WHERE (Offerta=0 or Offerta=2) ORDER BY PkId DESC"
            prod_rs.open sql,conn, 1, 1
            if prod_rs.recordcount>0 then
            %>
            <div class="row top-buffer">
                <div class="col-xl-12 clearfix">
                    <h4 class="subtitle pull-left"><div class="dot"></div><span>Novit&Agrave; illuminazione e ultimi arrivi</span></h4> <a href="/cristalensi/novita-illuminazione-ultimi-arrivi.asp" class="btn btn-default pull-right" title="Novit&Agrave; illuminazione e ultimi arrivi">Vedi tutte le Novit&agrave; <i class="fa fa-chevron-right"></i></a>
                </div>
                <%
                Do while not prod_rs.EOF

                  id=prod_rs("pkid")
                  titolo_prodotto=prod_rs("titolo")
                  NomePagina=prod_rs("NomePagina")
                  if Len(NomePagina)>0 then
                    NomePagina="public/pagine/"&NomePagina
                    'NomePagina="/public/pagine/scheda_prodotto.asp?id="&id
                  else
                    NomePagina="#"
                  end if
                  codicearticolo=prod_rs("codicearticolo")
                  prezzoarticolo=prod_rs("PrezzoProdotto")
                  prezzolistino=prod_rs("PrezzoListino")

                    fkproduttore_pr=prod_rs("fkproduttore")
                    if fkproduttore_pr="" then fkproduttore_pr=0

                    if fkproduttore_pr>0 then
                      Set pr_rs = Server.CreateObject("ADODB.Recordset")
                      sql = "SELECT * FROM Produttori WHERE PkId="&fkproduttore_pr&""
                      pr_rs.open sql,conn, 1, 1
                      if pr_rs.recordcount>0 then
                        produttore=pr_rs("titolo")
                        url_produttore="/produttori-illuminazione/"&ConvertiTitoloInUrlProduttore(produttore, fkproduttore_pr)
                      end if
                      pr_rs.close
                    end if

                    Set img_rs = Server.CreateObject("ADODB.Recordset")
                    sql = "SELECT * FROM Immagini WHERE Record="&id&" AND Tabella='Prodotti' Order by PkId_Contatore ASC"
                    img_rs.open sql,conn, 1, 1
                    if img_rs.recordcount>0 then
                      tot_img=img_rs.recordcount
                      titolo_img=img_rs("titolo")
                      file_img=NoLettAcc(img_rs("file"))
                    end if
                    img_rs.close
                %>
                <div class="col-xs-12 col-sm-4 col-md-3">
                  <article class="col-item">
                      <div class="photo">
                          <a href="/cristalensi/<%=NomePagina%>" class="prod-img-replace" style="background-image: url(https://www.cristalensi.it/public/<%=file_img%>)" title="<%=titolo_prodotto%>"><img alt="<%=titolo_prodotto%>" src="/cristalensi/images/blank.png"></a>
                      </div>
                      <div class="info">
                          <div class="row">
                              <div class="price-details col-md-6">
                                  <a href="/cristalensi/<%=NomePagina%>" title="<%=titolo_prodotto%>"><h1><%=titolo_prodotto%></h1></a>
                                  <p class="details">codice: <b><%=codicearticolo%></b><br /><span>produttore: <b><a href="<%=url_produttore%>"><%=produttore%></a></b></span></p>
                                  <div class="price-box separator">
                                      <%if prezzoarticolo<>0 then%>
                                        <span class="price-new"><i class="fa fa-tag"></i>&nbsp;<%=prezzoarticolo%> &euro;</span><br />
                                        <%if prezzolistino<>0 then%><span class="price-old">invece di  <b><%=prezzolistino%> &euro;</b></span><%else%>&nbsp;<%end if%>
                                      <%else%>
                                        <span class="price-new">&nbsp;<br /></span>
                                        <span class="price-old">Prezzo di listino: <b><%=prezzolistino%> &euro;</b></span>
                                      <%end if%>
                                  </div>
                              </div>
                          </div>
                          <div class="separator clear-left">
                              <p class="btn-add">
                                  <a href="#" class="hidden-lg" data-toggle="tooltip" data-placement="top" title="Aggiungi ai preferiti"><i class="fa fa-heart"></i></a>
                              </p>
                              <p class="btn-details">
                                  <a href="/cristalensi/<%=NomePagina%>" class="hidden-lg" data-toggle="tooltip" data-placement="top" title="vedi ed aggiungi al carrello">vedi scheda <i class="fa fa-chevron-right"></i></a>
                              </p>
                          </div>
                          <div class="clearfix"></div>
                      </div>
                  </article>
                </div>
                <%
                prod_rs.movenext
                loop
                %>
            </div>
            <%
            end if
            prod_rs.close
            %>
        </div>
    </div>
    <!--#include file="inc_footer.asp"-->

    <script type='text/javascript' src='javascripts/camera.js'></script>

    <script type='text/javascript' src='javascripts/jquery.easing.1.3.js'></script>
    <script>
		jQuery(function(){

			jQuery('#slider').camera({
                height: '55%',
	            pagination: false,
				thumbnails: false,
                autoadvance: true
			});
		});
	</script>
</body>
<!--#include file="inc_strClose.asp"-->
