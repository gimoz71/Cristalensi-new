<!--#include file="inc_strConn.asp"-->
<%
	mode=request("mode")
	if mode="" then mode=0

	IdOrdine=session("ordine_shop")
	if IdOrdine="" then IdOrdine=0
	if idOrdine=0 then response.redirect("carrello1.asp")

	'inserisco le eventuali note dal carrello1
	if fromURL="carrello1.asp" then
		Set os1 = Server.CreateObject("ADODB.Recordset")
		sql = "SELECT * FROM Ordini where PkId="&idOrdine
		os1.Open sql, conn, 3, 3
		os1("NoteCliente")=request("NoteCliente")
		os1.update
		os1.close
	end if
	if idsession=0 then response.Redirect("/cristalensi/iscrizione.asp?prov=1")

	'italia_log=session("italia_log")
	'if italia_log="No" then response.Redirect("carrello2extra.asp")

	Call Visualizzazione("",0,"carrello2.asp")

	mode=request("mode")
	if mode="" then mode=0

	'inserisco il costo del trasporto.
	TipoTrasportoScelto=request("TipoTrasportoScelto")
	if TipoTrasportoScelto="" then TipoTrasportoScelto=0

	Set os1 = Server.CreateObject("ADODB.Recordset")
	sql = "SELECT * FROM Ordini where PkId="&idOrdine
	os1.Open sql, conn, 3, 3

	TotaleCarrello=os1("TotaleCarrello")

	os1("FkCliente")=idsession

	if fromURL="carrello2.asp" then
		NoteCliente=request("NoteCliente")
		os1("NoteCliente")=NoteCliente
	end if

	if TipoTrasportoScelto>0 then
		Set trasp_rs = Server.CreateObject("ADODB.Recordset")
		sql = "SELECT * FROM CostiTrasporto where PkId="&TipoTrasportoScelto
		trasp_rs.Open sql, conn, 1, 1
		if trasp_rs.recordcount>0 then
			PkIdTrasportoScelto=trasp_rs("PkId")
			NomeTrasportoScelto=trasp_rs("Nome")
			CostoTrasportoScelto=trasp_rs("Costo")
			TipoCostoTrasportoScelto=trasp_rs("TipoCosto")
		end if
		trasp_rs.close

		if TipoCostoTrasportoScelto=1 then
			CostoSpedizione=CostoTrasportoScelto
		end if
		if TipoCostoTrasportoScelto=2 then
			CostoSpedizione=(TotaleCarrello*CostoTrasportoScelto)/100
		end if
		if TipoCostoTrasportoScelto=3 or TipoCostoTrasportoScelto=10 or TotaleCarrello>=250 then
			CostoSpedizione=0
		end if

		os1("TipoTrasporto")=NomeTrasportoScelto
		os1("FkSpedizione")=TipoTrasportoScelto
		os1("CostoSpedizione")=CostoSpedizione
		os1("TotaleGenerale")=TotaleCarrello+CostoSpedizione
	end if

	if mode=0 then
		os1("stato")=1
	else
		os1("stato")=2

		Nominativo_sp=request("Nominativo_sp")
		Telefono_sp=request("Telefono_sp")
		Indirizzo_sp=request("Indirizzo_sp")
		CAP_sp=request("CAP_sp")
		Citta_sp=request("Citta_sp")
		Provincia_sp=request("Provincia_sp")
		Nazione_sp=request("Nazione_sp")

		os1("Nominativo_sp")=Nominativo_sp
		os1("Telefono_sp")=Telefono_sp
		os1("Indirizzo_sp")=Indirizzo_sp
		os1("CAP_sp")=CAP_sp
		os1("Citta_sp")=Citta_sp
		os1("Provincia_sp")=Provincia_sp
		os1("Nazione_sp")=Nazione_sp
	end if
	os1("DataAggiornamento")=now()
	os1("IpOrdine")=Request.ServerVariables("REMOTE_ADDR")
	os1.update

	os1.close

	if mode=1 and TipoCostoTrasportoScelto<10 then response.Redirect("/cristalensi/carrello3.asp")
	if mode=1 and TipoCostoTrasportoScelto=10 then response.Redirect("/cristalensi/carrello2extra.asp")

%>
<!DOCTYPE html>
<html>

<head>
    <title>Cristalensi</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="description" content="Cristalensi.">
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
    <link href="javascripts/html5shiv.js" rel="stylesheet">
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
</head>

<body>
    <nav class="navbar navbar-inverse menu-aux navbar-default visible-xs">
        <div class="container">
            <div class="col-xs-6">
                <ul class="nav navbar-nav">
                    <li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"><span class="glyphicon glyphicon-info-sign"></span> Contattaci <span class="caret"></span></a>
                        <ul class="dropdown-menu">
                            <li><a href="#"><span class="glyphicon glyphicon-earphone"></span> +39 0571 911163</a></li>
                            <li><a href="#"><span class="glyphicon glyphicon-envelope"></span> info@cristalensi.it</a></li>
                            <li><a href="#"><span class="glyphicon glyphicon-map-marker"></span> Contatti e mappa</a></li>
                            <li><a href="#"><span class="glyphicon glyphicon-star"></span> Chi siamo</a></li>
                        </ul>
                    </li>
                </ul>
            </div>
            <div class="col-xs-6">
                <ul class="nav navbar-nav">
                    <li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"><span class="glyphicon glyphicon-globe"></span> Lingua <span class="caret"></span></a>
                        <ul class="dropdown-menu">
                            <li><a href="#">Italiano</a></li>
                            <li><a href="#">Tedesco</a></li>
                        </ul>
                    </li>
                </ul>
            </div>
        </div>
    </nav>
    <nav class="navbar navbar-inverse menu-aux hidden-xs first-top-menu">
        <div class="container">
            <ul class="nav nav-justified">
                <li><a href="#"><span class="glyphicon glyphicon-earphone"></span> +39 0571 911163</a></li>
                <li><a href="#"><span class="glyphicon glyphicon-envelope"></span> info@cristalensi.it</a></li>
                <li><a href="#"><span class="glyphicon glyphicon-map-marker"></span> Contatti e mappa</a></li>
                <li><a href="#"><span class="glyphicon glyphicon-star"></span> Chi siamo</a></li>
                <li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"><span class="glyphicon glyphicon-globe"></span> Lingua <span class="caret"></span></a>
                    <ul class="dropdown-menu">
                        <li><a href="#">Italiano</a></li>
                        <li><a href="#">Tedesco</a></li>
                    </ul>
                </li>
            </ul>
        </div>
    </nav>
    <nav class="navbar navbar-inverse service-menu hidden-xs last-top-menu">
        <div class="container">
            <ul class="nav nav-justified">
                <li><a href="#"><span class="glyphicon glyphicon-home"></span> Home</a></li>
                <li><a href="#"><span class="glyphicon glyphicon-bullhorn"></span> Dicono di noi</a></li>
                <li><a href="#"><span class="glyphicon glyphicon-facetime-video"></span> Video</a></li>
                <li><a href="#"><span class="glyphicon glyphicon-log-in"></span> Accedi/iscriviti</a></li>
                <li><a href="#"><span class="glyphicon glyphicon-heart"></span> Lista dei desideri</a></li>
                <li><a href="#"><span class="glyphicon glyphicon-shopping-cart"></span> Carrello</a></li>
                <li><a href="#"><span class="glyphicon glyphicon-th-list"></span> Condizioni di vendita</a></li>
            </ul>
        </div>
    </nav>
    <div id="block-main">
        <div class="container">
            <div class="row no-gutters">
                <div class="col-xs-12 col-sm-4" style="text-align: center">
                    <a class="header-logo" href="/">Cristalensi</a>
                </div>
                <div class="col-md-8">
                    <form class="navbar-form pull-right search-bar" role="search">
                        <div class="input-group">
                            <input type="text" class="form-control" placeholder="Nome o codice prodotto" name="srch-term" id="srch-term">
                            <div class="input-group-btn">
                                <button class="btn btn-default" type="submit" style="margin-right: 5px;"><i class="glyphicon glyphicon-search"></i></button>
                                <button class="btn btn-danger" type="submit"><i class="glyphicon glyphicon-cog visible-xs-inline-block"></i><span class="hidden-xs"> Ricerca avanzata</span></button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <nav class="navbar yamm navbar-inverse">
            <div class="container">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                </div>
                <div id="navbar" class="navbar-collapse collapse">
                    <ul class="nav nav-justified main-menu">
                        <li class="nav-user visible-xs"><a href="#">Home</a></li>
                        <li class="nav-user dropdown yamm-fw"><a href="#" data-toggle="dropdown" class="dropdown-toggle">Interno <span class="glyphicon glyphicon-chevron-down" aria-hidden="true"></span></a>
                            <ul class="dropdown-menu">
                                <li>
                                    <!-- Content container to add padding -->
                                    <div class="yamm-content">
                                        <div class="row">
                                            <ul class="col-sm-6 col-lg-4 col-same-height list-unstyled">
                                                <li class="subcategory">
                                                    <a href="#"><h4><strong>Plafoniere</strong></h4></a>
                                                    <ul class="list-unstyled plafoniere">
                                                        <li><a href="#">Plafoniere <b>moderne</b></a></li>
                                                        <li><a href="#">Plafoniere <b>a LED</b></a></li>
                                                        <li><a href="#">Plafoniere <b>classiche</b></a></li>
                                                        <li><a href="#">Plafoniere <b>rustiche</b></a></li>
                                                        <li><a href="#">Plafoniere <b>vintage</b></a></li>
                                                        <li><a href="#">Plafoniere <b>Tiffany</b></a></li>
                                                        <li><a href="#">Plafoniere <b>in cristallo</b></a></li>
                                                        <li><a href="#">Plafoniere <b>Murano</b></a></li>
                                                        <li><a href="#">Plafoniere <b>gesso</b></a></li>
                                                        <li><a href="#">Plafoniere <b>per bambini</b></a></li>
                                                    </ul>
                                                </li>

                                            </ul>
                                            <ul class="col-sm-6 col-lg-4 col-same-height list-unstyled">
                                                <li class="subcategory">
                                                    <a href="#"><h4><strong>Lampadari</strong></h4></a>
                                                    <ul class="list-unstyled lampadari">
                                                        <li><a href="#">Lampadari <b>moderni</b></a></li>
                                                        <li><a href="#">Lampadari <b>a LED</b></a></li>
                                                        <li><a href="#">Lampadari <b>classici</b></a></li>
                                                        <li><a href="#">Lampadari <b>rustici</b></a></li>
                                                        <li><a href="#">Lampadari <b>vintage</b></a></li>
                                                        <li><a href="#">Lampadari <b>Tiffany</b></a></li>
                                                        <li><a href="#">Lampadari <b>in cristallo</b></a></li>
                                                        <li><a href="#">Lampadari <b>Murano</b></a></li>
                                                        <li><a href="#">Lampadari <b>per bambini</b></a></li>
                                                    </ul>
                                                </li>
                                            </ul>

                                            <ul class="col-sm-6 col-lg-4 col-same-height list-unstyled">
                                                <li class="subcategory">
                                                    <a href="#"><h4><strong>Applique</strong></h4></a>
                                                    <ul class="list-unstyled applique">
                                                        <li><a href="#">Applique <b>moderne</b></a></li>
                                                        <li><a href="#">Applique <b>a LED</b></a></li>
                                                        <li><a href="#">Applique <b>classiche</b></a></li>
                                                        <li><a href="#">Applique <b>rustiche</b></a></li>
                                                        <li><a href="#">Applique <b>vintage</b></a></li>
                                                        <li><a href="#">Applique <b>Tiffany</b></a></li>
                                                        <li><a href="#">Applique <b>in cristallo</b></a></li>
                                                        <li><a href="#">Applique <b>Murano</b></a></li>
                                                        <li><a href="#">Applique <b>gesso</b></a></li>
                                                        <li><a href="#">Applique <b>per bambini</b></a></li>
                                                    </ul>
                                                </li>
                                            </ul>
                                            <ul class="col-sm-6 col-lg-4 col-same-height list-unstyled">
                                                <li class="subcategory">
                                                    <a href="#"><h4><strong>Piantane</strong></h4></a>
                                                    <ul class="list-unstyled piantane">
                                                        <li><a href="#">Piantane <b>moderne</b></a></li>
                                                        <li><a href="#">Piantane <b>a LED</b></a></li>
                                                        <li><a href="#">Piantane <b>classiche</b></a></li>
                                                        <li><a href="#">Piantane <b>rustiche</b></a></li>
                                                        <li><a href="#">Piantane <b>vintage</b></a></li>
                                                        <li><a href="#">Piantane <b>Tiffany</b></a></li>
                                                        <li><a href="#">Piantane <b>in cristallo</b></a></li>
                                                        <li><a href="#">Piantane <b>Murano</b></a></li>
                                                        <li><a href="#">Piantane <b>gesso</b></a></li>
                                                        <li><a href="#">Piantane <b>per bambini</b></a></li>
                                                    </ul>
                                                </li>
                                            </ul>

                                            <ul class="col-sm-6 col-lg-4 col-same-height list-unstyled">
                                                <li class="subcategory">
                                                    <a href="#"><h4><strong>Lampade da tavolo</strong></h4></a>
                                                    <ul class="list-unstyled lampade-tavolo">
                                                        <li><a href="#">Lampade da tavolo <b>moderne</b></a></li>
                                                        <li><a href="#">Lampade da tavolo <b>a LED</b></a></li>
                                                        <li><a href="#">Lampade da tavolo <b>classiche</b></a></li>
                                                        <li><a href="#">Lampade da tavolo <b>rustiche</b></a></li>
                                                        <li><a href="#">Lampade da tavolo <b>vintage</b></a></li>
                                                        <li><a href="#">Lampade da tavolo <b>Tiffany</b></a></li>
                                                        <li><a href="#">Lampade da tavolo <b>in cristallo</b></a></li>
                                                        <li><a href="#">Lampade da tavolo <b>Murano</b></a></li>
                                                        <li><a href="#">Lampade da tavolo <b>gesso</b></a></li>
                                                        <li><a href="#">Lampade da tavolo <b>per bambini</b></a></li>
                                                    </ul>
                                                </li>
                                            </ul>
                                            <ul class="col-sm-6 col-lg-4 col-same-height list-unstyled">
                                                <li class="subcategory">
                                                    <a href="#"><h4><strong>Faretti, incassi e binari</strong></h4></a>
                                                    <ul class="list-unstyled faretti">
                                                        <li><a href="#">Faretti <b>a parete</b></a></li>
                                                        <li><a href="#">Faretti <b>a soffitto</b></a></li>
                                                        <li><a href="#">Faretti <b>da incasso</b></a></li>
                                                        <li><a href="#">Faretti <b>a LED</b></a></li>
                                                    </ul>
                                                </li>
                                                <li class="subcategory">
                                                    <a href="#"><h4><strong>Lampade allo specchio</strong></h4></a>
                                                    <ul class="list-unstyled lampade-specchio">
                                                        <li><a href="#">Lampade allo specchio <b>moderne</b></a></li>
                                                        <li><a href="#">Lampade allo specchio <b>a LED</b></a></li>
                                                        <li><a href="#">Specchi <b>con luce</b></a></li>
                                                    </ul>
                                                </li>
                                            </ul>
                                        </div>
                                    </div>
                                </li>
                            </ul>
                        </li>
                        <li class="nav-user dropdown yamm-fw"><a href="#" data-toggle="dropdown" class="dropdown-toggle">Esterno <span class="glyphicon glyphicon-chevron-down" aria-hidden="true"></span></a>
                            <ul class="dropdown-menu">
                                <li>
                                    <!-- Content container to add padding -->
                                    <div class="yamm-content">
                                        <div class="row">
                                            <ul class="col-sm-6 col-lg-4 col-same-height list-unstyled">
                                                <li class="subcategory">
                                                    <a href="#"><h4><strong>Plafoniere</strong></h4></a>
                                                    <ul class="list-unstyled plafoniere">
                                                        <li><a href="#">Plafoniere <b>moderne</b></a></li>
                                                        <li><a href="#">Plafoniere <b>a LED</b></a></li>
                                                        <li><a href="#">Plafoniere <b>classiche</b></a></li>
                                                        <li><a href="#">Plafoniere <b>rustiche</b></a></li>
                                                        <li><a href="#">Plafoniere <b>vintage</b></a></li>
                                                        <li><a href="#">Plafoniere <b>Tiffany</b></a></li>
                                                        <li><a href="#">Plafoniere <b>in cristallo</b></a></li>
                                                        <li><a href="#">Plafoniere <b>Murano</b></a></li>
                                                        <li><a href="#">Plafoniere <b>gesso</b></a></li>
                                                        <li><a href="#">Plafoniere <b>per bambini</b></a></li>
                                                    </ul>
                                                </li>

                                            </ul>
                                            <ul class="col-sm-6 col-lg-4 col-same-height list-unstyled">
                                                <li class="subcategory">
                                                    <a href="#"><h4><strong>Lampadari</strong></h4></a>
                                                    <ul class="list-unstyled lampadari">
                                                        <li><a href="#">Lampadari <b>moderni</b></a></li>
                                                        <li><a href="#">Lampadari <b>a LED</b></a></li>
                                                        <li><a href="#">Lampadari <b>classici</b></a></li>
                                                        <li><a href="#">Lampadari <b>rustici</b></a></li>
                                                        <li><a href="#">Lampadari <b>vintage</b></a></li>
                                                        <li><a href="#">Lampadari <b>Tiffany</b></a></li>
                                                        <li><a href="#">Lampadari <b>in cristallo</b></a></li>
                                                        <li><a href="#">Lampadari <b>Murano</b></a></li>
                                                        <li><a href="#">Lampadari <b>per bambini</b></a></li>
                                                    </ul>
                                                </li>
                                            </ul>

                                            <ul class="col-sm-6 col-lg-4 col-same-height list-unstyled">
                                                <li class="subcategory">
                                                    <a href="#"><h4><strong>Applique</strong></h4></a>
                                                    <ul class="list-unstyled applique">
                                                        <li><a href="#">Applique <b>moderne</b></a></li>
                                                        <li><a href="#">Applique <b>a LED</b></a></li>
                                                        <li><a href="#">Applique <b>classiche</b></a></li>
                                                        <li><a href="#">Applique <b>rustiche</b></a></li>
                                                        <li><a href="#">Applique <b>vintage</b></a></li>
                                                        <li><a href="#">Applique <b>Tiffany</b></a></li>
                                                        <li><a href="#">Applique <b>in cristallo</b></a></li>
                                                        <li><a href="#">Applique <b>Murano</b></a></li>
                                                        <li><a href="#">Applique <b>gesso</b></a></li>
                                                        <li><a href="#">Applique <b>per bambini</b></a></li>
                                                    </ul>
                                                </li>
                                            </ul>
                                            <ul class="col-sm-6 col-lg-4 col-same-height list-unstyled">
                                                <li class="subcategory">
                                                    <a href="#"><h4><strong>Piantane</strong></h4></a>
                                                    <ul class="list-unstyled piantane">
                                                        <li><a href="#">Piantane <b>moderne</b></a></li>
                                                        <li><a href="#">Piantane <b>a LED</b></a></li>
                                                        <li><a href="#">Piantane <b>classiche</b></a></li>
                                                        <li><a href="#">Piantane <b>rustiche</b></a></li>
                                                        <li><a href="#">Piantane <b>vintage</b></a></li>
                                                        <li><a href="#">Piantane <b>Tiffany</b></a></li>
                                                        <li><a href="#">Piantane <b>in cristallo</b></a></li>
                                                        <li><a href="#">Piantane <b>Murano</b></a></li>
                                                        <li><a href="#">Piantane <b>gesso</b></a></li>
                                                        <li><a href="#">Piantane <b>per bambini</b></a></li>
                                                    </ul>
                                                </li>
                                            </ul>

                                            <ul class="col-sm-6 col-lg-4 col-same-height list-unstyled">
                                                <li class="subcategory">
                                                    <a href="#"><h4><strong>Lampade da tavolo</strong></h4></a>
                                                    <ul class="list-unstyled lampade-tavolo">
                                                        <li><a href="#">Lampade da tavolo <b>moderne</b></a></li>
                                                        <li><a href="#">Lampade da tavolo <b>a LED</b></a></li>
                                                        <li><a href="#">Lampade da tavolo <b>classiche</b></a></li>
                                                        <li><a href="#">Lampade da tavolo <b>rustiche</b></a></li>
                                                        <li><a href="#">Lampade da tavolo <b>vintage</b></a></li>
                                                        <li><a href="#">Lampade da tavolo <b>Tiffany</b></a></li>
                                                        <li><a href="#">Lampade da tavolo <b>in cristallo</b></a></li>
                                                        <li><a href="#">Lampade da tavolo <b>Murano</b></a></li>
                                                        <li><a href="#">Lampade da tavolo <b>gesso</b></a></li>
                                                        <li><a href="#">Lampade da tavolo <b>per bambini</b></a></li>
                                                    </ul>
                                                </li>
                                            </ul>
                                            <ul class="col-sm-6 col-lg-4 col-same-height list-unstyled">
                                                <li class="subcategory">
                                                    <a href="#"><h4><strong>Faretti, incassi e binari</strong></h4></a>
                                                    <ul class="list-unstyled faretti">
                                                        <li><a href="#">Faretti <b>a parete</b></a></li>
                                                        <li><a href="#">Faretti <b>a soffitto</b></a></li>
                                                        <li><a href="#">Faretti <b>da incasso</b></a></li>
                                                        <li><a href="#">Faretti <b>a LED</b></a></li>
                                                    </ul>
                                                </li>
                                                <li class="subcategory">
                                                    <a href="#"><h4><strong>Lampade allo specchio</strong></h4></a>
                                                    <ul class="list-unstyled lampade-specchio">
                                                        <li><a href="#">Lampade allo specchio <b>moderne</b></a></li>
                                                        <li><a href="#">Lampade allo specchio <b>a LED</b></a></li>
                                                        <li><a href="#">Specchi <b>con luce</b></a></li>
                                                    </ul>
                                                </li>
                                            </ul>
                                        </div>
                                    </div>
                                </li>
                            </ul>
                        </li>
                        <li class="nav-user"><a href="#">Ventilatori <span class="glyphicon glyphicon-chevron-down" aria-hidden="true"></span></a></li>
                        <li class="nav-user"><a href="#">Lampadine <span class="glyphicon glyphicon-chevron-down" aria-hidden="true"></span></a></li>
                        <li class="nav-user"><a href="#">Stili <span class="glyphicon glyphicon-chevron-down" aria-hidden="true"></span></a></li>
                        <li class="nav-user"><a href="#">Ambienti <span class="glyphicon glyphicon-chevron-down" aria-hidden="true"></span></a></li>
                        <li class="nav-user"><a href="#">Produttori <span class="glyphicon glyphicon-chevron-down" aria-hidden="true"></span></a></li>

                        <li class="nav-user visible-xs"><a href="#">Dicono di noi</a></li>
                        <li class="nav-user visible-xs"><a href="#">Video</a></li>
                        <li class="nav-user visible-xs"><a href="#">Accedi/iscriviti</a></li>
                        <li class="nav-user visible-xs"><a href="#">Lista dei desideri</a></li>
                        <li class="nav-user visible-xs"><a href="#">Carrello</a></li>
                        <li class="nav-user visible-xs"><a href="#">Condizioni di vendita</a></li>
                    </ul>
                </div>
            </div>
        </nav>

    </div>
    <div class="container content">
        <div class="row hidden">
            <div class="col-md-12 parentOverflowContainer">
            </div>
        </div>
        <div class="col-sm-12">
            <div class="row bs-wizard">
                <div class="col-sm-5 bs-wizard-step complete">
                    <div class="text-center bs-wizard-stepnum">1</div>
                    <div class="progress">
                        <div class="progress-bar"></div>
                    </div>
                    <a href="#" class="bs-wizard-dot"></a>
                    <div class="bs-wizard-info text-center">Carrello.</div>
                </div>
                <div class="col-sm-5 bs-wizard-step complete">
                    <div class="text-center bs-wizard-stepnum">2</div>
                    <div class="progress">
                        <div class="progress-bar"></div>
                    </div>
                    <a href="#" class="bs-wizard-dot"></a>
                    <div class="bs-wizard-info text-center">Accedi / Registrati.</div>
                </div>
                <div class="col-sm-5 bs-wizard-step active">
                    <div class="text-center bs-wizard-stepnum">3</div>
                    <div class="progress">
                        <div class="progress-bar"></div>
                    </div>
                    <a href="#" class="bs-wizard-dot"></a>
                    <div class="bs-wizard-info text-center">Indirizzo di spedizione</div>
                </div>
                <div class="col-sm-5 bs-wizard-step disabled">
                    <div class="text-center bs-wizard-stepnum">4</div>
                    <div class="progress">
                        <div class="progress-bar"></div>
                    </div>
                    <a href="#" class="bs-wizard-dot"></a>
                    <div class="bs-wizard-info text-center">Pagamento &amp; fatturazione</div>
                </div>
                <div class="col-sm-5 bs-wizard-step disabled">
                    <div class="text-center bs-wizard-stepnum">5</div>
                    <div class="progress">
                        <div class="progress-bar"></div>
                    </div>
                    <a href="#" class="bs-wizard-dot"></a>
                    <div class="bs-wizard-info text-center">Conferma dell'ordine</div>
                </div>
            </div>
        </div>
        <div class="col-md-12">
            <div class="title">
                <h4>Il tuo ordine: modalit&agrave; di spedizione/ritiro prodotti</h4>
            </div>
            <div class="col-md-12">
                <div class="top-buffer">
                    <table id="cart" class="table table-hover table-condensed table-cart">
                        <thead>
                            <tr>
                                <th style="width:45%">Prodotto</th>
                                <th style="width:10%" class="text-center">Quantit&agrave;</th>
                                <th style="width:10%" class="text-center">Prezzo unitario</th>
                                <th style="width:20%" class="text-center">Subtotale</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td data-th="Product" class="cart-product">
                                    <div class="row">
                                        <div class="col-sm-12">
                                            <h5 class="nomargin"><a href="scheda.html">Modello Plafoniera Moderna</a></h5>
                                            <p>Col.: Avorio antico - Lamp.: Bianco satinato</p>
                                        </div>
                                    </div>
                                </td>
                                <td data-th="Quantity" class="text-center">
                                    1
                                </td>
                                <td data-th="Price" class="hidden-xs text-center">55&euro;</td>
                                <td data-th="Subtotal" class="text-center">55&euro;</td>
                            </tr>
                            <tr>
                                <td data-th="Product" class="cart-product">
                                    <div class="row">
                                        <div class="col-sm-12">
                                            <h5 class="nomargin"><a href="scheda.html">Modello Plafoniera Moderna</a></h5>
                                            <p>Col.: Avorio antico - Lamp.: Bianco satinato</p>
                                        </div>
                                    </div>
                                </td>
                                <td data-th="Quantity" class="text-center">
                                    1
                                </td>
                                <td data-th="Price" class="hidden-xs text-center">55&euro;</td>
                                <td data-th="Subtotal" class="text-center">55&euro;</td>
                            </tr>
                        </tbody>
                        <tfoot>
                            <tr class="visible-xs">
                                <td class="text-center"><strong>Totale 110&euro;</strong></td>
                            </tr>
                            <tr>
                                <td class="hidden-xs"></td>
                                <td class="hidden-xs"></td>
                                <td class="hidden-xs"></td>
                                <td class="hidden-xs text-center"><strong>Totale 110&euro;</strong></td>
                            </tr>
                        </tfoot>
                    </table>
                    <h5>Eventuali annotazioni</h5>
                    <p>Potete usare questo spazio per inserire eventuali annotazioni o comunicazioni in relazione ai prodotti in acquisto</p>
                    <textarea class="form-control" rows="3"></textarea>
                </div>
            </div>
        </div>
        <div class="col-md-12">
            <div class="row top-buffer">
                <div class="col-md-6">
                    <div class="title">
                        <h4>modalit&agrave; di spedizione</h4>
                    </div>
                    <div class="col-md-12 top-buffer">
                        <table id="cart" class="table table-hover table-condensed table-cart">
                            <thead>
                                <tr>
                                    <th style="width:70%">Modalit&agrave; di spedizione</th>
                                    <th style="width:15%">Tariffa</th>
                                    <th style="width:15%">Totale</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td data-th="Product" class="cart-product">
                                        <div class="row">
                                            <div class="col-sm-12">
                                                <div class="radio">
                                                    <label><input type="radio" name="auth" checked> <b>Spedizione in Italia</b></label>
                                                </div>
                                                <p style="color: #666; font-size: .85em;">Per le spedizioni ci affidiamo alle migliori ditte di trasporto nazionali con un costo fisso, indipendentemente dal numero di prodotti acquistati. Superati i 250€ questo costo non sarà addebitato e la spedizione
                                                    risulterà gratuita, a carico nostro.</p>
                                            </div>
                                        </div>
                                    </td>
                                    <td data-th="Price" style="">10,00&euro;</td>
                                    <td data-th="Subtotal" class="hidden-xs"></td>
                                </tr>
                                <tr>
                                    <td data-th="Product" class="cart-product">
                                        <div class="row">
                                            <div class="col-sm-12">
                                                <div class="radio">
                                                    <label><input type="radio" name="auth" > <b>Ritiro presso la nostra sede</b></label>
                                                </div>
                                                <p style="color: #666; font-size: .85em;">Per chi avesse la possibilità di ritirare i prodotti presso la nostra sede può farlo: in questo caso non verrebbe addebitato nessun costo di trasporto.</p>
                                            </div>
                                        </div>
                                    </td>
                                    <td data-th="Price">0,00&euro;</td>
                                    <td data-th="Subtotal" class="hidden-xs"></td>
                                </tr>
                                <tr>
                                    <td data-th="Product" class="cart-product">
                                        <div class="row">
                                            <div class="col-sm-12">
                                                <div class="radio">
                                                    <label><input type="radio" name="auth" > <b>Spedizione in Italia</b></label>
                                                </div>
                                                <p style="color: #666; font-size: .85em;">Per le spedizioni INTERNAZIONALI ci affidiamo alle migliori ditte di trasporto internazionali con un COSTO VARIABILE che dipende dal numero di prodotti acquistati e dalla destinazione. Una volta inseriti
                                                    i dati di spedizione il nostro staff ti farà avere il costo esatto per la spedizione. Da quel momento potrai completare l’ordine.</p>
                                            </div>
                                        </div>
                                    </td>
                                    <td data-th="Price">Da definire</td>
                                    <td data-th="Subtotal" class="hidden-xs"></td>
                                </tr>
                                <tr>
                                    <td data-th="Product" class="hidden-xs"></td>
                                    <td data-th="Price">
                                        <h5 class="visible-xs">costo spedizione: 10&euro;</h5></td>
                                    <td data-th="Subtotal" class="hidden-xs"></td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="title">
                        <h4>Recapito</h4>
                    </div>
                    <div class="col-md-12">
                        <p class="description">E' necessario indicare esattamente un indirizzo dove recapitare i prodotti ordinati oltre ad un numero di telefono per essere eventualmente contattati dal corriere.</p>
                        <form class="form-horizontal">
                            <div class="form-group">
                                <label for="inputEmail3" class="col-sm-4 control-label">Nominativo</label>
                                <div class="col-sm-8">
                                    <input type="email" class="form-control" id="inputEmail3">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="inputEmail3" class="col-sm-4 control-label">Indirizzo</label>
                                <div class="col-sm-8">
                                    <input type="email" class="form-control" id="inputEmail3">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="inputEmail3" class="col-sm-4 control-label">Citt&agrave;</label>
                                <div class="col-sm-8">
                                    <input type="email" class="form-control" id="inputEmail3">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="inputEmail3" class="col-sm-4 control-label">Telefono</label>
                                <div class="col-sm-8">
                                    <input type="number" class="form-control" id="inputEmail3">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="inputPassword3" class="col-sm-4 control-label">CAP</label>
                                <div class="col-sm-8">
                                    <input type="number" class="form-control" id="inputPassword3">
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-sm-offset-4 col-sm-8">
                                    <span>Provincia</span>
                                    <select class="selectpicker show-menu-arrow  show-tick" data-size="4" title="Seleziona una provincia">
                                        <option title="Applique classiche e lampade a parete" value="9c-applique-classiche-e-lampade-classiche-a-parete.asp">Applique classiche e lampade a parete</option>
                                        <option title="Lampadari classici e lampade a sospensione" value="7c-lampadari-classici-e-lampade-classiche-a-sospensione.asp">Lampadari classici e lampade a sospensione</option>
                                        <option title="Lampade classiche da tavolo" value="10c-lampade-classiche-da-tavolo-lumini-e-abat-jour-classiche.asp">Lampade classiche da tavolo</option>
                                        <option title="Piantane classiche e lampade da terra" value="11c-piantane-classiche-e-lampade-classiche-da-terra.asp">Piantane classiche e lampade da terra</option>
                                        <option title="Plafoniere classiche e lampade a soffitto" value="8c-plafoniere-classiche-e-lampade-classiche-a-soffitto.asp" >Plafoniere classiche e lampade a soffitto</option>
                                    </select>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-sm-offset-4 col-sm-8">
                                    <span>Nazione</span>
                                    <select class="selectpicker show-menu-arrow  show-tick" data-size="4" title="Italy">
                                        <option title="Applique classiche e lampade a parete" value="9c-applique-classiche-e-lampade-classiche-a-parete.asp">Applique classiche e lampade a parete</option>
                                        <option title="Lampadari classici e lampade a sospensione" value="7c-lampadari-classici-e-lampade-classiche-a-sospensione.asp">Lampadari classici e lampade a sospensione</option>
                                        <option title="Lampade classiche da tavolo" value="10c-lampade-classiche-da-tavolo-lumini-e-abat-jour-classiche.asp">Lampade classiche da tavolo</option>
                                        <option title="Piantane classiche e lampade da terra" value="11c-piantane-classiche-e-lampade-classiche-da-terra.asp">Piantane classiche e lampade da terra</option>
                                        <option title="Plafoniere classiche e lampade a soffitto" value="8c-plafoniere-classiche-e-lampade-classiche-a-soffitto.asp" >Plafoniere classiche e lampade a soffitto</option>
                                    </select>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
            <div class="col-md-12">
                <div class="bg-primary">
                    <p style="font-size: 1.2em; text-align: right; padding: 10px 15px; color: #000;">Totale carrello: <b>349,00&euro;</b></p>
                </div>
                <a href="carrello.html" class="btn btn-danger pull-left"><i class="glyphicon glyphicon-chevron-left"></i> Passo precedente</a>
                <a href="pagamento.html" class="btn btn-danger pull-right">Passo successivo <i class="glyphicon glyphicon-chevron-right"></i></a>
            </div>
        </div>
    </div>
    <footer>
        <div class="container">
            <div class="row">
                <div class="col-md-3 address-col">
                    <h4>Cristalensi</h4>
                    <p>
                        fgdfgfsdgsdg sgsdg sdg sdfg dsfg sdfgsd sdfgs fgs d
                    </p>
                    <h4>Social</h4>
                    <p class="social">
                        <a href="#"><i class="fa fa-facebook-square"></i></a>
                        <a href="#"><i class="fa fa-twitter-square"></i></a>
                    </p>
                    <h4>accettiamo:</h4>
                    <p class="other">
                        <a href="#"><i class="fa fa-paypal"></i></a>
                        <a href="#"><i class="fa fa-cc-mastercard"></i></a>
                        <a href="#"><i class="fa fa-cc-visa"></i></a>
                    </p>
                </div>
                <div class="col-md-3 menu-col">
                    <h4>Voce principale</h4>
                    <ul>
                        <li><a>voce menu</a></li>
                        <li><a>voce menu</a></li>
                        <li><a>voce menu</a></li>
                        <li><a>voce menu</a></li>
                        <li><a>voce menu</a></li>
                        <li><a>voce menu</a></li>
                    </ul>
                </div>
                <div class="col-md-3 menu-col">
                    <h4>Voce principale</h4>
                    <ul>
                        <li><a>voce menu</a></li>
                        <li><a>voce menu</a></li>
                        <li><a>voce menu</a></li>
                        <li><a>voce menu</a></li>
                        <li><a>voce menu</a></li>
                        <li><a>voce menu</a></li>
                    </ul>
                </div>
                <div class="col-md-3 menu-col">
                    <h4>Voce principale</h4>
                    <ul>
                        <li><a>voce menu</a></li>
                        <li><a>voce menu</a></li>
                        <li><a>voce menu</a></li>
                        <li><a>voce menu</a></li>
                        <li><a>voce menu</a></li>
                        <li><a>voce menu</a></li>
                    </ul>
                </div>
            </div>
        </div>
    </footer>
    <div class="floating-links">

    </div>
    <span id="top-link-block" class="hidden">
        <a href="#top" class="well well-sm"  onclick="$('html,body').animate({scrollTop:0},'slow');return false;">
            <i class="glyphicon glyphicon-chevron-up"></i> Back to Top
        </a>
    </span>
    <!-- /top-link-block -->
    <!-- fine finestra modale -->
    <!-- Bootstrap core JavaScript
        ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    <script src="javascripts/bootstrap.js"></script>
    <script src="javascripts/holder.js"></script>
    <script src="javascripts/jquery.bootstrap-touchspin.js"></script>
    <script src="javascripts/bootstrap-select.js"></script>
    <script src="javascripts/custom.js"></script>
</body>
