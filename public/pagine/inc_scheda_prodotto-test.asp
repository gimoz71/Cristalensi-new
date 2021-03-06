<!--#include virtual="/inc_strConn.asp"-->
<%
'response.write(toUrl_completo)
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
		prezzoprodottosoloclienti=prod_rs("PrezzoProdottoSoloClienti")
		if prezzoprodottosoloclienti=True THEN
			prezzoprodottosoloclienti="si"
		Else
			prezzoprodottosoloclienti="no"
		end if
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

		FkNewAmbienti = prod_rs("FkNewAmbiente")

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
		<title><%=Titolo_prodotto%> <%=" "& produttore%> <%=" "& CodiceArticolo%> - <%=Titolo_2_cat%></title>
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="description" content="Scheda del prodotto <%=Titolo_prodotto%>, <%=produttore%>, <%=codicearticolo%>. Vendita online con interessanti sconti. Cristalensi vende online <%=Titolo_1_cat%>, <%=Titolo_2_cat%>, a prezzi scontati. Per qualsiasi dubbio il nostro competente e disponibile staff &egrave; a disposizione.">
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
    <link href="/stylesheets/styles.css" media="screen" rel="stylesheet" type="text/css">
	<link href="/stylesheets/jquery.fancybox.min.css" media="screen" rel="stylesheet" type="text/css">
    <link rel="stylesheet" type="text/css" href="../../stylesheets/customization.css" shim-shadowdom>
    <!--[if lt IE 9]><script src="/javascripts/html5shiv.js"></script><![endif]-->
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
		<SCRIPT language="JavaScript">
			function verifica_1() {

				quantita=document.newsform2.quantita.value;
				num_colori=document.newsform2.num_colori.value;
				colore=document.newsform2.colore.value;
				num_lampadine=document.newsform2.num_lampadine.value;
				lampadina=document.newsform2.lampadina.value;

				if (quantita=="0" || quantita=="" || quantita<0){
					alert("La quantita\' deve essere maggiore di 0");
					return false;
				}

				if (num_colori>0 && colore==""){
					alert("Deve essere scelto un colore");
					return false;
				}

				if (num_lampadine>0 && lampadina==""){
					alert("Deve essere scelta una lampadina");
					return false;
				}

				else

					document.newsform2.method = "post";
					//document.newsform2.action = "../../carrello1.asp";
					document.newsform2.action = "/carrello1.asp";
					document.newsform2.submit();
			}
	</SCRIPT>
	<SCRIPT language="JavaScript">
	function verifica_2() {

		quantita=document.newsform2.quantita.value;
		num_colori=document.newsform2.num_colori.value;
		colore=document.newsform2.colore.value;
		num_lampadine=document.newsform2.num_lampadine.value;
		lampadina=document.newsform2.lampadina.value;

		if (quantita=="0" || quantita==""){
			alert("La quantita\' deve essere maggiore di 0");
			return false;
		}

		if (num_colori>0 && colore==""){
			alert("Deve essere scelto un colore");
			return false;
		}

		if (num_lampadine>0 && lampadina==""){
			alert("Deve essere scelta una lampadina");
			return false;
		}

		else

			document.newsform2.method = "post";
			//document.newsform2.action = "../../carrello1.asp";
			document.newsform2.action = "/carrello1.asp";
			//document.newsform2.submit();
	}
	</SCRIPT>
	<!--#include virtual="/inc_funzioni_head.asp"-->
</head>

<body>
  <!--#include virtual="/inc_header_1.asp"-->
	<!--#include virtual="/inc_header_2.asp"-->
    <div class="container content">
        <div class="row hidden">
            <div class="col-md-12 parentOverflowContainer">
            </div>
        </div>
		<div class="row clearfix">
			<div class="col-md-10 col-md-push-2">
						<ol class="breadcrumb" itemtype="http://schema.org/BreadcrumbList">
                <li itemprop="itemListElement" itemtype="http://schema.org/ListItem"><a href="/" itemprop="item" title="Cristalensi Vendita lampadari online"><span itemprop="name"><i class="fa fa-home"></i></span></a><meta itemprop="position" content="1" /></li>
                <li itemprop="itemListElement" itemtype="http://schema.org/ListItem"><a href="/illuminazione-interni-ed-esterni/<%=Url_gr%>" itemprop="item" title="<%=Titolo_1_gr%> - <%=Titolo_2_gr%>"><span itemprop="name"><%=Titolo_1_gr%></span></a><meta itemprop="position" content="2" /></li>
                <li itemprop="itemListElement" itemtype="http://schema.org/ListItem"><a href="/illuminazione-interni-ed-esterni/<%=Url_tip%>" itemprop="item" title="<%=Titolo_1_tip%> - <%=Titolo_2_tip%>"><span itemprop="name"><%=Titolo_1_tip%></span></a><meta itemprop="position" content="3" /></li>
								<li itemprop="itemListElement" itemtype="http://schema.org/ListItem"><a href="/illuminazione-interni-ed-esterni/<%=Url_cat%>" itemprop="item" title="<%=Titolo_1_cat%>"><span itemprop="name"><%=Titolo_1_cat%></span></a><meta itemprop="position" content="4" /></li>
								<li class="active" itemprop="itemListElement" itemtype="http://schema.org/ListItem"><span itemprop="name"><%=Titolo_prodotto%></span><meta itemprop="position" content="5" /></li>
            </ol>
			</div>
			<div class="col-md-2 col-md-pull-10">
				<a class="btn btn-warning btn-sm btn-block" href="javascript:history.back()"><i class="fa fa-chevron-left"></i> torna indietro</a>
			</div>
		</div>
        <div class="top-buffer hidden-md hidden-lg"></div>
        <div class="" itemscope itemtype="http://schema.org/Product">
            <div class="col-md-8">
                <div class="row">
                    <div class="title">
                        <h1 class="product-name"><span itemprop="name"><%=Titolo_prodotto%></span></h1>
                        <p class="details">codice: <b><span itemprop="mpn"><%=codicearticolo%></span></b> - produttore: <b><a href="<%=url_produttore%>" title="Catalogo <%=produttore%> vendita online prodotti illuminazione"><span itemprop="brand"><%=produttore%></a></span></b></p>
                    </div>
                    <div class="col-md-12">
                        <div class="top-buffer">
                            <p class="descrizione"><span itemprop="description">
															<%
															if LEN(ClasseEnergetica)>0 then
															%>
															<a href="https://www.cristalensi.it/public/etichetta-classe-energetica-<%=ClasseEnergetica%>.jpg" data-fancybox="group2" data-caption="<%=Titolo_prodotto%> - <%=produttore%> - <%=Titolo_2_cat%>" title="<%if titolo_img<>"" then%><%=titolo_img%>&nbsp;<%=titolo_cat%><%else%><%=titolo_prodotto%>&nbsp;<%=titolo_cat%><%end if%>"><img src="https://www.cristalensi.it/public/etichetta-classe-energetica-<%=ClasseEnergetica%>.jpg" alt="<%=Titolo_prodotto%> - <%=produttore%> - <%=Titolo_2_cat%>" align="right" valign="middle" height="150px" width="75px"></a>
															<%end if%>
															<small style="font-size: 12px;"><%=Descrizione_prodotto%></small>

															<%if allegato_prodotto<>"" then%>
															<br /><br />E' presente un allegato: >> <a href="https://www.cristalensi.it/public/<%=allegato_prodotto%>" target="_blank" title="E' presente un allegato per il prodotto: <%=titolo_prodotto%>">Scarica l'allegato</a>
															<%end if%>

															<%
															if Len(FkNewAmbienti)>0 then
															arrFkNewAmbienti=split(FkNewAmbienti,", ")
															%>
															<br />

															<span style="font-size: 12px;"><em>
															L'articolo "<%=Titolo_prodotto%>", prodotto da <%=produttore%> e presente in <%=Titolo_2_cat%>, &egrave; adatto ai seguenti ambienti:&nbsp;
															<%
															For iLoop = LBound(arrFkNewAmbienti) to UBound(arrFkNewAmbienti)
																fknewambiente=arrFkNewAmbienti(iLoop)
																Set ams=Server.CreateObject("ADODB.Recordset")
																sql = "Select * From NewAmbienti WHERE Posizione='"&fknewambiente&"'"
																ams.Open sql, conn, 1, 1
																if ams.recordcount>0 then
																titolo_1_amb=ams("Titolo_1")
																titolo_2_amb=ams("Titolo_2")
																url_amb=ams("Url")
																%>
																<a href="/illuminazione-interni-ed-esterni/<%=url_amb%>" title="<%=titolo_2_amb%>"><%=titolo_1_amb%></a>,&nbsp;
															<%
																end if
																ams.close
															Next
															%>
															ma per suggerimenti pi&ugrave; dettagliati contattate il nostro staff.
														</span></em>
															<%
															end if
															%>
															</span>
                            </p>
                            <hr />

                            <div class="row">
																<%
																Set img_rs = Server.CreateObject("ADODB.Recordset")
																sql = "SELECT * FROM Immagini WHERE Record="&id&" AND Tabella='Prodotti' Order by PkId_Contatore ASC"
																img_rs.open sql,conn, 1, 1
																if img_rs.recordcount>0 then

																	Do while not img_rs.EOF
																	titolo_img=img_rs("titolo")
																	file_img=NoLettAcc(img_rs("file"))
																	'file_img=img_rs("file")
																	'percorso_img="/public/"&file_img
																	'zoom=img_rs("zoom")
																%>
																<div class="col-md-4 col-xs-6">
                                    <div class="col-item">
                                        <div class="photo">
                                            <a href="https://www.cristalensi.it/public/<%=file_img%>" data-fancybox="group" data-caption="<%=Titolo_prodotto%> - <%=produttore%> - <%=Titolo_2_cat%>" class="prod-img-replace" style="background-image: url(https://www.cristalensi.it/public/<%=file_img%>);" title="<%if titolo_img<>"" then%><%=titolo_img%>&nbsp;<%=titolo_cat%><%else%><%=titolo_prodotto%>&nbsp;<%=titolo_cat%><%end if%>"><img itemprop="image" src="/images/blank.png" alt="<%=Titolo_prodotto%> - <%=produttore%> - <%=Titolo_2_cat%>"></a>
                                        </div>
                                    </div>
                                </div>
																<%
																	img_rs.movenext
																	loop
																end if
																img_rs.close
																%>
																<%
																'if LEN(ClasseEnergetica)>0 then
																%>
																<!-- <div class="col-md-2 col-xs-4">
                                    <div class="col-item">
                                        <div class="photo">
                                            <a href="https://www.cristalensi.it/public/etichetta-classe-energetica-<%=ClasseEnergetica%>.jpg" data-fancybox="group" data-caption="<%=Titolo_prodotto%> - <%=produttore%> - <%=Titolo_2_cat%>" class="prod-img-replace" style="background-image: url(https://www.cristalensi.it/public/etichetta-classe-energetica-<%=ClasseEnergetica%>.jpg)" title="Etichetta classe energetica: <%=Titolo_prodotto%> - <%=produttore%>"><img src="/images/blank.png" alt="<%=Titolo_prodotto%> - <%=produttore%> - <%=Titolo_2_cat%>"></a>
                                        </div>
                                    </div>
                                </div> -->
																<%'end if%>
                                <div class="clearfix"></div>
								<div class="panel panel-default user-comment">
                                    <!-- Default panel contents -->
                                    <div class="panel-heading">
                                        <h5><i class="glyphicon glyphicon-warning-sign"></i> INFORMAZIONI IMPORTANTI SULLA DISPONIBILITA' DEI PRODOTTI</h5>
                                    </div>
                                    <ul class="list-group">
                                        <li class="list-group-item">
																					<%if offerta=10 then%>
																					IL PRODOTTO NON E' DISPONIBILE
																					<%else%>
																					Il nostro catalogo &egrave; composto da numerosi prodotti e non tutti sono disponibili immediatamente al momento della richiesta: potrebbero essere disponibili nel giro di qualche giorno.<br />
																					<em>Noi garantiamo una consegna da un minimo di 2 giorni a un massimo di 30 giorni.</em><br />
																					<%end if%>
                                        </li>
                                    </ul>
																		<div class="panel-footer"><a data-fancybox data-src="#hidden-content" href="javascript:;" class="btn launch btn-warning btn-block" style="white-space: normal">Contatta lo staff per dettagli sulla disponibilit&agrave; <i class="fa fa-angle-right"></i></a></div>
                                </div>
																<%
								                Set com_rs = Server.CreateObject("ADODB.Recordset")
								                sql = "SELECT TOP 5 * FROM Commenti_Clienti WHERE Pubblicato=1 ORDER BY PkId DESC"
								                com_rs.open sql,conn, 1, 1
								                if com_rs.recordcount>0 then
								                %>
																<div class="panel panel-default user-comment" itemprop="review" itemscope itemtype="http://schema.org/Review">
                                    <!-- Default panel contents -->
                                    <div class="panel-heading">
                                        <h5><i class="fa fa-users"></i> Dicono di noi...</h5>
                                    </div>
                                    <ul class="list-group">
																		<%Do While not com_rs.EOF%>
																		<%
																		Set cr_rs = Server.CreateObject("ADODB.Recordset")
																		sql = "SELECT PkId, Nome FROM Clienti WHERE PkId="&com_rs("FkIscritto")
																		cr_rs.open sql,conn, 1, 1
																		if cr_rs.recordcount>0 then
																		  NomeIscritto=cr_rs("Nome")
																		end if
																		cr_rs.close
																		%>
																		<li class="list-group-item"><i class="fa fa-user"></i> <em><span itemprop="description"><%=Left(NoHTML(com_rs("Testo")), 90)%>...</span><span itemprop="author" style="display: none;"><%=NomeIscritto%></span> <span itemprop="reviewRating" itemscope itemtype="http://schema.org/Rating">Voto: <meta itemprop="worstRating" content = "1"><span itemprop="ratingValue"><%=com_rs("Valutazione")%></span>/<span itemprop="bestRating">5</span></span></em></li>
																		<%
				                            com_rs.movenext
				            								loop
				                            %>
                                    </ul>
																		<div class="panel-footer"><a href="/commenti_elenco.asp" class="btn btn-default">leggi tutti i commenti <i class="fa fa-chevron-right"></i></a></div>
                                </div>
																<%
								                end if
								                com_rs.close
								                %>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="panel panel-default" style="box-shadow: 0 3px 5px #ccc;" itemprop="offers" itemscope itemtype="http://schema.org/Offer">
										<%if prezzoarticolo=0 then%>
										<%richiesta_prev=1%>
											<ul class="list-group text-center">

													<li class="list-group-item" style="padding-top: 20px">
	                            <p>
															<span class="price-old">Prezzo di Listino  <b><%=prezzolistino%> &euro;</b><meta itemprop="priceCurrency" content="EUR" /></span><br /><br />
															Vuoi sapere il Prezzo Cristalensi?
	                            </p>
	                        </li>
											</ul>
	                    <div class="panel-footer">
	                        <a data-fancybox data-src="#hidden-content-prev" href="javascript:;" rel="nofollow" class="btn launch-prev btn-danger btn-block" title="Richiedi un preventivo al nostro staff">Richiedi un preventivo al nostro staff <i class="glyphicon glyphicon-shopping-cart"></i></a>
	                    </div>
										<%else%>
											<%if offerta=10 then%>
												<ul class="list-group text-center">
												<li class="list-group-item" style="padding-top: 20px">
														<p>
																<span class="price-new">Prodotto non disponibile</span><br />
														</p>
												</li>
												</ul>
											<%else%>
												<form name="newsform2" id="newsform2" onSubmit="return verifica_2();">
												<input type="hidden" name="id" id="id" value="<%=id%>">
												<ul class="list-group text-center">

														<li class="list-group-item" style="padding-top: 20px">
		                            <p>
																		<%if prezzoarticolo<>0 then%>
																			<%if idsession=0 and prezzoprodottosoloclienti="si" then%>
																				<span class="price-new"><em><span itemprop="price">SCONTO EXTRA<br />PER GLI ISCRITTI !!!</span></em></span><br /><br />
																				<%if prezzolistino<>0 then%>
																					<span class="price-old">Prezzo di Listino <b><%=prezzolistino%> &euro;</b></span>
																				<%end if%>
																			<%Else%>
																				Prezzo Cristalensi:<br />
		                                		<span class="price-new"><i class="fa fa-tag"></i>&nbsp;<span itemprop="price"><%=prezzoarticolo%></span> &euro;<meta itemprop="priceCurrency" content="EUR" /></span><br />
																				<%if prezzolistino<>0 then%>
																					<span class="price-old">invece di  <b><%=prezzolistino%> &euro;</b></span>
																				<%end if%>
																			<%end if%>
																		<%end if%>


		                            </p>
		                        </li>


														<%if idsession=0 and prezzoprodottosoloclienti="si" then%>
															<%'qui eventualmente possiamo metter un banner per rafforzare iscrizione e sconto%>
															<li class="list-group-item" style="background-color: #FF972C; Color: #fff">Prezzo con SCONTO EXTRA riservato<br />per tutti i clienti iscritti</li>
														<%else%>
															<%
															Set col_rs = Server.CreateObject("ADODB.Recordset")
															sql = "SELECT [Prodotto-Colore].FkProdotto, Colori.Titolo FROM [Prodotto-Colore] INNER JOIN Colori ON [Prodotto-Colore].FkColore = Colori.PkId WHERE ((([Prodotto-Colore].FkProdotto)="&id&")) ORDER BY Colori.Titolo ASC"
															col_rs.open sql,conn, 1, 1
															if col_rs.recordcount>0 then
															%>
																	<input type="hidden" name="num_colori" id="num_colori" value="<%=col_rs.recordcount%>">
															<%else%>
																	<input type="hidden" name="num_colori" id="num_colori" value="0">
																	<input type="hidden" name="colore" id="colore" value="*****">
															<%end if%>

															<%
															Set lam_rs = Server.CreateObject("ADODB.Recordset")
															sql = "SELECT [Prodotto-Lampadina].FkProdotto, Lampadine.Titolo FROM [Prodotto-Lampadina] INNER JOIN Lampadine ON [Prodotto-Lampadina].FkLampadina = Lampadine.PkId WHERE ((([Prodotto-Lampadina].FkProdotto)="&id&")) ORDER BY Lampadine.Titolo ASC"
															lam_rs.open sql,conn, 1, 1
															if lam_rs.recordcount>0 then
															%>
																	<input type="hidden" name="num_lampadine" id="num_lampadine" value="<%=lam_rs.recordcount%>">
															<%else%>
																	<input type="hidden" name="num_lampadine" id="num_lampadine" value="0">
																	<input type="hidden" name="lampadina" id="lampadina" value="*****">
															<%end if%>

															<%if col_rs.recordcount>0 then%>
															<li class="list-group-item">
																	<select name="colore" id="colore" class="selectpicker show-menu-arrow  show-tick" data-size="4" title="Scegli il colore e/o la finitura">
																	<%
																	Do While Not col_rs.EOF
																	%>
																			<option title="<%=col_rs("Titolo")%>" value="<%=col_rs("Titolo")%>"><%=col_rs("Titolo")%></option>
																	<%
																	col_rs.movenext
																	loop
																	%>
																	</select>
			                        </li>
															<%
															end if
															col_rs.close
															%>
															<%if lam_rs.recordcount>0 then%>
															<li class="list-group-item">
																	<select name="lampadina" id="lampadina" class="selectpicker show-menu-arrow  show-tick" data-size="4" title="Scegli la lampadina e/o il vetro">
																	<%
																	Do While Not lam_rs.EOF
																	%>
																			<option title="<%=lam_rs("Titolo")%>" value="<%=lam_rs("Titolo")%>"><%=lam_rs("Titolo")%></option>
																	<%
																	lam_rs.movenext
																	loop
																	%>
																	</select>
			                        </li>
															<%
															end if
															lam_rs.close
															%>
			                        <li class="list-group-item">
			                            <input type="number" data-width="auto" class="form-control" name="quantita" id="quantita" placeholder="Quanti Pezzi?" aria-label="Pezzi">
			                        </li>
														<%end if%>


		                    </ul>
		                    <div class="panel-footer">
														<%if idsession=0 and prezzoprodottosoloclienti="si" then%>
															<a href="/iscrizione.asp?prov=3" id="invia_qta_2" rel="nofollow" class="btn btn-danger btn-block" title="Iscriviti per vedere gli sconti!"><i class="glyphicon glyphicon-log-in"></i>&nbsp;&nbsp;Iscriviti o Accedi !!!</a>
														<%else%>
															<a href="#" onClick="return verifica_1();" id="invia_qta_2" rel="nofollow" class="btn btn-danger btn-block" title="Aggiungi al carrello <%=titolo_prodotto%>&nbsp;<%=codicearticolo%>">Aggiungi al carrello <i class="glyphicon glyphicon-shopping-cart"></i></a>
														<%end if%>
		                    </div>
												</form>
											<%end if%>
										<%end if%>

                </div>

								<!--condizioni di vendita-->
								<div class="panel panel-default payment-list">
										<!-- Default panel contents -->
										<div class="panel-heading">
											<h5>Condizioni di vendita</h5>
										</div>
										<ul class="list-group">
											<li class="list-group-item"><strong>SPEDIZIONE ASSICURATA IN TUTTA ITALIA</strong></li>
											<li class="list-group-item"><i class="fa fa-check"></i> <em>Per ordini superiori a 250&euro;:</em><div style="float: right;"><em><strong>0&euro;</strong></em></div></li>
											<li class="list-group-item"><i class="fa fa-check"></i> <em>Per ordini fino a  250&euro;:</em><div style="float: right;"><em><strong>10&euro;</strong></em></div></li>
											<li class="list-group-item"><i class="fa fa-check"></i> <em>Ritiro in sede:</em><div style="float: right;"><em><strong>0&euro;</strong></em></div></li>
											<li class="list-group-item">&nbsp;</li>
											<li class="list-group-item"><strong>PAGAMENTI SICURI</strong></li>
											<li class="list-group-item"><i class="fa fa-check"></i> <em>Bonifico e PostePay:</em><div style="float: right;"><em><strong>0&euro;</strong></em></div></li>
											<li class="list-group-item"><i class="fa fa-check"></i> <em>Carte di credito e prepagate:</em><div style="float: right;"><em><strong>0&euro;</strong></em></div></li>
											<li class="list-group-item"><i class="fa fa-check"></i> <em>Contrassegno in contanti:</em><div style="float: right;"><em><strong>4&euro;</strong></em></div></li>
										</ul>
										<div class="panel-footer"><a href="/condizioni_di_vendita.asp" class="btn btn-default">Condizioni di vendita <i class="fa fa-chevron-right"></i></a></div>
								</div>
								<!--#include virtual="/inc_box_contatti.asp"-->
            </div>
        </div>


    </div>

    <!--#include virtual="/inc_footer.asp"-->

</body>
<!--#include virtual="/inc_strClose.asp"-->
