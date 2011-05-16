<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site3.Master" Inherits="System.Web.Mvc.ViewPage<VentanaTuristica.Model.Publicacion>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<table><tr><td align="left">

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
        <div id="publiTipo" class="descripcionContDere"><b>Tipo:</b> <%=Html.Encode(Model.Categorium.Nombre)%> - <%=Html.Encode(Model.SubCategorium.Nombre)%></div>
        <div id="publiCat" class="descripcionContDere">
            <b>Categoria:</b> <%if (Model.Idioma[0].Categoria.CompareTo("0")==0)
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

        <div id="publiUbi" class="descripcionContDere"> <b>Ubicacion:</b> <%=Html.Encode(Model.Ciudad)%>, <%=Html.Encode(Model.Estado)%> - <%=Html.Encode(Model.Pais)%></div>
        <div id="publiDir" class="descripcionContDere"><b>Dirección:</b> <%=Html.Encode(Model.Direccion)%></div>
        <%if (Html.Encode(Model.Empresa.Mail).CompareTo("") != 0)
          {%>
        <div id="publiMail" class="descripcionContDere"><b>Mail:</b> <%=Html.Encode(Model.Empresa.Mail)%></div>
        <%
          }%>
        <%if (Html.Encode(Model.Empresa.Website).CompareTo("") != 0)
          {%>
          <div id="publiWeb" class="descripcionContDere"><b>Website:</b> <a target="_blank"  href=" <%=Html.Encode(Model.Empresa.Website)%>"> <%=Html.Encode(Model.Empresa.Website)%></a></div>
        <%}%>
        <% if (Html.Encode(Model.Latitud).CompareTo("") != 0)
           {%>
        <div id="publiCoor" class="descripcionContDere"> 
            <b>Coordenadas:</b><br />
              Latitud - <%=Html.Encode(Model.Latitud)%> <br />
              Longitud - <%=Html.Encode(Model.Longitud)%>
        </div>
        <%
           }%>
        <div id="publiRes" class="descripcionContDere"><b>Por Reservacion:</b> <%=Html.Encode(Model.Reservacion)%>  </div>
        <div id="publiPre" class="descripcionContDere">
        <b>Precio:</b>
            <%foreach (var precio in Model.Precios)
            {%><br />
                <%if (precio.Tipo.CompareTo("TA") == 0)
                  {%>
                Temporada Alta: <%=precio.PrecioMin%> - <%=precio.PrecioMax%> <%=precio.Moneda%>
                <%
                    }
                  else
                    {%>
                    Temporada Baja: <%=precio.PrecioMin%> - <%=precio.PrecioMax%> <%=precio.Moneda%>
                    <%
                    }%>
            <%}%>   
        </div>
        <div id="publiMet" class="descripcionContDere2">
        <%if (Model.Tcredito != null)
          {%>

          <img src="<%=Url.Content("~/Content/credit_cards.png")%>" width="40px" height="40px" title="Tarjeta de Credito" alt="Tarjeta de Credito" />
        <%
          }%>
          <%if (Model.Tdebito != null)
          {%>

          <img src="<%=Url.Content("~/Content/maestro-icon.png")%>" width="40px" height="40px" title="Tarjeta de Debito" alt="Tarjeta de Debito" />
        <%
          }%>
          <%if (Model.Efectivo != null)
          {%>

          <img src="<%=Url.Content("~/Content/cash.png")%>" width="40px" height="40px" title="Efectivo" alt="Efectivo"/>
        <%
          }%>
          <%if (Model.Transferencia != null)
          {%>

          <img src="<%=Url.Content("~/Content/wire_transfer.png")%>" width="40px" height="40px"  title="Transferencia Electronica"  alt="Transferencia Electronica"/>
        <%
          }%>
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
<td class="contenidoDescripcionTabla" style=" background-image: url('../../Content/lineaDetails.jpg'); background-repeat: repeat-x repeat-y;">
&nbsp;<%=Model.Idioma[0].Descripcion%></td>
<td class="contenidoServiciosTabla" rowspan="3"  style=" background-image: url('../../Content/lineaDetails.jpg'); background-repeat: repeat-x repeat-y;">
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
<td class="contenidoNotasTabla"  style=" background-image: url('../../Content/lineaDetails.jpg'); background-repeat: repeat-x repeat-y;">
    <%= Model.Idioma[0].Notas %></td>
</tr>
</table>   

<style>
.bl3 {background-image: url('../../Content/lineaDetails.jpg'); background-repeat: repeat-x repeat-y; width:770px}
.br3 {height:370px; margin-top:5px; margin-bottom:5px}
.tl3 {}
.tr3 {padding:10px 10px 10px 20px; text-align:left}
.contenidoIzq{
	float:left;
	width:400px;
}
.contenidoDer{
	float:left;
	width:330px;
	font-size:12px;
	margin-left:10px;	
}
#publiNombre
{
     color:#D11221;
     font-size:20px;
     border-style: none none solid none; 
     font-weight: bold;
     font-family:Arial;
     border-width: 2px; 
     border-color: #C0C0C0;
}
.descripcionContDere
{
    color: black;
    font-family: Arial;
    border-style: none none solid none;
    border-width: 2px;
    border-color: #C0C0C0;
    font-size: 14px;
    font-style: italic;
}
.descripcionContDere2
{
    color: black;
    font-family: Arial;
    font-size: 14px;
    font-style: italic;
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
            frame_height: 35,
            pause_on_hover: true,
            panel_scale: 'nocrop'

        });
    });

</script>

</asp:Content>
