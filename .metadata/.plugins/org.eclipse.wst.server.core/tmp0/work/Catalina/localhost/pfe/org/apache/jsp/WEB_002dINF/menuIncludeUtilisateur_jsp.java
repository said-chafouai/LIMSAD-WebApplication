/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/7.0.85
 * Generated at: 2018-04-29 01:44:32 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp.WEB_002dINF;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class menuIncludeUtilisateur_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final javax.servlet.jsp.JspFactory _jspxFactory =
          javax.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.Map<java.lang.String,java.lang.Long> _jspx_dependants;

  static {
    _jspx_dependants = new java.util.HashMap<java.lang.String,java.lang.Long>(1);
    _jspx_dependants.put("/WEB-INF/taglibs.jsp", Long.valueOf(1524656015116L));
  }

  private volatile javax.el.ExpressionFactory _el_expressionfactory;
  private volatile org.apache.tomcat.InstanceManager _jsp_instancemanager;

  public java.util.Map<java.lang.String,java.lang.Long> getDependants() {
    return _jspx_dependants;
  }

  public javax.el.ExpressionFactory _jsp_getExpressionFactory() {
    if (_el_expressionfactory == null) {
      synchronized (this) {
        if (_el_expressionfactory == null) {
          _el_expressionfactory = _jspxFactory.getJspApplicationContext(getServletConfig().getServletContext()).getExpressionFactory();
        }
      }
    }
    return _el_expressionfactory;
  }

  public org.apache.tomcat.InstanceManager _jsp_getInstanceManager() {
    if (_jsp_instancemanager == null) {
      synchronized (this) {
        if (_jsp_instancemanager == null) {
          _jsp_instancemanager = org.apache.jasper.runtime.InstanceManagerFactory.getInstanceManager(getServletConfig());
        }
      }
    }
    return _jsp_instancemanager;
  }

  public void _jspInit() {
  }

  public void _jspDestroy() {
  }

  public void _jspService(final javax.servlet.http.HttpServletRequest request, final javax.servlet.http.HttpServletResponse response)
        throws java.io.IOException, javax.servlet.ServletException {

    final javax.servlet.jsp.PageContext pageContext;
    javax.servlet.http.HttpSession session = null;
    final javax.servlet.ServletContext application;
    final javax.servlet.ServletConfig config;
    javax.servlet.jsp.JspWriter out = null;
    final java.lang.Object page = this;
    javax.servlet.jsp.JspWriter _jspx_out = null;
    javax.servlet.jsp.PageContext _jspx_page_context = null;


    try {
      response.setContentType("text/html; charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;

      out.write('\r');
      out.write('\n');
      out.write(" <nav class=\"navbar navbar-default navbar-static-top\" role=\"navigation\" style=\"margin-bottom: 0\">\r\n");
      out.write("            <div class=\"navbar-header\">\r\n");
      out.write("                <button type=\"button\" class=\"navbar-toggle\" data-toggle=\"collapse\" data-target=\".navbar-collapse\">\r\n");
      out.write("                    <span class=\"sr-only\">Toggle navigation</span>\r\n");
      out.write("                    <span class=\"icon-bar\"></span>\r\n");
      out.write("                    <span class=\"icon-bar\"></span>\r\n");
      out.write("                    <span class=\"icon-bar\"></span>\r\n");
      out.write("                </button>\r\n");
      out.write("                <a class=\"navbar-brand\" href=\"index.html\">");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${sessionScope.nom}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null, false));
      out.write("&nbsp");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${sessionScope.prenom}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null, false));
      out.write("</a>\r\n");
      out.write("            </div>\r\n");
      out.write("            <!-- /.navbar-header -->\r\n");
      out.write("\r\n");
      out.write("            <ul class=\"nav navbar-top-links navbar-right\">\r\n");
      out.write("                <li class=\"dropdown\">\r\n");
      out.write("                    <a class=\"dropdown-toggle\" data-toggle=\"dropdown\" href=\"#\">\r\n");
      out.write("                        <i class=\"fa fa-user fa-fw\"></i> <i class=\"fa fa-caret-down\"></i>\r\n");
      out.write("                    </a>\r\n");
      out.write("                    <ul class=\"dropdown-menu dropdown-messages\">\r\n");
      out.write("                        <li><a href=\"#\"><i class=\"fa fa-user fa-fw\"></i>Profil</a></li>\r\n");
      out.write("                        <li class=\"divider\"></li>\r\n");
      out.write("                        <li><a href=\"deconnexion.jsp\"><i class=\"fa fa-sign-out fa-fw\"></i> Déconnexion </a></li>\r\n");
      out.write("                    </ul>\r\n");
      out.write("                    <!-- /.dropdown-user -->\r\n");
      out.write("                </li>\r\n");
      out.write("                <!-- /.dropdown -->\r\n");
      out.write("            </ul>\r\n");
      out.write("            <!-- /.navbar-top-links -->\r\n");
      out.write("\r\n");
      out.write("            <div class=\"navbar-default sidebar\" role=\"navigation\">\r\n");
      out.write("                <div class=\"sidebar-nav navbar-collapse\">\r\n");
      out.write("                    <ul class=\"nav\" id=\"side-menu\">\r\n");
      out.write("                    <li>\r\n");
      out.write("                            <a href=\"NotificationsUtilisateur\"><i class=\"fa fa-bell fa-fw\"></i> Notifications</a>\r\n");
      out.write("                        </li>\r\n");
      out.write("                        <li>\r\n");
      out.write("                            <a href=\"TheseUtilisateur\"><i class=\"fa fa-book fa-fw\"></i> Théses</a>\r\n");
      out.write("                        </li>\r\n");
      out.write("                        <li>\r\n");
      out.write("                            <a href=\"JournalUtilisateur\"><i class=\"fa fa-file-text-o fa-fw\"></i> Publication dans une revue</a>\r\n");
      out.write("                        </li>\r\n");
      out.write("                        <li>\r\n");
      out.write("                            <a href=\"ConferenceUtilisateur\"><i class=\"fa fa-wechat fa-fw\"></i> Communication dans une conférence</a>\r\n");
      out.write("                        </li>\r\n");
      out.write("                        <li>\r\n");
      out.write("                            <a href=\"index.html\"><i class=\"fa fa-child fa-fw\"></i> Formation personnelle</a>\r\n");
      out.write("                        </li>\r\n");
      out.write("                        <li>\r\n");
      out.write("                            <a href=\"index.html\"><i class=\"fa fa-dollar fa-fw\"></i> Projet/Contrat financé</a>\r\n");
      out.write("                        </li>\r\n");
      out.write("                        <li>\r\n");
      out.write("                            <a href=\"index.html\"><i class=\"fa  fa-trophy fa-fw\"></i> Distinction/Prix</a>\r\n");
      out.write("                        </li>\r\n");
      out.write("                        <li>\r\n");
      out.write("                            <a href=\"ManifistationUtilisateur\"><i class=\"fa  fa-maxcdn fa-fw\"></i> Manifstations scientifiques</a>\r\n");
      out.write("                        </li>\r\n");
      out.write("                        <li>\r\n");
      out.write("                            <a href=\"index.html\"><i class=\"fa fa-paste  fa-fw\"></i> Partenariat non financé</a>\r\n");
      out.write("                        </li>\r\n");
      out.write("                        <li>\r\n");
      out.write("                            <a href=\"index.html\"><i class=\"fa fa-file-text   fa-fw\"></i> Ouvrage</a>\r\n");
      out.write("                        </li>\r\n");
      out.write("                        <li>\r\n");
      out.write("                            <a href=\"index.html\"><i class=\"fa fa-copyright  fa-fw\"></i> Brevet/Droit d'auteur</a>\r\n");
      out.write("                        </li>\r\n");
      out.write("                        <li>\r\n");
      out.write("                            <a href=\"index.html\"><i class=\"fa fa-edit fa-fw\"></i> Créativité littéraire</a>\r\n");
      out.write("                        </li>\r\n");
      out.write("                    </ul>   \r\n");
      out.write("                </div>\r\n");
      out.write("                <!-- /.sidebar-collapse -->\r\n");
      out.write("            </div>\r\n");
      out.write("            <!-- /.navbar-static-side -->\r\n");
      out.write("        </nav>");
    } catch (java.lang.Throwable t) {
      if (!(t instanceof javax.servlet.jsp.SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          try {
            if (response.isCommitted()) {
              out.flush();
            } else {
              out.clearBuffer();
            }
          } catch (java.io.IOException e) {}
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
