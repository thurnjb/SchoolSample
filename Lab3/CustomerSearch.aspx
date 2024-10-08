﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="CustomerSearch.aspx.cs" Inherits="Lab3.CustomerDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="author" content="">
        <title>Customer Database</title>
        <link href="css/styles.css" rel="stylesheet">
        <link rel="stylesheet" href="css/heading.css">
        <link rel="stylesheet" href="css/body.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    </head>
    <body>
        <header class="masthead bg-primary text-black text-center">
            <div class="container d-flex align-items-center flex-column">
            <form class="example" action="action_page.php">
                <asp:TextBox ID="txtCustomerSearch" runat="server"></asp:TextBox>
                <asp:Button ID="btnView" runat="server" Text="Search" CssClass="fa fa-search" OnClick="btnView_Click" />
</form>
<div style="width:auto;height:auto;color:black;border:1px solid #000;">
    Customer Results
    <asp:GridView ID="grdCustomers" runat="server"
                        HeaderStyle-BackColor="#000000"
                        EmptyDataText="No customer with that name!"
                        AutoGenerateSelectButton="true"
                        SelectedIndex="1"
                        OnSelectedIndexChanged="grdCustomers_SelectedIndexChanged"
                        AllowSorting="true"
                        OnSorting="grdCustomers_Sorting"
                        DataKeyNames="CustomerID"
                        AutoGenerateColumns="false">
                        <Columns>
                            <asp:BoundField HeaderText="FirstName" DataField="FirstName" SortExpression="FirstName" />
                            <asp:BoundField HeaderText="LastName" DataField="LastName" SortExpression="LastName" />
                            <asp:BoundField HeaderText="InitialContact" DataField="InitialContact" SortExpression="InitialContact" />
                            <asp:BoundField HeaderText="HeardFrom" DataField="HeardFrom" SortExpression="HeardFrom" />
                            <asp:BoundField HeaderText="Phone" DataField="Phone" SortExpression="Phone" />
                            <asp:BoundField HeaderText="Email" DataField="Email" SortExpression="Email" />
                            <asp:BoundField HeaderText="Address" DataField="Address" SortExpression="Address" />
                            <asp:BoundField HeaderText="DestAddress" DataField="DestAddress" SortExpression="DestAddress" />
                            <asp:BoundField HeaderText="SaveDate" DataField="SaveDate" SortExpression="SaveDate" />
                        </Columns>
                    </asp:GridView>
</div>
                
</div>
                
                            <div class="form-group">
                                <asp:Button ID="btnNew" runat="server" Text="Add New Customer" OnClick="btnNew_Click" />
             
        </header>
      
          
    </body>
</html>
</asp:Content>
