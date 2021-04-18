﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="LookAtConfirmation.aspx.cs" Inherits="Lab3.LookAtConfirmation" %>
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
        <style>
            .mobile-wrapper {
                color: black;
            }
        </style>
    </head>
    <body>
        <header class="masthead bg-primary text-black text-center">
            <div class="container d-flex align-items-center flex-column">
                <img class="masthead-avatar mb-5" <img src="images/greenvalleyauctions.jpeg" alt="Green Valley Auctions Logo" width="300">
    <asp:Table ID="Table1" runat="server">
        <asp:TableRow>
            <asp:TableCell>
                <asp:Label ID="lblLookAtConfirm" runat="server" Text="Look At Confirmation Page"></asp:Label>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell>
                <asp:Label ID="lblNotification" runat="server" Text="Notification Selected:"></asp:Label>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell>
                <asp:GridView ID="grdNotification" runat="server" AutoGenerateColumns="false" DataKeyNames="ID">
                    <Columns>
                        <asp:BoundField HeaderText="CustomerName" DataField="CustomerName" />
                        <asp:BoundField HeaderText="PotentialDates" DataField="PotentialDates" />
                        <asp:BoundField HeaderText="SaveDate" DataField="SaveDate" />
                    </Columns> 
                </asp:GridView>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell>
                <asp:Calendar ID="Calendar1" runat="server" DayNameFormat="Shortest" OnSelectionChanged="Calendar1_SelectionChanged"></asp:Calendar>
            </asp:TableCell>
            <asp:TableCell>
                <asp:TextBox ID="txtSelectedDate" runat="server"></asp:TextBox>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell>
                <asp:Button ID="btnConfirmDate" runat="server" Text="Confirm" OnClick="btnConfirmDate_Click" />
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell>
                <asp:Label ID="lblErrorMsg" runat="server" Text=""></asp:Label>
            </asp:TableCell>
        </asp:TableRow>
    </asp:Table>
</body>
</html>
</asp:Content>
