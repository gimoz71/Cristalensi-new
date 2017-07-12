<!--#include file="inc_strConn.asp"-->
<%
	Call Visualizzazione("",0,"carrello3.asp")

	mode=request("mode")
	if mode="" then mode=0

	'se la session &eacute; gi&agrave; aperta sfrutto il pkid dell'ordine, altrimenti ne apro una
	IdOrdine=session("ordine_shop")
	if IdOrdine="" then IdOrdine=0
	if idOrdine=0 then response.redirect("/cristalensi/carrello1.asp")

	if idsession=0 then response.Redirect("/cristalensi/iscrizione.asp?prov=1")

	'inserisco il costo del pagamento. se nn ne &eacute; stato scelto uno, perch&eacute; sono appena entrato adesso in questa pagina, prendo il primo costo dal db

	TipoPagamentoScelto=request("TipoPagamentoScelto")
	if TipoPagamentoScelto="" then TipoPagamentoScelto=0

	Set trasp_rs = Server.CreateObject("ADODB.Recordset")
	if TipoPagamentoScelto=0 then
		sql = "SELECT * FROM CostiPagamento"
	else
		sql = "SELECT * FROM CostiPagamento where PkId="&TipoPagamentoScelto
	end if
	trasp_rs.Open sql, conn, 1, 1
	if trasp_rs.recordcount>0 then
		PkIdPagamentoScelto=trasp_rs("PkId")
		NomePagamentoScelto=trasp_rs("Nome")
		CostoPagamentoScelto=trasp_rs("Costo")
		TipoCostoPagamentoScelto=trasp_rs("TipoCosto")
	end if
	trasp_rs.close

'	Nominativo=request("Nominativo")
'	Rag_Soc=request("Rag_Soc")

'	if Nominativo="" and Rag_Soc="" then
'		Set cli_rs=Server.CreateObject("ADODB.Recordset")
'		sql = "Select * From Clienti where pkid="&idsession
'		cli_rs.Open sql, conn, 1, 1
'		if cli_rs.recordcount>0 then
'			Nominativo=cli_rs("Nome")&" "&cli_rs("Nominativo")
'			Rag_Soc=cli_rs("Rag_Soc")
'			Cod_Fisc=cli_rs("Cod_Fisc")
'			PartitaIVA=cli_rs("PartitaIVA")
'			Indirizzo=cli_rs("Indirizzo")
'			CAP=cli_rs("CAP")
'			Citta=cli_rs("Citta")
'			Provincia=cli_rs("Provincia")
'		end if
'		cli_rs.close
'	else
'		Cod_Fisc=request("Cod_Fisc")
'		PartitaIVA=request("PartitaIVA")
'		Indirizzo=request("Indirizzo")
'		CAP=request("CAP")
'		Citta=request("Citta")
'		Provincia=request("Provincia")
'	end if

	Set os1 = Server.CreateObject("ADODB.Recordset")
	sql = "SELECT * FROM Ordini where PkId="&idOrdine
	os1.Open sql, conn, 3, 3

	TotaleCarrello=os1("TotaleCarrello")
	CostoSpedizione=os1("CostoSpedizione")

	if TipoCostoPagamentoScelto=1 then
		CostoPagamento=CostoPagamentoScelto
	end if
	if TipoCostoPagamentoScelto=2 then
		CostoPagamento=((TotaleCarrello+CostoSpedizione)*CostoPagamentoScelto)/100
	end if
	if TipoCostoPagamentoScelto=3 then
		CostoPagamento=0
	end if

	os1("FkPagamento")=PkIdPagamentoScelto
	os1("TipoPagamento")=NomePagamentoScelto
	os1("CostoPagamento")=CostoPagamento
	'TotaleGnerale_AG=TotaleCarrello+CostoSpedizione+CostoPagamento
	os1("TotaleGenerale")=TotaleCarrello+CostoSpedizione+CostoPagamento
	os1("FkCliente")=idsession

	Nominativo_sp=os1("Nominativo_sp")
	Telefono_sp=os1("Telefono_sp")
	Indirizzo_sp=os1("Indirizzo_sp")
	CAP_sp=os1("CAP_sp")
	Citta_sp=os1("Citta_sp")
	Provincia_sp=os1("Provincia_sp")
	Nazione_sp=os1("Nazione_sp")

	if mode=0 then
		os1("stato")=2
		if Nazione_sp<>"IT" then os1("stato")=22
	else
		os1("stato")=3
	end if

	Nominativo=request("Nominativo")
	Rag_Soc=request("Rag_Soc")

	if Nominativo="" and Rag_Soc="" then
		Nominativo=os1("Nominativo")
		Rag_Soc=os1("Rag_Soc")
		Cod_Fisc=os1("Cod_Fisc")
		PartitaIVA=os1("PartitaIVA")
		Indirizzo=os1("Indirizzo")
		CAP=os1("CAP")
		Citta=os1("Citta")
		Provincia=os1("Provincia")
	else
		Cod_Fisc=request("Cod_Fisc")
		PartitaIVA=request("PartitaIVA")
		Indirizzo=request("Indirizzo")
		CAP=request("CAP")
		Citta=request("Citta")
		Provincia=request("Provincia")
	end if

	os1("Nominativo")=Nominativo
	os1("Rag_Soc")=Rag_Soc
	os1("Cod_Fisc")=Cod_Fisc
	os1("PartitaIVA")=PartitaIVA
	os1("Indirizzo")=Indirizzo
	os1("CAP")=CAP
	os1("Citta")=Citta
	os1("Provincia")=Provincia

	os1("DataAggiornamento")=now()
	os1("IpOrdine")=Request.ServerVariables("REMOTE_ADDR")
	os1.update

	os1.close

	if mode=1 then response.Redirect("/cristalensi/ordine.asp")
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
    <script language="javascript">
    function Cambia()
    {
        document.modulocarrello.method = "post";
        document.modulocarrello.action = "https://www.cristalensi.it/carrello3.asp";
        document.modulocarrello.submit();
    }
    </script>
    <script language="javascript">
    function Continua()
    {
        document.modulocarrello.method = "post";
        document.modulocarrello.action = "https://www.cristalensi.it/carrello3.asp?mode=1";
        document.modulocarrello.submit();
    }
    </script>
</head>

<body>
  <!--#include file="inc_header_1.asp"-->
  <!--#include file="inc_header_2.asp"-->
  <%
  	Set rs = Server.CreateObject("ADODB.Recordset")
  	sql = "SELECT PkId, FkOrdine, FkProdotto, PrezzoProdotto, Quantita, TotaleRiga, Titolo, CodiceArticolo, Colore, Lampadina FROM RigheOrdine WHERE FkOrdine="&idOrdine&""
  	rs.Open sql, conn, 1, 1
  	num_prodotti_carrello=rs.recordcount

  	Set ss = Server.CreateObject("ADODB.Recordset")
  	sql = "SELECT * FROM Ordini where pkid="&idOrdine
  	ss.Open sql, conn, 1, 1

  	if ss.recordcount>0 then
  		TotaleCarrello=ss("TotaleCarrello")
  		CostoSpedizioneTotale=ss("CostoSpedizione")
  		TipoTrasporto=ss("TipoTrasporto")
  		'DatiSpedizione=ss("DatiSpedizione")
  		Nominativo_sp=ss("Nominativo_sp")
  		Telefono_sp=ss("Telefono_sp")
  		Indirizzo_sp=ss("Indirizzo_sp")
  		CAP_sp=ss("CAP_sp")
  		Citta_sp=ss("Citta_sp")
  		Provincia_sp=ss("Provincia_sp")
  		Nazione_sp=ss("Nazione_sp")
  		CostoPagamentoTotale=ss("CostoPagamento")
  		TotaleGenerale=ss("TotaleGenerale")
  		NoteCliente=ss("NoteCliente")

  		NominativoOrdine=ss("Nominativo")
  		Rag_SocOrdine=ss("Rag_Soc")
  		Cod_FiscOrdine=ss("Cod_Fisc")
  		PartitaIVAOrdine=ss("PartitaIVA")
  		IndirizzoOrdine=ss("Indirizzo")
  		CAPOrdine=ss("CAP")
  		CittaOrdine=ss("Citta")
  		ProvinciaOrdine=ss("Provincia")
  	end if
  %>
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
                    <a href="/cristalensi/carrello1.asp" class="bs-wizard-dot"></a>
                    <div class="bs-wizard-info text-center">Carrello</div>
                </div>
                <div class="col-sm-5 bs-wizard-step complete">
                    <div class="text-center bs-wizard-stepnum">2</div>
                    <div class="progress">
                        <div class="progress-bar"></div>
                    </div>
                    <a href="/cristalensi/iscrizione.asp" class="bs-wizard-dot"></a>
                    <div class="bs-wizard-info text-center">Accedi / Iscriviti</div>
                </div>
                <div class="col-sm-5 bs-wizard-step complete">
                    <div class="text-center bs-wizard-stepnum">3</div>
                    <div class="progress">
                        <div class="progress-bar"></div>
                    </div>
                    <a href="/cristalensi/carrello2.asp" class="bs-wizard-dot"></a>
                    <div class="bs-wizard-info text-center">Indirizzo di spedizione</div>
                </div>
                <div class="col-sm-5 bs-wizard-step active">
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
                <h4>Modalit&agrave; di pagamento</h4>
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
                        <%if rs.recordcount>0 then%>
												<tbody>
														<%
														Do while not rs.EOF

														Set url_prodotto_rs = Server.CreateObject("ADODB.Recordset")
														sql = "SELECT PkId, NomePagina FROM Prodotti where PkId="&rs("FkProdotto")&""
														url_prodotto_rs.Open sql, conn, 1, 1

														NomePagina=url_prodotto_rs("NomePagina")
														if Len(NomePagina)>0 then
															NomePagina="/public/pagine/"&NomePagina
														else
															NomePagina="#"
														end if

														url_prodotto_rs.close
														%>
														<%
														quantita=rs("quantita")
														if quantita="" then quantita=1
														%>
														<tr>
                                <td data-th="Product" class="cart-product">
                                    <div class="row">
                                        <div class="col-sm-12">
                                            <h5 class="nomargin"><%=rs("titolo")%></h5>
																						<p><strong>Codice: <%=rs("codicearticolo")%></strong></p>
                                            <%if Len(rs("colore"))>0 or Len(rs("lampadina"))>0 then%><p>><%if Len(rs("colore"))>0 then%>Col.: <%=rs("colore")%><%end if%><%if Len(rs("lampadina"))>0 then%> - Lamp.: Bianco satinato<%=rs("lampadina")%><%end if%></p><%end if%>
                                        </div>
                                    </div>
                                </td>
                                <td data-th="Quantity" class="text-center">
                                    <%=quantita%>
                                </td>
                                <td data-th="Price" class="hidden-xs text-center"><%=FormatNumber(rs("PrezzoProdotto"),2)%>&euro;</td>
                                <td data-th="Subtotal" class="text-center"><%=FormatNumber(rs("TotaleRiga"),2)%>&euro;</td>
                            </tr>
														<%
														rs.movenext
														loop
														%>
                        </tbody>
												<%end if%>
												<%if ss.recordcount>0 then%>
												<tfoot>
                            <tr class="visible-xs">
                                <td class="text-center"><strong>Totale <%if ss("TotaleGenerale")<>0 then%>
								<%=FormatNumber(ss("TotaleGenerale"),2)%>&euro;<%else%>0&euro;<%end if%></strong></td>
                            </tr>
                            <tr>
                                <td class="hidden-xs"></td>
                                <td class="hidden-xs"></td>
                                <td class="hidden-xs"></td>
                                <td class="hidden-xs text-center"><strong>Totale <%if ss("TotaleGenerale")<>0 then%>
								<%=FormatNumber(ss("TotaleGenerale"),2)%>&euro;<%else%>0&euro;<%end if%></strong></td>
                            </tr>
                            <tr>
                                <td colspan="4">
                                    <h5>Eventuali annotazioni</h5>
                                    <textarea class="form-control" rows="3" readonly style="font-size: 12px;"><%=NoteCliente%></textarea>
                                </td>
                            </tr>
                        </tfoot>
												<%end if%>
                    </table>
                </div>
            </div>
            <div class="clearfix"></div>
            <div class="row top-buffer">
                <div class="col-md-6">
                    <div class="title">
                        <h4>Modalit&agrave; di spedizione</h4>
                    </div>
                    <div class="col-md-12 top-buffer">
                        <table id="cart" class="table table-hover table-condensed table-cart">
                            <thead>
                                <tr>
                                    <th style="width:75%">Modalit&agrave; di spedizione</th>
                                    <th style="width:25%" class="text-center">Totale</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td data-th="Product" class="cart-product">
                                        <div class="row">
                                            <div class="col-sm-12">
                                                <p>Spedizione in Italia</p>
                                            </div>
                                        </div>
                                    </td>
                                    <td data-th="Quantity" class="text-center">
                                        10,00&euro;
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="title">
                        <h4>indirizzo di spedizione</h4>
                    </div>
                    <div class="col-md-12 top-buffer">
                        <p>Nominativo: <b>Amintore Fanfani</b> - Indirizzo: <b>Via delle Acciughe 34 -57122 Livorno</b></p>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-md-12">
            <div class="row top-buffer">
                <div class="col-md-6">
                    <div class="title">
                        <h4>modalit&agrave; di pagamento</h4>
                    </div>
                    <div class="col-md-12 top-buffer">
                        <table id="cart" class="table table-hover table-condensed table-cart">
                            <thead>
                                <tr>
                                    <th style="width:70%">Modalit&agrave; di pagamento</th>
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
                                                    <label><input type="radio" name="auth" checked> <b>Bonifico bancario</b></label>
                                                </div>
                                                <p style="color: #666; font-size: .85em;">E' possibile pagare con bonifico bancario senza nessun costo aggiuntivo. La merce verr6agrave; spedita al momento che verr6agrave; notificato il pagamento sul nostro conto corrente. I dati per il bonifico
                                                    verranno resi noti al termine della procedura.</p>
                                            </div>
                                        </div>
                                    </td>
                                    <td data-th="Price" style="">0,00&euro;</td>
                                    <td data-th="Subtotal" class="hidden-xs">0,00&euro;</td>
                                </tr>
                                <tr>
                                    <td data-th="Product" class="cart-product">
                                        <div class="row">
                                            <div class="col-sm-12">
                                                <div class="radio">
                                                    <label><input type="radio" name="auth" > <b>Carta di Credito/Circuito Paypal</b></label>
                                                </div>
                                                <p style="color: #666; font-size: .85em;">E' possibile pagare con qualsiasi carta di credito attraverso il sistema di pagamento fornito da Paypal.</p>
                                            </div>
                                        </div>
                                    </td>
                                    <td data-th="Price">0,00&euro;</td>
                                    <td data-th="Subtotal" class="hidden-xs"></td>
                                </tr>
                                <tr>
                                    <td data-th="Product" class="hidden-xs"></td>
                                    <td data-th="Price"><b class="visible-xs">Costo operazione: 0&euro;</b></td>
                                    <td data-th="Subtotal" class="hidden-xs"></td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="title">
                        <h4>Dati fatturazione</h4>
                    </div>
                    <div class="col-md-12">
                        <p class="description">Per coloro che hanno la necessit&agrave; della fattura inserire i dati correttamente, altrimenti verr&agrave; emesso regolare scontrino fiscale.<br>La fattura &egrave; emessa su richiesta sia per le aziende che per privati.</p>
                        <form class="form-horizontal">
                            <div class="form-group">
                                <label for="inputEmail3" class="col-sm-4 control-label">Nominativo</label>
                                <div class="col-sm-8">
                                    <input type="text" class="form-control" id="inputEmail3">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="inputEmail3" class="col-sm-4 control-label">Partita IVA</label>
                                <div class="col-sm-8">
                                    <input type="number" class="form-control" id="inputEmail3">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="inputEmail3" class="col-sm-4 control-label">Indirizzo</label>
                                <div class="col-sm-8">
                                    <input type="text" class="form-control" id="inputEmail3">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="inputEmail3" class="col-sm-4 control-label">Citt&agrave;</label>
                                <div class="col-sm-8">
                                    <input type="text" class="form-control" id="inputEmail3">
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
                <a href="spedizione.html" class="btn btn-danger pull-left"><i class="glyphicon glyphicon-chevron-left"></i> Passo precedente</a>
                <a href="riepilogo.html" class="btn btn-danger pull-right">Passo successivo <i class="glyphicon glyphicon-chevron-right"></i></a>
            </div>
        </div>
    </div>
    <!--#include file="inc_footer.asp"-->
</body>
