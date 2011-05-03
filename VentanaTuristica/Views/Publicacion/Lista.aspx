<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<VentanaTuristica.Model.Publicacion>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Index
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

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


    /* use a semi-transparent image for the overlay */
	#overlay {
		background-image:url(../../Content/transparent.png);
		color:#efefef;
		height:830px;
	}
	
	/* container for external content. uses vertical scrollbar, if needed */
	div.contentWrap {
		height:821px;
		overflow-y:auto;
	}
	/* the overlayed element */
    .apple_overlay {
	
	    /* initially overlay is hidden */
	    display:none;
	
	    /* 
		    width after the growing animation finishes
		    height is automatically calculated
	    */
	    width:910px;		
	
	    /* some padding to layout nested elements nicely  */
	    padding:45px;
    }

    /* default close button positioned on upper right corner */
    .apple_overlay .close {
	    background-image:url(../../Content/close.png);
	    position:absolute; right:20px; top:15px;
	    cursor:pointer;
	    height:35px;
	    width:35px;
    }
</style>

<script src="http://cdn.jquerytools.org/1.2.5/full/jquery.tools.min.js"></script> 
<script src="http://www.microcosmotalk.com/tech/scripts/library/country.js"></script> 

<br />
<!-- <div class="bl2"><div class="br2"><div class="tl2"><div class="tr2">
 <%=Html.ActionLink("Menor Precio", "Lista", new {pagActual =  Convert.ToInt32(ViewData["pagActual"]), orden = 0})%>
 <%=Html.ActionLink("Mayor Precio", "Lista", new {pagActual =  Convert.ToInt32(ViewData["pagActual"]), orden = 1})%>
<div class="clear">&nbsp;</div> -->
<br />
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
        
        <a href="/Publicacion/Details/<%: Model.ElementAt(valor).IdPublicacion %>" rel="#overlay" style="text-decoration:none">
            <b><%= Model.ElementAt(valor).Nombre%></b><br />
           <%if (Model.ElementAt(valor).Imagen != null)
            {%> 
            <img  height="150px" width="150px" src='<%=Url.Action("Show", "Publicacion", new {id = Model.ElementAt(valor).Imagen.IdImagen})%>' />
            <br /><b><%=Model.ElementAt(valor).Precios[0].Moneda%>
            <%=Model.ElementAt(valor).Precios[0].PrecioMin%> -
            <%=Model.ElementAt(valor).Precios[0].PrecioMax%></b>
            <%}%>        
        </a>

        <!-- overlayed element -->
        <div class="apple_overlay" id="overlay"><a class="close"></a>

	        <!-- the external content is loaded inside this tag -->
	        <div class="contentWrap"></div>

        </div>
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
            <br /><b><%=Model.ElementAt(valor).Precios[0].Moneda%>
            <%=Model.ElementAt(valor).Precios[0].PrecioMin%> -
            <%=Model.ElementAt(valor).Precios[0].PrecioMax%></b>
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
            <br /><b><%=Model.ElementAt(valor).Precios[0].Moneda%>
            <%=Model.ElementAt(valor).Precios[0].PrecioMin%> -
            <%=Model.ElementAt(valor).Precios[0].PrecioMax%></b>
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
            <br /><b><%=Model.ElementAt(valor).Precios[0].Moneda%>
            <%=Model.ElementAt(valor).Precios[0].PrecioMin%> -
            <%=Model.ElementAt(valor).Precios[0].PrecioMax%></b>
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
            <br /><b><%=Model.ElementAt(valor).Precios[0].Moneda%>
            <%=Model.ElementAt(valor).Precios[0].PrecioMin%> -
            <%=Model.ElementAt(valor).Precios[0].PrecioMax%></b>
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
            <br /><b><%=Model.ElementAt(valor).Precios[0].Moneda%>
            <%=Model.ElementAt(valor).Precios[0].PrecioMin%> -
            <%=Model.ElementAt(valor).Precios[0].PrecioMax%></b>
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
            <br /><b><%=Model.ElementAt(valor).Precios[0].Moneda%>
            <%=Model.ElementAt(valor).Precios[0].PrecioMin%> -
            <%=Model.ElementAt(valor).Precios[0].PrecioMax%></b>
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
            <br /><b><%=Model.ElementAt(valor).Precios[0].Moneda%>
            <%=Model.ElementAt(valor).Precios[0].PrecioMin%> -
            <%=Model.ElementAt(valor).Precios[0].PrecioMax%></b>
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
            <br /><b><%=Model.ElementAt(valor).Precios[0].Moneda%>
            <%=Model.ElementAt(valor).Precios[0].PrecioMin%> -
            <%=Model.ElementAt(valor).Precios[0].PrecioMax%></b>
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
            <br /><b><%=Model.ElementAt(valor).Precios[0].Moneda%>
            <%=Model.ElementAt(valor).Precios[0].PrecioMin%> -
            <%=Model.ElementAt(valor).Precios[0].PrecioMax%></b>
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
            <br /><b><%=Model.ElementAt(valor).Precios[0].Moneda%>
            <%=Model.ElementAt(valor).Precios[0].PrecioMin%> -
            <%=Model.ElementAt(valor).Precios[0].PrecioMax%></b>
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
            <br /><b><%=Model.ElementAt(valor).Precios[0].Moneda%>
            <%=Model.ElementAt(valor).Precios[0].PrecioMin%> -
            <%=Model.ElementAt(valor).Precios[0].PrecioMax%></b>
            <%}%>
       <%}%></div>
    </div>
</div>


<%}%> 
<div class="menuIzquierda">
<div class="bl"><div class="br"><div class="tl"><div class="tr">
<form name="form1" action=""> 
<table style="width:590px;"><tbody><tr> 
<td style="width:100px;">Country</td> 
<td><select name="cboCountry" style="width:auto;clear:none;" onchange="Fill_States();"> 
<option selected="selected">12345678901234567890</option> 
<option>temp</option></select></td> 
</tr><tr> 
 
<td class="td100">State<br />Province</td> 
<td title="Enable javascript to fill the lists."><select name="cboState" style="width:auto;" onchange="Update_Globals();"> 
<option selected="selected">12345678901234567890</option> 
<option>temp</option></select></td></tr></tbody></table><br /> 
 
 


</form> 
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
   
   

</div></div></div></div>
<div class="clear">&nbsp;</div>
<!-- make all links with the 'rel' attribute open overlays -->
    <script>

        $(function () {

            // if the function argument is given to overlay,
            // it is assumed to be the onBeforeLoad event listener
            $("a[rel]").overlay({

                mask: 'darkgray',
                effect: 'apple',

                onBeforeLoad: function () {

                    // grab wrapper element inside content
                    var wrap = this.getOverlay().find(".contentWrap");

                    // load the page specified in the trigger
                    wrap.load(this.getTrigger().attr("href"));
                }

            });
        });
    </script>
</asp:Content>