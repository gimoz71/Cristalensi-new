<!--#include virtual="/cristalensi/inc_strConn.asp"-->
<%
'id=request("id")
if id="" then id=0
if id=0 then response.Redirect("https://www.cristalensi.it/prodotti.asp")

if id>0 then
	Set prod_rs = Server.CreateObject("ADODB.Recordset")
	sql = "SELECT * FROM Prodotti WHERE PKId="&id
	prod_rs.open sql,conn, 3, 3
	if prod_rs.recordcount>0 then
		CodiceArticolo=prod_rs("CodiceArticolo")
		Titolo_prodotto=prod_rs("Titolo")
		Descrizione_prodotto=prod_rs("Descrizione")
		allegato_prodotto=prod_rs("Allegato")
		PrezzoArticolo=prod_rs("PrezzoProdotto")
		PrezzoListino=prod_rs("PrezzoListino")
		fkproduttore=prod_rs("fkproduttore")
		if fkproduttore="" then fkproduttore=0
		NomePagina=prod_rs("NomePagina")

		offerta=prod_rs("offerta")
		if offerta="" then offerta=0

		ClasseEnergetica=prod_rs("ClasseEnergetica")

		if fkproduttore>0 then
			Set pr_rs = Server.CreateObject("ADODB.Recordset")
			sql = "SELECT * FROM Produttori WHERE PkId="&fkproduttore&""
			pr_rs.open sql,conn, 1, 1
			if pr_rs.recordcount>0 then
				produttore=pr_rs("titolo")
				url_produttore="/produttori-illuminazione/"&ConvertiTitoloInUrlProduttore(produttore, fkproduttore)
			end if
			pr_rs.close
		end if

		FkNewGruppo = prod_rs("FkNewGruppo")
		if FkNewGruppo="" then FkNewGruppo=0

		FkNewTipologia = prod_rs("FkNewTipologia")
		if FkNewTipologia="" then FkNewTipologia=0

		FkNewCategoria = prod_rs("FkNewCategoria")
		if FkNewCategoria="" then FkNewCategoria=0

		Set gr_rs = Server.CreateObject("ADODB.Recordset")
		sql = "SELECT * FROM NewGruppi WHERE PkId="&FkNewGruppo
		gr_rs.open sql,conn, 1, 1
		if gr_rs.recordcount>0 then
		  Titolo_1_gr=gr_rs("Titolo_1")
		  Titolo_2_gr=gr_rs("Titolo_2")
		  Url_gr=gr_rs("Url")
		end if
		gr_rs.close

		Set tr_rs = Server.CreateObject("ADODB.Recordset")
		sql = "SELECT * FROM NewTipologie WHERE PkId="&FkNewTipologia
		tr_rs.open sql,conn, 1, 1
		if tr_rs.recordcount>0 then
		  Titolo_1_tip=tr_rs("Titolo_1")
		  Titolo_2_tip=tr_rs("Titolo_2")
		  Url_tip=tr_rs("Url")
		end if
		tr_rs.close

		Set cr_rs = Server.CreateObject("ADODB.Recordset")
		sql = "SELECT * FROM NewCategorie WHERE PkId="&FkNewCategoria
		cr_rs.open sql,conn, 1, 1
		if cr_rs.recordcount>0 then
		  Titolo_1_cat=cr_rs("Titolo_1")
		  Titolo_2_cat=cr_rs("Titolo_2")
		  Url_cat=cr_rs("Url")
		  Title_cat=cr_rs("Title")
		end if
		cr_rs.close

		'aggiorno il contatore
		visualizzazioni=prod_rs("visualizzazioni")
		if visualizzazioni="" or IsNull(visualizzazioni) then visualizzazioni=0
		prod_rs("visualizzazioni")=visualizzazioni+1
		prod_rs.update
	end if
	prod_rs.close


end if
%>
<!DOCTYPE html>
<html>

<head>
    <title><%=Titolo_prodotto%> <%=" "& produttore%> - <%=Titolo_2_cat%></title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="description" content="Scheda del prodotto <%=Titolo_prodotto%>, <%=produttore%>, <%=codicearticolo%>, Cristalensi vende <%=Titolo_2_cat%>">
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
    <link href="/cristalensi/stylesheets/styles.css" media="screen" rel="stylesheet" type="text/css">
    <link rel="stylesheet" type="text/css" href="/cristalensi/stylesheets/customization.css" shim-shadowdom>
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
  <!--#include virtual="/cristalensi/inc_header_1.asp"-->
    <div class="container content">
        <div class="row hidden">
            <div class="col-md-12 parentOverflowContainer">
            </div>
        </div>
        <ol class="breadcrumb">
				<li><a href="/cristalensi/index.asp">Home</a></li>
				<li><a href="/cristalensi/illuminazione-interni-ed-esterni/<%=Url_gr%>"><%=Titolo_2_gr%></a></li>
				<li><a href="/cristalensi/illuminazione-interni-ed-esterni/<%=Url_tip%>"><%=Titolo_2_tip%></a></li>
				<li><a href="/cristalensi/illuminazione-interni-ed-esterni/<%=Url_cat%>"><%=Titolo_2_cat%></a></li>
				<li class="active"><%=Titolo_prodotto%></li>
        </ol>
        <div class="">
            <div class="col-md-8">
                <div class="row">
                    <div class="title">
                        <h4><%=Titolo_2_cat%></h4>
                        <p class="details">codice: <b><%=codicearticolo%></b> - produttore: <b><a href="<%=url_produttore%>"><%=produttore%></a></b></p>
                    </div>
                    <div class="col-md-12">
                        <div class="top-buffer">
                            <p class="descrizione"><small>
                                <%=Descrizione_prodotto%>
                                </small>
                            </p>
                            <hr />
                            <div class="row">
                                <div class="col-md-2 col-xs-4">
                                    <div class="col-item">
                                        <div class="photo">
                                            <a href="scheda.html" class="prod-img-replace" style="background-image: url(images/slider1.png)"><img alt="900x550" src="images/blank.png"></a>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-2 col-xs-4">
                                    <div class="col-item">
                                        <div class="photo">
                                            <a href="scheda.html" class="prod-img-replace" style="background-image: url(images/slider1.png)"><img alt="900x550" src="images/blank.png"></a>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-2 col-xs-4">
                                    <div class="col-item">
                                        <div class="photo">
                                            <a href="scheda.html" class="prod-img-replace" style="background-image: url(images/slider1.png)"><img alt="900x550" src="images/blank.png"></a>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-2 col-xs-4">
                                    <div class="col-item">
                                        <div class="photo">
                                            <a href="scheda.html" class="prod-img-replace" style="background-image: url(images/slider1.png)"><img alt="900x550" src="images/blank.png"></a>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-2 col-xs-4">
                                    <div class="col-item">
                                        <div class="photo">
                                            <a href="scheda.html" class="prod-img-replace" style="background-image: url(images/slider1.png)"><img alt="900x550" src="images/blank.png"></a>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-2 col-xs-4">
                                    <div class="col-item">
                                        <div class="photo">
                                            <a href="scheda.html" class="prod-img-replace" style="background-image: url(images/slider1.png)"><img alt="900x550" src="images/blank.png"></a>
                                        </div>
                                    </div>
                                </div>
                                <div class="clearfix">

                                </div>
																<div class="panel panel-default user-comment">
                                    <!-- Default panel contents -->
                                    <div class="panel-heading">
                                        <h5><i class="glyphicon glyphicon-warning-sign"></i> INFORMAZIONI IMPORTANTI SULLA DISPONIBILITA' DEI PRODOTTI</h5>
                                    </div>
                                    <ul class="list-group">
                                        <li class="list-group-item">
                                          Il nostro catalogo &egrave; composto da numerosi prodotti e non tutti sono disponibili immediatamente al momento della richiesta: potrebbero essere disponibili nel giro di qualche giorno.<br />
<!--Nel caso in cui ci fosse urgenza del prodotto desiderato, informarsi direttamente dal nostro staff.<br />-->
<em>Noi garantiamo una consegna da un minimo di 2 giorni a un massimo di 30 giorni.</em><br />
                                        </li>
                                    </ul>
                                    <div class="panel-footer"><a href="#" class="btn btn-warning btn-block">Contatta lo staff per info sulla disponibilit&agrave; <i class="fa fa-angle-right"></i></a></div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="panel panel-default" style="box-shadow: 0 3px 5px #ccc;">
                    <ul class="list-group text-center">
                        <li class="list-group-item" style="padding-top: 20px">
                            <p>prezzo Cristalensi:<br />
                                <span class="price-new"><i class="fa fa-tag"></i>&nbsp;110.00 &euro;</span><br />
                                <span class="price-old">invece di  <b>130.00 &euro;</b></span>
                            </p>
                        </li>
                        <li class="list-group-item">
                            <select class="selectpicker show-menu-arrow  show-tick" data-size="4" title="Seleziona una variante">
                                <option title="Applique classiche e lampade a parete" value="9c-applique-classiche-e-lampade-classiche-a-parete.asp">Applique classiche e lampade a parete</option>
                                <option title="Lampadari classici e lampade a sospensione" value="7c-lampadari-classici-e-lampade-classiche-a-sospensione.asp">Lampadari classici e lampade a sospensione</option>
                                <option title="Lampade classiche da tavolo" value="10c-lampade-classiche-da-tavolo-lumini-e-abat-jour-classiche.asp">Lampade classiche da tavolo</option>
                                <option title="Piantane classiche e lampade da terra" value="11c-piantane-classiche-e-lampade-classiche-da-terra.asp">Piantane classiche e lampade da terra</option>
                                <option title="Plafoniere classiche e lampade a soffitto" value="8c-plafoniere-classiche-e-lampade-classiche-a-soffitto.asp" >Plafoniere classiche e lampade a soffitto</option>
                            </select>

                        </li>
                        <li class="list-group-item">
                            <input type="number" data-width="auto" class="form-control" name="pezzi" placeholder="quantit&agrave;" aria-label="Pezzi">
                        </li>
                    </ul>
                    <div class="panel-footer">
                        <a href="carrello.html" class="btn btn-danger btn-block">Aggiungi al carrello <i class="glyphicon glyphicon-shopping-cart"></i></a>
                    </div>
                </div>
								<div class="alert alert-success" role="alert" style="text-align: center;">
                  <em>Hai bisogno di aiuto? Contattaci!</em><br /><br /><a href="tel: 0571.911163" class="alert-link"><span class="glyphicon glyphicon-earphone"></span> 0571.911163</a> - <a href="mailto:info@cristalensi.it" class="alert-link"><span class="glyphicon glyphicon-envelope"></span> info@cristalensi.it</a>
                  <br /><br />Lun. - Ven.: 9.00 - 12.30 | 14.30 - 19.30<br />Sab.: 9.00 - 12.30 | 15.30 - 19.30<br />Domenica CHIUSI<br />Giugno/Luglio CHIUSI Sabato Pomeriggio<br />
                </div>
            </div>
        </div>
        <div class="col-md-6">
            <div class=" top-buffer">
                <div class="panel panel-default user-comment">
                    <!-- Default panel contents -->
                    <div class="panel-heading">
                        <h5><i class="fa fa-users"></i> Dicono di noi...</h5>
                    </div>
                    <ul class="list-group">
                        <li class="list-group-item"><i class="fa fa-user"></i> <em>Ho acquistato una lampada d<b>a parete</b> per esterno Newport verde. Per la consegna c'&egrave; voluto qua...</em></li>
                        <li class="list-group-item"><i class="fa fa-user"></i> <em>Pochi giorni fa ho acquistato un lampadario per bagno di <b>Murano</b> bombato <b>a soffitto</b> ho telefonato i...</em></li>
                        <li class="list-group-item"><i class="fa fa-user"></i> <em>Il mio ordine: ORINA PLAFONIERA IN METALLO CROMATO. &Egrave; arrivato prima il pacco che le mail di spedizi...</em></li>
                    </ul>
                    <div class="panel-footer"><a href="#" class="btn btn-success">leggi tutti i commenti <i class="fa fa-chevron-right"></i></a></div>
                </div>
            </div>
        </div>
        <div class="col-md-6">
            <div class=" top-buffer">
                <div class="panel panel-default user-comment">
                    <!-- Default panel contents -->
                    <div class="panel-heading">
                        <h5><i class="fa fa-users"></i> Facebook</h5>
                    </div>
                    <ul class="list-group">
                        <li class="list-group-item"><i class="fa fa-user"></i> <em>Ho acquistato una lampada d<b>a parete</b> per esterno Newport verde. Per la consegna c'&egrave; voluto qua...</em></li>
                        <li class="list-group-item"><i class="fa fa-user"></i> <em>Pochi giorni fa ho acquistato un lampadario per bagno di <b>Murano</b> bombato <b>a soffitto</b> ho telefonato i...</em></li>
                        <li class="list-group-item"><i class="fa fa-user"></i> <em>Il mio ordine: ORINA PLAFONIERA IN METALLO CROMATO. &Egrave; arrivato prima il pacco che le mail di spedizi...</em></li>
                    </ul>
                    <div class="panel-footer"><a href="#" class="btn btn-success">leggi tutti i commenti <i class="fa fa-chevron-right"></i></a></div>
                </div>
            </div>
        </div>
    </div>
    <!--#include virtual="/cristalensi/inc_footer.asp"-->
</body>
<!--#include virtual="/cristalensi/inc_strClose.asp"-->
