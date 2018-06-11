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
   
    }

    public static OleDbConnection Conn()
    {
        return _conn;
    }

    public static string OrderNumber()
    {
        try
        {
            OleDbCommand cmd = new OleDbCommand("SELECT OrderregelNr FROM Orderregel", _conn);
            _conn.Open();
            OleDbDataReader r = cmd.ExecuteReader();
            if (r.Read())
            {
                return r["OrderregelNr"].ToString();
            }
            else
            {
                return "Bad order";
            }
        }
        catch
        {
            
            return "Error";
        }
        finally
        {
            _conn.Close();
        }
      
    }
}
