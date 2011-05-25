<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site4.Master" Inherits="System.Web.Mvc.ViewPage<VentanaTuristica.Model.Imagene>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Nuevo Imagen
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
        <fieldset>
        <legend>Nueva imagen</legend>
    <form action="../../Publicacion/UploadForEdit" method="post" enctype="multipart/form-data">
        <input type="file" name="files" id="file1"/>
        <input type="file" name="files" id="file2" />
        <input type="file" name="files" id="file3"/>
        <input type="file" name="files" id="file4"/>
        <input type="file" name="files" id="file5" />
    <div class="editor-label">
        <input type="submit" value="Cargar" />
    </div>
    <br />
        <table>
            <td>
                <%: Html.ActionLink("Volver", "Index","Publicacion")%>
            </td>
        </table>
    </fieldset>
    
</asp:Content>
