<footer>
    <div class="container">
        <div class="row">
            <div class="col-md-3 address-col">
                <h4>Cristalensi Vendita Lampadari</h4>
                <p>
                  Cristalensi Snc di Lensi Massimiliano & C.<br />

                  C.F. e Iscr. Reg. Impr. di Firenze 05305820481<br />
                  R.E.A. Firenze 536760<br />
                  50056 Montelupo Fiorentino (FI)<br />
                  Via arti e mestieri, 1<br />
                  Tel.: 0571.911163<br />
                  Fax: 0571.073327<br />
                  E-mail: info@cristalensi.it
                </p>
                <h4>Contatti Social</h4>
                <p class="social">
                    <a href="#"><i class="fa fa-facebook-square"></i></a>
                    <a href="#"><i class="fa fa-youtube-square"></i></a>
                    <a href="#"><i class="fa fa-linkedin-square"></i></a>
                </p>

            </div>
            <div class="col-md-3 menu-col">
                <h4>Cosa cerchi?</h4>
                <ul>
                    <li><a href="/cristalensi/illuminazione-interni-ed-esterni/1ng-lampade-da-interno.asp">Lampade da interno</a></li>
                    <li><a href="/cristalensi/illuminazione-interni-ed-esterni/2ng-lampade-da-esterno.asp">Lampade da esterno</a></li>
                    <li><a href="/cristalensi/illuminazione-interni-ed-esterni/3ng-ventilatori.asp">Ventiltori</a></li>
                    <li><a href="/cristalensi/illuminazione-interni-ed-esterni/4ng-lampadine.asp">Lampadine e componenti</a></li>
                    <li>&nbsp;</li>
                </ul>
                <h4>Oppure cerca in</h4>
                <ul>
                    <li><a href="/cristalensi/offerte.asp">Offerte</a></li>
                    <li><a href="/cristalensi/novita-illuminazione-ultimi-arrivi.asp">Novit&agrave; e ultimi arrivi</a></li>
                </ul>
            </div>
            <div class="col-md-3 menu-col">
                <h4>Riferimenti</h4>
                <ul>
                    <li><a href="/contatti.asp">Contatti e mappa</a></li>
                    <li><a href="/chi_siamo.asp">Chi siamo: lo showroom</a></li>
                    <li><a href="/video_elenco.asp">Video</a></li>
                    <li><a href="/commenti_elenco.asp">Dicono noi</a></li>
                </ul>
                <h4>Area Clienti</h4>
                <ul>
                    <li><a href="/iscrizione.asp">Iscriviti/Accedi</a></li>
                    <li><a href="/areaprivata.asp">Lista dei desideri</a></li>
                    <li><a href="/carrello1.asp">Carrello</a></li>
                    <li><a href="/areaprivata.asp">Elenco ordini</a></li>
                </ul>
            </div>
            <div class="col-md-3 menu-col">
                <h4>Note legali</h4>
                <ul>
                    <li><a href="/cristalensi/condizioni_di_vendita.asp">Condizioni di vendita</a></li>
                    <li><a href="/cristalensi/privacy.asp">Privacy e note legali</a></li>
                </ul>
                <h4>Spedizioni</h4>
                <ul class="checklist">
                    <li>Spedizioni assicurate GRATUITE in tutta Italia per ordini superiori a 250&euro;</li>
                </ul>
                <h4>Pagamenti accettati</h4>
                <ul class="checklist">
                    <li>Bonifico Bancario</li>
                    <li>Contrassegno</li>
                    <li>Carte di credito - Prepagate - PostePay</li>
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
<%if id>0 and Len(Titolo_prodotto)>0 then%>
<%
ric=request("ric")
if ric="" then ric=0
%>
<SCRIPT language="JavaScript">
  function verifica_request() {

  email=document.requestform.email.value;

  if (email==""){
    alert("Non  e\' stato compilato il campo \"Email\".");
    return false;
  }
  if (email.indexOf("@")==-1 || email.indexOf(".")==-1){
  alert("ATTENZIONE! \"e-mail\" non valida.");
  return false;
  }

    else

      document.requestform.method = "post";
      document.newsform2.action = "<%=toUrl_completo%>";
      document.newsform2.submit();
  }
</SCRIPT>
<div style="display: none; max-width: 800px;" id="hidden-content">
    <h4>Richiesta informazioni e disponibilit&agrave; per<br /><b><%=Titolo_prodotto%></b><br />Codice prodotto: <%=CodiceArticolo%></h4>
    <%if ric=1 then%>
    <p><strong>La richiesta &egrave; stata inoltrata correttamente, il nostro staff ti contatter&agrave; il prima possibile.<br />Saluti da CRISTALENSI</strong></p>
    <%else%>
    <p class="description">Per richiedere informazioni, disponibilit&agrave; o un preventivo di prezzo del prodotto riempi il seguente modulo, oppure contattaci direttamente.</p>
    <form class="form-horizontal" name="requestform" id="requestform" onSubmit="return verifica_request();">
    <input type="hidden" name="ric" value="1" />
        <div class="form-group">
            <label for="nome" class="col-sm-4 control-label">Nome</label>
            <div class="col-sm-8">
                <input type="text" class="form-control" id="nome" name="nome">
            </div>
        </div>
        <div class="form-group">
            <label for="email" class="col-sm-4 control-label">Indirizzo Email</label>
            <div class="col-sm-8">
                <input type="email" class="form-control" id="email" name="email">
            </div>
        </div>
        <div class="form-group">
            <label for="telefono" class="col-sm-4 control-label">Telefono</label>
            <div class="col-sm-8">
                <input type="number" class="form-control" id="telefono" name="telefono">
            </div>
        </div>
        <div class="form-group">
            <label for="richiesta" class="col-sm-4 control-label">Dettagli richiesta</label>
            <div class="col-sm-8">
                <textarea class="form-control" name="richesta"></textarea>
            </div>
        </div>
        <div class="form-group">
            <div class="col-sm-offset-4 col-sm-8">
                <button type="submit" class="btn btn-danger">invia richiesta</button>
            </div>
        </div>
    </form>
    <%end if%>
</div>
<%end if%>
<%if FkProduttore>0 then%>
<div style="display: none; max-width: 800px;" id="hidden-content">
    <h4>Invia richiesta disponibilit&agrave; prodotti per<br /><b><%=titolo_produttore%></b></h4>
    <p class="description">Inserisci quanti pi&uacute; dati possibili cos&iacute; da facilitare la ricerca al nostro staff, grazie.</p>
    <form class="form-horizontal">
        <div class="form-group">
            <label for="inputEmail3" class="col-sm-4 control-label">Nome</label>
            <div class="col-sm-8">
                <input type="text" class="form-control" id="inputEmail3">
            </div>
        </div>
        <div class="form-group">
            <label for="inputEmail3" class="col-sm-4 control-label">Indirizzo Email</label>
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
            <label for="inputEmail3" class="col-sm-4 control-label">Dettagli richiesta</label>
            <div class="col-sm-8">
                <textarea class="form-control"></textarea>
            </div>
        </div>
        <div class="form-group">
            <div class="col-sm-offset-4 col-sm-8">
                <button type="submit" class="btn btn-danger">invia richiesta</button>
            </div>
        </div>
    </form>
</div>
<%end if%>
<!-- fine finestra modale -->
<!-- Bootstrap core JavaScript
    ================================================== -->
<!-- Placed at the end of the document so the pages load faster -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="/cristalensi/javascripts/bootstrap.js"></script>
<script src="/cristalensi/javascripts/holder.js"></script>
<script src="/cristalensi/javascripts/jquery.bootstrap-touchspin.js"></script>
<script src="/cristalensi/javascripts/bootstrap-select.js"></script>
<script src="/cristalensi/javascripts/jquery.fancybox.js"></script>
<script src="/cristalensi/javascripts/custom.js"></script>
<script>
    // $("input[name='pezzi']").TouchSpin({
    //     // verticalbuttons: true,
    //     // verticalupclass: 'glyphicon glyphicon-plus',
    //     // verticaldownclass: 'glyphicon glyphicon-minus'
    // });
    $('.selectpicker').selectpicker({
        style: 'btn-default'
    });

</script>
