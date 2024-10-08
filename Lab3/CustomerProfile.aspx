﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="CustomerProfile.aspx.cs" Inherits="Lab3.CustomerProfile" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <
    <asp:Table ID="Table1" runat="server">
        <asp:TableRow>
            <asp:TableCell>
              <input id="oFile" type="file" runat="server" name="oFile" />
                <asp:Label ID="lblImageUpload" runat="server" Text=""></asp:Label>       
            </asp:TableCell>
            <asp:TableCell>
                <asp:Button ID="btnUpload" runat="server" Text="Add Profile Picture" OnClick="btnUpload_Click" />
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell>
                <asp:Label ID="lblCustomerFirstName" runat="server" Text="First Name: "></asp:Label>
            </asp:TableCell>
            <asp:TableCell>
                <asp:TextBox ID="txtCustomerFirstName" runat="server"></asp:TextBox>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell>
                <asp:Label ID="lblCustomerLastName" runat="server" Text="Last Name: "></asp:Label>
            </asp:TableCell>
            <asp:TableCell>
                <asp:TextBox ID="txtCustomerLastName" runat="server"></asp:TextBox>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell>
                <asp:Label ID="lblInitialContact" runat="server" Text="InitialContact"></asp:Label>
            </asp:TableCell>
            <asp:TableCell>
                <asp:TextBox ID="txtInitialContact" runat="server"></asp:TextBox>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell>
                <asp:Label ID="lblPhone" runat="server" Text="Phone: "></asp:Label>
            </asp:TableCell>
            <asp:TableCell>
                <asp:TextBox ID="txtPhone" runat="server"></asp:TextBox>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell>
                <asp:Label ID="lblAddress" runat="server" Text="Address: "></asp:Label>
            </asp:TableCell>
            <asp:TableCell>
                <asp:TextBox ID="txtAddress" runat="server"></asp:TextBox>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell>
                <asp:Label ID="lblEmail" runat="server" Text="Email: "></asp:Label>
            </asp:TableCell>
            <asp:TableCell>
                <asp:TextBox ID="txtEmail" runat="server"></asp:TextBox>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell>
                <asp:Label ID="lblHeardFrom" runat="server" Text="How did you hear about us?"></asp:Label>
            </asp:TableCell>
            <asp:TableCell>
                <asp:TextBox ID="txtHeardFrom" runat="server"></asp:TextBox>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell>
                <asp:Button ID="btnSave" runat="server" Text="Save" OnClick="btnSave_Click" />
            </asp:TableCell>
            <asp:TableCell>
                <asp:Button ID="btnViewTickets" runat="server" Text="View Tickets" OnClick="btnViewTickets_Click" />
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell>
                <asp:Button ID="btnScheduleLookAt" runat="server" Text="Schedule Look At" OnClick="btnScheduleLookAt_Click" />
            </asp:TableCell>
            <asp:TableCell>
                <asp:Button ID="btnCreateMove" runat="server" Text="Create Move" OnClick="btnCreateMove_Click"  />
            </asp:TableCell>
            <asp:TableCell>
                <asp:Button ID="btnCreateAuction" runat="server" Text="Create Auction" OnClick="btnCreateAuction_Click" />
            </asp:TableCell>
        </asp:TableRow>
        
    </asp:Table>


</asp:Content>
