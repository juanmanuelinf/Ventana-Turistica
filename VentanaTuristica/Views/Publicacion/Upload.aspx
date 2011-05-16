<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site4.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Upload
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Fotos</h2>

<form action="" method="post" enctype="multipart/form-data">
<input type="file" name="files" id="file1"/>
<input type="file" name="files" id="file2" />
<input type="file" name="files" id="file3"/>
<input type="file" name="files" id="file4"/>
<input type="file" name="files" id="file5" />
<input type="file" name="files" id="file6"/>
<input type="file" name="files" id="file7"/>
<input type="file" name="files" id="file8" />
<input type="file" name="files" id="file9"/>
<input type="file" name="files" id="file10"/>
<input type="file" name="files" id="file11" />
<input type="file" name="files" id="file12"/>
<input type="file" name="files" id="file13"/>
<input type="file" name="files" id="file14" />
<input type="file" name="files" id="file15"/>
<div class="editor-label">
    <input type="submit" value="Cargar" />
</div>
            
</form>

</asp:Content>


