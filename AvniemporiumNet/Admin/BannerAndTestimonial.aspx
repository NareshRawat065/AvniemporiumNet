<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/FirstMaster.Master" AutoEventWireup="true" CodeBehind="BannerAndTestimonial.aspx.cs" Inherits="AvniemporiumNet.Admin.BannerAndTestimonial" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
        function fn_AddBanner() {
            $('#addbannermodal').modal('show');

            return false;
        }
        function fn_AddTestimonial() {
            $('#addtestimonialmodal').modal('show');

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
                            <asp:Button id="btnAddBanner" runat="server" CssClass="btn btn-modal" OnClientClick="return fn_AddBanner(); false" Text="Add Banner" />
                        </div>
                        <div class="table-responsive">
                            <table id="example" class="table table-striped table-bordered" style="width: 100%">
                                <thead>
                                    <tr>
                                        <th>S#</th>
                                        <th>Image</th>
                                        <th>Title</th>
                                        <th>Description</th>
                                        <th>Action</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td>1</td>
                                        <td>Cuboid Pendant</td>
                                        <td>Family Jewelry  Collection</td>
                                        <td>Shukra Yogam & Silver Power Silver Saving Schemes.</td>
                                        <td>
                                            <button class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#addbannermodal"><i class='bx bx-edit-alt'></i></button>
                                            <button class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#bannerdeletemodal"><i class='bx bx-trash'></i></button>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>1</td>
                                        <td>Cuboid Pendant</td>
                                        <td>Family Jewelry  Collection</td>
                                        <td>Shukra Yogam & Silver Power Silver Saving Schemes.</td>
                                        <td>
                                            <button class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#addbannermodal"><i class='bx bx-edit-alt'></i></button>
                                            <button class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#bannerdeletemodal"><i class='bx bx-trash'></i></button>
                                        </td>
                                    </tr>

                                </tbody>

                            </table>
                        </div>
                    </div>
                </div>

                <div class="col-lg-12">
                    <div class="bannertab whitecard">
                        <h5 onclick="showbannerform(this);" class="tabheading">Our Testimonial Content <i
                            class='bx bx-chevrons-down arrowdown'></i></h5>
                        <div class="buttondiv text-end mb-2">
                            <asp:Button id="btnAddTestimonial" runat="server" CssClass="btn btn-modal" OnClientClick="return fn_AddTestimonial(); false" Text="Add Testimonial" />                            
                        </div>
                        <div class="table-responsive">
                            <table id="example" class="table table-striped table-bordered" style="width: 100%">
                                <thead>
                                    <tr>
                                        <th>S#</th>
                                        <th>Tesimonial Img</th>
                                        <th>Testimonial Name</th>
                                        <th>Tesimonial Review</th>
                                        <th>Action</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td>1</td>
                                        <td>Cuboid </td>
                                        <td>Naresh</td>
                                        <td>Products are amazing</td>
                                        <td>
                                            <button class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#addtestimonialmodal"><i class='bx bx-edit-alt'></i></button>
                                            <button class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#bannerdeletemodal"><i class='bx bx-trash'></i></button>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>1</td>
                                        <td>Cuboid </td>
                                        <td>Naresh</td>
                                        <td>Products are amazing</td>
                                        <td>
                                            <button class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#addtestimonialmodal"><i class='bx bx-edit-alt'></i></button>
                                            <button class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#bannerdeletemodal"><i class='bx bx-trash'></i></button>
                                        </td>
                                    </tr>

                                </tbody>

                            </table>
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
                                <input type="file" placeholder="Type content here..." class="form-control">
                            </div>
                        </div>
                        <div class="col-lg-6">
                            <div class="form-group">
                                <label for="">Banner Title</label>
                                <input type="text" placeholder="Type content here..." class="form-control">
                            </div>
                        </div>
                        <div class="col-lg-6">
                            <div class="form-group">
                                <label for="">Banner Description</label>
                                <input type="text" placeholder="Type content here..." class="form-control">
                            </div>
                        </div>

                    </div>
                </div>

                <!-- Modal footer -->
                <div class="modal-footer">
                    <button type="button" class="btn btn-success">Save</button>
                    <button type="button" class="btn btn-danger" data-bs-dismiss="modal">Close</button>
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
                        <div class="col-lg-6">
                            <div class="form-group">
                                <label for="">Testimonial Img</label>
                                <input type="file" placeholder="Type content here..." class="form-control">
                            </div>
                        </div>
                        <div class="col-lg-6">
                            <div class="form-group">
                                <label for="">Testimonial Name</label>
                                <input type="file" placeholder="Type content here..." class="form-control">
                            </div>
                        </div>
                        <div class="col-lg-12">
                            <div class="form-group">
                                <label for="">Tesimonial Review</label>
                                <textarea name="" id="" cols="30" rows="2" class="form-control" placeholder="type here..."></textarea>
                            </div>
                        </div>

                    </div>
                </div>

                <!-- Modal footer -->
                <div class="modal-footer">
                    <button type="button" class="btn btn-success">Save</button>
                    <button type="button" class="btn btn-danger" data-bs-dismiss="modal">Close</button>
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
