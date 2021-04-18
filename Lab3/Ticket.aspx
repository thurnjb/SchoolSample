﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Ticket.aspx.cs" Inherits="Lab3.TicketPage" %>
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
<style>
    .form-control {
        border-color: white;
        background-color: #daac00;
        text-align: center;
        color: white;
</style>
    </head>
    <body>
        <header class="masthead bg-primary text-black text-center">
            <div class="container d-flex align-items-center flex-column">
            <form class="example" action="action_page.php">
                  <h1> OPEN TICKETS </h1>
                <asp:GridView ID="grdTickets" runat="server" 
                    HeaderStyle-BackColor="#000000"
                    DataKeyNames="ServiceTicketID" 
                    AutoGenerateSelectButton="true" 
                    AllowSorting="true" 
                    AutoGenerateColumns="false" 
                    OnSelectedIndexChanged="grdTickets_SelectedIndexChanged" 
                    OnSorting="grdTickets_Sorting">
                    <Columns>
                        <asp:BoundField HeaderText="CustomerName" DataField="CustomerName" SortExpression="CustomerName" />
                        <asp:BoundField HeaderText="EmployeeName" DataField="EmployeeName" SortExpression="EmployeeName" />
                        <asp:BoundField HeaderText="ServiceType" DataField="ServiceType" SortExpression="ServiceType" />
                        <asp:BoundField HeaderText="TicketStatus" DataField="TicketStatus" SortExpression="TicketStatus" />
                        <asp:BoundField HeaderText="TicketOpenDate" DataField="TicketOpenDate" SortExpression="TicketOpenDate" />
                        <asp:BoundField HeaderText="FromDeadline" DataField="FromDeadline" SortExpression="FromDeadline" />
                        <asp:BoundField HeaderText="ToDeadline" DataField="ToDeadline" SortExpression="ToDeadline" />
                    </Columns>
                </asp:GridView>

 <button type="submit" class="form-control btn btn-primary submit px-3">Add Note</button> 
   <form class="example" action="action_page.php">
 <button type="submit" class="form-control btn btn-primary submit px-3">Assign Employee</button> 
   <form class="example" action="action_page.php">
 <button type="submit" class="form-control btn btn-primary submit px-3">Close Ticket</button> 




</div>

             
        </header>
      
          
    </body>
</html>


    <asp:SqlDataSource ID="dtasrcServiceTicketID" runat="server" 
        ConnectionString="<%$ ConnectionStrings:Lab3 %>" >
    </asp:SqlDataSource>

    <asp:SqlDataSource ID="dtasrcNotes" runat="server" 
        ConnectionString="<%$ ConnectionStrings:Lab3 %>" 
        SelectCommand="SELECT * FROM Notes WHERE ServiceTicketID = @ServiceTicketID" 
        UpdateCommand="UPDATE Notes SET NoteTitle=@NoteTitle, NoteContent=@NoteContent WHERE NoteID=@NoteID">
        <SelectParameters>
            <asp:ControlParameter name="ServiceTicketID" ControlID="grdTickets"/>
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter type="String" Name="NoteTitle"/>
            <asp:Parameter Type="String" Name="NoteContent"/>
        </UpdateParameters>
    </asp:SqlDataSource>

    <asp:SqlDataSource ID="dtasrcEmployee" runat="server"
        ConnectionString="<%$ ConnectionStrings:Lab3 %>"
        SelectCommand="SELECT EmployeeID, FirstName + ' ' + LastName + ' ' + Position AS NamePosition FROM Employee">
    </asp:SqlDataSource>



</asp:Content>
