using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.OleDb;
using System.IO;

public partial class NonFoodPage : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void Gridview1_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "AddNonFood")
        {
            int index = Convert.ToInt32(e.CommandArgument);
            GridViewRow row = GridView1.Rows[index];

            if (row != null)
            {
                Additem(/*Convert.ToInt32(row.Cells[1].Text),*/ row.Cells[2].Text.ToString(), row.Cells[3].Text.ToString(), 10);
            }
        }
    }

    private void Additem(string itemName, string itemDesc, int btw)
    {
        OleDbConnection conn = Main.Conn();
        try
        {
            int amount = 1;

            OleDbCommand cmd = new OleDbCommand();

            //cmd.Parameters.AddWithValue("@id", itemId);
            cmd.Parameters.AddWithValue("@name", itemName);
            cmd.Parameters.AddWithValue("@desc", itemDesc);
            //cmd.Parameters.AddWithValue("@price", itemPrice);
            cmd.Parameters.AddWithValue("@btw", btw);
            cmd.Parameters.AddWithValue("@amount", amount);

            cmd.CommandText = "INSERT INTO Orderregel(naam, Omschrijving, Inkoopprijs, BTW Tarief, Aantal)" +
                "VALUES(@name, @desc, @btw, @amount)";
            conn.Open();
            cmd.ExecuteNonQuery();

        }
        catch (Exception exc)
        {

        }
        finally
        {
            conn.Close();
        }

    }



    protected void btn_ExportNonFood_Click(object sender, EventArgs e)
    {
        //Clear output stream
        Response.ClearContent();
        //set filename
        Response.AppendHeader("content-disposition", "attachment; filename=Drinks.xls");
        //setcontenttype
        Response.ContentType = "application/excel";

        //set stringwriter to htmlwriter
        StringWriter sw = new StringWriter();
        HtmlTextWriter htmltw = new HtmlTextWriter(sw);

        //Write the data to he .xls file
        NonFoodView.RenderControl(htmltw);
        Response.Write(sw.ToString());
        //end
        Response.End();
    }
}