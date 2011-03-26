<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site2.Master" Inherits="System.Web.Mvc.ViewPage<VentanaTuristica.Model.Patrocinante>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Nuevo Patrocinante
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2></h2>
    
    <% using (Html.BeginForm()) {%>
        <%= Html.ValidationSummary(true,"Ha ocurrido un error. Por favor corrijalos e intente de nuevo.") %>

        <fieldset>
            <legend>Nuevo Patrocinante</legend>
           
            <div class="editor-label">
                <%: Html.LabelFor(model => model.Nombre) %>
            </div>
            <div class="editor-field">
                <%: Html.TextBoxFor(model => model.Nombre) %>
                <%: Html.ValidationMessageFor(model => model.Nombre) %>
            </div>

            <div class="editor-label">
                <%: Html.LabelFor(model => model.Descripcion) %>
            </div>
            <div class="editor-field">
                <%: Html.TextAreaFor(model => model.Descripcion) %>
                <%: Html.ValidationMessageFor(model => model.Descripcion) %>
            </div>
            
        <fieldset>
            <legend>Persona de Contacto:</legend>
            <div class="editor-label">
                <%: Html.LabelFor(model => model.Contacto[0].Nombre) %>
            </div>
            <div class="editor-field">
                <%: Html.TextBoxFor(model => model.Contacto[0].Nombre)%>
                <%: Html.ValidationMessageFor(model => model.Contacto[0].Nombre)%>
            </div>

            <div class="editor-label">
                <%: Html.Label("Numero de Telefono")%>
            </div>
            <div class="editor-field">
                <%: Html.TextBoxFor(model => model.Contacto[0].Telefono[0].CodigoInt, new { @style = "width:30px;" })%>
                <%: Html.TextBoxFor(model => model.Contacto[0].Telefono[0].CodigoLoc, new { @style = "width:30px;" })%>
                <%: Html.TextBoxFor(model => model.Contacto[0].Telefono[0].Numero, new { @style = "width:100px;" })%>
                <%: Html.ValidationMessageFor(model => model.Contacto[0].Telefono[0].CodigoInt)%>
                <%: Html.ValidationMessageFor(model => model.Contacto[0].Telefono[0].CodigoLoc)%>
                <%: Html.ValidationMessageFor(model => model.Contacto[0].Telefono[0].Numero)%>
            </div>
  
        </fieldset>
            <div class="editor-label">
                <input type="submit" class="ui-button ui-widget ui-state-default ui-corner-all ui-button-text-only ui-state-hover" value="Aceptar" />
            </div>

    <% } %>
    <br />
        <table>
            <td><a title="Patrocinante" href="<%=Url.Action("Index")%>">
                <img src="<%=Url.Content("~/Content/atras.png")%>" height="25px" width="25px" /></a></td>
            <td><%: Html.ActionLink("Patrocinante", "Index")%></td>
        </table>
    </fieldset>
    
</asp:Content>
