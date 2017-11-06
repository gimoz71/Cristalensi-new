<nav class="navbar navbar-inverse menu-aux navbar-default visible-xs">
    <div class="container">
        <div class="col-xs-6">
            <ul class="nav navbar-nav">
                <li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"><span class="glyphicon glyphicon-info-sign"></span> Contattaci <span class="caret"></span></a>
                    <ul class="dropdown-menu">
                        <li><a href="tel:+390571911163"><span class="glyphicon glyphicon-earphone"></span> +39.0571.911163</a></li>
                        <li><a href="mailto:info@cristalensi.it"><span class="glyphicon glyphicon-envelope"></span> info@cristalensi.it</a></li>
                        <li><a href="https://api.whatsapp.com/send?phone=393388064487" target="_blank" title="Per invio di messaggi e fotografie"><span class="glyphicon glyphicon-camera"></span> WhatsApp (SOLO CHAT)</a></li>
                        <li><a href="/contatti.asp"><span class="glyphicon glyphicon-map-marker"></span> Contatti e mappa</a></li>
                        <li><a href="/chi_siamo.asp"><span class="glyphicon glyphicon-star"></span> Chi siamo</a></li>
                        <li><a href="/video_elenco.asp"><span class="glyphicon glyphicon-facetime-video"></span> Video</a></li>
                    </ul>
                </li>
            </ul>
        </div>
        <div class="col-xs-6">
            <ul class="nav navbar-nav">
                <li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"><span class="glyphicon glyphicon-globe"></span> Lingua <span class="caret"></span></a>
                    <ul class="dropdown-menu">
                        <li><a href="https://www.cristalensi.com">Inglese</a></li>
                        <li><a href="https://www.cristalensi.com/de/">Tedesco</a></li>
                    </ul>
                </li>
            </ul>
        </div>
    </div>
</nav>
<nav class="navbar navbar-inverse menu-aux hidden-xs first-top-menu">
    <div class="container">
        <ul class="nav nav-justified">
            <li><a href="tel:+390571911163"><span class="glyphicon glyphicon-earphone"></span> +39.0571.911163</a></li>
            <li><a href="mailto:info@cristalensi.it"><span class="glyphicon glyphicon-envelope"></span> info@cristalensi.it</a></li>
            <li><a href="https://api.whatsapp.com/send?phone=393388064487" target="_blank" title="Per invio di messaggi e fotografie"><span class="glyphicon glyphicon-camera"></span> WhatsApp (SOLO CHAT)</a></li>
            <li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"><span class="glyphicon glyphicon-globe"></span> Chi siamo <span class="caret"></span></a>
                <ul class="dropdown-menu">
                    <li><a href="/contatti.asp"><span class="glyphicon glyphicon-map-marker"></span> Contatti e mappa</a></li>
            		<li><a href="https://api.whatsapp.com/send?phone=393388064487"><span class="glyphicon glyphicon-picture"></span> Il negozio</a></li>
            		<li><a href="/video_elenco.asp"><span class="glyphicon glyphicon-facetime-video"></span> Video</a></li>
                </ul>
            </li>
            <li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"><span class="glyphicon glyphicon-globe"></span> Lingua <span class="caret"></span></a>
                <ul class="dropdown-menu">
                    <li><a href="https://www.cristalensi.com">Inglese</a></li>
                    <li><a href="https://www.cristalensi.com/de/">Tedesco</a></li>
                </ul>
            </li>
        </ul>
    </div>
</nav>
<nav class="navbar navbar-inverse service-menu hidden-xs last-top-menu">
    <div class="container">
        <ul class="nav nav-justified">
            <li><a href="/" title="Cristalensi, vendita lampadari online"><span class="glyphicon glyphicon-home"></span> Home</a></li>
            <%if idsession>0 then%>
              <li><a href="/admin/logout.asp"><span class="glyphicon glyphicon-log-in"></span> LOG OUT</a></li>
            <%else%>
              <li><a href="/iscrizione.asp" rel="nofollow"><span class="glyphicon glyphicon-log-in"></span> Accedi/iscriviti</a></li>
            <%end if%>

            <li><a href="/areaprivata.asp" rel="nofollow"><span class="glyphicon glyphicon-user"></span> Area clienti</a></li>
            <li><a href="/commenti_elenco.asp"><span class="glyphicon glyphicon-bullhorn"></span> Dicono di noi</a></li>
            <li><a href="/preferiti.asp" rel="nofollow"><span class="glyphicon glyphicon-heart"></span> Lista dei desideri</a></li>
            <li><a href="/carrello1.asp" rel="nofollow"><span class="glyphicon glyphicon-shopping-cart"></span> Carrello</a></li>
            <li><a href="/condizioni_di_vendita.asp"><span class="glyphicon glyphicon-th-list"></span> Condizioni di vendita</a></li>
        </ul>
    </div>
</nav>
