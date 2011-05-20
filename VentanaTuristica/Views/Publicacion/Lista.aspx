<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<VentanaTuristica.Model.Publicacion>>" %>
<%@ Import Namespace="Resources" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	VentanaTuristica.com
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<style>
.tablaFondo{
	display: table;
	width: 1160px;
	height:900px;
	padding-left: 150px;
	padding-top:160px;
	position: absolute; top: 200px;
}
.tabla{
	display: table;
	width: 1011px;
}
.cuadriculaAbajo{
	float: left;
	width: 225px;
	
}
.cuadriculaDerecha
{
    padding-top:10px;
    padding-left:37px;
	float: left;
	width: 225px;
	height:250px;
	color:Black;
	font-family:Century Gothic;
	font-weight: normal;
	font-size:13px;
	background: url(../../Content/fondoPubli.png);
	background-repeat: no-repeat; 
	background-position: center center;
	
}
.menuIzquierda{
	position:absolute;
    top:150px;
    left:5px;
    width:100px;
    height:1000px;
}
.bl2 {background: url(../../Content/bl2.jpg) 0 100% no-repeat #F6C739; width:900px}
.br2 {background: url(../../Content/br2.jpg) 100% 100% no-repeat; height:35px}
.tl2 {background: url(../../Content/tl2.jpg) 0 0 no-repeat}
.tr2 {background: url(../../Content/tr2.jpg) 100% 0 no-repeat; padding:10px; text-align:center}

.bl {background: url(../../Content/bl.jpg) 0 100% no-repeat #F6C739; width:180px}
.br {background: url(../../Content/br.jpg) 100% 100% no-repeat; height:700px}
.tl {background: url(../../Content/tl.jpg) 0 0 no-repeat}
.tr {background: url(../../Content/tr.jpg) 100% 0 no-repeat; padding:10px; text-align:center}
.clear {font-size: 1px; height: 1px}

</style>
<script src="http://www.microcosmotalk.com/tech/scripts/library/country.js"></script> 

<div style=" text-align:center; margin-left:auto; margin-right:auto;">

    <%=Html.ActionLink(ResourceEmpresa.LowPrice, "Lista", new { pagActual = Convert.ToInt32(ViewData["pagActual"]), orden = 0, lug = Request["lug"], cat = Request["cat"], sub = Request["sub"] })%>
    <%=Html.ActionLink(ResourceEmpresa.HighPrice, "Lista", new { pagActual = Convert.ToInt32(ViewData["pagActual"]), orden = 1, lug = Request["lug"], cat = Request["cat"], sub = Request["sub"] })%>

</div>
 


<%if (Model.Count() != 0)
  {%>
  <%var cuenta = Convert.ToInt32(ViewData["cuenta"]);%>

    <div class="tabla">
    <div class="cuadriculaAbajo">
       <%
      int externo = 1;
      if (cuenta >= externo)
      {
          int valor = 0;%> <div class="cuadriculaDerecha">
         <br />
        
        <a href="/Publicacion/Details/<%: Model.ElementAt(valor).IdPublicacion %>" class="floatbox" data-fb-options="width:802px height:80% colorTheme:black">   
   
            <%if (Model.ElementAt(valor).Imagen != null)
            {%>
            <img  height="150px" width="188px"  src='<%=Url.Action("Show", "Publicacion", new {id = Model.ElementAt(valor).Imagen.IdImagen})%>'/></a><br />
            <b style=" text-align:left"><%= Model.ElementAt(valor).Nombre%></b><br />
            <b style=" font-size:11px;text-align:left;"><%= Model.ElementAt(valor).Estado%> - <%= Model.ElementAt(valor).Ciudad%></b><br />
            <b style="font-size:12px; text-align:right;"><%= Model.ElementAt(valor).Precios[0].Moneda%> <%= Model.ElementAt(valor).Precios[0].PrecioMin%> - <%= Model.ElementAt(valor).Precios[1].PrecioMax%></b><br />
            <%}%>   
        </div>
       <%}%>
        <%
      externo = 5;
      if (cuenta >= externo)
      {
          int valor = 4;%><div class="cuadriculaDerecha">
         <br />
         <a href="/Publicacion/Details/<%: Model.ElementAt(valor).IdPublicacion %>" class="floatbox" data-fb-options="width:802px height:80% colorTheme:black">   
   
            <%if (Model.ElementAt(valor).Imagen != null)
            {%>
            <img  height="150px" width="188px"  src='<%=Url.Action("Show", "Publicacion", new {id = Model.ElementAt(valor).Imagen.IdImagen})%>'/></a><br />
            <b style=" text-align:left"><%= Model.ElementAt(valor).Nombre%></b><br />
            <b style=" font-size:11px;text-align:left;"><%= Model.ElementAt(valor).Estado%> - <%= Model.ElementAt(valor).Ciudad%></b><br />
            <b style="font-size:12px; text-align:right;"><%= Model.ElementAt(valor).Precios[0].Moneda%> <%= Model.ElementAt(valor).Precios[0].PrecioMin%> - <%= Model.ElementAt(valor).Precios[1].PrecioMax%></b><br />
            <%}%>   
        </div>
       <%}%>
        
    </div>
    <div class="cuadriculaAbajo">
   <%
      externo = 2;
      if (cuenta >= externo)
      {
          int valor = 1;%> <div class="cuadriculaDerecha">
         <br />
         <a href="/Publicacion/Details/<%: Model.ElementAt(valor).IdPublicacion %>" class="floatbox" data-fb-options="width:802px height:80% colorTheme:black">   
   
            <%if (Model.ElementAt(valor).Imagen != null)
            {%>
             <img  height="150px" width="188px"  src='<%=Url.Action("Show", "Publicacion", new {id = Model.ElementAt(valor).Imagen.IdImagen})%>'/></a><br />
            <b style=" text-align:left"><%= Model.ElementAt(valor).Nombre%></b><br />
            <b style=" font-size:11px;text-align:left;"><%= Model.ElementAt(valor).Estado%> - <%= Model.ElementAt(valor).Ciudad%></b><br />
            <b style="font-size:12px; text-align:right;"><%= Model.ElementAt(valor).Precios[0].Moneda%> <%= Model.ElementAt(valor).Precios[0].PrecioMin%> - <%= Model.ElementAt(valor).Precios[1].PrecioMax%></b><br />
           <%}%>   
        </div>
       <%}%>
       
        <%
      externo = 6;
      if (cuenta >= externo)
      {
          int valor = 5;%> <div class="cuadriculaDerecha">
         <br />
         <a href="/Publicacion/Details/<%: Model.ElementAt(valor).IdPublicacion %>" class="floatbox" data-fb-options="width:802px height:80% colorTheme:black">   
   
            <%if (Model.ElementAt(valor).Imagen != null)
            {%>
            <img  height="150px" width="188px"  src='<%=Url.Action("Show", "Publicacion", new {id = Model.ElementAt(valor).Imagen.IdImagen})%>'/></a><br />
            <b style=" text-align:left"><%= Model.ElementAt(valor).Nombre%></b><br />
            <b style=" font-size:11px;text-align:left;"><%= Model.ElementAt(valor).Estado%> - <%= Model.ElementAt(valor).Ciudad%></b><br />
            <b style="font-size:12px; text-align:right;"><%= Model.ElementAt(valor).Precios[0].Moneda%> <%= Model.ElementAt(valor).Precios[0].PrecioMin%> - <%= Model.ElementAt(valor).Precios[1].PrecioMax%></b><br />
            <%}%>   
        </div>
       <%}%>
    </div>
    <div class="cuadriculaAbajo">
        <%
      externo = 3;
      if (cuenta >= externo)
      {
          int valor = 2;%><div class="cuadriculaDerecha">
         <br />
         <a href="/Publicacion/Details/<%: Model.ElementAt(valor).IdPublicacion %>" class="floatbox" data-fb-options="width:802px height:80% colorTheme:black">   
   
            <%if (Model.ElementAt(valor).Imagen != null)
            {%>
            <img  height="150px" width="188px"  src='<%=Url.Action("Show", "Publicacion", new {id = Model.ElementAt(valor).Imagen.IdImagen})%>'/></a><br />
            <b style=" text-align:left"><%= Model.ElementAt(valor).Nombre%></b><br />
            <b style=" font-size:11px;text-align:left;"><%= Model.ElementAt(valor).Estado%> - <%= Model.ElementAt(valor).Ciudad%></b><br />
            <b style="font-size:12px; text-align:right;"><%= Model.ElementAt(valor).Precios[0].Moneda%> <%= Model.ElementAt(valor).Precios[0].PrecioMin%> - <%= Model.ElementAt(valor).Precios[1].PrecioMax%></b><br />
            <%}%>   
        </div>
       <%}%>
        
        <%
      externo = 7;
      if (cuenta >= externo)
      {
          int valor = 6;%><div class="cuadriculaDerecha">
         <br />
         <a href="/Publicacion/Details/<%: Model.ElementAt(valor).IdPublicacion %>" class="floatbox" data-fb-options="width:802px height:80% colorTheme:black">   
   
            <%if (Model.ElementAt(valor).Imagen != null)
            {%>
            <img  height="150px" width="188px"  src='<%=Url.Action("Show", "Publicacion", new {id = Model.ElementAt(valor).Imagen.IdImagen})%>'/></a><br />
            <b style=" text-align:left"><%= Model.ElementAt(valor).Nombre%></b><br />
            <b style=" font-size:11px;text-align:left;"><%= Model.ElementAt(valor).Estado%> - <%= Model.ElementAt(valor).Ciudad%></b><br />
            <b style="font-size:12px; text-align:right;"><%= Model.ElementAt(valor).Precios[0].Moneda%> <%= Model.ElementAt(valor).Precios[0].PrecioMin%> - <%= Model.ElementAt(valor).Precios[1].PrecioMax%></b><br />
            <%}%>   
        </div>
       <%}%>
        
        
    </div>
    <div class="cuadriculaAbajo">
        <%
      externo = 4;
      if (cuenta >= externo)
      {
          int valor = 3;%><div class="cuadriculaDerecha">
         <br />
         <a href="/Publicacion/Details/<%: Model.ElementAt(valor).IdPublicacion %>" class="floatbox" data-fb-options="width:802px height:80% colorTheme:black">   
   
            <%if (Model.ElementAt(valor).Imagen != null)
            {%>
           <img  height="150px" width="188px"  src='<%=Url.Action("Show", "Publicacion", new {id = Model.ElementAt(valor).Imagen.IdImagen})%>'/></a><br />
            <b style=" text-align:left"><%= Model.ElementAt(valor).Nombre%></b><br />
            <b style=" font-size:11px;text-align:left;"><%= Model.ElementAt(valor).Estado%> - <%= Model.ElementAt(valor).Ciudad%></b><br />
            <b style="font-size:12px; text-align:right;"><%= Model.ElementAt(valor).Precios[0].Moneda%> <%= Model.ElementAt(valor).Precios[0].PrecioMin%> - <%= Model.ElementAt(valor).Precios[1].PrecioMax%></b><br />
             <%}%>   
        </div>
       <%}%>
        <%
      externo = 8;
      if (cuenta >= externo)
      {
          int valor = 7;%><div class="cuadriculaDerecha">
         <br />
         <a href="/Publicacion/Details/<%: Model.ElementAt(valor).IdPublicacion %>" class="floatbox" data-fb-options="width:802px height:80% colorTheme:black">   
   
            <%if (Model.ElementAt(valor).Imagen != null)
            {%>
            <img  height="150px" width="188px"  src='<%=Url.Action("Show", "Publicacion", new {id = Model.ElementAt(valor).Imagen.IdImagen})%>'/></a><br />
            <b style=" text-align:left"><%= Model.ElementAt(valor).Nombre%></b><br />
            <b style=" font-size:11px;text-align:left;"><%= Model.ElementAt(valor).Estado%> - <%= Model.ElementAt(valor).Ciudad%></b><br />
            <b style="font-size:12px; text-align:right;"><%= Model.ElementAt(valor).Precios[0].Moneda%> <%= Model.ElementAt(valor).Precios[0].PrecioMin%> - <%= Model.ElementAt(valor).Precios[1].PrecioMax%></b><br />
            <%}%>   
        </div>
       <%}%>
    </div>
</div>



<div style=" font-size:16px ; color:Black; margin-left:auto; margin-right:auto; text-align:center">
<%
  int nro = Convert.ToInt32(ViewData["nroPaginas"]);
  int pagina = Convert.ToInt32(ViewData["pagActual"]);
    
    if(pagina-1 >0)
    {
        if(pagina-1>3)
        {
            for (int i = pagina-4; i < pagina ; i++)
            {
                %>
                <%if (i == pagina - 4)
                {%>
                     <%=Html.ActionLink("...", "Lista", new { pagActual = i, orden = 2 })%>
                     
                <%}else{%>
                     <%=Html.ActionLink(Convert.ToString(i), "Lista", new { pagActual = i, orden = 2 }, new { disabled = "disabled" })%>
                <%}%>
           <%}%>
          <%=Html.Label(Convert.ToString(pagina)) %>  
        <%}
        else
        {
            for (int i = 1; i < pagina ; i++)
            {%>
                
                     <%=Html.ActionLink(Convert.ToString(i), "Lista", new { pagActual = i, orden = 2 })%>
              
           <%}%>
           <%=Html.Label(Convert.ToString(pagina)) %>
        <%}
        
    }else
    {%>
     <%=Html.Label(Convert.ToString(pagina)) %>
    <%}
    if(pagina+1 <=nro )
    {
        if(pagina+4<=nro)
        {
            for (int i = pagina+1; i < pagina+5 ; i++)
            {
                %>
                <%if (i == pagina + 4)
                {%>
                     <%=Html.ActionLink("...", "Lista", new { pagActual = i, orden = 2 })%>
                     
                <%}else{%>
                     <%=Html.ActionLink(Convert.ToString(i), "Lista", new { pagActual = i, orden = 2 }, new { disabled = "disabled" })%>
                <%}%>
           <%}%>
          
        <%}
        else
        {
            for (int i = pagina+1; i < nro+1 ; i++)
            {%>
                
                     <%=Html.ActionLink(Convert.ToString(i), "Lista", new { pagActual = i, orden = 2 })%>
              
           <%}%>
         
        <%}
        
    }
%>
</div>

<%}else
  {%>
       <h2>No hay resultados para esta busqueda...</h2>
  <%}%> 

</asp:Content>