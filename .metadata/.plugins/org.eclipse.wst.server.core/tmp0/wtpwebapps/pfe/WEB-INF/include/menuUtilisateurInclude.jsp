 <!-- Utilisateur Menu ########################################################################################## -->
 <nav class="navbar navbar-default navbar-static-top" role="navigation" style="margin-bottom: 0">
    <div class="navbar-header">
        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
        </button>
        <a class="navbar-brand" href="#">${sessionScope.nom}&nbsp${sessionScope.prenom}</a>
    </div>
    <!-- /.navbar-header -->

    <ul class="nav navbar-top-links navbar-right">
        <li class="dropdown">
            <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                <i class="fa fa-user fa-fw"></i> <i class="fa fa-caret-down"></i>
            </a>
            <ul class="dropdown-menu dropdown-messages">
                <li><a href="profil"><i class="fa fa-user fa-fw"></i>Profil</a></li>
                <li class="divider"></li>
                <li><a href="accueil"><i class="fa fa-sign-out fa-fw"></i> Déconnexion </a></li>
            </ul>
            <!-- /.dropdown-user -->
        </li>
        <!-- /.dropdown -->
    </ul>
    <!-- /.navbar-top-links -->

    <div class="navbar-default sidebar" role="navigation">
        <div class="sidebar-nav navbar-collapse">
            <ul class="nav" id="side-menu">
            	<li>
                    <a href="notification"><i class="fa fa-bell fa-fw"></i> Notifications</a>
                </li>
                <li>
                    <a href="these"><i class="fa fa-book fa-fw"></i> Théses</a>
                </li>
                <li>
                    <a href="doctorantEncadre"><i class="fa fa-graduation-cap fa-fw"></i> Doctorant(s) Encadré(s)</a>
                </li>
                <li>
                    <a href="journal"><i class="fa fa-file-text-o fa-fw"></i> Publication dans une revue</a>
                </li>
                <li>
                    <a href="conference"><i class="fa fa-wechat fa-fw"></i> Communication dans une conférence</a>
                <li>
                    <a href="projetContratFinance"><i class="fa fa-dollar fa-fw"></i> Projet/Contrat financé</a>
                </li>
                <li>
                    <a href="distinctionPrix"><i class="fa  fa-trophy fa-fw"></i> Distinction/Prix</a>
                </li>
                <li>
                    <a href="manifistation"><i class="fa  fa-maxcdn fa-fw"></i> Manifstations scientifiques</a>
                </li>
                <li>
                    <a href="partenariatNonfinance"><i class="fa fa-paste  fa-fw"></i> Partenariat non financé</a>
                </li>
                <li>
                    <a href="ouvrage"><i class="fa fa-file-text   fa-fw"></i> Ouvrage</a>
                </li>
                <li>
                    <a href="brevetDroit"><i class="fa fa-copyright  fa-fw"></i> Brevet/Droit d'auteur</a>
                </li>
                <li>
                    <a href="creativiteLitteraire"><i class="fa fa-edit fa-fw"></i> Créativité littèraire</a>
                </li>
            </ul>   
        </div>
        <!-- /.sidebar-collapse -->
    </div>
    <!-- /.navbar-static-side -->
</nav>
<!--  ########################################################################################################################## -->