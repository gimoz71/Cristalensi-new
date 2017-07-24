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
                    <li><a href="#">Lampade da interno</a></li>
                    <li><a href="#">Lampade da esterno</a></li>
                    <li><a href="#">Ventiltori</a></li>
                    <li><a href="#">Lampadine e componenti</a></li>
                    <li>&nbsp;</li>
                </ul>
                <h4>Oppure cerca per</h4>
                <ul>
                    <li><a href="#">Stile</a></li>
                    <li><a href="#">Ambiente</a></li>
                    <li><a href="#">Produttore</a></li>
                </ul>
            </div>
            <div class="col-md-3 menu-col">
                <h4>Riferimenti</h4>
                <ul>
                    <li><a href="/contatti.asp">Contatti e mappa</a></li>
                    <li><a href="/chi_siamo.asp">Chi siamo: lo showroom</a></li>
                    <li><a href="/video_elenco.asp">Video</a></li>
                    <li><a href="/commenti_elenco">Dicono noi</a></li>
                </ul>
                <h4>Area Clienti</h4>
                <ul>
                    <li><a href="/iscrizione.asp">Iscriviti/Accedi</a></li>
                    <li><a href="#">Lista dei desideri</a></li>
                    <li><a href="/carrello1.asp">Carrello</a></li>
                    <li><a href="/areaprivata.asp">Elenco ordini</a></li>
                </ul>
            </div>
            <div class="col-md-3 menu-col">
                <h4>Note legali</h4>
                <ul>
                    <li><a href="#">Condizioni di vendita</a></li>
                    <li><a href="#">Privacy e note legali</a></li>
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
<div style="display: none; max-width: 800px;" id="hidden-content">
    <h4>Invia richiesta disponibilit&agrave; per<br /><b><%=Titolo_prodotto%></b><br />Codice prodotto: <%=CodiceArticolo%></h4>
    <p class="description">Per coloro che hanno la necessit&agrave; della fattura inserire i dati correttamente, altrimenti verr&agrave; emesso regolare scontrino fiscale. La fattura &egrave; emessa su richiesta sia per le aziende che per privati.</p>
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
<%if FkProduttore>0 then%>
<div style="display: none; max-width: 800px;" id="hidden-content">
    <h4>Invia richiesta disponibilit&agrave; per<br /><b><%=titolo_produttore%></b></h4>
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
