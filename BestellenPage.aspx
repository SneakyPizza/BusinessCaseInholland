<%@ Page Title="" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeFile="BestellenPage.aspx.cs" Inherits="BestellenPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentAsp" Runat="Server">
    <asp:GridView ID="GridView1" runat="server" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="ProductNr" DataSourceID="AccessDataSource1">
        <Columns>
            <asp:BoundField DataField="ProductNr" HeaderText="ProductNr" InsertVisible="False" ReadOnly="True" SortExpression="ProductNr" />
            <asp:BoundField DataField="Naam" HeaderText="Naam" SortExpression="Naam" />
            <asp:BoundField DataField="Omschrijving" HeaderText="Omschrijving" SortExpression="Omschrijving" />
            <asp:BoundField DataField="Inkoopprijs" HeaderText="Inkoopprijs" SortExpression="Inkoopprijs" />
            <asp:BoundField DataField="MinimaleVoorraad" HeaderText="MinimaleVoorraad" SortExpression="MinimaleVoorraad" />
            <asp:BoundField DataField="MaximaleVoorraad" HeaderText="MaximaleVoorraad" SortExpression="MaximaleVoorraad" />
            <asp:BoundField DataField="HuidigeVoorraad" HeaderText="HuidigeVoorraad" SortExpression="HuidigeVoorraad" />
        </Columns>
    </asp:GridView>
    <asp:AccessDataSource ID="AccessDataSource1" runat="server" DataFile="~/App_Data/JECODatabase.accdb" SelectCommand="SELECT * FROM [Product]"></asp:AccessDataSource>
    </asp:Content>

