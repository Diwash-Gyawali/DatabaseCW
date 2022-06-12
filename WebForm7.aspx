<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="WebForm7.aspx.cs" Inherits="DatabaseCw.WebForm7" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1>Teacher_Module</h1>
<asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataKeyNames="PERSONID,MODULE_CODE" DataSourceID="SqlDataSource2">
    <Columns>
        <asp:BoundField DataField="PERSONID" HeaderText="PERSONID" ReadOnly="True" SortExpression="PERSONID" />
        <asp:BoundField DataField="PERSON_NAME" HeaderText="PERSON_NAME" SortExpression="PERSON_NAME" />
        <asp:BoundField DataField="EMAIL" HeaderText="EMAIL" SortExpression="EMAIL" />
        <asp:BoundField DataField="DATE_OF_BIRTH" HeaderText="DATE_OF_BIRTH" SortExpression="DATE_OF_BIRTH" />
        <asp:BoundField DataField="MODULE_CODE" HeaderText="MODULE_CODE" ReadOnly="True" SortExpression="MODULE_CODE" />
        <asp:BoundField DataField="MODULE_NAME" HeaderText="MODULE_NAME" SortExpression="MODULE_NAME" />
        <asp:BoundField DataField="CREDIT_HOURS" HeaderText="CREDIT_HOURS" SortExpression="CREDIT_HOURS" />
    </Columns>
</asp:GridView>
<asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="select person.*, module.*  from teacher_module  join teacher on teacher_module.teacher_id = teacher.teacher_id join person on teacher.teacher_id = person.personId join module on teacher_module.module_code =module.module_code where person.personId = :PERSONID">
    <SelectParameters>
        <asp:ControlParameter ControlID="DropDownList1" Name="PERSONID" PropertyName="SelectedValue" />
    </SelectParameters>
    </asp:SqlDataSource>
    <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource3" DataTextField="PERSON_NAME" DataValueField="PERSONID">
    </asp:DropDownList>
    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="select person.personId, person.person_name from person join teacher on person.personId = teacher.teacher_id"></asp:SqlDataSource>
</asp:Content>
