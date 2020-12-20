<!-- Directeur Menu ########################################################################################-->
         <!-- Navigation -->
        <nav class="navbar navbar-default navbar-static-top" role="navigation" style="margin-bottom: 0">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="#">Directeur ${sessionScope.nom}&nbsp${sessionScope.prenom}</a>
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
                            <a href="notificationDirecteur"><i class="fa fa-bell fa-fw"></i> Notifications</a>
                        </li>
                        <li>
                            <a href="membreLabo"><i class="fa fa-graduation-cap fa-fw"></i>Membres du laboratoire</a>
                        </li>
                        <li>
                            <a href="equipe"><i class="fa fa-group  fa-fw"></i>Equipes</a>
                        </li>
                        <li>
                            <a href="evenement"><i class="fa fa-calendar fa-fw"></i> Evenements</a>
                        </li>
                        <li>
                            <a href="bilan"><i class="fa fa-bar-chart-o fa-fw"></i> Bilan</a>
                        </li>
                        <li>
                            <a href="messagerie"><i class="fa fa-envelope-o fa-fw"></i> Messagerie</a>
                        </li>
                    </ul>   
                </div>
                <!-- /.sidebar-collapse -->
            </div>
            <!-- /.navbar-static-side -->
        </nav>
<!-- ################################################################################################################# -->