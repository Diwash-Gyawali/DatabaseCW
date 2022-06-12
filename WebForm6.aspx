<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="WebForm6.aspx.cs" Inherits="DatabaseCw.WebForm6" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1>Fee</h1>
<asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataKeyNames="PERSONID,FEE_ID,DEPARTMENT_ID1" DataSourceID="SqlDataSource2">
    <Columns>
        <asp:BoundField DataField="PERSONID" HeaderText="PERSONID" ReadOnly="True" SortExpression="PERSONID" />
        <asp:BoundField DataField="PERSON_NAME" HeaderText="PERSON_NAME" SortExpression="PERSON_NAME" />
        <asp:BoundField DataField="EMAIL" HeaderText="EMAIL" SortExpression="EMAIL" />
        <asp:BoundField DataField="DATE_OF_BIRTH" HeaderText="DATE_OF_BIRTH" SortExpression="DATE_OF_BIRTH" />
        <asp:BoundField DataField="FEE_ID" HeaderText="FEE_ID" ReadOnly="True" SortExpression="FEE_ID" />
        <asp:BoundField DataField="STUDENT_ID" HeaderText="STUDENT_ID" SortExpression="STUDENT_ID" />
        <asp:BoundField DataField="DEPARTMENT_ID" HeaderText="DEPARTMENT_ID" SortExpression="DEPARTMENT_ID" />
        <asp:BoundField DataField="AMOUNT" HeaderText="AMOUNT" SortExpression="AMOUNT" />
        <asp:BoundField DataField="DEPARTMENT_ID1" HeaderText="DEPARTMENT_ID1" ReadOnly="True" SortExpression="DEPARTMENT_ID1" />
        <asp:BoundField DataField="DEPARTMENT_NAME" HeaderText="DEPARTMENT_NAME" SortExpression="DEPARTMENT_NAME" />
    </Columns>
</asp:GridView>
<asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="select person.*, fee.*, department.*  from fee join student on fee.student_Id = student.student_Id join person on student.student_id = person.personId join department on fee.department_Id = department.department_Id where person.personId = :PERSONID">
    <SelectParameters>
        <asp:ControlParameter ControlID="DropDownList1" Name="PERSONID" PropertyName="SelectedValue" />
    </SelectParameters>
    </asp:SqlDataSource>
    <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource3" DataTextField="PERSON_NAME" DataValueField="PERSONID">
    </asp:DropDownList>
    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="select person.personId, person.person_name from person join student on person.personId = student.student_id"></asp:SqlDataSource>
</asp:Content>
