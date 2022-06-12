using Oracle.ManagedDataAccess.Client;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DatabaseCw
{
    public partial class WebForm3 : System.Web.UI.Page
    {
        private string toLink = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        private OracleConnection oracle;
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void saveDepartment(object sender, EventArgs e)
        {
            GridViewRow gridViewRow = (GridViewRow)((LinkButton)sender).NamingContainer;
            oracle = new OracleConnection(toLink);
            oracle.Open();
            String Department_Id = ((Label)gridViewRow.FindControl("Label1")).Text;
            String Department_Name = ((TextBox)gridViewRow.FindControl("TextBox1")).Text;

            OracleCommand command = new OracleCommand($"Update department set department_Name = '{Department_Name}'  where Department_Id ={Department_Id}", oracle);
            command.ExecuteNonQuery();

            oracle.Close();
            GridView1.EditIndex = -1;
            GridView1.DataBind();
        }
        protected void delete(object sender, EventArgs e)
        {
            GridViewRow gridViewRow = (GridViewRow)((LinkButton)sender).NamingContainer;
            oracle = new OracleConnection(toLink);
            oracle.Open();
            String Department_Id = ((Label)gridViewRow.FindControl("Label1")).Text;
            OracleCommand command = new OracleCommand($"delete department where Department_Id ={Department_Id}", oracle);
            command.ExecuteNonQuery();

            //OracleCommand commandto = new OracleCommand($"delete student where Student_Id={Student_Id} where Student_Id={Student_Id}", oracle);
            //commandto.ExecuteNonQuery();

            oracle.Close();
            GridView1.DataBind();
        }
        protected void insert(object sender, EventArgs e)
        {
            //System.Diagnostics.Debug.Write("hwlli");
            oracle = new OracleConnection(toLink);
            oracle.Open();

            string Department_Id = ((TextBox)FormView1.FindControl("DEPARTMENT_IDTextBox")).Text;
            string Department_Name = ((TextBox)FormView1.FindControl("DEPARTMENT_NAMETextBox")).Text;
            

            OracleCommand command = new OracleCommand($"insert into Department values({Department_Id}, '{Department_Name}')", oracle);
            command.ExecuteNonQuery();

            oracle.Close();
            GridView1.DataBind();
        }

    }
}