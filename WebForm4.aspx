<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="WebForm4.aspx.cs" Inherits="DatabaseCw.WebForm4" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   <h1>Module</h1>
    <asp:GridView class="table" ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="MODULE_CODE" DataSourceID="SqlDataSource1">
        <Columns>
            <asp:TemplateField ShowHeader="False">
                <EditItemTemplate>
                    <asp:LinkButton class="btn btn-success" ID="LinkButton1" runat="server" CausesValidation="True" CommandName="Update" Text="Update"></asp:LinkButton>
                    &nbsp;<asp:LinkButton class="btn btn-danger" ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel"></asp:LinkButton>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:LinkButton class="btn btn-info" ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit"></asp:LinkButton>
                    &nbsp;<asp:LinkButton class="btn btn-danger" ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete"></asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="MODULE_CODE" SortExpression="MODULE_CODE">
                <EditItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("MODULE_CODE") %>'></asp:Label>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("MODULE_CODE") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="MODULE_NAME" SortExpression="MODULE_NAME">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("MODULE_NAME") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("MODULE_NAME") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="CREDIT_HOURS" SortExpression="CREDIT_HOURS">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("CREDIT_HOURS") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("CREDIT_HOURS") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM &quot;MODULE&quot; WHERE &quot;MODULE_CODE&quot; = :MODULE_CODE" InsertCommand="INSERT INTO &quot;MODULE&quot; (&quot;MODULE_CODE&quot;, &quot;MODULE_NAME&quot;, &quot;CREDIT_HOURS&quot;) VALUES (:MODULE_CODE, :MODULE_NAME, :CREDIT_HOURS)" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT * FROM &quot;MODULE&quot;" UpdateCommand="UPDATE &quot;MODULE&quot; SET &quot;MODULE_NAME&quot; = :MODULE_NAME, &quot;CREDIT_HOURS&quot; = :CREDIT_HOURS WHERE &quot;MODULE_CODE&quot; = :MODULE_CODE">
        <DeleteParameters>
            <asp:Parameter Name="MODULE_CODE" Type="String" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="MODULE_CODE" Type="String" />
            <asp:Parameter Name="MODULE_NAME" Type="String" />
            <asp:Parameter Name="CREDIT_HOURS" Type="Decimal" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="MODULE_NAME" Type="String" />
            <asp:Parameter Name="CREDIT_HOURS" Type="Decimal" />
            <asp:Parameter Name="MODULE_CODE" Type="String" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:FormView ID="FormView1" runat="server" DataKeyNames="MODULE_CODE" DataSourceID="SqlDataSource2">
        <EditItemTemplate>
            MODULE_CODE:
            <asp:Label ID="MODULE_CODELabel1" runat="server" Text='<%# Bind("MODULE_CODE") %>' />
            <br />
            MODULE_NAME:
            <asp:TextBox ID="MODULE_NAMETextBox" runat="server" Text='<%# Bind("MODULE_NAME") %>' />
            <br />
            CREDIT_HOURS:
            <asp:TextBox ID="CREDIT_HOURSTextBox" runat="server" Text='<%# Bind("CREDIT_HOURS") %>' />
            <br />
            <asp:LinkButton class="btn btn-success" ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
            &nbsp;<asp:LinkButton class="btn btn-danger" ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
        </EditItemTemplate>
        <InsertItemTemplate>
            MODULE_CODE:
            <asp:TextBox ID="MODULE_CODETextBox" runat="server" Text='<%# Bind("MODULE_CODE") %>' />
            <br />
            MODULE_NAME:
            <asp:TextBox ID="MODULE_NAMETextBox" runat="server" Text='<%# Bind("MODULE_NAME") %>' />
            <br />
            CREDIT_HOURS:
            <asp:TextBox ID="CREDIT_HOURSTextBox" runat="server" Text='<%# Bind("CREDIT_HOURS") %>' />
            <br />
            <asp:LinkButton class="btn btn-success" ID="InsertButton" runat="server" CausesValidation="True" OnClick="insert" Text="Insert" />
            &nbsp;<asp:LinkButton class="btn btn-danger" ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
        </InsertItemTemplate>
        <ItemTemplate>
            MODULE_CODE:
            <asp:Label ID="MODULE_CODELabel" runat="server" Text='<%# Bind("MODULE_CODE") %>' />
            <br />
            MODULE_NAME:
            <asp:Label ID="MODULE_NAMELabel" runat="server" Text='<%# Bind("MODULE_NAME") %>' />
            <br />
            CREDIT_HOURS:
            <asp:Label ID="CREDIT_HOURSLabel" runat="server" Text='<%# Bind("CREDIT_HOURS") %>' />
            <br />
            <asp:LinkButton class="btn btn-info" ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit" />
            &nbsp;<asp:LinkButton class="btn btn-danger" ID="DeleteButton" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete" />
            &nbsp;<asp:LinkButton class="btn btn-warning" ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="New" />
        </ItemTemplate>
    </asp:FormView>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM &quot;MODULE&quot; WHERE &quot;MODULE_CODE&quot; = :MODULE_CODE" InsertCommand="INSERT INTO &quot;MODULE&quot; (&quot;MODULE_CODE&quot;, &quot;MODULE_NAME&quot;, &quot;CREDIT_HOURS&quot;) VALUES (:MODULE_CODE, :MODULE_NAME, :CREDIT_HOURS)" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT * FROM &quot;MODULE&quot;" UpdateCommand="UPDATE &quot;MODULE&quot; SET &quot;MODULE_NAME&quot; = :MODULE_NAME, &quot;CREDIT_HOURS&quot; = :CREDIT_HOURS WHERE &quot;MODULE_CODE&quot; = :MODULE_CODE">
        <DeleteParameters>
            <asp:Parameter Name="MODULE_CODE" Type="String" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="MODULE_CODE" Type="String" />
            <asp:Parameter Name="MODULE_NAME" Type="String" />
            <asp:Parameter Name="CREDIT_HOURS" Type="Decimal" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="MODULE_NAME" Type="String" />
            <asp:Parameter Name="CREDIT_HOURS" Type="Decimal" />
            <asp:Parameter Name="MODULE_CODE" Type="String" />
        </UpdateParameters>
    </asp:SqlDataSource>
</asp:Content>
