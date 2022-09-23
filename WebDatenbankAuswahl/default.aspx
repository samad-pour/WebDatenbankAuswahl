<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <title>WebDatenbankAuswahl</title>

    <%@ Page Language="C#" %>

    <%@ Import Namespace="System.Data.OleDb" %>
    <script runat="server">
    private void Page_Load()
    {
        OleDbConnection con = new OleDbConnection();
        OleDbCommand cmd = new OleDbCommand();
        OleDbDataReader reader;
    
        con.ConnectionString =
            "Provider=Microsoft.ACE.OLEDB.12.0;" +
            "Data Source=C:\\Users\\samad.pour\\source\\repos\\DB\\firma.accdb";
        cmd.Connection = con;
        cmd.CommandText = "SELECT * FROM personen";
    
        try
        {
            con.Open();
            reader = cmd.ExecuteReader();
            grid.DataSource = reader;
            DataBind();
            reader.Close();
        }
        catch(Exception ex)
        {
            ausgabe.Font.Bold = true;
            ausgabe.Text = ex.Message;
        }
    
        con.Close();
    }
    </script>
</head>
<body>
    <p>Datenbank-Tabelle</p>
    <asp:DataGrid ID="grid" runat="server" />
    <p>
        <asp:Label ID="ausgabe" runat="server" /></p>
</body>
</html>
