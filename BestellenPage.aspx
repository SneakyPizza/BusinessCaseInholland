<%@ Page Title="" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeFile="BestellenPage.aspx.cs" Inherits="BestellenPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentAsp" Runat="Server">
    <asp:GridView ID="GridView1" runat="server" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="ProductNr" DataSourceID="AccessDataSource1">
        <AlternatingRowStyle BorderStyle="None" BorderWidth="0px" />
        <Columns>
            <asp:BoundField DataField="ProductNr" HeaderText="ProductNr" InsertVisible="False" ReadOnly="True" SortExpression="ProductNr" />
            <asp:BoundField DataField="Naam" HeaderText="Naam" SortExpression="Naam" />
            <asp:BoundField DataField="Omschrijving" HeaderText="Omschrijving" SortExpression="Omschrijving" />
            <asp:BoundField DataField="Inkoopprijs" HeaderText="Inkoopprijs" SortExpression="Inkoopprijs" />
            <asp:BoundField DataField="MinimaleVoorraad" HeaderText="MinimaleVoorraad" SortExpression="MinimaleVoorraad" />
            <asp:BoundField DataField="MaximaleVoorraad" HeaderText="MaximaleVoorraad" SortExpression="MaximaleVoorraad" />
            <asp:BoundField DataField="HuidigeVoorraad" HeaderText="HuidigeVoorraad" SortExpression="HuidigeVoorraad" />
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
    <asp:AccessDataSource ID="AccessDataSource1" runat="server" DataFile="~/App_Data/JECODatabase.accdb" SelectCommand="SELECT * FROM [Product]"></asp:AccessDataSource>
    </asp:Content>

