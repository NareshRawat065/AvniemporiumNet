<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="AvniemporiumNet.Admin.Index" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div class="loginmain">
            <div class="container">
                <div class="row">
                    <div class="col-lg-5">
                        <div class="loginimg">
                            <img src="images/login.png" alt="" />
                        </div>
                    </div>

                    <div class="col-lg-5 offset-lg-2">
                        <div class="loginformcontent">
                            <img src="images/logo.png" alt="" />
                            <h4>Welcome Back </h4>
                            <div class="logindiv">
                                <div class="row">
                                    <div class="col-lg-12">
                                        <div class="form-group">
                                            <asp:TextBox ID="txtUserId" runat="server" placeholder="Enter your email id"></asp:TextBox>
                                            <i class='bx bx-user'></i>
                                        </div>
                                    </div>
                                    <div class="col-lg-12">
                                        <div class="form-group">
                                            <asp:TextBox ID="txtPassword" runat="server" placeholder="Enter your password here" TextMode="Password"></asp:TextBox>
                                            <i class='bx bxs-key'></i>
                                        </div>
                                    </div>
                                    <div class="col-lg-12">
                                        <div class="forgotdiv">
                                            <p>Forgot Password ? </p>
                                        </div>
                                    </div>
                                    <div class="col-lg-12">
                                        <div class="loginpagebtn">
                                            <asp:Button id="btnLogin" runat="server" OnClick="btnLogin_Click" CssClass="btn-main"/>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </form>
</body>
</html>
