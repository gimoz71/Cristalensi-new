<div id="block-main">
    <div class="container">
        <div class="row no-gutters">
            <div class="col-xs-12 col-sm-4" style="text-align: center">
                <a class="header-logo" href="/">Cristalensi</a>
            </div>
            <SCRIPT language="JavaScript">

        		function verifica_ricerca() {

        			testo_ricerca=document.ricerca_modulo.testo_ricerca.value;

        			if (testo_ricerca==""){
        				alert("Inserire un testo oppure un codice per effettuare la ricerca.");
        				return false;
        			}

        			else
        		return true

        		}

        		</SCRIPT>
            <div class="col-md-8">
                <form action="/cristalensi/ricerca_avanzata_elenco.asp" class="navbar-form pull-right search-bar" role="search" name="ricerca_modulo" onSubmit="return verifica_ricerca();">
                    <div class="input-group">
                        <input type="text" class="form-control" placeholder="Nome o codice prodotto" name="testo_ricerca" id="testo_ricerca">
                        <div class="input-group-btn">
                            <button class="btn btn-default" type="submit" style="margin-right: 5px;"><i class="glyphicon glyphicon-search"></i></button>
                            <button class="btn btn-danger" type="button" onClick="location.href='/cristalensi/ricerca_avanzata_elenco.asp'"><i class="glyphicon glyphicon-cog visible-xs-inline-block"></i><span class="hidden-xs"> Ricerca avanzata</span></button>
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
                    <li class="nav-user visible-xs"><a href="/cristalensi/index.asp">Home</a></li>
                    <li class="nav-user dropdown yamm-fw"><a href="#" data-toggle="dropdown" class="dropdown-toggle">Interno <span class="glyphicon glyphicon-chevron-down" aria-hidden="true"></span></a>
                        <ul class="dropdown-menu">
                            <li>
                                <!-- Content container to add padding -->
                                <div class="yamm-content">
                                    <div class="row">
                                      <ul class="col-sm-6 col-lg-3 col-same-height list-unstyled">
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
                                        <ul class="col-sm-6 col-lg-3 col-same-height list-unstyled">
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
                                                    <li><a href="#">Plafoniere <b>in gesso</b></a></li>
                                                    <li><a href="#">Plafoniere <b>per bambini</b></a></li>
                                                </ul>
                                            </li>
                                        </ul>

                                        <ul class="col-sm-6 col-lg-3 col-same-height list-unstyled">
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
                                                    <li><a href="#">Lampade da tavolo <b>per bambini</b></a></li>
                                                </ul>
                                            </li>
                                        </ul>

                                        <ul class="col-sm-6 col-lg-3 col-same-height list-unstyled">
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
                                                    <li><a href="#">Piantane <b>per bambini</b></a></li>
                                                </ul>
                                            </li>
                                        </ul>
                                        <ul class="col-sm-6 col-lg-3 col-same-height list-unstyled">
                                            <li class="subcategory">
                                                <a href="#"><h4><strong>Lampadari a bracci</strong></h4></a>
                                                <ul class="list-unstyled lampadari">
                                                    <li><a href="#">Lampadari a bracci <b>moderni</b></a></li>
                                                    <li><a href="#">Lampadari a bracci <b>classici</b></a></li>
                                                    <li><a href="#">Lampadari a bracci <b>in cristallo</b></a></li>
                                                    <li>&nbsp;</li>
                                                </ul>
                                            </li>
                                            <li class="subcategory">
                                                <a href="#"><h4><strong>Lampade allo specchio</strong></h4></a>
                                                <ul class="list-unstyled lampade-specchio">
                                                    <li><a href="#">Lampade allo specchio <b>moderne</b></a></li>
                                                    <li><a href="#">Lampade <b>LED</b> allo specchio</a></li>
                                                    <li><a href="#">Specchi <b>con luce</b></a></li>
                                                </ul>
                                            </li>
                                        </ul>

                                        <ul class="col-sm-6 col-lg-3 col-same-height list-unstyled">
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


                                        <ul class="col-sm-6 col-lg-3 col-same-height list-unstyled">
                                            <li class="subcategory">
                                                <a href="#"><h4><strong>Faretti, incassi e binari</strong></h4></a>
                                                <ul class="list-unstyled faretti">
                                                    <li><a href="#">Faretti <b>da incasso</b></a></li>
                                                    <li><a href="#">Faretti <b>LED da incasso</b></a></li>
                                                    <li><a href="#">Faretti a parete e binari</a></li>
                                                    <li><a href="#">Faretti a soffitto e binari</a></li>
                                                </ul>
                                            </li>
                                        </ul>
                                        <ul class="col-sm-6 col-lg-3 col-same-height list-unstyled">
                                            <li class="subcategory">
                                                <a href="#"><h4><strong>Novità e ultimi arrivi</strong></h4></a>
                                                <ul class="list-unstyled">
                                                    <li><a href="#">Lampade a sospensione</a></li>
                                                    <li><a href="#">Lampade a soffitto</a></li>
                                                    <li><a href="#">Lampade a parete</a></li>
                                                    <li><a href="#">Lampade da terra</a></li>
                                                    <li><a href="#">Abat-jour, lumini e lumetti</a></li>
                                                </ul>
                                            </li>
                                            <li class="subcategory">
                                                <a href="/cristalensi/offerte.asp" class="offerte">Offerte e Promozioni</a>
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
                                                <a href="#"><h4><strong>Lampade da terra per esterni</strong></h4></a>
                                                <ul class="list-unstyled piantane">
                                                    <li><a href="#">Pali e lampioni da giardino <b>moderni</b></a></li>
                                                    <li><a href="#">Lampade <b>LED</b> da terra per esterni</a></li>
                                                    <li><a href="#">Lampade esterne <b>classiche</b> da terra</a></li>
                                                    <li>&nbsp;</li>
                                                </ul>
                                            </li>
                                            <li class="subcategory">
                                                <a href="#"><h4><strong>Luci per arredo giardino</strong></h4></a>
                                                <ul class="list-unstyled piantane">
                                                    <li><a href="#">Lampade da arredo giardino e vasi luminosi</a></li>
                                                    <li>&nbsp;</li>
                                                    <li>&nbsp;</li>
                                                </ul>
                                            </li>
                                        </ul>
                                        <ul class="col-sm-6 col-lg-4 col-same-height list-unstyled">
                                          <li class="subcategory">
                                              <a href="#"><h4><strong>Applique da esterno</strong></h4></a>
                                              <ul class="list-unstyled applique">
                                                  <li><a href="#">Luci esterne a parete <b>moderne</b></a></li>
                                                  <li><a href="#">Applique <b>LED</b> per esterni</a></li>
                                                  <li><a href="#">Lampade esterne <b>classiche</b> a parete</a></li>
                                                  <li>&nbsp;</li>
                                              </ul>
                                          </li>

                                            <li class="subcategory">
                                                <a href="#"><h4><strong>Faretti e incassi da esterno</strong></h4></a>
                                                <ul class="list-unstyled faretti">
                                                    <li><a href="#">Lampade da incasso e faretti da esterno</a></li>
                                                    <li>&nbsp;</li>
                                                    <li>&nbsp;</li>
                                                </ul>
                                            </li>
                                        </ul>

                                        <ul class="col-sm-6 col-lg-4 col-same-height list-unstyled">
                                            <li class="subcategory">
                                                <a href="#"><h4><strong>Plafoniere e sospensioni per esterni</strong></h4></a>
                                                <ul class="list-unstyled plafoniere">
                                                    <li><a href="#">Plafoniere esterne <b>moderne</b></a></li>
                                                    <li><a href="#">Lampade esterne <b>classiche</b> a soffitto</a></li>
                                                    <li><a href="#">Lampade esterne <b>classiche</b> a sospensione</a></li>
                                                    <li>&nbsp;</li>
                                                </ul>
                                            </li>
                                            <li class="subcategory">
                                                <a href="#"><h4><strong>Lampade con pannello solare</strong></h4></a>
                                                <ul class="list-unstyled piantane">
                                                    <li><a href="#">Lampade <b>LED</b> con pannello solare</a></li>
                                                    <li>&nbsp;</li>
                                                    <li>&nbsp;</li>
                                                </ul>
                                            </li>
                                        </ul>

                                    </div>
                                </div>
                            </li>
                        </ul>
                    </li>
                    <li class="nav-user dropdown"><a href="#" data-toggle="dropdown" class="dropdown-toggle">Ventilatori <span class="glyphicon glyphicon-chevron-down" aria-hidden="true"></span></a>
                        <ul class="dropdown-menu">
                            <li class="dropdown dropdown-submenu">
                                <a href="#" class="dropdown-toggle" data-toggle="dropdown">Ventilatori a soffitto con luce</a>
                                <ul class="dropdown-menu">
                                    <li><a href="#">Ventilatori a soffitto <b>moderni</b> con luce</a></li>
                                    <li><a href="#">Ventilatori a soffitto <b>classici</b> con luce</a></li>
                                </ul>
                            </li>
                            <li class="dropdown dropdown-submenu">
                                <a href="#" class="dropdown-toggle" data-toggle="dropdown">Ventilatori senza luce</a>
                                <ul class="dropdown-menu">
                                    <li><a href="#">Ventilatori a soffitto senza luce</a></li>
                                    <li><a href="#">Ventilatori da terra e da tavolo</a></li>
                                </ul>
                            </li>
                        </ul>
                    </li>
                    <li class="nav-user dropdown"><a href="#" data-toggle="dropdown" class="dropdown-toggle">Lampadine <span class="glyphicon glyphicon-chevron-down" aria-hidden="true"></span></a>
                        <ul class="dropdown-menu">
                            <li class="dropdown dropdown-submenu">
                                <a href="#" class="dropdown-toggle" data-toggle="dropdown">Lampadine LED e alogene</a>
                                <ul class="dropdown-menu">
                                    <li><a href="#">Lampadine <b>LED</b></a></li>
                                    <li><a href="#">Lampadine <b>alogene</b></a></li>
                                </ul>
                            </li>
                            <li class="dropdown dropdown-submenu">
                                <a href="#" class="dropdown-toggle" data-toggle="dropdown">Componenti illuminazione</a>
                                <ul class="dropdown-menu">
                                    <li><a href="#">Strisce <b>LED</b></a></li>
                                    <li><a href="#">Driver per <b>LED</b></a></li>
                                </ul>
                            </li>
                        </ul>
                    </li>
                    <li class="nav-user dropdown"><a href="#" data-toggle="dropdown" class="dropdown-toggle">Stili <span class="glyphicon glyphicon-chevron-down" aria-hidden="true"></span></a>
                        <ul class="dropdown-menu">
                            <li><a href="/cristalensi/illuminazione-interni-ed-esterni/1ns-lampade-moderne-per-interni.asp">Lampade moderne per interni</a></li>
                            <li><a href="/cristalensi/illuminazione-interni-ed-esterni/2ns-lampade-led-da-interni.asp">Lampade LED da interni</a></li>
                            <li><a href="/cristalensi/illuminazione-interni-ed-esterni/3ns-lampade-classiche-da-interni.asp">Lampade classiche da interni</a></li>
                            <li><a href="/cristalensi/illuminazione-interni-ed-esterni/4ns-lampade-rustiche.asp">Lampade rustiche</a></li>
                            <li><a href="/cristalensi/illuminazione-interni-ed-esterni/5ns-lampade-vintage.asp">Lampade vintage</a></li>
                            <li><a href="/cristalensi/illuminazione-interni-ed-esterni/6ns-lampade-tiffany.asp">Lampade Tiffany</a></li>
                            <li><a href="/cristalensi/illuminazione-interni-ed-esterni/7ns-lampade-murano.asp">Lampade Murano</a></li>
                            <li><a href="/cristalensi/illuminazione-interni-ed-esterni/8ns-lampade-in-cristallo.asp">Lampade in cristallo</a></li>
                            <li><a href="/cristalensi/illuminazione-interni-ed-esterni/9ns-lampade-in-gesso.asp">Lampade in gesso</a></li>
                            <li><a href="/cristalensi/illuminazione-interni-ed-esterni/10ns-lampade-per-bambini.asp">Lampade per bambini</a></li>
                            <li><a href="/cristalensi/illuminazione-interni-ed-esterni/11ns-lampade-moderne-per-esterni.asp">Lampade moderne per esterni</a></li>
                            <li><a href="/cristalensi/illuminazione-interni-ed-esterni/12ns-lampade-led-per-esterni.asp">Lampade LED per esterni</a></li>
                            <li><a href="/cristalensi/illuminazione-interni-ed-esterni/13ns-lampade-classiche-per-esterni.asp">Lampade classiche per esterni</a></li>
                        </ul>
                    </li>
                    <li class="nav-user dropdown"><a href="#" data-toggle="dropdown" class="dropdown-toggle">Ambienti <span class="glyphicon glyphicon-chevron-down" aria-hidden="true"></span></a>
                        <ul class="dropdown-menu">
                            <li><a href="/cristalensi/illuminazione-interni-ed-esterni/1na-lampade-soggirno.asp">Soggiorno</a></li>
                            <li><a href="/cristalensi/illuminazione-interni-ed-esterni/2na-lampade-cucina.asp">Cucina</a></li>
                            <li><a href="/cristalensi/illuminazione-interni-ed-esterni/3na-lampade-camera-da-letto.asp">Camera da letto</a></li>
                            <li><a href="/cristalensi/illuminazione-interni-ed-esterni/4na-lampade-cameretta.asp">Cameretta</a></li>
                            <li><a href="/cristalensi/illuminazione-interni-ed-esterni/5na-lampade-bagno.asp">Bagno</a></li>
                            <li><a href="/cristalensi/illuminazione-interni-ed-esterni/6na-lampade-ingresso.asp">Ingresso</a></li>
                            <li><a href="/cristalensi/illuminazione-interni-ed-esterni/7na-lampade-corridoio-scale.asp">Corridoio e scale</a></li>
                            <li><a href="/cristalensi/illuminazione-interni-ed-esterni/8na-lampade-ufficio-studio.asp">Ufficio e studio</a></li>
                            <li><a href="/cristalensi/illuminazione-interni-ed-esterni/9na-lampade-taverna.asp">Taverna</a></li>
                            <li><a href="/cristalensi/illuminazione-interni-ed-esterni/10na-lampade-giardino.asp">Giardino</a></li>
                            <li><a href="/cristalensi/illuminazione-interni-ed-esterni/11na-lampade-terrazzo.asp">Terrazzo e balcone</a></li>
                            <li><a href="/cristalensi/illuminazione-interni-ed-esterni/12na-lampade-loggiato.asp">Loggiato</a></li>
                        </ul>
                    </li>
                    <li class="nav-user"><a href="/cristalensi/produttori.asp">Produttori</a></li>

                    <%if idsession>0 then%>
                      <li class="nav-user visible-xs"><a href="/cristalensi/admin/logout.asp">LOG OUT</a></li>
                    <%else%>
                      <li class="nav-user visible-xs"><a href="/cristalensi/iscrizione.asp">Accedi/iscriviti</a></li>
                    <%end if%>
                    <li class="nav-user visible-xs"><a href="areaprivata.asp">Area Clienti</a></li>
                    <li class="nav-user visible-xs"><a href="commenti_elenco.asp">Dicono di noi</a></li>
                    <li class="nav-user visible-xs"><a href="#">Lista dei desideri</a></li>
                    <li class="nav-user visible-xs"><a href="/cristalensi/carrello1.asp">Carrello</a></li>
                    <li class="nav-user visible-xs"><a href="/cristalensi/condizioni_di_vendita.asp">Condizioni di vendita</a></li>
                </ul>
            </div>
        </div>
    </nav>

</div>
