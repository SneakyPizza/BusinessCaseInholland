using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.OleDb;

public partial class BestellenPage : System.Web.UI.Page
{
    private int _pid;
    private string _pname;

    protected void Page_Load(object sender, EventArgs e)
    {

       /* INSERT Order (Colmn1, Colmn2) Values param1, param2 
        * 
        * for(int i; product in Ojects ) {
        *   INSERT Orderregel () Values
        *   }
        */

    }

    protected void OnSelectedIndexChanged(object sender, EventArgs e)
    {
        
      
        
        //add pname + amount to database

        if (Main.Conn() != null)
        {
            OleDbCommand cmd = new OleDbCommand();
            //cmd.Parameters.Add(new OleDbParameter("@var1", ));
            //cmd.Parameters.Add(new OleDbParameter("@var2", ));
            cmd.Connection = Main.Conn();
           // cmd.CommandText = "INSERT INTO InkoopOrder (Totaal Inkoopprijs, OrderDatum, BTWTarief, Pakbon, LeverancierNr) VALUES Totaal Inkoopprijs=@var1, TIMESTAMP, BTWTarief=@var3, Pakbon=@var4, LeverancierNr=@var5";
        }

       
    }

    protected void BestellenView_RowCommand(object sender, GridViewCommandEventArgs e)
    {

    }

    private void AddObject()
    {
            //addproduct.CommandText = "INSERT INTO Orderregel(Naam, Omschrijving, Inkoopprijs, BTWTarief) VALUES Naam=@1, Omschrijving, Inkoopprijs, BTWTarief )";
        
    }

    //Updates the amount of products you want to buy
    /*private void UpdateItem(string amount)
    {
        _sendingPage = IngredientsPage();
        string index = IngredientsPage.ClickedIndex();
        //int amount = GridView1.
        OleDbCommand cmd = new OleDbCommand();
        cmd.Connection = Main.Conn();
        cmd.Parameters.Add(new OleDbParameter("@amount", amount));
        cmd.Parameters.Add(new OleDbParameter("",));
        cmd.CommandText = "UPDATE Orderregel SET Orderregel.Aantal = @amount WHERE ";
        Main.Conn().Open();
        cmd.ExecuteNonQuery();
        Main.Conn().Close(); 

        
    }*/
}

