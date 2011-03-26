﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site2.Master" Inherits="System.Web.Mvc.ViewPage<VentanaTuristica.Model.SubCategorium>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Nueva SubCategoria
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2></h2>

    <% using (Html.BeginForm()) {%>
        <%: Html.ValidationSummary(true) %>

        <fieldset>
            <legend>Nueva SubCategoria</legend>
            
             
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
           
            <div>
                <input type="submit" value="Aceptar" />
            </div>

    <% } %>

    <br />
        <table>
            <td><a title="SubCategorias" href="<%=Url.Action("Index")%>">
                <img src="<%=Url.Content("~/Content/atras.png")%>" height="25px" width="25px" /></a></td>
            <td><%: Html.ActionLink("SubCategorias", "Index")%></td>
        </table>
    </fieldset>

</asp:Content>

