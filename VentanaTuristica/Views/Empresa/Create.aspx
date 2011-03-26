<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site2.Master" Inherits="System.Web.Mvc.ViewPage<VentanaTuristica.Model.Empresa>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Nueva Empresa
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

     <h2></h2>

     <% using (Html.BeginForm()) {%>
        <%= Html.ValidationSummary(true,"Ha ocurrido un error. Por favor corrijalos e intente de nuevo.") %>

        <fieldset>
            <legend>Nueva Empresa</legend>
           
            <div class="editor-label">
                <%: Html.LabelFor(model => model.Rif) %>
            </div>
            <div class="editor-field">
                <%: Html.TextBoxFor(model => model.Rif) %>
                <%: Html.ValidationMessageFor(model => model.Rif) %>
            </div>

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
                <%: Html.TextBoxFor(model => model.Direccion) %>
                <%: Html.ValidationMessageFor(model => model.Direccion) %>
            </div>

            <div class="editor-label">
                <%: Html.LabelFor(model => model.Ciudad) %>
            </div>
            <div class="editor-field">
                <%: Html.TextBoxFor(model => model.Ciudad)%>
                <%: Html.ValidationMessageFor(model => model.Ciudad)%>
            </div>

            <div class="editor-label">
                <%: Html.LabelFor(model => model.Localidad)%>
            </div>
            <div class="editor-field">
                <%: Html.TextBoxFor(model => model.Localidad)%>
                <%: Html.ValidationMessageFor(model => model.Localidad)%>
            </div>

            <div class="editor-label">
                <%: Html.LabelFor(model => model.Website)%>
            </div>
            <div class="editor-field">
                <%: Html.TextBoxFor(model => model.Website)%>
                <%: Html.ValidationMessageFor(model => model.Website)%>
            </div>

            <div class="editor-label">
                <%: Html.LabelFor(model => model.Mail)%>
            </div>
            <div class="editor-field">
                <%: Html.TextBoxFor(model => model.Mail)%>
                <%: Html.ValidationMessageFor(model => model.Mail)%>
            </div>

            <div class="editor-label">
                <%: Html.LabelFor(model => model.Telefonos[0].Numero)%>
            </div>
            <div class="editor-field">
                <%: Html.TextBoxFor(model => model.Telefonos[0].Numero)%>
                <%: Html.ValidationMessageFor(model => model.Telefonos[0].Numero)%>
            </div>

            <div class="editor-label">
                <input type="submit" class="ui-button ui-widget ui-state-default ui-corner-all ui-button-text-only ui-state-hover" value="Aceptar" />
            </div>

    <% } %>
    <br />
        <table>
            <td><a title="Empresas" href="<%=Url.Action("Index")%>">
                <img src="<%=Url.Content("~/Content/atras.png")%>" height="25px" width="25px" /></a></td>
            <td><%: Html.ActionLink("Empresas", "Index")%></td>
        </table>
    </fieldset>

</asp:Content>
