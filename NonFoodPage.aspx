<%@ Page Title="" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeFile="NonFoodPage.aspx.cs" Inherits="NonFoodPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentAsp" Runat="Server">

    <asp:Label ID="_PageTitle" runat="server" Text="NonFood pagina" Font-Bold="True" Font-Overline="False" Font-Size="X-Large" Font-Strikeout="False" ForeColor="#57504C"></asp:Label>
    <br />

    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="NonFoodnr" DataSourceID="NonFoodView" RowCommand="AddNonFood">
        <Columns>
            <asp:BoundField DataField="NonFoodnr" HeaderText="NonFoodnr" InsertVisible="False" ReadOnly="True" SortExpression="NonFoodnr" Visible="False" />
            <asp:BoundField DataField="NonFoodNaam" HeaderText="NonFoodNaam" SortExpression="NonFoodNaam" />
            <asp:BoundField DataField="CategorieNr" HeaderText="CategorieNr" SortExpression="CategorieNr" Visible="False" />
            <asp:BoundField DataField="ProductNr" HeaderText="ProductNr" SortExpression="ProductNr" Visible="False" />
            <asp:BoundField DataField="Omschrijving" HeaderText="Omschrijving" SortExpression="Omschrijving" />
            <asp:BoundField DataField="MinVoorraad" HeaderText="MinVoorraad" SortExpression="MinVoorraad" />
            <asp:BoundField DataField="MaxVoorraad" HeaderText="MaxVoorraad" SortExpression="MaxVoorraad" />
            <asp:ButtonField ButtonType="Button" CommandName="Edit" Text="Add To Cart" />
        </Columns>
    </asp:GridView>
    <asp:AccessDataSource ID="NonFoodView" runat="server" DataFile="~/App_Data/JECODatabase.accdb" DeleteCommand="DELETE FROM [NonFood] WHERE [NonFoodnr] = ?" InsertCommand="INSERT INTO [NonFood] ([NonFoodnr], [NonFoodNaam], [CategorieNr], [ProductNr], [Omschrijving], [MinVoorraad], [MaxVoorraad]) VALUES (?, ?, ?, ?, ?, ?, ?)" SelectCommand="SELECT * FROM [NonFood]" UpdateCommand="UPDATE [NonFood] SET [NonFoodNaam] = ?, [CategorieNr] = ?, [ProductNr] = ?, [Omschrijving] = ?, [MinVoorraad] = ?, [MaxVoorraad] = ? WHERE [NonFoodnr] = ?">
        <DeleteParameters>
            <asp:Parameter Name="NonFoodnr" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="NonFoodnr" Type="Int32" />
            <asp:Parameter Name="NonFoodNaam" Type="String" />
            <asp:Parameter Name="CategorieNr" Type="Int32" />
            <asp:Parameter Name="ProductNr" Type="Int32" />
            <asp:Parameter Name="Omschrijving" Type="String" />
            <asp:Parameter Name="MinVoorraad" Type="Int32" />
            <asp:Parameter Name="MaxVoorraad" Type="Int32" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="NonFoodNaam" Type="String" />
            <asp:Parameter Name="CategorieNr" Type="Int32" />
            <asp:Parameter Name="ProductNr" Type="Int32" />
            <asp:Parameter Name="Omschrijving" Type="String" />
            <asp:Parameter Name="MinVoorraad" Type="Int32" />
            <asp:Parameter Name="MaxVoorraad" Type="Int32" />
            <asp:Parameter Name="NonFoodnr" Type="Int32" />
        </UpdateParameters>
    </asp:AccessDataSource>

</asp:Content>

