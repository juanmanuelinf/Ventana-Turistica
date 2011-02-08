<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<VentanaTuristica.Model.SubCategorium>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Crear SubCategoria
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Crear Nueva SubCategoria</h2>

    <% using (Html.BeginForm()) {%>
        <%: Html.ValidationSummary(true) %>

        <fieldset>
            <legend>Datos</legend>
            
             
            <div class="editor-label">
                <%: Html.Label("SubCategorium.Nombre")%>
            </div>
            <div class="editor-field">
                <%: Html.TextBox("SubCategorium.Nombre")%>
                <%: Html.ValidationMessage("SubCategorium.Nombre","*") %>
            </div>
            
            <div class="editor-label">
                <%: Html.Label("SubCategorium.Descripcion")%>
            </div>
            <div class="editor-field">
                <%: Html.TextBox("SubCategorium.Descripcion")%>
                <%: Html.ValidationMessage("SubCategorium.Descripcion","*")%>
            </div>

             <div class="editor-label">
                <label> Categoria asociada:</label>
            </div>
            
            <div class="editor-field">
                <%= Html.DropDownList("SubCategorium.Categorium.Nombre")%>
                <%= Html.ValidationMessage("SubCategorium.Categorium.Nombre", "*")%>
            </div>
            
            <div class="editor-label">
                <label> Idioma </label>
            </div>
            <div class="editor-field">
                <%= Html.DropDownList("SubCategorium.Idioma")%>
                <%: Html.ValidationMessage("SubCategorium.Idioma", "*")%>
            </div>
           
            <p>
                <input type="submit" value="Crear" />
            </p>
        </fieldset>

    <% } %>

    <div>
        <%: Html.ActionLink("Regresar", "Index") %>
    </div>

</asp:Content>

