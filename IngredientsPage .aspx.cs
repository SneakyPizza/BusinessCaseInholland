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
        try
        {
            if (Main.Conn() != null)
            {
                _conn = Main.Conn();
                _conn.Open();

                OleDbCommand cmd = new OleDbCommand();
                cmd.Connection = _conn;
                cmd.CommandText = "SELECT * FROM product";

            }
        }
        catch(Exception exc)
        {
            //Main._ErrorText.Text = exc.Message;
        }
        finally
        {
            _conn.Close();
        }
    }
}
