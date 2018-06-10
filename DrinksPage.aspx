<%@ Page Title="" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeFile="DrinksPage.aspx.cs" Inherits="DrinksPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentAsp" Runat="Server">
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="DrankNr" DataSourceID="DrinksView" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" RowCommand="AddDrinks">
        <Columns>
            <asp:BoundField DataField="DrankNr" HeaderText="DrankNr" InsertVisible="False" ReadOnly="True" SortExpression="DrankNr" Visible="False" />
            <asp:BoundField DataField="DrankNaam" HeaderText="DrankNaam" SortExpression="DrankNaam" />
            <asp:BoundField DataField="Omschrijving" HeaderText="Omschrijving" SortExpression="Omschrijving" />
            <asp:BoundField DataField="Prijs" HeaderText="Prijs" SortExpression="Prijs" />
            <asp:ButtonField ButtonType="Button" CommandName="Edit" Text="Add To Cart" />
            <asp:BoundField DataField="BTW tarief" HeaderText="BTW tarief" SortExpression="BTW tarief" />
            <asp:BoundField DataField="CategorieNr" HeaderText="CategorieNr" SortExpression="CategorieNr" Visible="False" />
            <asp:BoundField DataField="ProductNr" HeaderText="ProductNr" SortExpression="ProductNr" Visible="False" />
            <asp:BoundField DataField="MinVoorraad" HeaderText="MinVoorraad" SortExpression="MinVoorraad" />
            <asp:BoundField DataField="MaxVoorraad" HeaderText="MaxVoorraad" SortExpression="MaxVoorraad" />
        </Columns>
    </asp:GridView>
    <asp:AccessDataSource ID="DrinksView" runat="server" DataFile="~/App_Data/JECODatabase.accdb" DeleteCommand="DELETE FROM [Drank] WHERE [DrankNr] = ?" InsertCommand="INSERT INTO [Drank] ([DrankNr], [DrankNaam], [Prijs], [Omschrijving], [BTW tarief], [CategorieNr], [ProductNr], [MinVoorraad], [MaxVoorraad]) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)" SelectCommand="SELECT * FROM [Drank]" UpdateCommand="UPDATE [Drank] SET [DrankNaam] = ?, [Prijs] = ?, [Omschrijving] = ?, [BTW tarief] = ?, [CategorieNr] = ?, [ProductNr] = ?, [MinVoorraad] = ?, [MaxVoorraad] = ? WHERE [DrankNr] = ?">
        <DeleteParameters>
            <asp:Parameter Name="DrankNr" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="DrankNr" Type="Int32" />
            <asp:Parameter Name="DrankNaam" Type="String" />
            <asp:Parameter Name="Prijs" Type="Decimal" />
            <asp:Parameter Name="Omschrijving" Type="String" />
            <asp:Parameter Name="BTW_tarief" Type="Int32" />
            <asp:Parameter Name="CategorieNr" Type="Int32" />
            <asp:Parameter Name="ProductNr" Type="Int32" />
            <asp:Parameter Name="MinVoorraad" Type="Int32" />
            <asp:Parameter Name="MaxVoorraad" Type="Int32" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="DrankNaam" Type="String" />
            <asp:Parameter Name="Prijs" Type="Decimal" />
            <asp:Parameter Name="Omschrijving" Type="String" />
            <asp:Parameter Name="BTW_tarief" Type="Int32" />
            <asp:Parameter Name="CategorieNr" Type="Int32" />
            <asp:Parameter Name="ProductNr" Type="Int32" />
            <asp:Parameter Name="MinVoorraad" Type="Int32" />
            <asp:Parameter Name="MaxVoorraad" Type="Int32" />
            <asp:Parameter Name="DrankNr" Type="Int32" />
        </UpdateParameters>
    </asp:AccessDataSource>
</asp:Content>

