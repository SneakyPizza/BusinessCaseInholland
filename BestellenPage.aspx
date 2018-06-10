<%@ Page Title="" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeFile="BestellenPage.aspx.cs" Inherits="BestellenPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentAsp" runat="Server">
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="Orderregelnr" DataSourceID="BestellenView">
        <Columns>
            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
            <asp:BoundField DataField="Orderregelnr" HeaderText="Orderregelnr" InsertVisible="False" ReadOnly="True" SortExpression="Orderregelnr" />
            <asp:BoundField DataField="Naam" HeaderText="Naam" ReadOnly="True" SortExpression="Naam" />
            <asp:BoundField DataField="Omschrijving" HeaderText="Omschrijving" ReadOnly="True" SortExpression="Omschrijving" />
            <asp:BoundField DataField="Inkoopprijs" HeaderText="Inkoopprijs" ReadOnly="True" SortExpression="Inkoopprijs" />
            <asp:TemplateField HeaderText="Aantal" SortExpression="Aantal">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Aantal") %>'></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvUpdateAmount" runat="server" ErrorMessage="Aantal is a required field" ControlToValidate="TextBox1" Text="*" ForeColor="Red"></asp:RequiredFieldValidator>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("Aantal") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="BTW Tarief" HeaderText="BTW Tarief" SortExpression="BTW Tarief" ReadOnly="True" />
            <asp:BoundField DataField="InkoopOrderNr" HeaderText="InkoopOrderNr" ReadOnly="True" SortExpression="InkoopOrderNr" Visible="False" />
            <asp:BoundField DataField="VoorraadNr" HeaderText="VoorraadNr" ReadOnly="True" SortExpression="VoorraadNr" Visible="False" />
        </Columns>
    </asp:GridView>
    <asp:ValidationSummary ID="ValidationSummary1" runat="server" />
    <asp:AccessDataSource ID="BestellenView" runat="server" DataFile="~/App_Data/JECODatabase.accdb" 
        DeleteCommand="DELETE FROM [Orderregel] WHERE [Orderregelnr] = ?" 
        InsertCommand="INSERT INTO [Orderregel] ([Orderregelnr], [Naam], [Omschrijving], [Inkoopprijs], [BTW Tarief], [InkoopOrderNr], [VoorraadNr], [Aantal]) VALUES (?, ?, ?, ?, ?, ?, ?, ?)" 
        SelectCommand="SELECT * FROM [Orderregel]" 
        UpdateCommand="UPDATE [Orderregel] SET [Aantal] = ? WHERE [Orderregelnr] = ?">
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
    </asp:AccessDataSource>
</asp:Content>

