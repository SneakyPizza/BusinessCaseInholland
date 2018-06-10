using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.OleDb;
using System.Web.UI.WebControls;
using System.Web.UI;
using System.Configuration;

/// <summary>
/// Summary description for Class1
/// </summary>
public class BuyHandeler
{
    private OleDbConnection _conn = new OleDbConnection();
    public BuyHandeler()
    {
        //
        // TODO: Add constructor logic here
        //It
    }

    public void AddToOrder()
    {
        /*int id = 10;
        OleDbConnection conn = new OleDbConnection();
        conn.ConnectionString = ConfigurationManager.ConnectionStrings["JECO"].ToString();

        OleDbCommand addQuery = new OleDbCommand();
        addQuery.Parameters.AddWithValue(new OleDbParameter("@name", id));
        addQuery.Connection = conn;
        addQuery.CommandText = "INSERT INTO Orderregel naam=@name, Omschrijving=@Desc, Inkoopprijs=@buyprice, BTW Tarief=@btw, InkoopOrderNr=@ordernr, VoorraadNr=@vnr " +
            "VALUES naam=@name, Omschrijving=@Desc, Inkoopprijs=@buyprice, BTW Tarief=@btw, InkoopOrderNr=@ordernr, VoorraadNr=@vnr";




        foreach (int pID in _Cart) { }*/
    }

    //Input all the cells from the clicked row

}