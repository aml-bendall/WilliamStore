<%@ Page Language="VB" MasterPageFile="~/wsc.master" AutoEventWireup="false" CodeFile="Login.aspx.vb" Inherits="Login" title="Login Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    <h1>Login</h1>
    <p>
        Username:
        <asp:TextBox ID="UserName" runat="server"></asp:TextBox></p>
    <p>
        Password:
        <asp:TextBox ID="Password" runat="server" TextMode="Password"></asp:TextBox></p>
    <p>
        <asp:CheckBox ID="RememberMe" runat="server" Text="Remember Me" />&nbsp;</p>
    <p>
        <asp:Button ID="LoginButton" runat="server" Text="Login" OnClick="LoginButton_Click" />&nbsp;</p>
    <p>
        <asp:Label ID="InvalidCredentialsMessage" runat="server" ForeColor="Red" Text="Your username or password is invalid. Please try again."
            Visible="False"></asp:Label>&nbsp;</p>
</asp:Content>

<asp:Content ID="Content2" runat="server" contentplaceholderid="LoginContent">
</asp:Content>

