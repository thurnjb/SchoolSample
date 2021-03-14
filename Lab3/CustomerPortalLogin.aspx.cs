﻿using System;
using System.Collections.Generic;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Lab3
{
    /*Jay Thurn, Ryan Booth, John Lee
Our submission of this assignment indicates that we have neither received nor given unauthorized assistance in writing this program. All design and coding is our own work.*/
    public partial class CustomerPortalLogin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString.Get("loggedout") == "true")
            {
                lblStatus.ForeColor = Color.Green;
                lblStatus.Text = "User has successfully logged out";
            }

            if (Session["CustInvalidUse"] != null)
            {
                lblStatus.ForeColor = Color.Red;
                lblStatus.Text = Session["CustInvalidUse"].ToString();
            }

        }
        protected void btnEmpLogin_Click(object sender, EventArgs e)
        {
            Response.Redirect("LoginForm.aspx");
        }

        //This method checks the users information and logs them in
        protected void btnLogin_Click(object sender, EventArgs e)
        {
            if (Application["CustUsername"] != null & Application["CustPassword"] != null)
            {
                String username = Application["CustUsername"].ToString();
                String password = Application["CustPassword"].ToString();

                if (txtUserName.Text != "" & txtPassWord.Text != "")
                {
                    if (txtUserName.Text == username & txtPassWord.Text == password)
                    {
                        Session["CustLogin"] = tbUsernameCreate.Text;
                        Response.Redirect("CustomerPortalService.aspx");
                    }
                }
            }
            
            else
            {
                lblStatus.Text = "Login Error";
            }

        }

        protected void btnCreateAccount_Click(object sender, EventArgs e)
        {
            if(tbFirstNameCreate.Text != "" & tbLastNameCreate.Text != "" & tbUsernameCreate.Text != "" & tbPasswordCreate.Text != "" & tbAddressCreate.Text != "" & tbPhoneCreate.Text != "" & tbHearCreate.Text != "")
            {
                Application["CustUsername"] = tbUsernameCreate.Text;
                Application["CustPassword"] = tbPasswordCreate.Text;
                Application["CustFName"] = tbFirstNameCreate.Text;
                Application["CustLName"] = tbLastNameCreate.Text;
                Application["CustAddress"] = tbAddressCreate.Text;
                Application["CustPhone"] = tbPhoneCreate.Text;
                Application["CustHear"] = tbHearCreate.Text;
                lblAccountStatus.Text = "Account Successfully Created";
            }
            else
            {
                lblAccountStatus.Text = "Error: Text Fields Cannot Be Blank";
            }
        }


    }
}