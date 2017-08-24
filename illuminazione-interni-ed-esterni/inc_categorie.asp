<!--#include virtual="/cristalensi/inc_strConn.asp"-->
<%
Set cr_rs = Server.CreateObject("ADODB.Recordset")
sql = "SELECT * FROM NewCategorie WHERE PkId="&pkid_categoria
cr_rs.open sql,conn, 1, 1
if cr_rs.recordcount>0 then
  Titolo_1=cr_rs("Titolo_1")
  Titolo_2=cr_rs("Titolo_2")
  Url=cr_rs("Url")
  Title=cr_rs("Title")
  Description=cr_rs("Description")
  Descrizione=cr_rs("Descrizione")
  Img=cr_rs("Img")
  FkNewGruppo=cr_rs("FkNewGruppo")
  FkNewTipologia=cr_rs("FkNewTipologia")
end if
cr_rs.close

Set tr_rs = Server.CreateObject("ADODB.Recordset")
sql = "SELECT * FROM NewTipologie WHERE PkId="&FkNewTipologia
tr_rs.open sql,conn, 1, 1
if tr_rs.recordcount>0 then
  Titolo_1_tip=tr_rs("Titolo_1")
  Titolo_2_tip=tr_rs("Titolo_2")
  Url_tip=tr_rs("Url")
end if
tr_rs.close

Set gr_rs = Server.CreateObject("ADODB.Recordset")
sql = "SELECT * FROM NewGruppi WHERE PkId="&FkNewGruppo
gr_rs.open sql,conn, 1, 1
if gr_rs.recordcount>0 then
  Titolo_1_gr=gr_rs("Titolo_1")
  Titolo_2_gr=gr_rs("Titolo_2")
  Url_gr=gr_rs("Url")
end if
gr_rs.close

%>
<!DOCTYPE html>
<html>

<head>
    <title><%=Title%></title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="description" content="<%=Description%>">
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
    <!--#include virtual="/cristalensi/inc_funzioni_head.asp"-->
</head>

<body>
    <!--#include virtual="/cristalensi/inc_header_1.asp"-->
    <!--#include virtual="/cristalensi/inc_header_2.asp"-->
    <div class="container content">
        <div class="row hidden">
            <div class="col-md-12 parentOverflowContainer">
            </div>
        </div>
        <div class="col-xl-12">
            <ol class="breadcrumb">
                <li><a href="/cristalensi/index.asp"><i class="fa fa-home"></i></a></li>
                <li><a href="/cristalensi/illuminazione-interni-ed-esterni/<%=Url_gr%>"><%=Titolo_2_gr%></a></li>
                <li><a href="/cristalensi/illuminazione-interni-ed-esterni/<%=Url_tip%>"><%=Titolo_2_tip%></a></li>
                <li class="active"><%=Titolo_2%></li>
            </ol>
            <h4 class="title"><%=Titolo_2%></h4>
            <%if Len(Descrizione)>0 then%>
            <p class="description">
                <%=Descrizione%>
            </p>
            <%end if%>
        </div>
        <div class="col-md-3">
            <div class=" top-buffer">
                <nav class="navbar">
                    <!-- menu - normal collapsible navbar markup -->
                    <%
                    Set tip_rs = Server.CreateObject("ADODB.Recordset")
                    sql = "SELECT * FROM NewCategorie WHERE FkNewTipologia="&FkNewTipologia&" ORDER BY Posizione ASC"
                    tip_rs.open sql,conn, 1, 1
                    if tip_rs.recordcount>0 then
                    %>
                    <ul class="list-unstyled side-list">
                        <%
                        Do While not tip_rs.EOF
                          PkId=tip_rs("PkId")
                          Titolo_1=tip_rs("Titolo_1")
                          Titolo_2=tip_rs("Titolo_2")
                          Url=tip_rs("Url")
                          Title=tip_rs("Title")
                          'Description=tip_rs("Description")
                          'Descrizione=tip_rs("Descrizione")
                        %>
                        <li><a href="/cristalensi/illuminazione-interni-ed-esterni/<%=Url%>" title="<%=Titolo_2%>" <%if pkid=pkid_categoria then%>class="active"<%end if%>><%=Titolo_1%></a></li>
                        <%
                        tip_rs.movenext
                        loop
                        %>
                    </ul>
                    <%
                    end if
                    tip_rs.close
                    %>
                </nav>
            </div>
        </div>
        <div class="col-md-9">
            <div class="row top-buffer">
                <%
                p=request("p")
                if p="" then p=1

                order=request("order")
                if order="" then order=1

                if order=1 then ordine="Titolo ASC"
                if order=2 then ordine="Titolo DESC"
                if order=3 then ordine="PrezzoProdotto ASC, PrezzoListino ASC"
                if order=4 then ordine="PrezzoProdotto DESC, PrezzoListino DESC"

                Set prod_rs = Server.CreateObject("ADODB.Recordset")
                sql = "SELECT * FROM Prodotti WHERE (FkNewCategoria="&pkid_categoria&" and (Offerta=0 or Offerta=2)) ORDER BY "&ordine&""
                prod_rs.open sql,conn, 1, 1
                if prod_rs.recordcount>0 then

                  prod_rs.PageSize = 30
                  if prod_rs.recordcount > 0 then
                    prod_rs.AbSolutePage = p
                    maxPage = prod_rs.PageCount
                  End if
                %>
                <div class="col-xs-12">
                    <nav class="navbar navbar-default">
                        <div class="container-fluid">
                            <div class="navbar-header">
                                <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                                    <span class="sr-only">Toggle navigation</span>
                                    <span class="icon-bar"></span>
                                    <span class="icon-bar"></span>
                                    <span class="icon-bar"></span>
                                </button>
                                <a class="navbar-brand" href="#">Ordina per:</a>
                            </div>
                            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                                <p class="navbar-text">prezzo</p>
                                <ul class="nav navbar-nav">
                                    <li <%if order=3 then%>class="active"<%end if%>><a style="border: solid 1px #e7e7e7; border-top: none; border-bottom: none;" href="/cristalensi/illuminazione-interni-ed-esterni/<%=toUrl%>?order=3"><i class="glyphicon glyphicon-eur"></i> - </a></li>
                                    <li <%if order=4 then%>class="active"<%end if%>><a style="border: solid 1px #e7e7e7; border-top: none; border-bottom: none;" href="/cristalensi/illuminazione-interni-ed-esterni/<%=toUrl%>?order=4"><i class="glyphicon glyphicon-eur"></i> + </a></li>
                                </ul>
                                <p class="navbar-text">ordine alfabetico</p>
                                <ul class="nav navbar-nav">
                                    <li <%if order=1 then%>class="active"<%end if%>><a style="border: solid 1px #e7e7e7; border-top: none; border-bottom: none;" href="/cristalensi/illuminazione-interni-ed-esterni/<%=toUrl%>?order=1">A/Z</a></li>
                                    <li <%if order=2 then%>class="active"<%end if%>><a style="border: solid 1px #e7e7e7; border-top: none; border-bottom: none;" href="/cristalensi/illuminazione-interni-ed-esterni/<%=toUrl%>?order=2">Z/A</a></li>
                                </ul>
                            </div>
                        </div>
                    </nav>
                </div>
                <%
                Do while not prod_rs.EOF and rowCount < prod_rs.PageSize
                RowCount = RowCount + 1

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
                <div class="col-xs-12 col-sm-4 col-md-4">
                  <article class="col-item">
                      <div class="photo">
                          <a href="/cristalensi/<%=NomePagina%>" class="prod-img-replace" style="background-image: url(https://www.cristalensi.it/public/<%=file_img%>)" title="<%=titolo_prodotto%>"><img alt="<%=titolo_prodotto%>" src="/cristalensi/images/blank.png"></a>
                      </div>
                      <div class="info">
                          <div class="row">
                              <div class="price-details col-md-6">
                                  <a href="/cristalensi/<%=NomePagina%>" title="<%=titolo_prodotto%>"><h1><%=titolo_prodotto%></h1></a>
                                  <p class="details">codice: <b><%=codicearticolo%></b><br /> <span>produttore: <b><a href="<%=url_produttore%>"><%=produttore%></a></b></span></p>
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
            <%if prod_rs.recordcount>30 then%>
            <div class="row top-buffer">
                <div class="col-lg-12">
                    <nav aria-label="Page navigation center-block">
                        <ul class="pagination">
                            <li class="active"><a href="#" aria-label="Previous">Pagina <%=p%> di <%=prod_rs.PageCount%></a></li>

                            <%if p > 2 then%>
                            <li><a href="/cristalensi/illuminazione-interni-ed-esterni/<%=toUrl%>?p=1&cat=<%=cat%>&FkProduttore=<%=FkProduttore%>&order=<%=order%>">Prima pagina</a></li>
                            <%end if%>
                            <% if p > 1 then %>
                            <li>
                                <a href="/cristalensi/illuminazione-interni-ed-esterni/<%=toUrl%>?p=<%=p-1%>&cat=<%=cat%>&FkProduttore=<%=FkProduttore%>&order=<%=order%>" aria-label="Previous">
                                    <span aria-hidden="true">&laquo;</span>
                                </a>
                            </li>
                            <%end if%>
                            <% for page = p+1 to p+4 %>
                            <%if not page>maxPage then%>
                            <li><a href="/cristalensi/illuminazione-interni-ed-esterni/<%=toUrl%>?p=<%=Page%>&cat=<%=cat%>&FkProduttore=<%=FkProduttore%>&order=<%=order%>"><%=page%></a></li>
                            <%end if%>
                            <% if page >= prod_rs.PageCount then
                               page = p+4
                              end if
                              next
                            %>
                            <% if cInt(p) < maxPage then %>
                            <li>
                                <a href="/cristalensi/illuminazione-interni-ed-esterni/<%=toUrl%>?p=<%=p+1%>&cat=<%=cat%>&FkProduttore=<%=FkProduttore%>&order=<%=order%>" aria-label="Next">
                                    <span aria-hidden="true">&raquo;</span>
                                </a>
                            </li>
                            <%end if%>
                            <%if maxPage>5 and cInt(p)<>prod_rs.PageCount then%>
                            <li><a href="/cristalensi/illuminazione-interni-ed-esterni/<%=toUrl%>?p=<%=prod_rs.PageCount%>&cat=<%=cat%>&FkProduttore=<%=FkProduttore%>&order=<%=order%>">Ultima pagina</a></li>
                            <%end if%>
                        </ul>
                    </nav>
                </div>
            </div>
            <%end if%>
            <%
            end if
            prod_rs.close
            %>
        </div>
    </div>
    <!--#include virtual="/cristalensi/inc_footer.asp"-->
</body>
<!--#include virtual="/cristalensi/inc_strClose.asp"-->
