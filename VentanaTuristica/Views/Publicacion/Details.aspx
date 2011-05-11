<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site3.Master" Inherits="System.Web.Mvc.ViewPage<VentanaTuristica.Model.Publicacion>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<table><tr><td>

<div class="bl3"><div class="br3"><div class="tl3"><div class="tr3">
	<div class="contenidoIzq">
        <ul id="myGallery">
            <%
                foreach (var imagene in Model.Imagenes)
                {%>
             <li ><img src='<%=Url.Action("Show", "Publicacion", new {id = imagene.IdImagen})%>' width="400px" />
                 <div class="gv-panel-overlay">
                        <p><%=imagene.Descripcion%></p>
	                </div>
                </li>
             <%
                }%>
        </ul>
    </div>
    <div class="contenidoDer">
        <div id="publiNombre"> <%=Html.Encode(Model.Nombre)%></div>
        <div id="publiTipo"><b>Tipo:</b> <%=Html.Encode(Model.Categorium.Nombre)%> - <%=Html.Encode(Model.SubCategorium.Nombre)%></div>
        <div id="publiCat">
            <b>Categoria:</b> <%if (Model.Idioma[0].Categoria == "0")
                                    {%>
                <%=Model.Idioma[Model.Idioma.Count - 1].Categoria%>
                <%
                                    } %>
                <%else
                {%>
                    <%for (int i = 0; i < Convert.ToInt32(Model.Idioma[0].Categoria); i++)
                    {%>
                    &#9733;
                    <%} %>
                <%}%>
        </div>

        <div id="publiUbi"> <b>Ubicacion:</b> <%=Html.Encode(Model.Ciudad)%>, <%=Html.Encode(Model.Estado)%> - <%=Html.Encode(Model.Pais)%></div>
        <div id="publiDir"><b>Dirección:</b> <%=Html.Encode(Model.Direccion)%></div>
        <div id="publiMail"><b>Mail:</b> <%=Html.Encode(Model.Empresa.Mail)%></div>
        <div id="publiWeb"> <b>Website:</b> <%=Html.Encode(Model.Empresa.Website)%>  </div>
        <div id="publiCoor"> 
            <b>Coordenadas:</b><br />
              Latitud - <%=Html.Encode(Model.Latitud)%> /
              Longitud - <%=Html.Encode(Model.Longitud)%>
        </div>

        <div id="publiRes"><b>Por Reservacion:</b> <%=Html.Encode(Model.Reservacion)%>  </div>
        <div id="publiPre">
        <b>Precio:</b><br />
            <%foreach (var precio in Model.Precios)
            {%>
                <%=precio.Tipo %> : <%=precio.PrecioMin %> - <%=precio.PrecioMax %> <%=precio.Moneda %><br />
  
            <%}%>   
        </div>
    </div>
</div></div></div></div>

</td></tr></table>


<table style="border: 2px none #C0C0C0;width:750px;">
<tr>
<td class="tituloTabla2">Descripcion</td>
<td class="tituloTabla2">Servicios y Actividades</td>
</tr>
<tr>
<td class="contenidoDescripcionTabla">
&nbsp;<%=Model.Idioma[0].Descripcion%></td>
<td class="contenidoServiciosTabla" rowspan="3">
<%foreach (var servicio in Model.Servicios)
  {%>
  
  *<%=servicio.Nombre %><br />
<%
  }%>

</td>
</tr>
<tr>
<td class="tituloTabla2">Notas </td>
</tr>
<tr>
<td class="contenidoNotasTabla">
    <%= Model.Idioma[0].Notas %></td>
</tr>
</table>   

<style>
.bl3 {background: url(../../Content/bl2.jpg) 0 100% no-repeat #cdc9c9; width:770px}
.br3 {background: url(../../Content/br2.jpg) 100% 100% no-repeat; height:370px; margin-top:5px; margin-bottom:5px}
.tl3 {background: url(../../Content/tl2.jpg) 0 0 no-repeat}
.tr3 {background: url(../../Content/tr2.jpg) 100% 0 no-repeat; padding:10px; text-align:center}
.contenidoIzq{
	float:left;
	width:400px;
	}
.contenidoDer{
	float:left;
	width:350px;
	font-size:12px;	
	}

</style>




<script type="text/javascript">
    $(document).ready(function () {
        $('#myGallery').galleryView({
            show_captions: false,
            show_overlays: false,
            panel_width: 400,
            panel_height: 300,
            frame_width: 50,
            frame_height: 35

        });
    });

</script>

</asp:Content>
