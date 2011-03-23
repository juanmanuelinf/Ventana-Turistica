<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site2.Master" Inherits="System.Web.Mvc.ViewPage<VentanaTuristica.Model.Patrocinante>" %>
<%@ Import Namespace="VentanaTuristica.Model" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Create
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

     <% using (Html.BeginForm()) {%>
        <%= Html.ValidationSummary(true,"Ha ocurrido un error. Por favor corrijalos e intente de nuevo.") %>

        <fieldset>
            <legend>Registro de Patrocinante:</legend>
           

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
                <%: Html.TextBoxFor(model => model.Descripcion) %>
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
                <%: Html.LabelFor(model => model.Contacto[0].Telefono[0].CodigoInt)%>
            </div>
            <div class="editor-field">
                <%: Html.TextBoxFor(model => model.Contacto[0].Telefono[0].CodigoInt)%>
                <%: Html.ValidationMessageFor(model => model.Contacto[0].Telefono[0].CodigoInt)%>
            </div>

            <div class="editor-label">
                <%: Html.LabelFor(model => model.Contacto[0].Telefono[0].CodigoLoc)%>
            </div>
            <div class="editor-field">
                <%: Html.TextBoxFor(model => model.Contacto[0].Telefono[0].CodigoLoc)%>
                <%: Html.ValidationMessageFor(model => model.Contacto[0].Telefono[0].CodigoLoc)%>
            </div>

            <div class="editor-label">
                <%: Html.LabelFor(model => model.Contacto[0].Telefono[0].Numero)%>
            </div>
            <div class="editor-field">
                <%: Html.TextBoxFor(model => model.Contacto[0].Telefono[0].Numero)%>
                <%: Html.ValidationMessageFor(model => model.Contacto[0].Telefono[0].Numero)%>
            </div>
        </fieldset>
            <div class="editor-label">
                <input type="submit" class="ui-button ui-widget ui-state-default ui-corner-all ui-button-text-only ui-state-hover" value="Registrar" />
            </div>
        </fieldset>

    <% } %>

    <div>
       
    </div>

</asp:Content>
