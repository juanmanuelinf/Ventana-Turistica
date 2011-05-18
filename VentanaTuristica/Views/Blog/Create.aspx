<%@ Page Title="" Language="C#" ValidateRequest="false" MasterPageFile="~/Views/Shared/Site4.Master" Inherits="System.Web.Mvc.ViewPage<VentanaTuristica.Model.Blog>"  %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Nueva entrada al blog
</asp:Content>

<asp:Content ID="Content2" ValidateRequest="false" ContentPlaceHolderID="MainContent" runat="server">
 <link rel="stylesheet" type="text/css" href="../../Content/jHtmlArea.css"/>
<script type="text/javascript" src="<%:Url.Content("~/Scripts/jquery-1.3.2.min.js") %>" ></script>
<script type="text/javascript" src="<%:Url.Content("~/Scripts/jHtmlArea-0.7.0.min.js") %>" ></script>
<script type="text/javascript" src="<%:Url.Content("~/Scripts/jHtmlArea.ColorPickerMenu-0.7.0.min.js") %>"></script>
    
 <script type="text/javascript">
     $(document).ready(function () {
         $("textarea").htmlarea();
     });
 </script>

 
    <form id="form1" ValidateRequest="false" runat="server">

        <fieldset>
            <legend>Nueva entrada al blog</legend>
            
            <div class="editor-label">
                <%: Html.LabelFor(model => model.Titulo) %>
            </div>
            <div class="editor-field">
                <%: Html.TextBoxFor(model => model.Titulo) %>
                <%: Html.ValidationMessageFor(model => model.Titulo) %>
            </div> 
          
            <div class="editor-label">
                <%: Html.LabelFor(model => model.Fecha) %>
            </div>
            <div class="editor-field">
                <%: Html.TextBoxFor(model => model.Fecha,new { @class = "text-box" }) %>
                <%: Html.ValidationMessageFor(model => model.Fecha) %>
            </div>
            
            <div class="editor-label">
                <%: Html.LabelFor(model => model.Descripcion) %>
            </div>
            <div class="editor-field" ValidateRequest="false">
                <%: Html.TextAreaFor(model => model.Descripcion, new { @style = "width:700px; height:300px" })%>
            </div>
            
            <div>
                <input type="submit" ValidateRequest="false" class="ui-button ui-widget ui-state-default ui-corner-all ui-button-text-only ui-state-hover" value="Aceptar" />
            </div>

   
    <br />
        <table>
            <td><a title="Entradas del blog" href="<%=Url.Action("Index")%>">
                <img src="<%=Url.Content("~/Content/atras.png")%>" height="25px" width="25px" /></a></td>
            <td><%: Html.ActionLink("Entradas del Blog", "Index")%></td>
        </table>
    </fieldset>
    
    </form>

</asp:Content>