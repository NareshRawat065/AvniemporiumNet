<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/FirstMaster.Master" AutoEventWireup="true" CodeBehind="Product.aspx.cs" Inherits="AvniemporiumNet.Admin.Product" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
        function fn_AddProductShowPopUp() {
            $('.modal-backdrop').hide();
            $('#addproductmodal').modal('show');
            return false;
        }
        function fn_AddProductHidePopUp() {
            $('#addproductmodal').modal('hide');
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
        function fn_Validate(e) {
            var status = 1;
            var index = $(e).closest('tr').index();
            var prvIndex = index - 1;
            $('#ContentPlaceHolder1_GrvProduct').find('tr').eq(prvIndex).each(function () {
                if ($(this).find('.ddlForCategory').val() == "-1") {
                    validateError($(this).find('.ddlForCategory').attr('id'), "Please select for category");
                    status = 0;
                }
                else if ($(this).find('.ddlProductCategory').val() == "-1") {
                    validateError($(this).find('.ddlProductCategory').attr('id'), "Please select product category");
                    status = 0;
                }
                else if ($(this).find('.ddlProductType').val() == "-1") {
                    validateError($(this).find('.ddlProductType').attr('id'), "Please select product type");
                    status = 0;
                }
                else if ($(this).find('.ddlProductColor').val() == "-1") {
                    validateError($(this).find('.ddlProductColor').attr('id'), "Please select product color");
                    status = 0;
                }
                else if ($(this).find('.fileupload').val() == "") {
                    validateError($(this).find('.fileupload').attr('id'), "Please upload product");
                    status = 0;
                }
                else if ($(this).find('.txtPrice').val() == "") {
                    validateError($(this).find('.txtPrice').attr('id'), "Please enter price");
                    status = 0;
                }
                else if ($(this).find('.txtDiscountedPrice').val() == "") {
                    validateError($(this).find('.txtDiscountedPrice').attr('id'), "Please enter discounted price");
                    status = 0;
                }
                else if ($(this).find('.ddlProductSize').val() == "-1") {
                    validateError($(this).find('.ddlProductSize').attr('id'), "Please select product size");
                    status = 0;
                }
                else if ($(this).find('.txtDescription').val() == "") {
                    validateError($(this).find('.txtDescription').attr('id'), "Please enter description");
                    status = 0;
                }
            });

            if (status == 0) {
                return false;
            }
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row">
        <div class="col-lg-12">
            <div class="whitecard">
                <div class="buttondiv text-end mb-2">
                    <asp:Button ID="btnAddBanner" runat="server" CssClass="btn btn-modal" OnClientClick="return fn_AddProductShowPopUp(); false" Text="Add Product" />
                </div>
                <div class="table-responsive">
                    <table id="example" class="table table-striped table-bordered" style="width: 100%">
                        <thead>
                            <tr>
                                <th>S#</th>
                                <th>Product Title</th>
                                <th>Gender</th>
                                <th>Product Category</th>
                                <th>Product Type</th>
                                <th>Color</th>
                                <th>Product Price</th>
                                <th>Discounted Price</th>
                                <th>Category</th>
                                <th>Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>1</td>
                                <td>Cuboid Pendant</td>
                                <td>Male</td>
                                <td>Jewellery</td>
                                <td>Ring</td>
                                <td>Black</td>
                                <td><i class='bx bx-rupee'></i>1499</td>
                                <td><i class='bx bx-rupee'></i>1299</td>
                                <td>Our Product</td>
                                <td>
                                    <button class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#addproductmodal"><i class='bx bx-edit-alt'></i></button>
                                    <button class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#productdeletemodal"><i class='bx bx-trash'></i></button>
                                </td>
                            </tr>
                            <tr>
                                <td>1</td>
                                <td>Cuboid Pendant</td>
                                <td>Male</td>
                                <td>Jewellery</td>
                                <td>Ring</td>
                                <td>Black</td>
                                <td><i class='bx bx-rupee'></i>1499</td>
                                <td><i class='bx bx-rupee'></i>1299</td>
                                <td>Our Product</td>
                                <td>
                                    <button class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#addproductmodal"><i class='bx bx-edit-alt'></i></button>
                                    <button class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#productdeletemodal"><i class='bx bx-trash'></i></button>
                                </td>
                            </tr>

                        </tbody>

                    </table>
                </div>
            </div>
        </div>
    </div>

    <!-- add product modal start -->
    <!-- The Modal -->
    <div class="modal" id="addproductmodal">
        <div class="modal-dialog modal-xl">
            <div class="modal-content">
                <!-- Modal Header -->
                <div class="modal-header">
                    <h4 class="modal-title">Add Product Detail</h4>
                    <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                </div>
                <!-- Modal body -->
                <div class="modal-body">
                    <div class="row">
                        <div class="col-lg-6">
                            <div class="form-group">
                                <label for="">Product Title<span class="spnMandatory">*</span></label>
                                <asp:TextBox ID="txtProductTitle" runat="server" CssClass="form-control" placeholder="Type title here..."></asp:TextBox>
                            </div>
                        </div>
                        <div class="col-lg-6">
                            <div class="form-group">
                                <label for="">Category<span class="spnMandatory">*</span></label>
                                <asp:DropDownList ID="ddlCategory" runat="server" CssClass="form-control">
                                    <asp:ListItem Value="-1" Text="Select Category"></asp:ListItem>
                                    <asp:ListItem Value="1" Text="Our Products"></asp:ListItem>
                                    <asp:ListItem Value="2" Text="Featured Products"></asp:ListItem>
                                </asp:DropDownList>
                            </div>
                        </div>

                        <div class="col-lg-12">
                            <div class="table-responsive">
                                <asp:GridView ID="GrvProduct" runat="server" ShowFooter="true" CssClass="table table-bordered" AutoGenerateColumns="false"
                                    OnRowCreated="GrvProduct_RowCreated">
                                    <Columns>
                                        <asp:BoundField DataField="RowNumber" HeaderText="#" />
                                        <asp:TemplateField HeaderText="For">
                                            <ItemTemplate>
                                                <asp:DropDownList ID="ddlForCategory" runat="server" CssClass="form-control ddlForCategory">
                                                    <asp:ListItem Value="-1" Text="Select For Category"></asp:ListItem>
                                                    <asp:ListItem Value="1" Text="Men"></asp:ListItem>
                                                    <asp:ListItem Value="2" Text="Women"></asp:ListItem>
                                                </asp:DropDownList>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Category">
                                            <ItemTemplate>
                                                <asp:DropDownList ID="ddlProductCategory" runat="server" CssClass="form-control ddlProductCategory">
                                                    <asp:ListItem Value="-1" Text="Select Category"></asp:ListItem>
                                                    <asp:ListItem Value="1" Text="Jewellery"></asp:ListItem>
                                                    <asp:ListItem Value="2" Text="Watch"></asp:ListItem>
                                                    <asp:ListItem Value="3" Text="Sunglasses"></asp:ListItem>
                                                </asp:DropDownList>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Type">
                                            <ItemTemplate>
                                                <asp:DropDownList ID="ddlProductType" runat="server" CssClass="form-control ddlProductType">
                                                    <asp:ListItem Value="-1" Text="Select Type"></asp:ListItem>
                                                    <asp:ListItem Value="1" Text="Ring"></asp:ListItem>
                                                    <asp:ListItem Value="2" Text="Pendant"></asp:ListItem>
                                                    <asp:ListItem Value="3" Text="Bracellet"></asp:ListItem>
                                                    <asp:ListItem Value="4" Text="Sunglass"></asp:ListItem>
                                                    <asp:ListItem Value="5" Text="Earring"></asp:ListItem>
                                                    <asp:ListItem Value="6" Text="Necklace"></asp:ListItem>
                                                    <asp:ListItem Value="7" Text="Pearls"></asp:ListItem>
                                                </asp:DropDownList>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Color">
                                            <ItemTemplate>
                                                <asp:DropDownList ID="ddlProductColor" runat="server" CssClass="form-control ddlProductColor">
                                                    <asp:ListItem Value="-1" Text="Select Color"></asp:ListItem>
                                                    <asp:ListItem Value="1" Text="Red"></asp:ListItem>
                                                    <asp:ListItem Value="2" Text="Black"></asp:ListItem>
                                                    <asp:ListItem Value="3" Text="White"></asp:ListItem>
                                                    <asp:ListItem Value="4" Text="Gray"></asp:ListItem>
                                                </asp:DropDownList>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Product">
                                            <ItemTemplate>
                                                <asp:FileUpload ID="fileupload" runat="server" onchange="validatefileupload(this)" CssClass="form-control fileupload" />
                                                <asp:HiddenField ID="hdnfilePathr" runat="server" />
                                                <asp:HyperLink ID="hrefImage" Target="_blank" runat="server" Visible="false"> </asp:HyperLink>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Price">
                                            <ItemTemplate>
                                                <asp:TextBox ID="txtPrice" runat="server" CssClass="form-control txtPrice"></asp:TextBox>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Dis. Price">
                                            <ItemTemplate>
                                                <asp:TextBox ID="txtDiscountedPrice" runat="server" CssClass="form-control txtDiscountedPrice"></asp:TextBox>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Size">
                                            <ItemTemplate>
                                                <asp:DropDownList ID="ddlProductSize" runat="server" CssClass="form-control ddlProductSize">
                                                    <asp:ListItem Value="-1" Text="Select Size"></asp:ListItem>
                                                    <asp:ListItem Value="1" Text="Small"></asp:ListItem>
                                                    <asp:ListItem Value="2" Text="Medium"></asp:ListItem>
                                                    <asp:ListItem Value="3" Text="Large"></asp:ListItem>
                                                </asp:DropDownList>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Description">
                                            <ItemTemplate>
                                                <asp:TextBox ID="txtDescription" runat="server" TextMode="MultiLine" CssClass="form-control txtDescription"></asp:TextBox>
                                            </ItemTemplate>
                                            <FooterStyle HorizontalAlign="Right" />
                                            <FooterTemplate>
                                                <asp:LinkButton ID="btnNewRowForProduct" runat="server" CssClass="btn btn-primary" OnClientClick="return fn_Validate(this);"
                                                    OnClick="btnNewRowForProduct_Click"><i class='bx bx-plus'></i></asp:LinkButton>
                                            </FooterTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField>
                                            <ItemTemplate>
                                                <asp:LinkButton ID="lblBtnRemoveRowForProduct" runat="server" OnClientClick="return fn_ConfirmDelete();" CssClass="btn btn-danger"
                                                    OnClick="lblBtnRemoveRowForProduct_Click"><i class='bx bx-trash'></i></asp:LinkButton>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                </asp:GridView>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- Modal footer -->
                <div class="modal-footer">
                      <asp:HiddenField ID="hdnTesimonialId" runat="server" />
                    <asp:Button ID="btnSubmit" runat="server" CssClass="btn btn-success" Text="Submit" OnClick="btnSubmit_Click" OnClientClick="return Validate()" />
                    <asp:Button ID="btnCancel" runat="server" CssClass="btn btn-danger" data-bs-dismiss="modal" Text="Close" OnClick="btnCancel_Click" />
                </div>

            </div>
        </div>
    </div>
    <!-- add product modal end -->

    <!-- delete product modal start -->
    <!-- The Modal -->
    <div class="modal" id="productdeletemodal">
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
                        <p>Are Your sure you want to delete this item from category ?</p>
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
