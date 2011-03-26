<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site2.Master" Inherits="System.Web.Mvc.ViewPage<VentanaTuristica.Model.Categorium>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Nueva Categoria
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2></h2>

    <% using (Html.BeginForm()) {%>
        <%: Html.ValidationSummary(true) %>

        <fieldset>
            <legend>Nueva Categoria</legend>

             <div class="editor-label">
                <%: Html.LabelFor(model => model.Nombre) %>
            </div>
             <div class="editor-field">
                <%: Html.TextBox("Categorium.Nombre")%>
                <%: Html.ValidationMessage("Categorium.Nombre")%>
            </div>
            <div class="editor-label">
                <%: Html.LabelFor(model => model.Descripcion) %>
            </div>
            <div class="editor-field">
                <%: Html.TextArea("Categorium.Descripcion")%>
                <%: Html.ValidationMessage("Categorium.Descripcion")%>
            </div>
            
            <div class="editor-label">
                <%: Html.LabelFor(model => model.Idioma) %>
            </div>
            <div class="editor-field">
                <%= Html.DropDownList("Categorium.Idioma")%>
                <%: Html.ValidationMessageFor(model => model.Idioma) %>
            </div>
            
            <div>
                <input type="submit" value="Aceptar" />
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