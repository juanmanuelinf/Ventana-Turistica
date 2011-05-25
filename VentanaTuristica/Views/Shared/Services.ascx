<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>
<%@ Import Namespace="Resources" %>


<div>
    
     
       <form action="http://www.ventanaturistica.com/Home/Busqueda" id="cse-search-box">
  <div>
    <input type="hidden" name="cx" value="017947157383025472513:mwooje1unnw" />
    <input type="hidden" name="cof" value="FORID:9" />
    <input type="hidden" name="ie" value="UTF-8" />
    <input onblur="if(this.value=='') this.value='  ';" value="<%=ResourceEmpresa.ButtonSearch%>" onfocus="if(this.value=='<%=ResourceEmpresa.ButtonSearch%>') this.value='';" name="q" type="text" />
    <input id="btnsearch" alt="search" name="sa" class="mainFormSubmit" type="submit" />
  </div>
</form>
  
</div> 
<br />
<div>
    <a title="Facebook" target="_blank" href="http://www.facebook.com/pages/Ventana-Turisticacom/113756445350700">
        <img src="<%=Url.Content("~/Content/facebook.png")%>" width="25px" /></a>
    <a title="Twitter" target="_blank" href="#">
        <img src="<%=Url.Content("~/Content/twitter.gif")%>" width="25px" /></a>
    <a title="Fotos en Panoramio" target="_blank" href="http://www.panoramio.com/">
        <img src="<%=Url.Content("~/Content/panoramio.png")%>" width="25px" /></a>
    <a title="<%=ResourceEmpresa.English%>" href="<%=Url.Action("Ingles", "Home")%>">
        <img src="<%=Url.Content("~/Content/english.png")%>" width="24px" /></a>  
    <a title="<%=ResourceEmpresa.Spanish%>"  href="<%=Url.Action("Espanol", "Home")%>">
        <img src="<%=Url.Content("~/Content/spanish.png")%>" width="24px" /></a>
</div>

<script type="text/javascript">

    (function () {
        var f = document.getElementById('cse-search-box');
        if (!f) {
            f = document.getElementById('searchbox_demo');
        }
        if (f && f.q) {
            var q = f.q;
            var n = navigator;
            var l = location;
            var su = function () {
                var u = document.createElement('input');
                var v = document.location.toString();
                var existingSiteurl = /(?:[?&]siteurl=)([^&#]*)/.exec(v);
                if (existingSiteurl) {
                    v = decodeURI(existingSiteurl[1]);
                }
                var delimIndex = v.indexOf('://');
                if (delimIndex >= 0) {
                    v = v.substring(delimIndex + '://'.length, v.length);
                }
                u.name = 'siteurl';
                u.value = v;
                u.type = 'hidden';
                f.appendChild(u);
            };
            if (n.appName == 'Microsoft Internet Explorer') {
                var s = f.parentNode.childNodes;
                for (var i = 0; i < s.length; i++) {
                    if (s[i].nodeName == 'SCRIPT' &&
            s[i].attributes['src'] &&
            s[i].attributes['src'].nodeValue == unescape('http:\x2F\x2Fwww.google.com\x2Fcse\x2Fbrand?form=cse-search-box\x26lang=es')) {
                        su();
                        break;
                    }
                }
            } else {
                su();
            }


            if (n.platform == 'Win32') {
                q.style.cssText = 'color: #999; font-family: Arial, Helvetica, sans-serif; 	font-size: 10px; border: none; padding: 8px 10px 7px; line-height: 1.3em; width: 154px; background: url(../../Content/header-search-field.gif) no-repeat 0 0; vertical-align: middle; margin-right: -5px;';
            }


            if (window.history.navigationMode) {
                window.history.navigationMode = 'compatible';
            }

            var b = function () {
                if (q.value == '') {
                    q.value = <%=ResourceEmpresa.ButtonSearch%>;
                }
            };

            var f = function () {
                q.value = '';
            };

            q.onfocus = f;
            q.onblur = b;


            if (!/[&?]q=[^&]/.test(l.search)) {
                b();
            }
        }
    })();
</script>