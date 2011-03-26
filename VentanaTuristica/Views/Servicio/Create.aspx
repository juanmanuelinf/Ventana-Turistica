<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site2.Master" Inherits="System.Web.Mvc.ViewPage<VentanaTuristica.Model.Servicio>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Nuevo Servicio
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2></h2>

    <% using (Html.BeginForm()) {%>
        <%: Html.ValidationSummary(true) %>

        <fieldset>
            <legend>Nuevo Servicio</legend>
            
            <div class="editor-label">
                <%: Html.LabelFor(model => model.Nombre) %>
            </div>
            <div class="editor-field">
                <%: Html.TextBox("Servicio.Nombre")%>
                <%: Html.ValidationMessage("Servicio.Nombre")%>
            </div>
            
            <div class="editor-label">
                <%: Html.LabelFor(model => model.Descripcion) %>
            </div>
            <div class="editor-field">
                <%: Html.TextArea("Servicio.Descripcion") %>
                <%: Html.ValidationMessage("Servicio.Descripcion")%>
            </div>
            
            <div class="editor-label">
                <%: Html.LabelFor(model => model.Idioma) %>
            </div>
            <div class="editor-field">
                <%= Html.DropDownList("Servicio.Idioma")%>
                <%: Html.ValidationMessageFor(model => model.Idioma) %>
            </div>

            <div class="editor-label">
                <input type="submit" class="ui-button ui-widget ui-state-default ui-corner-all ui-button-text-only ui-state-hover" value="Aceptar" />
            </div>

    <% } %>

    <br />
        <table>
            <td><a title="Servicio" href="<%=Url.Action("Index")%>">
                <img src="<%=Url.Content("~/Content/atras.png")%>" height="25px" width="25px" /></a></td>
            <td><%: Html.ActionLink("Servicio", "Index")%></td>
        </table>
    </fieldset>
    

</asp:Content>

