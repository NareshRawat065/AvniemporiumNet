<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/FirstMaster.Master" AutoEventWireup="true" CodeBehind="BannerAndTestimonial.aspx.cs" Inherits="AvniemporiumNet.Admin.BannerAndTestimonial" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
        function fn_AddBanner() {
             $('.modal-backdrop').hide();
            $('#addbannermodal').modal('show');
            return false;
        }
        function fn_AddBannerHide() {
            $('#addbannermodal').modal('hide');
            $('.modal-backdrop').hide();
            //return false;
        }
        function fn_AddTestimonial() {
             $('.modal-backdrop').hide();
            $('#addtestimonialmodal').modal('show');
            return false;
        }
        function fn_AddTestimonialHide() {
            $('#addtestimonialmodal').modal('hide');
            $('.modal-backdrop').hide();
            //return false;
        }
    </script>
    <script type="text/javascript">       
        function Validate() {
            if ($("#ContentPlaceHolder1_txtBannerTitle").val() == "") {
                validateError("ContentPlaceHolder1_txtBannerTitle", "Please Enter Title");
                return false;
            }
            if ($("#ContentPlaceHolder1_txtBanerDescription").val() == "") {
                validateError("ContentPlaceHolder1_txtBanerDescription", "Please Enter Description");
                return false;
            }
            return true;
        }
        function validatefileupload(fu) {
            var ext = $(fu).val().split('.').pop().toLowerCase();
            if ($.inArray(ext, ['png', 'jpg', 'jpeg']) == -1) {
                validateError(fu.id, "Please upload only '.png', '.jpg', '.jpeg' file");
                $('#' + fu.id).val('');
                return false;
            }
            uploadlogo();
        }
        function fn_ConfirmDelete() {
            if (confirm('Are you sure you want to delete ?')) {
                return true;
            }
            return false;
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="col-lg-12">
        <div class="row">
            <div class="col-lg-12">
                <div class="whitecard">
                    <div class="breadcrumbcustom">
                        <h4 class="cardheading"><i class="bx bxs-home-circle"></i>Home</h4>
                        <ul>
                            <li><a href="dashboard.html"><i class="bx bxs-dashboard"></i>Dashboard / </a></li>
                            <li>Home </li>
                        </ul>
                    </div>
                </div>
            </div>

            <div class="col-lg-12">
                <div class="bannertab whitecard">
                    <h5 onclick="showbannerform(this);" class="tabheading">Banner Content <i
                        class='bx bx-chevrons-down arrowdown'></i></h5>

                    <div class="buttondiv text-end mb-2">
                        <asp:Button ID="btnAddBanner" runat="server" CssClass="btn btn-modal" OnClientClick="return fn_AddBanner(); false" Text="Add Banner" />
                    </div>
                    <div class="table-responsive">
                        <asp:Repeater ID="RepBannerDetails" runat="server" OnItemCommand="RepBannerDetails_ItemCommand">
                            <HeaderTemplate>
                                <table class="table table-striped">
                                    <thead>
                                        <tr>
                                            <th>#</th>
                                            <th>Title</th>
                                            <th>Description</th>
                                            <th>Attachment</th>
                                            <th>Action</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                            </HeaderTemplate>
                            <ItemTemplate>
                                <tr>
                                    <td><%# Container.ItemIndex + 1 %></td>
                                    <td><%# Eval("Title") %></td>
                                    <td><%# Eval("Description") %></td>
                                    <td>
                                        <asp:HyperLink ID="hrefImage1" Target="_blank" NavigateUrl='<%# Eval("Attachment") %>' Visible='<%# Eval("Attachment").ToString() == "" ? false:true %>' runat="server">View</asp:HyperLink>
                                    </td>
                                    <td>
                                        <asp:Button ID="btnEdit" class="btn btn-primary" runat="server" Text="Edit" CommandName="Edit" CommandArgument='<%# Eval("Id") %>' />
                                        <asp:Button ID="btnDelete" class="btn btn-danger" runat="server" OnClientClick="return fn_ConfirmDelete();" Text="Delete" CommandName="Delete" CommandArgument='<%# Eval("Id") %>' />
                                    </td>
                                </tr>
                            </ItemTemplate>
                            <FooterTemplate>
                                </tbody>
                                    </table>
                            </FooterTemplate>
                        </asp:Repeater>
                    </div>
                </div>
            </div>

            <div class="col-lg-12">
                <div class="bannertab whitecard">
                    <h5 onclick="showbannerform(this);" class="tabheading">Our Testimonial Content <i
                        class='bx bx-chevrons-down arrowdown'></i></h5>
                    <div class="buttondiv text-end mb-2">
                        <asp:Button ID="btnAddTestimonial" runat="server" CssClass="btn btn-modal" OnClientClick="return fn_AddTestimonial(); false" Text="Add Testimonial" />
                    </div>
                    <div class="table-responsive">
                        <asp:Repeater ID="RepTestimonialDetails" runat="server" OnItemCommand="RepTestimonialDetails_ItemCommand">
                            <HeaderTemplate>
                                <table class="table table-striped">
                                    <thead>
                                        <tr>
                                            <th>#</th>
                                            <th>User</th>
                                            <th>Title</th>
                                            <th>Rating</th>
                                            <th>Description</th>
                                            <th>Writer Name</th>
                                            <th>Action</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                            </HeaderTemplate>
                            <ItemTemplate>
                                <tr>
                                    <td><%# Container.ItemIndex + 1 %></td>
                                    <td><%# Eval("UserName") %></td>
                                    <td><%# Eval("Title") %></td>
                                    <td><%# Eval("Rating") %></td>
                                    <td><%# Eval("Description") %></td>
                                    <td>
                                        <asp:HyperLink ID="hrefImage1" Target="_blank" NavigateUrl='<%# Eval("Attachment") %>' Visible='<%# Eval("Attachment").ToString() == "" ? false:true %>' runat="server">View</asp:HyperLink></td>
                                    <td>
                                        <asp:Button ID="btnEdit" class="btn btn-primary" runat="server" Text="Edit" CommandName="Edit" CommandArgument='<%# Eval("Id") %>' />
                                        <asp:Button ID="btnDelete" class="btn btn-danger" runat="server" OnClientClick="return fn_ConfirmDelete();" Text="Delete" CommandName="Delete" CommandArgument='<%# Eval("Id") %>' />
                                    </td>
                                </tr>
                            </ItemTemplate>
                            <FooterTemplate>
                                </tbody>
                                    </table>
                            </FooterTemplate>
                        </asp:Repeater>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- add product modal start -->
    <!-- The Modal -->
    <div class="modal" id="addbannermodal">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <!-- Modal Header -->
                <div class="modal-header">
                    <h4 class="modal-title">Add Banner</h4>
                    <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                </div>
                <!-- Modal body -->
                <div class="modal-body">
                    <div class="row">
                        <div class="col-lg-6">
                            <div class="form-group">
                                <label for="">Banner Img</label>
                                <asp:FileUpload ID="fileuploadBanner" runat="server" onchange="validatefileupload(this)" CssClass="form-control" />
                                <asp:HiddenField ID="hdnfilePathBanner" runat="server" />
                                <asp:HyperLink ID="hrefImageBanner" Target="_blank" runat="server" Visible="false"> </asp:HyperLink>
                            </div>
                        </div>
                        <div class="col-lg-6">
                            <div class="form-group">
                                <label for="">Banner Title</label>
                                <asp:TextBox ID="txtBannerTitle" runat="server" CssClass="form-control" placeholder="Add title"></asp:TextBox>
                            </div>
                        </div>
                        <div class="col-lg-6">
                            <div class="form-group">
                                <label for="">Banner Description</label>
                                <textarea name="" id="txtBanerDescription" cols="30" rows="3" runat="server" class="form-control"></textarea>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- Modal footer -->
                <div class="modal-footer">
                    <asp:HiddenField ID="hdnBannerId" runat="server" />
                    <asp:Button ID="btnSubmit" runat="server" CssClass="btn btn-success" Text="Submit" OnClick="btn_Submit" OnClientClick="return Validate()" />
                    <asp:Button ID="btnCancel" runat="server" CssClass="btn btn-danger" data-bs-dismiss="modal" Text="Cancel" OnClick="btn_Cancel" />
                </div>

            </div>
        </div>
    </div>
    <!-- add product modal end -->

    <!-- add product modal start -->
    <!-- The Modal -->
    <div class="modal" id="addtestimonialmodal">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <!-- Modal Header -->
                <div class="modal-header">
                    <h4 class="modal-title">Add Testimonial</h4>
                    <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                </div>
                <!-- Modal body -->
                <div class="modal-body">
                    <div class="row">
                        <div class="col-lg-4">
                            <div class="form-group">
                                <label for="">Testimonial Img</label>
                                <asp:FileUpload ID="fileuploadTestimonial" runat="server" onchange="validatefileupload(this)" CssClass="form-control" />
                                <asp:HiddenField ID="hdnfilePathTestimonial" runat="server" />
                                <asp:HyperLink ID="hrefImageTestimonial" Target="_blank" runat="server" Visible="false"> </asp:HyperLink>
                            </div>
                        </div>
                        <div class="col-lg-4">
                            <div class="form-group">
                                <label for="">Testimonial Name</label>
                                <asp:TextBox ID="txtTestimonialTitle" runat="server" CssClass="form-control" placeholder="Add title"></asp:TextBox>
                            </div>
                        </div>
                        <div class="col-lg-4">
                            <div class="form-group">
                                <label for="">Username</label>
                                <asp:TextBox ID="txtUserName" runat="server" CssClass="form-control" placeholder="Add Username"></asp:TextBox>
                            </div>
                        </div> <div class="col-lg-4">
                            <div class="form-group">
                                <label for="">Rating</label>
                                <asp:TextBox ID="txtRating" runat="server" CssClass="form-control" onkeypress="OnlyNumber(event);" placeholder="Add Rating"></asp:TextBox>
                            </div>
                        </div>
                        <div class="col-lg-8">
                            <div class="form-group">
                                <label for="">Tesimonial Review</label>
                                <textarea name="" id="txtTesimonialDescription" cols="30" rows="3" runat="server" class="form-control"></textarea>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- Modal footer -->
                <div class="modal-footer">
                    <asp:HiddenField ID="hdnTesimonialId" runat="server" />
                    <asp:Button ID="btnSubmitTesimonial" runat="server" CssClass="btn btn-success" Text="Submit" OnClick="btnTesimonial_Submit" OnClientClick="return ValidateTesimonial()" />
                    <asp:Button ID="btnCancelTesimonial" runat="server" CssClass="btn btn-danger" data-bs-dismiss="modal" Text="Cancel" OnClick="btn_Cancel" />
                </div>
            </div>
        </div>
    </div>
    <!-- add product modal end -->

    <!-- delete banner modal start -->
    <!-- The Modal -->
    <div class="modal" id="bannerdeletemodal">
        <div class="modal-dialog modal-sm">
            <div class="modal-content">
                <!-- Modal Header -->
                <div class="modal-header">
                    <h4 class="modal-title">Delete</h4>
                    <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                </div>
                <!-- Modal body -->
                <div class="modal-body">
                    <div class="deletewarningwrap">
                        <img src="images/deletemodal.gif" alt="">
                        <p>Are Your sure you want to delete this Banner ?</p>
                    </div>
                </div>

                <!-- Modal footer -->
                <div class="modal-footer">
                    <button type="button" class="btn btn-success">Yes</button>
                    <button type="button" class="btn btn-danger" data-bs-dismiss="modal">Cancel</button>
                </div>

            </div>
        </div>
    </div>
    <!-- delete product modal end -->
</asp:Content>
