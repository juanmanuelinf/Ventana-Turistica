<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site4.Master" Inherits="System.Web.Mvc.ViewPage<VentanaTuristica.Model.Lugar>" %>

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
                <%: Html.LabelFor(model => model.Tipo) %>
            </div>
            <div class="editor-field">
                <%: Html.TextBoxFor(model => model.Tipo) %>
                <%: Html.ValidationMessageFor(model => model.Tipo) %>
            </div>
            
            <div class="editor-label">
                <%: Html.LabelFor(model => model.FkLugar) %>
            </div>
            <div class="editor-field">
                <%: Html.TextBoxFor(model => model.FkLugar) %>
                <%: Html.ValidationMessageFor(model => model.FkLugar) %>
            </div>
            
            <p>
                <input type="submit" value="Save" />
            </p>
        </fieldset>

    <% } %>

    <div>
        <%: Html.ActionLink("Atras", "Index") %>
    </div>

</asp:Content>

