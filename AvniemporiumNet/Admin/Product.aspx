<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/FirstMaster.Master" AutoEventWireup="true" CodeBehind="Product.aspx.cs" Inherits="AvniemporiumNet.Admin.Product" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row">
        <div class="col-lg-12">
            <div class="whitecard">
                <div class="buttondiv text-end mb-2">
                    <button class="btn btn-modal" data-bs-toggle="modal" data-bs-target="#addproductmodal">Add Product</button>
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
        <div class="modal-dialog modal-lg">
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
                                <label for="">Product Img</label>
                                <input type="file" placeholder="Type content here..." class="form-control">
                            </div>
                        </div>
                        <div class="col-lg-6">
                            <div class="form-group">
                                <label for="">Product Title</label>
                                <input type="text" placeholder="Type content here..." class="form-control">
                            </div>
                        </div>
                        <div class="col-lg-6">
                            <div class="form-group">
                                <label for="">For Mens/Womens</label>
                                <select name="" class="form-control" id="">
                                    <option value="">Men</option>
                                    <option value="">Women</option>
                                </select>
                            </div>
                        </div>
                        <div class="col-lg-6">
                            <div class="form-group">
                                <label for="">Product Category</label>
                                <select name="" class="form-control" id="">
                                    <option value="">Jewellery</option>
                                    <option value="">Watch</option>
                                    <option value="">Sunglasses</option>
                                </select>
                            </div>
                        </div>
                        <div class="col-lg-6">
                            <div class="form-group">
                                <label for="">Product Type</label>
                                <select name="" class="form-control" id="">
                                    <option value="">Ring</option>
                                    <option value="">Pendant</option>
                                    <option value="">Bracellet</option>
                                    <option value="">Sunglass</option>
                                    <option value="">Earring</option>
                                    <option value="">Necklace</option>
                                    <option value="">Pearls</option>
                                </select>
                            </div>
                        </div>
                        <div class="col-lg-6">
                            <div class="form-group">
                                <label for="">Color</label>
                                <select name="" class="form-control" id="test">
                                    <option value="">Black</option>
                                    <option value="">White</option>
                                    <option value="">Gray</option>
                                </select>
                            </div>
                        </div>
                        <div class="col-lg-6">
                            <div class="form-group">
                                <label for="">Product Price</label>
                                <input type="text" placeholder="Product Price" class="form-control">
                            </div>
                        </div>
                        <div class="col-lg-6">
                            <div class="form-group">
                                <label for="">Discounted Price</label>
                                <input type="text" placeholder="Product Price" class="form-control">
                            </div>
                        </div>
                        <div class="col-lg-6">
                            <div class="form-group">
                                <label for="">Category</label>
                                <select name="" class="form-control" id="test">
                                    <option value="">Our Products</option>
                                    <option value="">Featured Products</option>
                                </select>
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
