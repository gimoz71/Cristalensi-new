<!--#include file="inc_strConn.asp"-->
<%
Call Visualizzazione("",0,"carrello1.asp")

	mode=request("mode")
	if mode="" then mode=0

	'se la session è già aperta sfrutto il pkid dell'ordine, altrimenti ne apro una
	IdOrdine=session("ordine_shop")
	if IdOrdine="" then IdOrdine=0

	id=request("id")
	if id="" then id=0

		if IdOrdine=0 and id<>0 then
			Set os1 = Server.CreateObject("ADODB.Recordset")
			sql = "SELECT * FROM Ordini"
			os1.Open sql, conn, 3, 3

			os1.addnew
			os1("FkCliente")=idsession
			os1("stato")=0
			os1("TotaleCarrello")=0
			os1("TotaleGenerale")=0
			os1("DataOrdine")=now()
			os1("DataAggiornamento")=now()
			os1("IpOrdine")=Request.ServerVariables("REMOTE_ADDR")
			os1.update

			os1.close

			'Prendo l'id dell'ordine
			Set os2 = Server.CreateObject("ADODB.Recordset")
			sql = "Select @@Identity As pkid"
			os2.Open sql, conn, 1, 1
			IdOrdine=os2("pkid")

			os2.close

			'Creo una sessione con l'id dell'ordine
			Session("ordine_shop")=IdOrdine

		end if

		IdOrdine=cInt(IdOrdine)

	'modifica del carrello: eliminazione o modifica di un articolo nel carrello
		if mode=2 then
			cs = conn.Execute("Delete * FROM RigheOrdine Where FkOrdine="&IdOrdine)
			mode=0
		end if

		if mode=1 then

			eliminare=request("eliminare")
		'parte per eliminare il prodotto dal carrello
			if eliminare<>"" then
				arrProd = Split(eliminare, ", ")
				For iLoop = LBound(arrProd) to UBound(arrProd)
					cs = conn.Execute("Delete * FROM RigheOrdine Where PkId="&arrProd(iLoop))
	   			next
		'fine parte per eliminazione
			else
		'parte per la modifica delle quantita di un articolo nel carrello

			'modifica delle quantità
				Set ts = Server.CreateObject("ADODB.Recordset")
				sql = "SELECT * FROM RigheOrdine where FkOrdine="&idordine
				ts.Open sql, conn, 3, 3
				num=0
				Do while not ts.EOF
					'aggiornamento
					PrezzoProdotto=ts("PrezzoProdotto")
					Quantita=request("quantita"&num)
					ts("Quantita")=Quantita
					ts("TotaleRiga")=(Quantita*PrezzoProdotto)
					ts.update
					num=num+1
					ts.movenext
				loop
				ts.close
			end if
		'fine della parte di modifica

		else
	'inserimento di un prodotto per la prima volta scelto con il carrello già aperto
			'Prendo il prezzo del prodotto


			if id<>0 then
				quantita=request("quantita")
				if quantita="" then quantita=1

				colore=request("colore")
				if colore="*****" then colore=""

				lampadina=request("lampadina")
				if lampadina="*****" then lampadina=""

				'prendo le caretteristriche del prodotto

				Set prodotto_rs = Server.CreateObject("ADODB.Recordset")
				sql = "SELECT * FROM Prodotti where PkId="&id&""
				prodotto_rs.Open sql, conn, 1, 1

				PrezzoProdotto=prodotto_rs("PrezzoProdotto")
				CodiceArticolo=prodotto_rs("CodiceArticolo")
				TitoloProdotto=prodotto_rs("Titolo")

				prodotto_rs.close


				Set riga_rs = Server.CreateObject("ADODB.Recordset")
				sql = "SELECT * FROM RigheOrdine"
				riga_rs.Open sql, conn, 3, 3

				riga_rs.addnew
				riga_rs("FkOrdine")=IdOrdine
				riga_rs("FkCliente")=idsession
				riga_rs("FkProdotto")=id
				riga_rs("PrezzoProdotto")=PrezzoProdotto
				riga_rs("Quantita")=Quantita
				TotaleRiga=PrezzoProdotto*Quantita
				riga_rs("TotaleRiga")=TotaleRiga
				riga_rs("colore")=Colore
				riga_rs("lampadina")=Lampadina
				riga_rs("CodiceArticolo")=CodiceArticolo
				riga_rs("Titolo")=TitoloProdotto
				riga_rs("Data")=now()
				riga_rs.update

				riga_rs.close
			end if
		end if

				'Calcolo la somma per l'ordine
				Set rs2 = Server.CreateObject("ADODB.Recordset")
				sql = "SELECT sum(TotaleRiga) as TotaleCarrello FROM RigheOrdine where FkOrdine="&IdOrdine
				rs2.Open sql, conn, 3, 3
				if rs2.recordcount>0 then
					TotaleCarrello=rs2("TotaleCarrello")
					if TotaleCarrello="" then TotaleCarrello=0
				else
					TotaleCarrello=0
				end if
				rs2.close


				'Aggiorno la tabella dell'ordine con la somma calcolata prima
				Set ss = Server.CreateObject("ADODB.Recordset")
				sql = "SELECT * FROM Ordini where PkId="&IdOrdine
				ss.Open sql, conn, 3, 3
				if ss.recordcount>0 then
					ss("TotaleCarrello")=TotaleCarrello
					ss("TotaleGenerale")=TotaleCarrello
					'ss("DataOrdine")=now()
					ss("DataAggiornamento")=now()
					ss("Stato")=0
					ss("FkCliente")=idsession
					ss("IpOrdine")=Request.ServerVariables("REMOTE_ADDR")
					ss.update
				end if
				ss.close
%>
<!DOCTYPE html>
<html>

<head>
    <title>Cristalensi - Carrello E-commerce vendita lampadari</title>
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
  <!--#include file="inc_header_1.asp"-->
  <!--#include file="inc_header_2.asp"-->
    <div class="container content">
        <div class="row hidden">
            <div class="col-md-12 parentOverflowContainer">
            </div>
        </div>
        <div class="col-sm-12">
            <div class="row bs-wizard">
                <div class="col-sm-5 bs-wizard-step active">
                    <div class="text-center bs-wizard-stepnum">1</div>
                    <div class="progress">
                        <div class="progress-bar"></div>
                    </div>
                    <a href="#" class="bs-wizard-dot"></a>
                    <div class="bs-wizard-info text-center">Carrello.</div>
                </div>
                <div class="col-sm-5 bs-wizard-step disabled">
                    <div class="text-center bs-wizard-stepnum">2</div>
                    <div class="progress">
                        <div class="progress-bar"></div>
                    </div>
                    <a href="#" class="bs-wizard-dot"></a>
                    <div class="bs-wizard-info text-center">Accedi / Registrati.</div>
                </div>
                <div class="col-sm-5 bs-wizard-step disabled">
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
        <div class="col-sm-12">
            <div class="col-md-8">
                <div class="row">
                    <div class="title">
                        <h4>Carrello</h4>
                    </div>
                    <div class="col-md-12">
                        <div class="top-buffer">
                            <table id="cart" class="table table-hover table-condensed table-cart">
                                <thead>
                                    <tr>
                                        <th style="width:45%">Prodotto</th>
                                        <th style="width:10%">Prezzo</th>
                                        <th style="width:8%">Quantit&agrave;</th>
                                        <th style="width:22%" class="text-center">Subtotale</th>
                                        <th style="width:15%"></th>
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
                                        <td data-th="Price" class="hidden-xs">55&euro;</td>
                                        <td data-th="Quantity">
                                            <input type="number" class="form-control text-center" value="1">
                                        </td>
                                        <td data-th="Subtotal" class="text-center">55&euro;</td>
                                        <td class="actions" data-th="">
                                            <button class="btn btn-info btn-sm"><i class="fa fa-refresh"></i></button>
                                            <button class="btn btn-danger btn-sm"><i class="fa fa-trash-o"></i></button>
                                        </td>
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
                                        <td data-th="Price" class="hidden-xs">55&euro;</td>
                                        <td data-th="Quantity">
                                            <input type="number" class="form-control text-center" value="1">
                                        </td>
                                        <td data-th="Subtotal" class="text-center">55&euro;</td>
                                        <td class="actions" data-th="">
                                            <button class="btn btn-info btn-sm"><i class="fa fa-refresh"></i></button>
                                            <button class="btn btn-danger btn-sm"><i class="fa fa-trash-o"></i></button>
                                        </td>
                                    </tr>
                                </tbody>
                                <tfoot>
                                    <tr class="visible-xs">
                                        <td class="text-center"><strong>Totale 110&euro;</strong></td>
                                    </tr>
                                    <tr>
                                        <td><a href="#" class="btn btn-warning"><i class="fa fa-angle-left"></i> Continua gli acquisti</a></td>
                                        <td colspan="2" class="hidden-xs"></td>
                                        <td class="hidden-xs text-center"><strong>Totale 110&euro;</strong></td>
                                        <td></td>
                                    </tr>
                                </tfoot>
                            </table>

                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="panel panel-default" style="box-shadow: 0 3px 5px #ccc;">
                    <ul class="list-group text-center">
                        <li class="list-group-item" style="padding-top: 20px">
                            <p>Totale carrello:<br />
                                <span class="price-new"><i class="fa fa-tag"></i>&nbsp;110.00 &euro;</span>
                            </p>
                        </li>
                    </ul>
                    <div class="panel-footer">
                        <a href="accedi.html" class="btn btn-danger btn-block">Completa l'acquisto <i class="fa fa-angle-right"></i></a>
                    </div>
                </div>
                <div class="alert alert-success" role="alert">
                    Hai bisogno di aiuto? Chiama al<br /><a href="tel: +39 0571 911163" class="alert-link">+39 0571 911163</a>
                </div>
            </div>
        </div>
        <div class="col-sm-12">
            <div class="panel panel-default user-comment">
                <!-- Default panel contents -->
                <div class="panel-heading">
                    <h5><i class="glyphicon glyphicon-warning-sign"></i> INFORMAZIONI IMPORTANTI SULLA DISPONIBILITA' DEI PRODOTTI</h5>
                </div>
                <ul class="list-group">
                    <li class="list-group-item">Come potete aver notato il nostro catalogo &egrave; composto da numerosi prodotti e numerose ditte, a tal ragione alcuni prodotti, al momento della richiesta, potrebbero non essere dispobili immediatamente e potrebbero essere in fase
                        di ordinazione. Nel caso in cui ci fosse urgenza del prodotto desiderato, informarsi direttamente dal nostro staff per l'effettiva disponibilità o tempo di consegna nel caso in cui fosse in ordinazione: da un minimo 2 giorni a
                        un massimo 30 giorni.</li>
                </ul>
                <div class="panel-footer"><a href="#" class="btn btn-warning btn-block">Contatta lo staff per info sulla disponibilit&agrave; <i class="fa fa-angle-right"></i></a></div>
            </div>
        </div>
        <div class="col-sm-6">
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
        <div class="col-sm-6">
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
        <div class="col-md-12">
            <div class="bg-primary">
                <p style="font-size: 1.2em; text-align: right; padding: 10px 15px; color: #000;">Totale carrello: <b>349,00&euro;</b></p>
            </div>
            <a href="#" class="btn btn-danger pull-left"><i class="glyphicon glyphicon-chevron-left"></i> Passo precedente</a>
            <a href="#" class="btn btn-danger pull-right">Passo successivo <i class="glyphicon glyphicon-chevron-right"></i></a>
        </div>
    </div>
    <!--#include file="inc_footer.asp"-->
</body>
<!--#include file="inc_strClose.asp"-->
