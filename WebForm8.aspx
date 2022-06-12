<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="WebForm8.aspx.cs" Inherits="DatabaseCw.WebForm8" %>
<%@ Register assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" namespace="System.Web.UI.DataVisualization.Charting" tagprefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1>Home</h1>
    <h5> This graph represents the total number of individuals who live at a certain address.</h5>
    <asp:Chart ID="Chart1" runat="server" DataSourceID="SqlDataSource1">
    <series>
        <asp:Series Name="Series1" XValueMember="ADDRESS" YValueMembers="COUNT(PERSON.PERSONID)">
        </asp:Series>
    </series>
    <chartareas>
        <asp:ChartArea Name="ChartArea1">
        </asp:ChartArea>
    </chartareas>
</asp:Chart>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="select address.address, count(person.personId) from address join person_address on address.address_id = person_address.address_id join person on person_address.person_Id = person.personId group by address.address"></asp:SqlDataSource>
</asp:Content>
