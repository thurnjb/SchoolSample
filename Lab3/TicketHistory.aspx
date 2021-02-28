﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="TicketHistory.aspx.cs" Inherits="Lab3.TicketHistory" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!-- Jay Thurn, Ryan Booth, John Lee
    We have neither given nor received any unauthorized assistance on this assignment-->
    <br />
    <asp:Button ID="btnViewHomePage" runat="server" Text="View Home Page" OnClick="btnViewHomePage_Click" />
    <fieldset>
        <legend>All Tickets</legend>
        <asp:Table ID="Table2" runat="server" HorizontalAlign="Left">
            <asp:TableRow>
                <asp:TableCell>
                    <asp:Button ID="btnRefresh" runat="server" Text="Refresh" OnClick="btnRefresh_Click" />
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell>
                    <asp:GridView ID="grdTickets" runat="server"
                        AutoGenerateEditButton="true"
                        DataKeyNames="ServiceTicketID"
                        DataSourceID="dtasrcServiceTicketID"
                        AutoGenerateColumns="false"
                        AllowSorting="true">
                        <Columns>
                            <asp:BoundField ReadOnly="true" HeaderText="CustomerName" DataField="CustomerName" SortExpression="CustomerName" />
                            <asp:BoundField ReadOnly="true" HeaderText="EmployeeName" DataField="EmployeeName" SortExpression="EmployeeName" />
                            <asp:BoundField ReadOnly="true" HeaderText="ServiceType" DataField="ServiceType" SortExpression="ServiceType" />
                            <asp:BoundField HeaderText="TicketStatus" DataField="TicketStatus" SortExpression="TicketStatus" />
                            <asp:BoundField HeaderText="TicketOpenDate" DataField="TicketOpenDate" SortExpression="TicketOpenDate" />
                            <asp:BoundField HeaderText="FromDeadline" DataField="FromDeadline" SortExpression="FromDeadline" />
                            <asp:BoundField HeaderText="ToDeadline" DataField="ToDeadline" SortExpression="ToDeadline" />
                        </Columns>
                    </asp:GridView>
                </asp:TableCell>
            </asp:TableRow>
        </asp:Table>
    </fieldset>
    <asp:Table ID="Table1" runat="server" Height="100px">
        <asp:TableRow>
            <asp:TableCell>
                <asp:DropDownList ID="ddlServiceTicketID" runat="server"
                    AutoPostBack="true"
                    DataSourceID="dtasrcServiceTicketID"
                    DataTextField="NameDate"
                    DataValueField="ServiceTicketID">
                </asp:DropDownList>
            </asp:TableCell>
            <asp:TableCell>
                <asp:Button ID="btnViewTicketDetails" runat="server" Text="View Ticket Details" OnClick="btnViewTicketDetails_Click" />
            </asp:TableCell>
            <asp:TableCell>
                <asp:Button ID="btnAssignEmployee" runat="server" Text="Assign New Employee" OnClick="btnAssignEmployee_Click" />
            </asp:TableCell>
        </asp:TableRow>
    </asp:Table>
    <fieldset>
        <legend>Selected Ticket Details</legend>
        <asp:Table ID="tblDetails" runat="server">
            <asp:TableRow>
                <asp:TableCell>
                    <asp:GridView ID="grdSelectedTicket" runat="server"
                        EmptyDataText="This ticket has no notes!">
                    </asp:GridView>
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell>
                    <asp:GridView ID="grdAuction" runat="server"
                        EmptyDataText="This ticket has no auction!">
                    </asp:GridView>
                </asp:TableCell>
            </asp:TableRow>
        </asp:Table>
    </fieldset>
    <fieldset>
        <legend>Selected Ticket History</legend>
        <asp:GridView ID="grdSelectedTicketHistory" runat="server"
            EmptyDataText="This ticket has no history!">
        </asp:GridView>
    </fieldset>
    <asp:Table ID="tblNoteBtn" runat="server" HorizontalAlign="Left">
        <asp:TableRow>
            <asp:TableCell>
                <asp:Button ID="btnAddNote" runat="server" Text="Add Note:" OnClick="btnAddNote_Click" />
            </asp:TableCell>
            <asp:TableCell>
                <asp:Button ID="btnAssignAuction" runat="server" Text="Assign to Auction:" OnClick="btnAssignAuction_Click1" />
            </asp:TableCell>
        </asp:TableRow>
    </asp:Table>

    <asp:SqlDataSource ID="dtasrcServiceTicketID" runat="server"
        ConnectionString="<%$ ConnectionStrings:Lab3 %>"
        SelectCommand="SELECT T.ServiceTicketID, C.FirstName + ' ' + C.LastName as CustomerName, E.FirstName + ' ' + E.LastName as EmployeeName, S.ServiceType, T.TicketStatus, T.TicketOpenDate, T.FromDeadline, T.ToDeadline, C.FirstName + ' ' + C.LastName + '-' + CONVERT(varchar(255), T.TicketOpenDate) NameDate FROM Customer C, Employee E, Service S, ServiceTicket T WHERE T.CustomerID = C.CustomerID AND T.InitiatingEmployeeID = E.EmployeeID AND T.ServiceID = S.ServiceID"
        UpdateCommand="UPDATE ServiceTicket SET TicketStatus=@TicketStatus, TicketOpenDate=@TicketOpenDate, FromDeadline=@FromDeadline, ToDeadline=@ToDeadline WHERE ServiceTicketID=@ServiceTicketID">
        <UpdateParameters>
            <asp:Parameter Type="String" Name="TicketStatus" />
            <asp:Parameter Type="DateTime" Name="TicketOpenDate" />
            <asp:Parameter Type="String" Name="FromDeadline" />
            <asp:Parameter Type="String" Name="ToDeadline" />
        </UpdateParameters>
    </asp:SqlDataSource>
</asp:Content>
