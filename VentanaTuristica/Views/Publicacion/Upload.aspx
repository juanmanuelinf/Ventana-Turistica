<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site4.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Upload
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Fotos</h2>

<form action="" method="post" enctype="multipart/form-data">
<label>Imagen 1</label><br />
<input type="file" style=" width:500px" name="files" id="file1"/>
<label>Imagen 2</label><br />
<input type="file" style=" width:500px" name="files" id="file2" />
<label>Imagen 3</label><br />
<input type="file" style=" width:500px" name="files" id="file3"/>
<label>Imagen 4</label><br />
<input type="file" style=" width:500px" name="files" id="file4"/>
<label>Imagen 5</label><br />
<input type="file" style=" width:500px" name="files" id="file5" />
<label>Imagen 6</label><br />
<input type="file" style=" width:500px" name="files" id="file6"/>
<label>Imagen 7</label><br />
<input type="file" style=" width:500px" name="files" id="file7"/>
<label>Imagen 8</label><br />
<input type="file" style=" width:500px" name="files" id="file8" />
<label>Imagen 9</label><br />
<input type="file" style=" width:500px" name="files" id="file9"/>
<label>Imagen 10</label><br />
<input type="file" style=" width:500px" name="files" id="file10"/>
<label>Imagen 11</label><br />
<input type="file" style=" width:500px" name="files" id="file11" />
<label>Imagen 12</label><br />
<input type="file" style=" width:500px" name="files" id="file12"/>
<label>Imagen 13</label><br />
<input type="file" style=" width:500px" name="files" id="file13"/>
<label>Imagen 14</label><br />
<input type="file" style=" width:500px" name="files" id="file14" />
<label>Imagen 15</label><br />
<input type="file" style=" width:500px" name="files" id="file15"/>
<div class="editor-label">
    <input type="submit" value="Cargar" />
</div>
            
</form>

</asp:Content>