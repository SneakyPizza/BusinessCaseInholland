using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.OleDb;

public partial class Main : System.Web.UI.MasterPage
{
    private OleDbConnection _conn;
    

    protected void Page_Load(object sender, EventArgs e)
    {
       /* _conn.ConnectionString = "Provider=Microsoft.ACE.OLEDB.12.0; Data Source=" + Server.MapPath(@"\App_data") + @"\JECODatabase.accdb";

         OleDbCommand cmd = new OleDbCommand();
         cmd.Connection = _conn;
         cmd.CommandText = "SELECT * FROM Producten";


         try
         {
             _conn.Open();
         }
         catch(Exception exc)
         {
             //Error message Display
             _ErrorText.Text = exc.Message;
         }
         finally
         {
             _conn.Close();
         }*/

    }

    public OleDbConnection Conn()
    {
        return _conn;
    }
}
