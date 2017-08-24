<!--#include file="inc_strConn.asp"-->
<%
	IdOrdine=request("IdOrdine")
	if IdOrdine="" then IdOrdine=0

	mode=request("mode")
	if mode="" then mode=0

		Set ss = Server.CreateObject("ADODB.Recordset")
		sql = "SELECT * FROM Ordini where pkid="&idOrdine
		ss.Open sql, conn, 3, 3

	if ss.recordcount>0 then
		TotaleCarrello=ss("TotaleCarrello")
		CostoSpedizioneTotale=ss("CostoSpedizione")
		if CostoSpedizioneTotale="" or isnull(CostoSpedizioneTotale)  then CostoSpedizioneTotale=0
		TipoTrasporto=ss("TipoTrasporto")
		DatiSpedizione=ss("DatiSpedizione")
		Nominativo_sp=ss("Nominativo_sp")
		Telefono_sp=ss("Telefono_sp")
		Indirizzo_sp=ss("Indirizzo_sp")
		CAP_sp=ss("CAP_sp")
		Citta_sp=ss("Citta_sp")
		Provincia_sp=ss("Provincia_sp")
		Nazione_sp=ss("Nazione_sp")

		NoteCliente=ss("NoteCliente")

		FkPagamento=ss("FkPagamento")
		TipoPagamento=ss("TipoPagamento")
		CostoPagamento=ss("CostoPagamento")

		Nominativo=ss("Nominativo")
		Rag_Soc=ss("Rag_Soc")
		Cod_Fisc=ss("Cod_Fisc")
		PartitaIVA=ss("PartitaIVA")
		Indirizzo=ss("Indirizzo")
		Citta=ss("Citta")
		Provincia=ss("Provincia")
		CAP=ss("CAP")

		TotaleGenerale=ss("TotaleGenerale")

		DataAggiornamento=ss("DataAggiornamento")

		FkCliente=ss("FkCliente")

		Set cs = Server.CreateObject("ADODB.Recordset")
		sql = "SELECT PkId, Email, Telefono FROM Clienti where pkid="&FkCliente
		cs.Open sql, conn, 1, 1
		if cs.recordcount>0 then
			email_cliente=cs("Email")
			telefono_cliente=cs("Telefono")
		end if
		cs.close
	end if

	ss.close

%>
<!DOCTYPE html>
<html>

<head>
    <title>Cristalensi - Ordine n. <%=idordine%> - Data <%=Left(DataAggiornamento, 10)%></title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="description" content="Cristalensi.">
    <meta name="keywords" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta property="og:description" content="Cristalensi.">
    <link href="stylesheets/styles.css" rel="stylesheet" type="text/css">
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
        @media print{
            body {
                font-size: 135%;
            }
            h1,h2,h3,h4,h5 {
                font-size: 135%;
            }
            @page {
                size:  auto;
                margin: 0mm;
            }
        }
    </style>
		<!--#include virtual="/cristalensi/inc_funzioni_head.asp"-->
</head>

<body <%if mode=1 then%>onLoad="print();"<%end if%>>
    <div class="container-fluid content">
        <div class="row">
            <div class="col-xs-6"><img src="images/logo-cristalensi.png" style="height: 85px; margin: 15px;" /></div>
            <div class="col-xs-6">
                <p style="font-size: 60%; margin: 15px; color: #999">
                  Cristalensi Snc di Lensi Massimiliano & C.<br />
                  C.F. e Iscr. Reg. Impr. di Firenze 05305820481<br />Via arti e mestieri, 1 - 50056 Montelupo Fiorentino (FI)<br />
                  Tel.: 0571.911163<br />
                  Fax: 0571.073327<br />
                  E-mail: info@cristalensi.it
                </p>
            </div>
        </div>
        <div class="row top-buffer">
            <div class="col-md-12">
                <div class="title">
                    <h4>Ordine n. <%=idordine%> - Data <%=Left(DataAggiornamento, 10)%></h4>
                </div>
                <div class="col-md-12">
                    <div class="top-buffer">
                        <table id="cart" class="table table-hover table-condensed table-cart">
                            <thead>
                                <tr>
                                    <th style="width:50%">Prodotto</th>
                                    <th style="width:10%" class="text-center">Quantit&agrave;</th>
                                    <th style="width:20%" class="text-center">Prezzo unitario</th>
                                    <th style="width:20%" class="text-center">Subtotale</th>
                                </tr>
                            </thead>
                            <tbody>
                              <%
                              	Set rs = Server.CreateObject("ADODB.Recordset")
                              	if pkid<12210 then
                              		sql = "SELECT RigheOrdine.PkId, RigheOrdine.FkOrdine, RigheOrdine.PrezzoProdotto as PrezzoProdotto, RigheOrdine.FkProdotto, RigheOrdine.Quantita, RigheOrdine.TotaleRiga, Prodotti.Titolo, Prodotti.CodiceArticolo, RigheOrdine.Colore, RigheOrdine.Lampadina FROM Prodotti INNER JOIN RigheOrdine ON Prodotti.PkId = RigheOrdine.FkProdotto WHERE (((RigheOrdine.FkOrdine)="&idOrdine&"))"
                              	else
                              		sql = "SELECT PkId, FkOrdine, FkProdotto, PrezzoProdotto, Quantita, TotaleRiga, Titolo, CodiceArticolo, Colore, Lampadina FROM RigheOrdine WHERE FkOrdine="&idOrdine&""
                              	end if
                              		rs.Open sql, conn, 1, 1
                              	num_prodotti_carrello=rs.recordcount
                              if rs.recordcount>0 then
                              %>
                              <%
                              Do while not rs.EOF
                              %>
                                <tr>
                                    <td data-th="Product" class="cart-product">
                                        <div class="row">
                                            <div class="col-sm-12">
                                                <h5 class="nomargin">[<%=rs("codicearticolo")%>]&nbsp;<%=rs("titolo")%></h5>
                                                <%if Len(rs("colore"))>0 or Len(rs("lampadina"))>0 then%><p><%if Len(rs("colore"))>0 then%>&nbsp;Col.:&nbsp;<%=rs("colore")%><%end if%><%if Len(rs("lampadina"))>0 then%>&nbsp;-&nbsp;Lamp.:&nbsp;<%=rs("lampadina")%><%end if%></p><%end if%>
                                            </div>
                                        </div>
                                    </td>
                                    <td data-th="Quantity" class="text-center">
                                      <%
                                      quantita=rs("quantita")
                                      if quantita="" then quantita=1
                                      %>
                                      <%=quantita%> pezzi
                                    </td>
                                    <td data-th="Price" class="text-center"><%=FormatNumber(rs("PrezzoProdotto"),2)%>&euro;</td>
                                    <td data-th="Subtotal" class="text-center"><%=FormatNumber(rs("TotaleRiga"),2)%>&euro;</td>
                                </tr>
                              <%
                              rs.movenext
                              loop
                              %>
                              <%end if%>
                              <%rs.close%>
                            </tbody>
                            <tfoot>
                                <tr class="visible-xs">
                                    <td></td>
                                    <td></td>
                                    <td colspan="2" class="text-center"><strong>Totale <%=FormatNumber(TotaleCarrello,2)%>&euro;</strong></td>
                                </tr>
                                <tr class="hidden-xs">
                                    <td></td>
                                    <td></td>
                                    <td colspan="2" class="text-center"><strong>Totale <%=FormatNumber(TotaleCarrello,2)%>&euro;</strong></td>
                                </tr>
                                <tr>
                                    <td colspan="4">
                                        <h5>Eventuali annotazioni</h5>
                                        <textarea class="form-control" rows="3" readonly style="font-size: 12px;"><%=NoteCliente%></textarea>
                                    </td>
                                </tr>
                            </tfoot>
                        </table>
                    </div>
                </div>
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
                                                    <p><%=TipoTrasporto%></p>
                                                </div>
                                            </div>
                                        </td>
                                        <td data-th="Quantity" class="text-center">
                                            <%=FormatNumber(CostoSpedizioneTotale,2)%>&euro;
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
                            <p>
                              <%if Len(DatiSpedizione)>0 then%>
                      					<%=DatiSpedizione%><br>Email: <%=Email_cliente%> - Telefono: <%=Telefono_cliente%>
                              <%else%>
                              	<%=Nominativo_sp%>&nbsp;-&nbsp;Telefono:&nbsp;<%=Telefono_sp%><br /><%=Indirizzo_sp%>&nbsp;-&nbsp;<%=CAP_sp%>&nbsp;-&nbsp;<%=Citta_sp%><%if Provincia_sp<>"" then%>&nbsp;(<%=Provincia_sp%>)<%end if%>&nbsp;-&nbsp;<%=Nazione_sp%><br>Email iscrizione: <%=Email_cliente%>
                              <%end if%>
                            </p>
                        </div>
                    </div>
                </div>
                <div class="row top-buffer">
                    <div class="col-md-6">
                        <div class="title">
                            <h4>Modalit&agrave; di Pagamento</h4>
                        </div>
                        <div class="col-md-12 top-buffer">
                            <table id="cart" class="table table-hover table-condensed table-cart">
                                <thead>
                                    <tr>
                                        <th style="width:75%">Modalit&agrave; di pagamento</th>
                                        <th style="width:25%" class="text-center">Totale</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td data-th="Product" class="cart-product">
                                            <div class="row">
                                                <div class="col-sm-12">
                                                    <p><%=TipoPagamento%></p>
                                                </div>
                                            </div>
                                        </td>
                                        <td data-th="Quantity" class="text-center">
                                            <%=FormatNumber(CostoPagamento,2)%>&euro;
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="title">
                            <h4>Dati di fatturazione</h4>
                        </div>
                        <div class="col-md-12 top-buffer">
                            <p>
                              <%if Rag_Soc<>"" then%><%=Rag_Soc%>&nbsp;&nbsp;<%end if%><%if nominativo<>"" then%><%=nominativo%><%end if%><br />
                              <%if Cod_Fisc<>"" then%>Codice fiscale: <%=Cod_Fisc%>&nbsp;&nbsp;<%end if%><%if PartitaIVA<>"" then%>Partita IVA: <%=PartitaIVA%><%end if%><br />
                              <%=indirizzo%>&nbsp;-&nbsp;<%=CAP%>&nbsp;-&nbsp;<%=Citta%><%if provincia<>"" then%>(<%=provincia%>)<%end if%>
                            </p>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-12">
                <div class="col-md-12">
                    <div class="bg-primary">
                        <p style="font-size: 1.2em; text-align: right; padding: 10px 15px; color: #000;">Totale carrello: <b><%if TotaleGenerale<>0 then%>
                        <%=FormatNumber(TotaleGenerale,2)%>
                        <%else%>
                        0,00
                        <%end if%>&euro;</b></p>
                    </div>
                </div>
            </div>
        </div>
    </div>

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
</html>
