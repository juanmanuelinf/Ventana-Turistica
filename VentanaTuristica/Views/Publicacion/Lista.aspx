<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site2.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<VentanaTuristica.Model.Publicacion>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Index
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<h2></h2>
<style>
.tablaFondo{
	display: table;
	width: 1160px;
	height:990px;
	background-image:url('../../Content/prueba.png');
	background-repeat:no-repeat;
	background-position:left top;
	padding-left: 150px;
	padding-top:160px;
	position: absolute; top: 200px; left: 50px
}
.tabla{
	display: table;
	width: 1011px;
	
	
}
.cuadriculaAbajo{
	float: left;
	width: 225px;
	
}
.cuadriculaDerecha{
	float: left;
	width: 225px;
	height:210px;
	color:#DC7B1C;
	text-align:center;
	font-family: 'Book Antiqua';
	font-style: italic;
	font-weight: normal;
	font-size:14px;
	text-transform: uppercase;
	border-right: 1px dashed #CCC;
	border-bottom:  1px dashed #CCC;
	
}
.cuadriculaDerechaSuperior{
	float: left;
	width: 225px;
	height:210px;
	color:#DC7B1C;
	text-align:center;
	font-family: 'Book Antiqua';
	font-style: italic;
	font-weight: normal;
	font-size:14px;
	text-transform: uppercase;
	border-bottom:  1px dashed #CCC;
	
}
.cuadriculaDerechaInferior{
	float: left;
	width: 225px;
	height:210px;
	color:#DC7B1C;
	text-align:center;
	font-size:14px;
	font-family: 'Book Antiqua';
	font-style: italic;
	font-weight: normal;
	text-transform: uppercase;
}
.cuadriculaInferiorCentro{
	float: left;
	width: 225px;
	height:210px;
	color:#DC7B1C;
	border-right: 1px dashed #CCC;
	border-left: 1px dashed #CCC;
	font-family: 'Book Antiqua';
	font-size:14px;
	font-style: italic;
	font-weight: normal;
	text-transform: uppercase;
	text-align:center;
}
.cuadriculaInferiorCentroDerecha{
	float: left;
	width: 225px;
	height:210px;
	color:#DC7B1C;
	border-right: 1px dashed #CCC;
	font-family: 'Book Antiqua';
	font-size:14px;
	font-style: italic;
	font-weight: normal;
	text-transform: uppercase;
	text-align:center;
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
<div class="bl2"><div class="br2"><div class="tl2"><div class="tr2">

</div></div></div></div>
<div class="clear">&nbsp;</div>
    
<%if (Model != null)
  {%>
  <%var cuenta = Convert.ToInt32(ViewData["cuenta"]);%>
    <div class="tabla">
    <div class="cuadriculaAbajo">
        <div class="cuadriculaDerecha"><%
      int externo = 1;
      if (cuenta >= externo)
      {
          int valor = 0;%>
         <br />
         <b><%= Model.ElementAt(valor).Nombre%></b><br />
           <%if (Model.ElementAt(valor).Imagen != null)
            {%> 
            <img  height="150px" width="150px" src='<%=Url.Action("Show", "Publicacion", new {id = Model.ElementAt(valor).Imagen.IdImagen})%>' />
            <%}%>
       <%}%></div>
        <div class="cuadriculaDerecha"><%
      externo = 2;
      if (cuenta >= externo)
      {
          int valor = 1;%>
         <br />
         <b><%= Model.ElementAt(valor).Nombre%></b><br />
           <%if (Model.ElementAt(valor).Imagen != null)
            {%> 
            <img  height="150px" width="150px" src='<%=Url.Action("Show", "Publicacion", new {id = Model.ElementAt(valor).Imagen.IdImagen})%>' />
            <%}%>
       <%}%></div>
        <div class="cuadriculaDerechaInferior"><%
      externo = 3;
      if (cuenta >= externo)
      {
          int valor = 2;%>
         <br />
         <b><%= Model.ElementAt(valor).Nombre%></b><br />
           <%if (Model.ElementAt(valor).Imagen != null)
            {%> 
            <img  height="150px" width="150px" src='<%=Url.Action("Show", "Publicacion", new {id = Model.ElementAt(valor).Imagen.IdImagen})%>' />
            <%}%>
       <%}%></div>
    </div>
    <div class="cuadriculaAbajo">
        <div class="cuadriculaDerecha">
        <%
      externo = 4;
      if (cuenta >= externo)
      {
          int valor = 3;%>
         <br />
         <b><%= Model.ElementAt(valor).Nombre%></b><br />
           <%if (Model.ElementAt(valor).Imagen != null)
            {%> 
            <img  height="150px" width="150px" src='<%=Url.Action("Show", "Publicacion", new {id = Model.ElementAt(valor).Imagen.IdImagen})%>' />
            <%}%>
       <%}%></div>
        <div class="cuadriculaDerecha"><%
      externo = 5;
      if (cuenta >= externo)
      {
          int valor = 4;%>
         <br />
         <b><%= Model.ElementAt(valor).Nombre%></b><br />
           <%if (Model.ElementAt(valor).Imagen != null)
            {%> 
            <img  height="150px" width="150px" src='<%=Url.Action("Show", "Publicacion", new {id = Model.ElementAt(valor).Imagen.IdImagen})%>' />
            <%}%>
       <%}%></div>
        <div class="cuadriculaInferiorCentro">
        <%
      externo = 6;
      if (cuenta >= externo)
      {
          int valor = 5;%>
         <br />
         <b><%= Model.ElementAt(valor).Nombre%></b><br />
           <%if (Model.ElementAt(valor).Imagen != null)
            {%> 
            <img  height="150px" width="150px" src='<%=Url.Action("Show", "Publicacion", new {id = Model.ElementAt(valor).Imagen.IdImagen})%>' />
            <%}%>
       <%}%></div>
    </div>
    <div class="cuadriculaAbajo">
        <div class="cuadriculaDerecha"><%
      externo = 7;
      if (cuenta >= externo)
      {
          int valor = 6;%>
         <br />
         <b><%= Model.ElementAt(valor).Nombre%></b><br />
           <%if (Model.ElementAt(valor).Imagen != null)
            {%> 
            <img  height="150px" width="150px" src='<%=Url.Action("Show", "Publicacion", new {id = Model.ElementAt(valor).Imagen.IdImagen})%>' />
            <%}%>
       <%}%></div>
        <div class="cuadriculaDerecha"><%
      externo = 8;
      if (cuenta >= externo)
      {
          int valor = 7;%>
         <br />
         <b><%= Model.ElementAt(valor).Nombre%></b><br />
           <%if (Model.ElementAt(valor).Imagen != null)
            {%> 
            <img  height="150px" width="150px" src='<%=Url.Action("Show", "Publicacion", new {id = Model.ElementAt(valor).Imagen.IdImagen})%>' />
            <%}%>
       <%}%></div>
        <div class="cuadriculaInferiorCentroDerecha">
        <%
      externo = 9;
      if (cuenta >= externo)
      {
          int valor = 8;%>
         <br />
         <b><%= Model.ElementAt(valor).Nombre%></b><br />
           <%if (Model.ElementAt(valor).Imagen != null)
            {%> 
            <img  height="150px" width="150px" src='<%=Url.Action("Show", "Publicacion", new {id = Model.ElementAt(valor).Imagen.IdImagen})%>' />
            <%}%>
       <%}%></div>
    </div>
    <div class="cuadriculaAbajo">
        <div class="cuadriculaDerechaSuperior"><%
      externo = 10;
      if (cuenta >= externo)
      {
          int valor = 9;%>
         <br />
         <b><%= Model.ElementAt(valor).Nombre%></b><br />
           <%if (Model.ElementAt(valor).Imagen != null)
            {%> 
            <img  height="150px" width="150px" src='<%=Url.Action("Show", "Publicacion", new {id = Model.ElementAt(valor).Imagen.IdImagen})%>' />
            <%}%>
       <%}%></div>
        <div class="cuadriculaDerechaSuperior"><%
      externo = 11;
      if (cuenta >= externo)
      {
          int valor = 10;%>
         <br />
         <b><%= Model.ElementAt(valor).Nombre%></b><br />
           <%if (Model.ElementAt(valor).Imagen != null)
            {%> 
            <img  height="150px" width="150px" src='<%=Url.Action("Show", "Publicacion", new {id = Model.ElementAt(valor).Imagen.IdImagen})%>' />
            <%}%>
       <%}%></div>
        <div class="cuadriculaDerechaInferior"><%
      externo = 12;
      if (cuenta >= externo)
      {
          int valor = 11;%>
         <br />
         <b><%= Model.ElementAt(valor).Nombre%></b><br />
           <%if (Model.ElementAt(valor).Imagen != null)
            {%> 
            <img  height="150px" width="150px" src='<%=Url.Action("Show", "Publicacion", new {id = Model.ElementAt(valor).Imagen.IdImagen})%>' />
            <%}%>
       <%}%></div>
    </div>
</div>


<%}%> 
<div class="menuIzquierda">
<div class="bl"><div class="br"><div class="tl"><div class="tr">
Lorem ipsum dolor sit amet consectetur adipisicing elit
</div></div></div></div>
<div class="clear">&nbsp;</div>
</div>

<div class="bl2"><div class="br2"><div class="tl2"><div class="tr2">
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
                     <%=Html.ActionLink("...", "Lista", new {pagActual = i})%>
                     
                <%}else{%>
                     <%=Html.ActionLink(Convert.ToString(i), "Lista", new { pagActual = i }, new { disabled = "disabled" })%>
                <%}%>
           <%}%>
          <%=Html.Label(Convert.ToString(pagina)) %>  
        <%}
        else
        {
            for (int i = 1; i < pagina ; i++)
            {%>
                
                     <%=Html.ActionLink(Convert.ToString(i), "Lista", new {pagActual = i})%>
              
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
                     <%=Html.ActionLink("...", "Lista", new {pagActual = i})%>
                     
                <%}else{%>
                     <%=Html.ActionLink(Convert.ToString(i), "Lista", new { pagActual = i }, new { disabled = "disabled" })%>
                <%}%>
           <%}%>
          
        <%}
        else
        {
            for (int i = pagina+1; i < nro+1 ; i++)
            {%>
                
                     <%=Html.ActionLink(Convert.ToString(i), "Lista", new {pagActual = i})%>
              
           <%}%>
         
        <%}
        
    }
%>
   
   

</div></div></div></div>
<div class="clear">&nbsp;</div>
</asp:Content>