<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site2.Master" Inherits="System.Web.Mvc.ViewPage<VentanaTuristica.Model.Categorium>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Editar Categoria
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2></h2>

    <% using (Html.BeginForm()) {%>
        <%: Html.ValidationSummary(true) %>
        
        <fieldset>
            <legend>Editar Categoria</legend>
            
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
            
            <div class="editor-label">
                <%: Html.LabelFor(model => model.Idioma) %>
            </div>
            <div class="editor-field">
                <%: Html.DisplayFor(model => model.Idioma) %>
                <%: Html.ValidationMessageFor(model => model.Idioma) %>
            </div>
            <input type="hidden" name="FkIdSubCategoria" value="<%: Model.FkIdCategoria %>" />
            <input type="hidden" name="IdCategoria" value="<%: Model.IdCategoria %>" />
            <input type="hidden" name="Idioma" value="<%: Model.Idioma %>" />
            <div>
                <input type="submit" class="ui-button ui-widget ui-state-default ui-corner-all ui-button-text-only ui-state-hover" value="Actualizar" />
            </div>

    <% } %>

    <br />
        <table>
            <td><a title="Categorias" href="<%=Url.Action("Index")%>">
                <img src="<%=Url.Content("~/Content/atras.png")%>" height="25px" width="25px" /></a></td>
            <td><%: Html.ActionLink("Categorias", "Index")%></td>
        </table>
    </fieldset>

</asp:Content>

