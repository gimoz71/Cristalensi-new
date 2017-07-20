<nav class="navbar navbar-inverse menu-aux navbar-default visible-xs">
    <div class="container">
        <div class="col-xs-6">
            <ul class="nav navbar-nav">
                <li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"><span class="glyphicon glyphicon-info-sign"></span> Contattaci <span class="caret"></span></a>
                    <ul class="dropdown-menu">
                        <li><a href="#"><span class="glyphicon glyphicon-earphone"></span> +39.0571.911163</a></li>
                        <li><a href="#"><span class="glyphicon glyphicon-envelope"></span> info@cristalensi.it</a></li>
                        <li><a href="#"><span class="glyphicon glyphicon-map-marker"></span> Contatti e mappa</a></li>
                        <li><a href="/cristalensi/chi_siamo.asp"><span class="glyphicon glyphicon-star"></span> Chi siamo</a></li>
                        <li><a href="#"><span class="glyphicon glyphicon-facetime-video"></span> Video</a></li>
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
            <li><a href="#"><span class="glyphicon glyphicon-earphone"></span> +39.0571.911163</a></li>
            <li><a href="#"><span class="glyphicon glyphicon-envelope"></span> info@cristalensi.it</a></li>
            <li><a href="#"><span class="glyphicon glyphicon-map-marker"></span> Contatti e mappa</a></li>
            <li><a href="/cristalensi/chi_siamo.asp"><span class="glyphicon glyphicon-star"></span> Chi siamo</a></li>
            <li><a href="#"><span class="glyphicon glyphicon-facetime-video"></span> Video</a></li>
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
            <li><a href="/cristalensi/index.asp"><span class="glyphicon glyphicon-home"></span> Home</a></li>
            <%if idsession>0 then%>
              <li><a href="/cristalensi/admin/logout.asp"><span class="glyphicon glyphicon-log-in"></span> LOG OUT</a></li>
            <%else%>
              <li><a href="/cristalensi/iscrizione.asp"><span class="glyphicon glyphicon-log-in"></span> Accedi/iscriviti</a></li>
            <%end if%>

            <li><a href="areaprivata.asp"><span class="glyphicon glyphicon-user"></span> Area clienti</a></li>
            <li><a href="commenti_elenco.asp"><span class="glyphicon glyphicon-bullhorn"></span> Dicono di noi</a></li>
            <li><a href="#"><span class="glyphicon glyphicon-heart"></span> Lista dei desideri</a></li>
            <li><a href="/cristalensi/carrello1.asp"><span class="glyphicon glyphicon-shopping-cart"></span> Carrello</a></li>
            <li><a href="#"><span class="glyphicon glyphicon-th-list"></span> Condizioni di vendita</a></li>
        </ul>
    </div>
</nav>
