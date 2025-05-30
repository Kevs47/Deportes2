<%@ Page Title="Página principal" Language="C#" AutoEventWireup="true"
    CodeBehind="Default.aspx.cs" Inherits="Deportes2._Default" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <title>Página principal - Deportes</title>
    <style>
        /* Paleta: #52357B, #5459AC, #648DB3, #B2D8CE */
        body {
            font-family: Arial, sans-serif;
            background-color: #B2D8CE;
            margin: 0;
            padding: 0;
        }

        .top-bar {
            background-color: #5459AC;
            padding: 10px 20px;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .top-bar h2 {
            color: #fff;
            margin: 0;
        }

        .top-bar img {
            height: 40px;
        }

        .header-banner {
            width: 100%;
            height: 200px;
            object-fit: cover;
            display: block;
        }

        .side-image {
            position: fixed;
            top: 50%;
            transform: translateY(-50%);
            width: 80px;
            opacity: 0.8;
        }

        .side-left {
            left: 0;
        }

        .side-right {
            right: 0;
        }

        .container {
            max-width: 900px;
            margin: 40px auto;
            background: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 2px 8px rgba(0,0,0,0.1);
        }

        h1 {
            text-align: center;
            color: #52357B;
        }

        fieldset {
            border: 2px solid #648DB3;
            border-radius: 8px;
            padding: 16px;
            margin-bottom: 20px;
            background: #F9FCFB;
        }

        legend {
            font-weight: bold;
            color: #5459AC;
            padding: 0 8px;
        }

        label {
            display: inline-block;
            width: 100px;
            margin-top: 8px;
            color: #52357B;
        }

        input[type="text"], input[type="date"] {
            width: calc(100% - 120px);
            padding: 8px;
            margin-top: 8px;
            border: 1px solid #648DB3;
            border-radius: 4px;
        }

        .btn {
            display: inline-block;
            padding: 8px 16px;
            margin-top: 12px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 14px;
        }

        .btn-primary {
            background-color: #52357B;
            color: #fff;
        }

        .btn-warning {
            background-color: #5459AC;
            color: #fff;
        }

        .btn-danger {
            background-color: #648DB3;
            color: #fff;
        }

        .btn + .btn {
            margin-left: 8px;
        }

        .gridview {
            width: 100%;
            border-collapse: collapse;
        }

        .gridview th {
            background-color: #52357B;
            color: #fff;
            padding: 10px;
            text-align: left;
        }

        .gridview td {
            padding: 8px;
            border-bottom: 1px solid #ccc;
            color: #333;
        }

        .gridview tr:nth-child(even) {
            background-color: #F0F7F9;
        }

        .gridview tr:hover {
            background-color: #B2D8CE;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <!-- Encabezado, banner e imágenes laterales iguales -->
        <div class="top-bar">
            <h2>Deportes en Acción</h2>
            <img src="images/logo.png" alt="Logo" />
        </div>
        <img src="images/Deportes.jpg" alt="Banner" class="header-banner" />
        <img src="images/izquierdo.jpg" alt="Izquierda" class="side-image side-left"
             height="400" style="width:auto; margin-left:10px;" />
        <img src="images/derecha.jpg" alt="Derecha" class="side-image side-right"
             height="400" style="width:auto; margin-right:10px;" />

        <div class="container">
            <h1>Registro de Eventos Deportivos</h1>
            <fieldset>
                <!-- Formulario de inserción -->
                <asp:Label runat="server" AssociatedControlID="txtDeporte" Text="Deporte:" CssClass="label" /><br />
                <asp:TextBox ID="txtDeporte" runat="server" /><br />
                <asp:Label runat="server" AssociatedControlID="txtEquipoA" Text="Equipo A:" CssClass="label" /><br />
                <asp:TextBox ID="txtEquipoA" runat="server" /><br />
                <asp:Label runat="server" AssociatedControlID="txtEquipoB" Text="Equipo B:" CssClass="label" /><br />
                <asp:TextBox ID="txtEquipoB" runat="server" /><br />
                <asp:Label runat="server" AssociatedControlID="txtResultados" Text="Resultados:" CssClass="label" /><br />
                <asp:TextBox ID="txtResultados" runat="server" /><br />
                <asp:Label runat="server" AssociatedControlID="txtEstadisticas" Text="Estadísticas:" CssClass="label" /><br />
                <asp:TextBox ID="txtEstadisticas" runat="server" /><br />
                <asp:Label runat="server" AssociatedControlID="txtFecha" Text="Fecha:" CssClass="label" /><br />
                <asp:TextBox ID="txtFecha" runat="server" TextMode="Date" /><br />
                <asp:Label runat="server" AssociatedControlID="txtHora" Text="Hora:" CssClass="label" /><br />
                <asp:TextBox ID="txtHora" runat="server" /><br />
                <asp:Button ID="btnInsertar" runat="server" Text="Agregar Partido"
                            CssClass="btn btn-primary" OnClick="btnInsertar_Click" />
            </fieldset>

            <!-- GridView con TemplateField para botones personalizados -->
            <asp:GridView ID="GridView1" runat="server"
    AutoGenerateColumns="False"
    DataKeyNames="Id"
    DataSourceID="AccessDataSource1"
    CssClass="gridview"
    OnRowEditing="GridView1_RowEditing"
    OnRowUpdating="GridView1_RowUpdating"
    OnRowCancelingEdit="GridView1_RowCancelingEdit">
    <Columns>

        <asp:BoundField DataField="Id" HeaderText="Id" ReadOnly="True" />

        <asp:TemplateField HeaderText="Deporte">
            <ItemTemplate>
                <%# Eval("deporte") %>
            </ItemTemplate>
            <EditItemTemplate>
                <asp:TextBox ID="txtDeporteEdit" runat="server"
                    Text='<%# Bind("deporte") %>'
                    Width="74px" />
            </EditItemTemplate>
        </asp:TemplateField>

        <asp:TemplateField HeaderText="Equipo A">
            <ItemTemplate>
                <%# Eval("Equipo_A") %>
            </ItemTemplate>
            <EditItemTemplate>
                <asp:TextBox ID="txtEquipoAEdit" runat="server"
                    Text='<%# Bind("Equipo_A") %>'
                    Width="74px" />
            </EditItemTemplate>
        </asp:TemplateField>

        <asp:TemplateField HeaderText="Equipo B">
            <ItemTemplate>
                <%# Eval("Equipo_B") %>
            </ItemTemplate>
            <EditItemTemplate>
                <asp:TextBox ID="txtEquipoBEdit" runat="server"
                    Text='<%# Bind("Equipo_B") %>'
                    Width="74px" />
            </EditItemTemplate>
        </asp:TemplateField>

        <asp:TemplateField HeaderText="Resultados">
            <ItemTemplate>
                <%# Eval("resultados") %>
            </ItemTemplate>
            <EditItemTemplate>
                <asp:TextBox ID="txtResultadosEdit" runat="server"
                    Text='<%# Bind("resultados") %>'
                    Width="74px" />
            </EditItemTemplate>
        </asp:TemplateField>

        <asp:TemplateField HeaderText="Estadísticas">
            <ItemTemplate>
                <%# Eval("estadisticas") %>
            </ItemTemplate>
            <EditItemTemplate>
                <asp:TextBox ID="txtEstadisticasEdit" runat="server"
                    Text='<%# Bind("estadisticas") %>'
                    Width="74px" />
            </EditItemTemplate>
        </asp:TemplateField>

        <asp:TemplateField HeaderText="Fecha">
            <ItemTemplate>
                <%# Eval("Fecha", "{0:yyyy-MM-dd}") %>
            </ItemTemplate>
            <EditItemTemplate>
                <asp:TextBox ID="txtFechaEdit" runat="server"
                    Text='<%# Bind("Fecha", "{0:yyyy-MM-dd}") %>'
                    Width="74px" TextMode="Date" />
            </EditItemTemplate>
        </asp:TemplateField>

        <asp:TemplateField HeaderText="Hora">
            <ItemTemplate>
                <%# Eval("Hora") %>
            </ItemTemplate>
            <EditItemTemplate>
                <asp:TextBox ID="txtHoraEdit" runat="server"
                    Text='<%# Bind("Hora") %>'
                    Width="74px" />
            </EditItemTemplate>
        </asp:TemplateField>

        <asp:TemplateField>
            <ItemTemplate>
                <asp:Button ID="btnEdit" runat="server" CommandName="Edit"
                    Text="Modificar" CssClass="btn btn-warning" />
                <asp:Button ID="btnDelete" runat="server" CommandName="Delete"
                    Text="Eliminar" CssClass="btn btn-danger"
                    OnClientClick="return confirm('¿Seguro que deseas eliminar?');" />
            </ItemTemplate>
            <EditItemTemplate>
                <asp:Button ID="btnUpdate" runat="server" CommandName="Update"
                    Text="Actualizar" CssClass="btn btn-primary" />
                <asp:Button ID="btnCancel" runat="server" CommandName="Cancel"
                    Text="Cancelar" CssClass="btn btn-warning" />
            </EditItemTemplate>
        </asp:TemplateField>

    </Columns>
</asp:GridView>


            <asp:AccessDataSource ID="AccessDataSource1" runat="server"
                DataFile="Access/Deportes2.mdb"
                SelectCommand="SELECT Id, deporte, [Equipo A] AS Equipo_A, [Equipo B] AS Equipo_B, resultados, estadisticas, Fecha, Hora FROM Registros"
                InsertCommand="INSERT INTO Registros (deporte, [Equipo A], [Equipo B], resultados, estadisticas, Fecha, Hora) VALUES (?, ?, ?, ?, ?, ?, ?)"
                UpdateCommand="UPDATE Registros SET deporte = ?, [Equipo A] = ?, [Equipo B] = ?, resultados = ?, estadisticas = ?, Fecha = ?, Hora = ? WHERE Id = ?"
                DeleteCommand="DELETE FROM Registros WHERE Id = ?">
                <InsertParameters>
                    <asp:Parameter Name="deporte" Type="String" />
                    <asp:Parameter Name="Equipo A" Type="String" />
                    <asp:Parameter Name="Equipo B" Type="String" />
                    <asp:Parameter Name="resultados" Type="String" />
                    <asp:Parameter Name="estadisticas" Type="String" />
                    <asp:Parameter Name="Fecha" Type="DateTime" />
                    <asp:Parameter Name="Hora" Type="String" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="deporte" Type="String" />
                    <asp:Parameter Name="Equipo A" Type="String" />
                    <asp:Parameter Name="Equipo B" Type="String" />
                    <asp:Parameter Name="resultados" Type="String" />
                    <asp:Parameter Name="estadisticas" Type="String" />
                    <asp:Parameter Name="Fecha" Type="DateTime" />
                    <asp:Parameter Name="Hora" Type="String" />
                    <asp:Parameter Name="Id" Type="Int32" />
                </UpdateParameters>
                <DeleteParameters>
                    <asp:Parameter Name="Id" Type="Int32" />
                </DeleteParameters>
            </asp:AccessDataSource>
        </div>
    </form>
</body>
</html>