using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.OleDb;

public partial class IngredientsPage : System.Web.UI.Page
{
    private OleDbConnection _conn;

    protected void Page_Load(object sender, EventArgs e)
    {
        if(Main.Conn() != null)
        {
            _conn = Main.Conn();
            _conn.Open();

            OleDbCommand cmd = new OleDbCommand();
            cmd.Connection = _conn;
            cmd.CommandText = "SELECT * FROM product";

            OleDbDataReader r = cmd.ExecuteReader();
            r.Read();
            while (r.Read())
            {
                IngredientTestLabel.Text = String.Format("{0}: {1}<br /> \n", r["ProductNr"].ToString(), r["Naam"].ToString());
            }

        }

    }
}