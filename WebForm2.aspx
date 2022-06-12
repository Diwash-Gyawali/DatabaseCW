<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="WebForm2.aspx.cs" Inherits="DatabaseCw.WebForm2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1>Teacher</h1>
    <asp:GridView class="table" ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="PERSONID,TEACHER_ID" DataSourceID="SqlDataSource1">
        <Columns>
            <asp:TemplateField ShowHeader="False">
                <EditItemTemplate>
                    <asp:LinkButton class="btn btn-success" ID="LinkButton1" runat="server" CausesValidation="True" onClick="saveTeacher" Text="Update"></asp:LinkButton>
                    &nbsp;<asp:LinkButton class="btn btn-danger" ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel"></asp:LinkButton>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:LinkButton class="btn btn-info" ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit"></asp:LinkButton>
                    &nbsp;<asp:LinkButton class="btn btn-danger" ID="LinkButton2" runat="server" CausesValidation="False" onClick="delete" Text="Delete"></asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="PERSONID" SortExpression="PERSONID">
                <EditItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("PERSONID") %>'></asp:Label>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("PERSONID") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="PERSON_NAME" SortExpression="PERSON_NAME">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("PERSON_NAME") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("PERSON_NAME") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="EMAIL" SortExpression="EMAIL">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("EMAIL") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("EMAIL") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="DATE_OF_BIRTH" SortExpression="DATE_OF_BIRTH">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("DATE_OF_BIRTH") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label4" runat="server" Text='<%# Bind("DATE_OF_BIRTH") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="TEACHER_ID" SortExpression="TEACHER_ID">
                <EditItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("TEACHER_ID") %>'></asp:Label>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label5" runat="server" Text='<%# Bind("TEACHER_ID") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="SALARY" SortExpression="SALARY">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("SALARY") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label6" runat="server" Text='<%# Bind("SALARY") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM &quot;TEACHER&quot; WHERE &quot;TEACHER_ID&quot; = :TEACHER_ID" InsertCommand="INSERT INTO &quot;TEACHER&quot; (&quot;TEACHER_ID&quot;, &quot;SALARY&quot;) VALUES (:TEACHER_ID, :SALARY)" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="select person.*, teacher.* from person join teacher on person.personId = teacher.teacher_Id  where teacher.teacher_Id = person.personId" UpdateCommand="UPDATE &quot;TEACHER&quot; SET &quot;SALARY&quot; = :SALARY WHERE &quot;TEACHER_ID&quot; = :TEACHER_ID">
        <DeleteParameters>
            <asp:Parameter Name="TEACHER_ID" Type="Decimal" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="TEACHER_ID" Type="Decimal" />
            <asp:Parameter Name="SALARY" Type="Decimal" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="SALARY" Type="Decimal" />
            <asp:Parameter Name="TEACHER_ID" Type="Decimal" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:FormView ID="FormView1" runat="server" DataKeyNames="PERSONID,TEACHER_ID" DataSourceID="SqlDataSource2">
        <EditItemTemplate>
            PERSONID:
            <asp:Label ID="PERSONIDLabel1" runat="server" Text='<%# Eval("PERSONID") %>' />
            <br />
            PERSON_NAME:
            <asp:TextBox ID="PERSON_NAMETextBox" runat="server" Text='<%# Bind("PERSON_NAME") %>' />
            <br />
            EMAIL:
            <asp:TextBox ID="EMAILTextBox" runat="server" Text='<%# Bind("EMAIL") %>' />
            <br />
            DATE_OF_BIRTH:
            <asp:TextBox ID="DATE_OF_BIRTHTextBox" runat="server" Text='<%# Bind("DATE_OF_BIRTH") %>' />
            <br />
            TEACHER_ID:
            <asp:Label ID="TEACHER_IDLabel1" runat="server" Text='<%# Eval("TEACHER_ID") %>' />
            <br />
            SALARY:
            <asp:TextBox ID="SALARYTextBox" runat="server" Text='<%# Bind("SALARY") %>' />
            <br />
            <asp:LinkButton class="btn btn-success" ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
            &nbsp;<asp:LinkButton class="btn btn-danger" ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
        </EditItemTemplate>
        <InsertItemTemplate>
            PERSONID:
            <asp:TextBox ID="PERSONIDTextBox" runat="server" Text='<%# Bind("PERSONID") %>' />
            <br />
            PERSON_NAME:
            <asp:TextBox ID="PERSON_NAMETextBox" runat="server" Text='<%# Bind("PERSON_NAME") %>' />
            <br />
            EMAIL:
            <asp:TextBox ID="EMAILTextBox" runat="server" Text='<%# Bind("EMAIL") %>' />
            <br />
            DATE_OF_BIRTH:
            <asp:TextBox ID="DATE_OF_BIRTHTextBox" runat="server" Text='<%# Bind("DATE_OF_BIRTH") %>' />
            <br />
            TEACHER_ID:
            <asp:TextBox ID="TEACHER_IDTextBox" runat="server" Text='<%# Bind("TEACHER_ID") %>' />
            <br />
            SALARY:
            <asp:TextBox ID="SALARYTextBox" runat="server" Text='<%# Bind("SALARY") %>' />
            <br />
            <asp:LinkButton class="btn btn-success" ID="InsertButton" runat="server" CausesValidation="True" OnClick="insert" Text="Insert" />
            &nbsp;<asp:LinkButton class="btn btn-danger" ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
        </InsertItemTemplate>
        <ItemTemplate>
            PERSONID:
            <asp:Label ID="PERSONIDLabel" runat="server" Text='<%# Eval("PERSONID") %>' />
            <br />
            PERSON_NAME:
            <asp:Label ID="PERSON_NAMELabel" runat="server" Text='<%# Bind("PERSON_NAME") %>' />
            <br />
            EMAIL:
            <asp:Label ID="EMAILLabel" runat="server" Text='<%# Bind("EMAIL") %>' />
            <br />
            DATE_OF_BIRTH:
            <asp:Label ID="DATE_OF_BIRTHLabel" runat="server" Text='<%# Bind("DATE_OF_BIRTH") %>' />
            <br />
            TEACHER_ID:
            <asp:Label ID="TEACHER_IDLabel" runat="server" Text='<%# Eval("TEACHER_ID") %>' />
            <br />
            SALARY:
            <asp:Label ID="SALARYLabel" runat="server" Text='<%# Bind("SALARY") %>' />
            <br />
            <asp:LinkButton class="btn btn-info" ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit" />
&nbsp;<asp:LinkButton class="btn btn-danger" ID="DeleteButton" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete" />
&nbsp;<asp:LinkButton class="btn btn-warning" ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="New" />
        </ItemTemplate>
    </asp:FormView>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM &quot;PERSON&quot; WHERE &quot;PERSONID&quot; = :PERSONID" InsertCommand="INSERT INTO &quot;PERSON&quot; (&quot;PERSONID&quot;, &quot;PERSON_NAME&quot;, &quot;EMAIL&quot;, &quot;DATE_OF_BIRTH&quot;) VALUES (:PERSONID, :PERSON_NAME, :EMAIL, :DATE_OF_BIRTH)" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="select person.*, teacher.* from person join teacher on person.PersonId = teacher.Teacher_Id  where teacher.Teacher_Id = person.PersonId" UpdateCommand="UPDATE &quot;PERSON&quot; SET &quot;PERSON_NAME&quot; = :PERSON_NAME, &quot;EMAIL&quot; = :EMAIL, &quot;DATE_OF_BIRTH&quot; = :DATE_OF_BIRTH WHERE &quot;PERSONID&quot; = :PERSONID">
        <DeleteParameters>
            <asp:Parameter Name="PERSONID" Type="Decimal" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="PERSONID" Type="Decimal" />
            <asp:Parameter Name="PERSON_NAME" Type="String" />
            <asp:Parameter Name="EMAIL" Type="String" />
            <asp:Parameter Name="DATE_OF_BIRTH" Type="DateTime" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="PERSON_NAME" Type="String" />
            <asp:Parameter Name="EMAIL" Type="String" />
            <asp:Parameter Name="DATE_OF_BIRTH" Type="DateTime" />
            <asp:Parameter Name="PERSONID" Type="Decimal" />
        </UpdateParameters>
    </asp:SqlDataSource>
</asp:Content>
