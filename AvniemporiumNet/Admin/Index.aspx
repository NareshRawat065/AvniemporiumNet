<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="AvniemporiumNet.Admin.Index" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta name="title" content="Avni Emporium  | Avni Emporium Pvt Ltd" />
    <meta name="description" content="" />
    <meta name="keywords" content=" " />
    <link rel="shortcut icon" href="images/logo.png" type="image/x-icon" />
    <title>Avni Emporium | Admin Login</title>
    <link rel="stylesheet" type="text/css" href="../Content/Admin/css/summernote.css" />
    <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet' />
    <link rel="stylesheet" type="text/css" href="../Content/Admin/css/bootstrap.css" />
    <link rel="stylesheet" type="text/css" href="../Content/Admin/css/boxicon.css" />
    <link rel="stylesheet" type="text/css" href="../Content/Admin/css/admin.css" />
    <link rel="stylesheet" type="text/css" href="../Content/Admin/css/responsiveadmin.css" />
    <link href="../Content/toastr.min.css" rel="stylesheet" />

    <script type="text/javascript">
        var EmailRegex = /^([a-zA-Z0-9_.+-])+\@(([a-zA-Z0-9-])+\.)+([a-zA-Z0-9]{2,4})+$/;
        function validateLogin() {
            if ($("#txtUserId").val() == "") {
                toastr["error"]("Please Enter Email");
                return false;
            }
            else {
                if (!EmailRegex.test($('#txtUserId').val())) {
                    toastr["error"]("Please enter correct email format");
                    return false;
                }
            }
            if ($("#txtPassword").val() == "") {
                toastr["error"]("Please Enter Email");
                return false;
            }
        }
    </script>

</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="scriptmanager1" runat="server">
        </asp:ScriptManager>
        <asp:UpdatePanel ID="updatepanel" runat="server" UpdateMode="Conditional">
            <ContentTemplate>
                <div class="loginmain">
                    <div class="container">
                        <div class="row">
                            <div class="col-lg-5">
                                <div class="loginimg">
                                    <img src="../Content/Admin/images/login.png" alt="" />
                                </div>
                            </div>

                            <div class="col-lg-5 offset-lg-2">
                                <div class="loginformcontent">
                                    <img src="../Content/Admin/images/logo.png" alt="" />
                                    <h4>Welcome Back </h4>
                                    <div class="logindiv">
                                        <div class="row">
                                            <div class="col-lg-12">
                                                <div class="form-group">
                                                    <asp:TextBox ID="txtUserId" runat="server" ClientIDMode="Static" placeholder="Enter your email id"></asp:TextBox>
                                                    <i class='bx bx-user'></i>
                                                </div>
                                            </div>
                                            <div class="col-lg-12">
                                                <div class="form-group">
                                                    <asp:TextBox ID="txtPassword" runat="server" ClientIDMode="Static" placeholder="Enter your password here" TextMode="Password"></asp:TextBox>
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
                                                    <asp:Button ID="btnLogin" runat="server" Style="width: 100%; color: #493423;" OnClick="btnLogin_Click" OnClientClick="return validateLogin();" Text="Login" CssClass="btn-main" />
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </ContentTemplate>
        </asp:UpdatePanel>
    </form>
</body>
<script src="../Content/Admin/js/bootstrap.js"></script>
<script src="../Content/Admin/js/jquery.js"></script>
<script src="../Content/toastr.min.js"></script>
<script type="text/javascript">
    toastr.options = {
        "closeButton": true,
        "debug": false,
        "newestOnTop": true,
        "progressBar": true,
        "positionClass": "toast-top-full-width",
        "preventDuplicates": false,
        "onclick": null,
        "showDuration": "300",
        "hideDuration": "1000",
        "timeOut": "5000",
        "extendedTimeOut": "1000",
        "showEasing": "swing",
        "hideEasing": "linear",
        "showMethod": "fadeIn",
        "hideMethod": "fadeOut"
    }
</script>
</html>
