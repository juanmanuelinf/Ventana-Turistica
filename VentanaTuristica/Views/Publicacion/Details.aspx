﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site2.Master" Inherits="System.Web.Mvc.ViewPage<VentanaTuristica.Model.Publicacion>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">


<table  class="tablaPubli">
    <tr>
        <td rowspan="10">
        <ul id="myGallery">
        <%
            foreach (var imagene in Model.Imagenes)
            {%>
         <li ><img src='<%=Url.Action("Show", "Publicacion", new {id = imagene.IdImagen})%>' />
             <div class="gv-panel-overlay">
                    <p><%=imagene.Descripcion%></p>
	            </div>
            </li>
         <%
            }%>
         </ul>

        </td>
        <td valign=top  class="tituloTabla">
            <%=Html.Encode(Model.Nombre)%>
                             
        </td>
    </tr>
    <tr>
        <td valign=top class="contenidoTabla">
            <b>Tipo:</b> <%=Html.Encode(Model.Categorium.Nombre)%> - <%=Html.Encode(Model.SubCategorium.Nombre)%>
        </td>
    </tr>
    <tr>
        <td valign=top class="contenidoTabla">
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
                             
        </td>
    </tr>
    <tr>
        <td valign=top class="contenidoTabla">
            <b>Ubicacion:</b> <%=Html.Encode(Model.Ciudad)%>, <%=Html.Encode(Model.Estado)%> - <%=Html.Encode(Model.Pais)%>
                             
        </td>
    </tr>
    <tr>
        <td valign=top class="contenidoTabla">
            <b>Dirección:</b> <%=Html.Encode(Model.Direccion)%>
                             
        </td>
    </tr>
    <tr>
        <td valign=top class="contenidoTabla">
            <b>Mail:</b> <%=Html.Encode(Model.Empresa.Mail)%>
                             
        </td>
    </tr>
    <tr>
        <td valign=top class="contenidoTabla">
          <b>Website:</b> <%=Html.Encode(Model.Empresa.Website)%>  
                             
        </td>
    </tr>
    <tr>
        <td valign=top class="contenidoTabla">
          <b>Coordenadas:</b><br />
          Latitud - <%=Html.Encode(Model.Latitud)%> /
          Longitud - <%=Html.Encode(Model.Longitud)%>
                             
        </td>
    </tr>
    <tr>
        <td valign=top class="contenidoTabla">
         <b>Por Reservacion:</b> <%=Html.Encode(Model.Reservacion)%>  
                             
        </td>
    </tr>
    <tr>
        <td valign=top class="contenidoTablaUltimo">
            <b>Precio:</b><br />
             <%foreach (var precio in Model.Precios)
{%>
<%=precio.Tipo %> : <%=precio.PrecioMin %> - <%=precio.PrecioMax %> <%=precio.Moneda %><br />
  
<%}%> 
                             
        </td>
    </tr>
</table>

<table style="border: 2px none #C0C0C0;">
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
<div class="barraPubli"></div>        

   
    <p>
        <%=Html.ActionLink("Volver a la lista", "Index")%>
    </p>
<script type="text/javascript">
    $(document).ready(function () {
        $('#myGallery').galleryView({
            show_captions: false,
            show_overlays: false,
            panel_width: 500,
            panel_height: 300,
            frame_width: 50,
            frame_height: 35

        });
    });

</script>

</asp:Content>
