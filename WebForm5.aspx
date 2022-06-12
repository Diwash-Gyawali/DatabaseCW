<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="WebForm5.aspx.cs" Inherits="DatabaseCw.WebForm5" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   <h1>Module_Assignment</h1>
<asp:GridView ID="GridView2" runat="server" DataSourceID="SqlDataSource4" AutoGenerateColumns="False" DataKeyNames="PERSONID,STUDENT_ID,MODULE_CODE,ASSIGNMENT_ID,MODULE_CODE1,ASSIGNMENT_ID1">
    <Columns>
        <asp:BoundField DataField="PERSONID" HeaderText="PERSONID" ReadOnly="True" SortExpression="PERSONID" />
        <asp:BoundField DataField="PERSON_NAME" HeaderText="PERSON_NAME" SortExpression="PERSON_NAME" />
        <asp:BoundField DataField="EMAIL" HeaderText="EMAIL" SortExpression="EMAIL" />
        <asp:BoundField DataField="DATE_OF_BIRTH" HeaderText="DATE_OF_BIRTH" SortExpression="DATE_OF_BIRTH" />
        <asp:BoundField DataField="STUDENT_ID" HeaderText="STUDENT_ID" ReadOnly="True" SortExpression="STUDENT_ID" />
        <asp:BoundField DataField="MODULE_CODE" HeaderText="MODULE_CODE" ReadOnly="True" SortExpression="MODULE_CODE" />
        <asp:BoundField DataField="ASSIGNMENT_ID" HeaderText="ASSIGNMENT_ID" ReadOnly="True" SortExpression="ASSIGNMENT_ID" />
        <asp:BoundField DataField="GRADE" HeaderText="GRADE" SortExpression="GRADE" />
        <asp:BoundField DataField="STATUS" HeaderText="STATUS" SortExpression="STATUS" />
        <asp:BoundField DataField="MODULE_CODE1" HeaderText="MODULE_CODE1" ReadOnly="True" SortExpression="MODULE_CODE1" />
        <asp:BoundField DataField="MODULE_NAME" HeaderText="MODULE_NAME" SortExpression="MODULE_NAME" />
        <asp:BoundField DataField="CREDIT_HOURS" HeaderText="CREDIT_HOURS" SortExpression="CREDIT_HOURS" />
        <asp:BoundField DataField="ASSIGNMENT_ID1" HeaderText="ASSIGNMENT_ID1" ReadOnly="True" SortExpression="ASSIGNMENT_ID1" />
        <asp:BoundField DataField="DEPARTMENT_ID" HeaderText="DEPARTMENT_ID" SortExpression="DEPARTMENT_ID" />
        <asp:BoundField DataField="ASSIGNMENT_TYPE" HeaderText="ASSIGNMENT_TYPE" SortExpression="ASSIGNMENT_TYPE" />
    </Columns>
</asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="select person.*, module_assignment.*, module.*, assignment.* from module_assignment join student on module_assignment.student_id = student.student_id join person on student.student_id = person.personId join module on module_assignment.module_code = module.module_code join assignment on module_assignment.assignment_id = assignment.assignment_id where person.personId = :PERSONID">
        <SelectParameters>
            <asp:ControlParameter ControlID="DropDownList1" Name="PERSONID" PropertyName="SelectedValue" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource3" DataTextField="PERSON_NAME" DataValueField="PERSONID">
    </asp:DropDownList>
    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="select person.personId, person.person_name from person join student on person.personId = student.student_id"></asp:SqlDataSource>
</asp:Content>
