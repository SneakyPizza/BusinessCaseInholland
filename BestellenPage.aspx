<%@ Page Title="" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeFile="BestellenPage.aspx.cs" Inherits="BestellenPage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentAsp" runat="Server">
    <asp:Label ID="_PageTitle" runat="server" Text="Bestellen pagina" Font-Bold="True" Font-Overline="False" Font-Size="X-Large" Font-Strikeout="False" ForeColor="#57504C"></asp:Label>
    <br />
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="BestellenOrderregel" AllowSorting="True">
        <Columns>
            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
            <asp:BoundField DataField="Orderregelnr" HeaderText="Nr" InsertVisible="False" SortExpression="Orderregelnr" />
            <asp:BoundField DataField="Naam" HeaderText="Naam" SortExpression="Naam" />
            <asp:BoundField DataField="Omschrijving" HeaderText="Omschrijving" SortExpression="Omschrijving" />
            <asp:BoundField DataField="Inkoopprijs" HeaderText="Inkoopprijs" SortExpression="Inkoopprijs" />
            <asp:BoundField DataField="BTW Tarief" HeaderText="BTW Tarief" SortExpression="BTW Tarief" />
            <asp:BoundField DataField="Aantal" HeaderText="Aantal" SortExpression="Aantal" />
            <asp:BoundField DataField="Orderregel.InkoopOrderNr" HeaderText="Orderregel.InkoopOrderNr" SortExpression="Orderregel.InkoopOrderNr" Visible="False" />
            <asp:BoundField DataField="InkoopOrder.InkoopOrderNr" HeaderText="InkoopOrder.InkoopOrderNr" InsertVisible="False" SortExpression="InkoopOrder.InkoopOrderNr" Visible="False" />
            <asp:BoundField DataField="Totaal Inkoopprijs" HeaderText="Totaal Inkoopprijs" SortExpression="Totaal Inkoopprijs" Visible="False" />
            <asp:BoundField DataField="OrderDatum" HeaderText="OrderDatum" SortExpression="OrderDatum" Visible="False" />
            <asp:BoundField DataField="Pakbon" HeaderText="Pakbon" SortExpression="Pakbon" Visible="False" />
            <asp:BoundField DataField="LeverancierNr" HeaderText="LeverancierNr" SortExpression="LeverancierNr" />
        </Columns>
        <EditRowStyle BorderStyle="None" BorderWidth="0px" />
        <EmptyDataRowStyle BorderStyle="None" BorderWidth="0px" />
        <FooterStyle BackColor="#CCCC99" />
        <HeaderStyle BackColor="White" Font-Bold="True" ForeColor="#9D2E48" BorderStyle="None" BorderWidth="0px" />
        <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" BorderStyle="None" />
        <RowStyle BackColor="White" BorderStyle="None" ForeColor="#57504C" />
        <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
        <SortedAscendingCellStyle BackColor="#E6E6E6" />
        <SortedAscendingHeaderStyle BackColor="#9D2E48" ForeColor="White" />
        <SortedDescendingCellStyle BackColor="#E6E6E6" />
        <SortedDescendingHeaderStyle BackColor="#9D2E48" />
    </asp:GridView>
    <asp:Button ID="btn_Bestellen" runat="server" OnClick="btn_Bestellen_Click" Text="Bestellen" />
    <asp:TextBox ID="tb_OrderNr" runat="server" AutoPostBack="True" Height="16px" Width="16px" Text="1">1</asp:TextBox>
    <asp:Label ID="lbl_error" runat="server" Text="Label"></asp:Label>
    <asp:ValidationSummary ID="ValidationSummary1" runat="server" />
    <asp:AccessDataSource ID="BestellenOrderregel" runat="server" DataFile="~/App_Data/JECODatabase.accdb" 
        DeleteCommand="DELETE FROM [Orderregel] WHERE [Orderregelnr] = ?" 
        InsertCommand="INSERT INTO [Orderregel] ([Orderregelnr], [Naam], [Omschrijving], [Inkoopprijs], [BTW Tarief], [InkoopOrderNr], [VoorraadNr], [Aantal]) VALUES (?, ?, ?, ?, ?, ?, ?, ?)" 
        SelectCommand="SELECT * FROM [Orderregel] INNER JOIN InkoopOrder ON Orderregel.InkoopOrderNr = InkoopOrder.InkoopOrderNr WHERE Orderregel.InkoopOrderNr = @Orderregelnr"
        UpdateCommand="UPDATE [Orderregel] SET [Aantal] = ? WHERE [Orderregelnr] = @Orderregelnr">
        <DeleteParameters>
            <asp:Parameter Name="Orderregelnr" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="Orderregelnr" Type="Int32" />
            <asp:Parameter Name="Naam" Type="String" />
            <asp:Parameter Name="Omschrijving" Type="String" />
            <asp:Parameter Name="Inkoopprijs" Type="Decimal" />
            <asp:Parameter Name="BTW_Tarief" Type="Int32" />
            <asp:Parameter Name="InkoopOrderNr" Type="Int32" />
            <asp:Parameter Name="VoorraadNr" Type="Int32" />
            <asp:Parameter Name="Aantal" Type="Int32" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="Naam" Type="String" />
            <asp:Parameter Name="Omschrijving" Type="String" />
            <asp:Parameter Name="Inkoopprijs" Type="Decimal" />
            <asp:Parameter Name="BTW_Tarief" Type="Int32" />
            <asp:Parameter Name="InkoopOrderNr" Type="Int32" />
            <asp:Parameter Name="VoorraadNr" Type="Int32" />
            <asp:Parameter Name="Aantal" Type="Int32" />
            <asp:Parameter Name="Orderregelnr" Type="Int32" />
        </UpdateParameters>
        <SelectParameters>
            <asp:Parameter Name="Orderregelnr" Type="Int32" DefaultValue="1" />
        </SelectParameters>
    </asp:AccessDataSource>
</asp:Content>

