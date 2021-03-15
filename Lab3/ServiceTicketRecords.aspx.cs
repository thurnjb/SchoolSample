﻿using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

/*Jay Thurn, Ryan Booth, John Lee
Our submission of this assignment indicates that we have neither received nor given unauthorized assistance in writing this program. All design and coding is our own work.*/

namespace Lab3
{
    public partial class ServiceTicketRecords : System.Web.UI.Page
    {
        private static DataSet dataset = new DataSet("ServiceTicket");
        private static SqlDataReader queryResults;
        private static int count = 0;
        private static int current = -1;
        private static String sqlCommitQuery = "";

        //On page load, connect to data
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                current = -1;
                count = 0;
                connectToData();
            }

            if(Application["NewAdd"] != null)
            {
                txtCustomerName.Text = Application["CustFName"].ToString() + " " + Application["CustLName"].ToString();
                txtServiceType.Text = Application["CustService"].ToString();
                txtFromDeadline.Text = "2021-03-05";
                txtToDeadline.Text = "2021-03-07";
            }
        }

        //Gets count of number of records in ServiceTicket and fills dataset with rows
        protected void connectToData()
        {
            String sqlQuery = "Select Employee.FirstName + ' ' + Employee.LastName as EmployeeName, Customer.FirstName + ' ' + Customer.LastName as CustomerName, Service.ServiceType, ServiceTicket.TicketStatus, ServiceTicket.TicketOpenDate, ServiceTicket.FromDeadline, ServiceTicket.ToDeadline FROM Customer, Employee, Service, ServiceTicket WHERE ServiceTicket.CustomerID = Customer.CustomerID AND ServiceTicket.InitiatingEmployeeID = Employee.EmployeeID AND ServiceTicket.ServiceID = Service.ServiceID";

            SqlConnection connection = new SqlConnection(WebConfigurationManager.ConnectionStrings["Lab3"].ConnectionString);

            SqlDataAdapter adapter = new SqlDataAdapter();

            adapter.TableMappings.Add("Table", "ServiceTicket");

            connection.Open();

            SqlCommand sqlCommand = new SqlCommand();
            sqlCommand.Connection = connection;
            sqlCommand.CommandType = CommandType.Text;
            sqlCommand.CommandText = sqlQuery;
            queryResults = sqlCommand.ExecuteReader();
            while (queryResults.Read())
            {
                count++;
            }
            queryResults.Close();

            SqlCommand command = new SqlCommand();
            command.Connection = connection;
            command.CommandType = CommandType.Text;
            command.CommandText = sqlQuery;

            adapter.SelectCommand = command;
            if (dataset.Tables.Count == 0)
            {
                adapter.Fill(dataset);
            }
        }

        //This method goes to the home page
        protected void btnHomePage_Click(object sender, EventArgs e)
        {
            Response.Redirect("HomePageV2.aspx");
        }

        //This method fills the textboxes with the first data entry in the table
        protected void btnPopulate_Click(object sender, EventArgs e)
        {
            lblErrorMsg.Text = "";
            current = 0;
            txtCustomerName.Text = dataset.Tables[0].Rows[current]["CustomerName"].ToString();
            txtInitiatingEmployee.Text = dataset.Tables[0].Rows[current]["EmployeeName"].ToString();
            txtServiceType.Text = dataset.Tables[0].Rows[current]["ServiceType"].ToString();
            txtTicketStatus.Text = dataset.Tables[0].Rows[current]["TicketStatus"].ToString();
            txtTicketOpenDate.Text = dataset.Tables[0].Rows[current]["TicketOpenDate"].ToString();
            txtFromDeadline.Text = dataset.Tables[0].Rows[current]["FromDeadLine"].ToString();
            txtToDeadline.Text = dataset.Tables[0].Rows[current]["ToDeadline"].ToString();
        }

        //This method creates an insert sql statement and executes
        protected void btnSave_Click(object sender, EventArgs e)
        {
            if(txtCustomerName.Text != "" & txtInitiatingEmployee.Text != "" & txtServiceType.Text != "" & txtFromDeadline.Text != "" & txtToDeadline.Text != "")
            {
                sqlCommitQuery = "INSERT INTO ServiceTicket(CustomerID, InitiatingEmployeeID, ServiceID, TicketStatus, TicketOpenDate, FromDeadline, ToDeadline)  VALUES (" + ddlCustomerList.SelectedValue + ", " + ddlEmployeeList.SelectedValue + ", " +
                    ddlService.SelectedValue + ", 'Open', '" + DateTime.Now + "', '" + HttpUtility.HtmlEncode(txtFromDeadline.Text) + "', '" + HttpUtility.HtmlEncode(txtToDeadline.Text) + "');";

                SqlConnection sqlConnect = new SqlConnection(WebConfigurationManager.ConnectionStrings["Lab3"].ConnectionString);

                sqlConnect.Open();
                SqlCommand sqlCommand = new SqlCommand();
                sqlCommand.Connection = sqlConnect;
                sqlCommand.CommandText = sqlCommitQuery;

                sqlCommand.ExecuteNonQuery();

                Session["ServiceTicketID"] = ++count;

                btnNoteCancel.Visible = true;
                btnNoteSave.Visible = true;
                lblNoteContent.Visible = true;
                lblNoteTitle.Visible = true;
                txtNoteContent.Visible = true;
                txtNoteTitle.Visible = true;

                if (Application["NewAdd"] != null)
                {
                    Application["Request"] = null;
                    Application["NewAdd"] = null;
                    Application["Added"] = "yes";
                    Response.Redirect("NotificationPage.aspx");
                }
            }
            else
            {
                lblErrorMsg.Text = "Only Ticket Status and Open Date may be left blank";
            }
        }

        //This method clears all textboxes
        protected void btnClear_Click(object sender, EventArgs e)
        {
            lblErrorMsg.Text = "";
            current = -1;
            txtCustomerName.Text = "";
            txtInitiatingEmployee.Text = "";
            txtServiceType.Text = "";
            txtTicketStatus.Text = "";
            txtTicketOpenDate.Text = "";
            txtFromDeadline.Text = "";
            txtToDeadline.Text = "";
        }

        //This method goes back a record in the table
        protected void btnPrevious_Click(object sender, EventArgs e)
        {
            try
            {
                lblErrorMsg.Text = "";
                current--;
                txtCustomerName.Text = dataset.Tables[0].Rows[current]["CustomerName"].ToString();
                txtInitiatingEmployee.Text = dataset.Tables[0].Rows[current]["EmployeeName"].ToString();
                txtServiceType.Text = dataset.Tables[0].Rows[current]["ServiceType"].ToString();
                txtTicketStatus.Text = dataset.Tables[0].Rows[current]["TicketStatus"].ToString();
                txtTicketOpenDate.Text = dataset.Tables[0].Rows[current]["TicketOpenDate"].ToString();
                txtFromDeadline.Text = dataset.Tables[0].Rows[current]["FromDeadLine"].ToString();
                txtToDeadline.Text = dataset.Tables[0].Rows[current]["ToDeadline"].ToString();
            } catch (Exception)
            {
                lblErrorMsg.Text = "No more previous data";
                current++;
            }
        }

        //This method goes forward a record in the table
        protected void btnNext_Click(object sender, EventArgs e)
        {
            try
            {
                lblErrorMsg.Text = "";
                current++;
                txtCustomerName.Text = dataset.Tables[0].Rows[current]["CustomerName"].ToString();
                txtInitiatingEmployee.Text = dataset.Tables[0].Rows[current]["EmployeeName"].ToString();
                txtServiceType.Text = dataset.Tables[0].Rows[current]["ServiceType"].ToString();
                txtTicketStatus.Text = dataset.Tables[0].Rows[current]["TicketStatus"].ToString();
                txtTicketOpenDate.Text = dataset.Tables[0].Rows[current]["TicketOpenDate"].ToString();
                txtFromDeadline.Text = dataset.Tables[0].Rows[current]["FromDeadLine"].ToString();
                txtToDeadline.Text = dataset.Tables[0].Rows[current]["ToDeadline"].ToString();
            } catch (Exception)
            {
                lblErrorMsg.Text = "No more data left";
                current--;
            }
        }

        //Fills textboxes on ddlIndexChange
        protected void ddlCustomerList_SelectedIndexChanged(object sender, EventArgs e)
        {
            lblErrorMsg.Text = "";
            txtCustomerName.Text = ddlCustomerList.SelectedItem.Text;
        }
        protected void ddlService_SelectedIndexChanged(object sender, EventArgs e)
        {
            lblErrorMsg.Text = "";
            txtServiceType.Text = ddlService.SelectedItem.Text;
        }

        protected void ddlEmployeeList_SelectedIndexChanged(object sender, EventArgs e)
        {
            lblErrorMsg.Text = "";
            txtInitiatingEmployee.Text = ddlEmployeeList.SelectedItem.Text;
        }

        protected void btnNoteCancel_Click(object sender, EventArgs e)
        {
            lblNoteErrorMsg.Text = "";
            btnNoteCancel.Visible = false;
            btnNoteSave.Visible = false;
            lblNoteContent.Visible = false;
            lblNoteTitle.Visible = false;
            txtNoteContent.Visible = false;
            txtNoteTitle.Visible = false;
        }

        protected void btnNoteSave_Click(object sender, EventArgs e)
        {
            if (txtNoteContent.Text != "" & txtNoteTitle.Text != "")
            {
                if (Session["ServiceTicketID"] != null)
                {
                    String sqlCommitQuery = "INSERT INTO Notes(ServiceTicketID, NoteTitle, NoteContent) VALUES (" + Session["ServiceTicketID"] + ", @NoteTitle, @NoteContent);";

                    SqlConnection sqlConnect = new SqlConnection(WebConfigurationManager.ConnectionStrings["Lab3"].ConnectionString);

                    sqlConnect.Open();
                    SqlCommand sqlCommand = new SqlCommand();
                    sqlCommand.Connection = sqlConnect;
                    sqlCommand.CommandText = sqlCommitQuery;
                    sqlCommand.Parameters.AddWithValue("@NoteTitle", HttpUtility.HtmlEncode(txtNoteTitle.Text));
                    sqlCommand.Parameters.AddWithValue("@NoteContent", HttpUtility.HtmlEncode(txtNoteContent.Text));

                    sqlCommand.ExecuteNonQuery();
                    sqlConnect.Close();

                    if (Session["EditTicketPage"] != null)
                    {
                        sqlCommitQuery = "INSERT INTO TicketHistory(ServiceTicketID, EmployeeID, TicketChangeDate, DetailsNote) VALUES (" + Session["ServiceTicketID"] + ", " + Session["EmployeeID"] + ", '" + DateTime.Now + "', 'Note was added');";

                        SqlCommand sqlcommand = new SqlCommand();
                        sqlConnect.Open();
                        sqlcommand.Connection = sqlConnect;
                        sqlcommand.CommandText = sqlCommitQuery;
                        sqlcommand.ExecuteNonQuery();
                    }
                    lblNoteErrorMsg.Text = "Note was successfully added!";
                    btnNoteCancel.Visible = false;
                    btnNoteSave.Visible = false;
                    lblNoteContent.Visible = false;
                    lblNoteTitle.Visible = false;
                    txtNoteContent.Visible = false;
                    txtNoteTitle.Visible = false;
                }
                else
                {
                    lblNoteErrorMsg.Text = "No ticket was selected";
                }
            }
            else
            {
                lblNoteErrorMsg.Text = "Title and Content must be filled";
            }
        }
    }
}