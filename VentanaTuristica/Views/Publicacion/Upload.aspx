<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site2.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Upload
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Upload</h2>

<form action="" method="post" enctype="multipart/form-data">
<input type="file" name="files" id="file1"/>
<input type="file" name="files" id="file2" />
<input type="file" name="files" id="file3"/>
<div class="editor-label">
    <input type="submit" value="Cargar" />
</div>
            
</form>

</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="HeaderContent" runat="server">
</asp:Content>
