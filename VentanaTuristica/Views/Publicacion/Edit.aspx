<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site4.Master" Inherits="System.Web.Mvc.ViewPage<VentanaTuristica.Model.Publicacion>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Edit
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Edit</h2>

    <% using (Html.BeginForm()) {%>
        <%: Html.ValidationSummary(true) %>
        
        <fieldset>
            <legend>Fields</legend>
             <div class="editor-label">
                <%: Html.LabelFor(model => model.Nombre) %>
            </div>
            <div class="editor-field">
                <%: Html.TextBoxFor(model => model.Nombre) %>
                <%: Html.ValidationMessageFor(model => model.Nombre) %>
            </div>
             
            <div class="editor-label">
                <%: Html.LabelFor(model => model.Direccion) %>
            </div>
            <div class="editor-field">
                <%: Html.TextAreaFor(model => model.Direccion) %>
                <%: Html.ValidationMessageFor(model => model.Direccion) %>
            </div>

            <div class="editor-label">
                <%: Html.LabelFor(model => model.Idioma[0].Descripcion) %>
            </div>
            <div class="editor-field">
                <%: Html.TextAreaFor(model => model.Idioma[0].Descripcion)%>
            </div>

            <div class="editor-label">
                <%: Html.LabelFor(model => model.Idioma[0].Notas) %>
            </div>
            <div class="editor-field">
                <%: Html.TextAreaFor(model => model.Idioma[0].Notas)%>
            </div>

            <div class="editor-label">
                <%: Html.LabelFor(model => model.Idioma[0].ProcesosEcologicos) %>
            </div>
            <div class="editor-field">
                <%: Html.TextAreaFor(model => model.Idioma[0].ProcesosEcologicos)%>
            </div>

            <div class="editor-label">
                Precio Min
            </div>
            <div class="editor-field">
               <%: Html.Label(Model.Precios[0].Moneda)%> <%: Html.TextBoxFor(model => model.Precios[0].PrecioMin)%>
            </div>
            <div class="editor-label">
                Precio Max
            </div>
            <div class="editor-field">
               <%: Html.Label(Model.Precios[0].Moneda)%> <%: Html.TextBoxFor(model => model.Precios[0].PrecioMax)%>
            </div>
           
              <%: Html.TextBoxFor(model => model.Precios[1].PrecioMin, new { type = "hidden" })%>
            
             <%: Html.TextBoxFor(model => model.Precios[1].PrecioMax, new { type = "hidden" })%>
           

            <div class="editor-label">
               Servicios
            </div>
             <div class="editor-field">
            <%
    int cont = 0;
    var idSer = (IList<String>) ViewData["Servicios-Es-id"];
    int cont2=0;
    bool flag=false;
           foreach (var ser in (IList<String>)ViewData["Servicios-Es"])
           {
               
               foreach (var servicio in Model.Servicios)
               {
                    if(ser.CompareTo(servicio.Nombre)==0)
                    {
                        flag = true;
                        %>
                        <label  id="Servicios[<%=cont%>].Nombre"><%=servicio.Nombre %></label>
                        <input  type="checkbox" id= "Servicios[<%=cont%>].IdServicio"name="Servicios[<%=cont%>].IdServicio" value="<%= servicio.IdServicio%>" checked="checked"/>
                        <input  type="hidden"  name="Servicios[<%=cont%>].Nombre" value="<%=servicio.Nombre %>" />
                        <input  type="hidden"  name="Servicios[<%=cont%>].FkIdServicio" value="<%=servicio.IdServicio%>" />
                        <%
                        cont++;
                    }
               } 
               if(!flag)
               {
                   %>
                    <label  id="Servicios[<%=cont%>].Nombre"><%=ser %></label>
                    <input  type="checkbox" id= "Servicios[<%=cont%>].IdServicio"name="Servicios[<%=cont%>].IdServicio" value="<%=idSer[cont2]%>" />
                    <input  type="hidden"  name="Servicios[<%=cont%>].Nombre" value="<%=ser %>" />
                    <input  type="hidden"  name="Servicios[<%=cont%>].FkIdServicio" value="<%=idSer[cont2]%>" />
                   <%
                   cont++;
               }
               cont2++;
                flag = false;
            } %>
           </div>

           
            
            <div class="editor-label">
                <%: Html.LabelFor(model => model.Latitud) %>
            </div>
            <div class="editor-field">
                <%: Html.TextBoxFor(model => model.Latitud) %>
                <%: Html.ValidationMessageFor(model => model.Latitud) %>
            </div>
            
            <div class="editor-label">
                <%: Html.LabelFor(model => model.Longitud) %>
            </div>
            <div class="editor-field">
                <%: Html.TextBoxFor(model => model.Longitud) %>
                <%: Html.ValidationMessageFor(model => model.Longitud) %>
            </div>
            
             
                   
                  
             <div class="editor-label">
                <%: Html.LabelFor(model => model.Efectivo) %>
            
                <input  type="checkbox" id= "Efectivo"name="Efectivo" value="S" <%if(Model.Efectivo!=null){%> checked="checked"<%}%> />
            
                <%: Html.LabelFor(model => model.Reservacion) %>
            
                <input  type="checkbox" id= "Reservacion"name="Reservacion" value="S" <%if(Model.Reservacion!=null){%> checked="checked"<%}%> />
            
                <%: Html.LabelFor(model => model.Tcredito) %>
          
                <input  type="checkbox" id= "Tcredito"name="Tcredito" value="S" <%if(Model.Tcredito!=null){%> checked="checked"<%}%> />
           
                <%: Html.LabelFor(model => model.Tdebito) %>
           
                <input  type="checkbox" id= "Tdebito"name="Tdebito" value="S" <%if(Model.Tdebito!=null){%> checked="checked"<%}%> />
                <%: Html.LabelFor(model => model.Transferencia) %>
           
                <input  type="checkbox" id= "Transferencia"name="Tranferencia" value="S" <%if(Model.Transferencia!=null){%> checked="checked"<%}%> />
            </div>
            
            <%: Html.TextBoxFor(model => model.Ciudad, new { type = "hidden" })%>
            <%: Html.TextBoxFor(model => model.Idioma[0].Categoria, new { type = "hidden" })%>
            <%: Html.TextBoxFor(model => model.Idioma[0].IdIdioma, new { type = "hidden" })%>
            <%: Html.TextBoxFor(model => model.Idioma[0].IdPublicacion, new { type = "hidden" })%>
            <%: Html.TextBoxFor(model => model.Precios[0].IdPublicacion, new { type = "hidden" })%>
            <%: Html.TextBoxFor(model => model.Precios[0].Moneda, new { type = "hidden" })%>
            <%: Html.TextBoxFor(model => model.Precios[1].Moneda, new { type = "hidden" })%>
            <%: Html.TextBoxFor(model => model.Precios[0].IdPrecio, new { type = "hidden" })%>
            <%: Html.TextBoxFor(model => model.Precios[1].IdPrecio, new { type = "hidden" })%>
            <%: Html.TextBoxFor(model => model.Precios[1].IdPublicacion, new { type = "hidden" })%>
            <%: Html.TextBoxFor(model => model.Precios[0].Tipo, new { type = "hidden" })%>
            <%: Html.TextBoxFor(model => model.Precios[1].Tipo, new { type = "hidden" })%>
            <%: Html.TextBoxFor(model => model.IdEmpresa,new { type="hidden" }) %>
            <%: Html.TextBoxFor(model => model.IdPublicacion, new { type = "hidden" })%>
            <%: Html.TextBoxFor(model => model.IdSubCategoria, new { type = "hidden" })%>
            <%: Html.TextBoxFor(model => model.Estado, new { type = "hidden" })%>
            <%: Html.TextBoxFor(model => model.Pais, new { type = "hidden" })%>

       
            
            <p>
                <input type="submit" class="ui-button ui-widget ui-state-default ui-corner-all ui-button-text-only ui-state-hover" value="Guardar y Editar Imagenes"  />
            </p>
        </fieldset>

    <% } %>

    <div>
        <%: Html.ActionLink("Volver", "Index") %>
    </div>

</asp:Content>



