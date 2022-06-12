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
    public partial class WebForm2 : System.Web.UI.Page
    {
        private string toLink = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        private OracleConnection oracle;
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void saveTeacher(object sender, EventArgs e)
        {
            GridViewRow gridViewRow = (GridViewRow)((LinkButton)sender).NamingContainer;
            oracle = new OracleConnection(toLink);
            oracle.Open();
            String PersonId = ((Label)gridViewRow.FindControl("Label1")).Text;
            String Person_Name = ((TextBox)gridViewRow.FindControl("TextBox1")).Text;
            String Email = ((TextBox)gridViewRow.FindControl("TextBox2")).Text;
            String Date_Of_Birth = ((TextBox)gridViewRow.FindControl("TextBox3")).Text;
            Date_Of_Birth = (Convert.ToDateTime(Date_Of_Birth).Year).ToString() + '-' + (Convert.ToDateTime(Date_Of_Birth).Month).ToString() + '-' + (Convert.ToDateTime(Date_Of_Birth).Day).ToString();
            String Teacher_Id = ((Label)gridViewRow.FindControl("Label2")).Text;
            String Salary = ((TextBox)gridViewRow.FindControl("TextBox4")).Text;
        
        OracleCommand command = new OracleCommand($"Update person set Person_Name = '{Person_Name}',Email='{Email}',Date_Of_Birth=to_date('{Date_Of_Birth}','YYYY-MM-DD') where PersonId ={PersonId}", oracle);
        command.ExecuteNonQuery();

         OracleCommand commandto = new OracleCommand($"Update teacher set Salary={Salary} where Teacher_Id={Teacher_Id}", oracle);
        commandto.ExecuteNonQuery();

            oracle.Close();
            GridView1.EditIndex = -1;
            GridView1.DataBind();
        }
        protected void delete(object sender, EventArgs e)
        {
            GridViewRow gridViewRow = (GridViewRow)((LinkButton)sender).NamingContainer;
            oracle = new OracleConnection(toLink);
            oracle.Open();
            String PersonId = ((Label)gridViewRow.FindControl("Label1")).Text;
            String Teacher_Id = ((Label)gridViewRow.FindControl("Label2")).Text;
            OracleCommand command = new OracleCommand($"delete person where PersonId ={PersonId}", oracle);
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
            String PersonId = ((TextBox)FormView1.FindControl("PERSONIDTextBox")).Text;
            String Person_Name = ((TextBox)FormView1.FindControl("PERSON_NAMETextBox")).Text;
            String Email = ((TextBox)FormView1.FindControl("EMAILTextBox")).Text;
            String Date_Of_Birth = ((TextBox)FormView1.FindControl("DATE_OF_BIRTHTextBox")).Text;
            Date_Of_Birth = (Convert.ToDateTime(Date_Of_Birth).Year).ToString() + '-' + (Convert.ToDateTime(Date_Of_Birth).Month).ToString() + '-' + (Convert.ToDateTime(Date_Of_Birth).Day).ToString();
            String Teacher_Id = ((TextBox)FormView1.FindControl("TEACHER_IDTextBox")).Text;
            String Salary = ((TextBox)FormView1.FindControl("SALARYTextBox")).Text;

            OracleCommand command = new OracleCommand($"insert into person values('{PersonId}','{Person_Name}', '{Email}', to_date('{Date_Of_Birth}','YYYY-MM-DD'))", oracle);
            command.ExecuteNonQuery();

            OracleCommand commandto = new OracleCommand($"insert into teacher values('{PersonId}', {Salary})", oracle);
            commandto.ExecuteNonQuery();

            oracle.Close();
            GridView1.DataBind();
        }
    }
}