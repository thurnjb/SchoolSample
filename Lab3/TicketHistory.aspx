﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="TicketHistory.aspx.cs" Inherits="Lab3.TicketHistory" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!-- Jay Thurn, Ryan Booth, John Lee
    We have neither given nor received any unauthorized assistance on this assignment-->
    <br />
    <asp:Button ID="btnViewHomePage" runat="server" Text="View Home Page" OnClick="btnViewHomePage_Click" />
    <asp:Table ID="Table3" runat="server" HorizontalAlign="Center">
        <asp:TableRow>
            <asp:TableCell HorizontalAlign="Center">
                <asp:Label ID="lblEditTicketPage" runat="server" Text="Ticket Editing Page" Font-Bold="true"></asp:Label>
            </asp:TableCell>
        </asp:TableRow>
    </asp:Table>
        <asp:Table ID="Table2" runat="server" HorizontalAlign="Left">
            <asp:TableRow>
                <asp:TableCell HorizontalAlign="Left" ColumnSpan="2">
                    <asp:Label ID="lblTickets" runat="server" Text="All Tickets:"></asp:Label>
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell>
                    <asp:Button ID="btnRefresh" runat="server" Text="Refresh" OnClick="btnRefresh_Click" />
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell>
                    <asp:GridView ID="grdTickets" runat="server"
                        DataSourceID="dtasrcServiceTicketID"
                        DataKeyNames="ServiceTicketID"
                        AutoGenerateSelectButton="true"
                        AllowSorting="true"
                        AutoGenerateColumns="false"
                        OnSelectedIndexChanged="grdTickets_SelectedIndexChanged">
                        <Columns>
                            <asp:BoundField HeaderText="CustomerName" DataField="CustomerName" SortExpression="CustomerName" />
                            <asp:BoundField HeaderText="EmployeeName" DataField="EmployeeName" SortExpression="EmployeeName" />
                            <asp:BoundField HeaderText="ServiceType" DataField="ServiceType" SortExpression="ServiceType" />
                            <asp:BoundField HeaderText="TicketStatus" DataField="TicketStatus" SortExpression="TicketStatus" />
                            <asp:BoundField HeaderText="TicketOpenDate" DataField="TicketOpenDate" SortExpression="TicketOpenDate" />
                            <asp:BoundField HeaderText="FromDeadline" DataField="FromDeadline" SortExpression="FromDeadline" />
                            <asp:BoundField HeaderText="ToDeadline" DataField="ToDeadline" SortExpression="ToDeadline" />
                            <asp:BoundField HeaderText="LookAt" DataField="LookAt" SortExpression="LookAt" />
                            <asp:BoundField HeaderText="PickUp" DataField="PickUp" SortExpression="PickUp" />
                            <asp:TemplateField>
                                <ItemTemplate>
                                    <asp:HiddenField ID="hdnEmployee" runat="server" Value='<%#Eval("InitiatingEmployeeID")%>' />
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                    <br />
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell HorizontalAlign="Left" ColumnSpan="2">
                    <asp:Label ID="lblEditTicket" runat="server" Text="Edit selected ticket:"></asp:Label>
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell>
                    <asp:DetailsView ID="dtlVwEditTicket" runat="server" Height="50px" Width="125px"
                        DefaultMode="Edit"
                        EmptyDataText="This ticket has no notes!"
                        AutoGenerateEditButton="true"
                        AutoGenerateDeleteButton="true"
                        AutoGenerateRows="false"
                        DataKeyNames="ServiceTicketID"
                        DataSourceID="dtasrcUpdateTicket"
                        OnItemUpdated="dtlVwEditTicket_ItemUpdated"
                        OnModeChanging="dtlVwEditTicket_ModeChanging">
                        <Fields>
                            <asp:BoundField ReadOnly="true" HeaderText="CustomerName" DataField="CustomerName" SortExpression="CustomerName" />
                            <asp:BoundField ReadOnly="true" HeaderText="EmployeeName" DataField="EmployeeName" SortExpression="EmployeeName" />
                            <asp:BoundField ReadOnly="true" HeaderText="ServiceType" DataField="ServiceType" SortExpression="ServiceType" />
                            <asp:BoundField HeaderText="TicketStatus" DataField="TicketStatus" SortExpression="TicketStatus" />
                            <asp:BoundField HeaderText="TicketOpenDate" DataField="TicketOpenDate" SortExpression="TicketOpenDate" />
                            <asp:BoundField HeaderText="FromDeadline" DataField="FromDeadline" SortExpression="FromDeadline" />
                            <asp:BoundField HeaderText="ToDeadline" DataField="ToDeadline" SortExpression="ToDeadline" />
                            <asp:BoundField HeaderText="LookAt" DataField="LookAt" SortExpression="LookAt" />
                            <asp:BoundField HeaderText="PickUp" DataField="PickUp" SortExpression="PickUp" />
                        </Fields>
                    </asp:DetailsView>
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell HorizontalAlign="Left" ColumnSpan="2">
                    <asp:Label ID="lblEditNotes" runat="server" Text="Edit notes:"></asp:Label>
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell>
                    <asp:DetailsView ID="dtlVwTicketNotes" runat="server" Height="50px" Width="250px"
                        AllowPaging="true"
                        DataKeyNames="NoteID"
                        AutoGenerateRows="false"
                        AutoGenerateEditButton="true"
                        OnModeChanging="dtlVwTicketNotes_ModeChanging"
                        DataSourceID="dtasrcNotes">
                        <Fields>
                            <asp:BoundField HeaderText="NoteTitle" DataField="NoteTitle" />
                            <asp:BoundField HeaderText="NoteContent" DataField="NoteContent" />
                        </Fields>
                    </asp:DetailsView>
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell HorizontalAlign="Left" ColumnSpan="2">
                    <asp:Label ID="lblHistory" runat="server" Text="Ticket History:"></asp:Label>
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell>
                    <asp:GridView ID="grdSelectedTicketHistory" runat="server"
                        EmptyDataText="This ticket has no history!"
                        DataSourceID="dtasrcHistory"
                        DataKeyNames="TicketHistoryID"
                        AutoGenerateColumns="false">
                        <Columns>
                            <asp:BoundField HeaderText="EmployeeContact" DataField="EmployeeContact" />
                            <asp:BoundField HeaderText="TicketChangeDate" DataField="TicketChangeDate" />
                            <asp:BoundField HeaderText="DetailsNote" DataField="DetailsNote" />
                        </Columns>
                    </asp:GridView>
                </asp:TableCell>
            </asp:TableRow>
        </asp:Table>
    <asp:Table ID="Table1" runat="server" Height="100px">
        <asp:TableRow>
            
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell>
                <asp:DropDownList ID="ddlEmployee" runat="server"
                    AutoPostBack="true"
                    DataSourceID="dtasrcEmployee"
                    DataTextField="NamePosition"
                    DataValueField="EmployeeID"
                    Visible="false">
                </asp:DropDownList>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell>
                <asp:Button ID="btnEmployeeCancel" runat="server" Text="Cancel" OnClick="btnEmployeeCancel_Click" Visible="false" />
            </asp:TableCell>
            <asp:TableCell>
                <asp:Button ID="btnEmployeeSave" runat="server" Text="Save" OnClick="btnEmployeeSave_Click" Visible="false" />
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell>
                <asp:Label ID="lblErrorMsg" runat="server" Text=""></asp:Label>
            </asp:TableCell>
        </asp:TableRow>
    </asp:Table>
    <asp:Table ID="tblButtons" runat="server" HorizontalAlign="Left">
        <asp:TableRow>
            <asp:TableCell>
                <asp:Button ID="btnAddNote" runat="server" Text="Add Note:" OnClick="btnAddNote_Click" />
            </asp:TableCell>
            <asp:TableCell>
                <asp:Button ID="btnAssignEmployee" runat="server" Text="Assign New Employee" OnClick="btnAssignEmployee_Click" />
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell>
                <asp:Label ID="lblNoteTitle" runat="server" Text="Note Title:" Visible="false"></asp:Label>
            </asp:TableCell>
            <asp:TableCell>
                <asp:TextBox ID="txtNoteTitle" runat="server" Visible="false"></asp:TextBox>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell>
                <asp:Label ID="lblNoteContent" runat="server" Text="Note Content:" Visible="false"></asp:Label>
            </asp:TableCell>
            <asp:TableCell>
                <asp:TextBox ID="txtNoteContent" runat="server" Height="300px" Width="300px" TextMode="MultiLine" Visible="false"></asp:TextBox>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell>
                <asp:Button ID="btnNoteCancel" runat="server" Text="Cancel" OnClick="btnNoteCancel_Click" Visible="false" />
            </asp:TableCell>
            <asp:TableCell>
                <asp:Button ID="btnNoteSave" runat="server" Text="Save Note" OnClick="btnNoteSave_Click" Visible="false" />
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell>
                <asp:Label ID="lblNoteErrorMsg" runat="server" Text=""></asp:Label>
            </asp:TableCell>
        </asp:TableRow>
    </asp:Table>

    <asp:SqlDataSource ID="dtasrcServiceTicketID" runat="server"
        ConnectionString="<%$ ConnectionStrings:Lab3 %>"
        SelectCommand="SELECT T.ServiceTicketID, C.FirstName + ' ' + C.LastName as CustomerName, E.FirstName + ' ' + E.LastName as EmployeeName, S.ServiceType, T.TicketStatus, T.TicketOpenDate, T.FromDeadline, T.ToDeadline, T.InitiatingEmployeeID, T.LookAt, T.PickUp FROM Customer C, Employee E, Service S, ServiceTicket T WHERE T.CustomerID = C.CustomerID AND T.InitiatingEmployeeID = E.EmployeeID AND T.ServiceID = S.ServiceID"></asp:SqlDataSource>
    <asp:SqlDataSource ID="dtasrcUpdateTicket" runat="server"
        ConnectionString="<%$ ConnectionStrings:Lab3 %>"
        SelectCommand="SELECT T.ServiceTicketID, C.FirstName + ' ' + C.LastName as CustomerName, E.FirstName + ' ' + E.LastName as EmployeeName, S.ServiceType, T.TicketStatus, T.TicketOpenDate, T.FromDeadline, T.ToDeadline, T.InitiatingEmployeeID, T.LookAt, T.PickUp FROM Customer C, Employee E, Service S, ServiceTicket T WHERE T.CustomerID = C.CustomerID AND T.InitiatingEmployeeID = E.EmployeeID AND T.ServiceID = S.ServiceID AND T.ServiceTicketID=@ServiceTicketID"
        UpdateCommand="UPDATE ServiceTicket SET TicketStatus=@TicketStatus, TicketOpenDate=@TicketOpenDate, FromDeadline=@FromDeadline, ToDeadline=@ToDeadline, LookAt=@LookAt, PickUp=@PickUp WHERE ServiceTicketID=@ServiceTicketID">
        <SelectParameters>
            <asp:ControlParameter Name="ServiceTicketID" ControlID="grdTickets" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Type="String" Name="TicketStatus" />
            <asp:Parameter Type="DateTime" Name="TicketOpenDate" />
            <asp:Parameter Type="DateTime" Name="FromDeadline" />
            <asp:Parameter Type="DateTime" Name="ToDeadline" />
            <asp:Parameter Type="DateTime" Name="LookAt" />
            <asp:Parameter Type="DateTime" Name="PickUp" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="dtasrcNotes" runat="server" ConnectionString="<%$ ConnectionStrings:Lab3 %>"
        SelectCommand="SELECT * FROM Notes WHERE ServiceTicketID = @ServiceTicketID"
        UpdateCommand="UPDATE Notes SET NoteTitle=@NoteTitle, NoteContent=@NoteContent WHERE NoteID=@NoteID">
        <SelectParameters>
            <asp:ControlParameter Name="ServiceTicketID" ControlID="grdTickets" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Type="String" Name="NoteTitle" />
            <asp:Parameter Type="String" Name="NoteContent" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="dtasrcHistory" runat="server"
        ConnectionString="<%$ ConnectionStrings:Lab3 %>"
        SelectCommand="SELECT T.TicketHistoryID, T.ServiceTicketID, E.FirstName + ' ' + E.LastName as EmployeeContact, T.TicketChangeDate, T.DetailsNote FROM TicketHistory T, Employee E WHERE T.EmployeeID = E.EmployeeID AND T.ServiceTicketID=@ServiceTicketID">
        <SelectParameters>
            <asp:ControlParameter Name="ServiceTicketID" ControlID="grdTickets" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="dtasrcEmployee" runat="server"
        ConnectionString="<%$ ConnectionStrings:Lab3 %>"
        SelectCommand="SELECT EmployeeID, FirstName + ' ' + LastName + ' ' + Position AS NamePosition FROM Employee">
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server"></asp:SqlDataSource>
</asp:Content>
