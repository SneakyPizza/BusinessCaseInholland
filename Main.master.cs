using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.OleDb;
using System.Configuration;

public partial class Main : System.Web.UI.MasterPage
{
    private static OleDbConnection _conn;

    protected void Page_Load(object sender, EventArgs e)
    {
        _conn = new OleDbConnection();
        _conn.ConnectionString = ConfigurationManager.ConnectionStrings["JECO"].ToString();

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
            _ErrorText.Text = "Done";
         }
   
    }

    public static OleDbConnection Conn()
    {
        return _conn;
    }
}
