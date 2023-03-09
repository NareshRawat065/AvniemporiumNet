<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/UserMaster.master" AutoEventWireup="true" CodeBehind="MyAccount.aspx.cs" Inherits="AvniemporiumNet.User.MyAccount" %>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!-- My Account Tab Content Start -->
    <div class="col-lg-9 col-md-8">
        <div class="tab-content" id="myaccountContent">
            <!-- Single Tab Content Start -->
            <div class="tab-pane fade show active" id="dashboad" role="tabpanel">
                <div class="myaccount-content">
                    <h5>Dashboard</h5>
                    <div class="welcome">
                        <p>
                            Hello, <strong>Atul Kumar</strong> (If Not <strong>Atul Kumar
                                                                !</strong><a href="login-register.html" class="logout">
                                                                Logout</a>)
                        </p>
                    </div>
                    <p class="mb-0">
                        From your account dashboard. you can easily check &
                                                        view your recent orders, manage your shipping, Refund and
                                                        Replacement, billing address
                                                        and edit your personal details.
                    </p>
                </div>
            </div>
            <!-- Single Tab Content End -->

            <!-- Single Tab Content Start -->
            <div class="tab-pane fade" id="orders" role="tabpanel">
                <div class="myaccount-content">
                    <h5>Orders</h5>
                    <div class="myaccount-table table-responsive text-center">
                        <table class="table table-bordered">
                            <thead class="thead-light">
                                <tr>
                                    <th>Order</th>
                                    <th>Date</th>
                                    <th>Status</th>
                                    <th>Total</th>
                                    <th>Action</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>1</td>
                                    <td>Aug 22, 2018</td>
                                    <td>Pending</td>
                                    <td>$3000</td>
                                    <td><a href="cart.html" class="btn btn-sqr">View</a>
                                    </td>
                                </tr>
                                <tr>
                                    <td>2</td>
                                    <td>July 22, 2018</td>
                                    <td>Approved</td>
                                    <td>$200</td>
                                    <td><a href="cart.html" class="btn btn-sqr">View</a>
                                    </td>
                                </tr>
                                <tr>
                                    <td>3</td>
                                    <td>June 12, 2017</td>
                                    <td>On Hold</td>
                                    <td>$990</td>
                                    <td><a href="cart.html" class="btn btn-sqr">View</a>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>


                </div>
            </div>
            <!-- Single Tab Content End -->

            <!-- Single Tab Content Start -->
            <div class="tab-pane fade" id="refundandreplacement" role="tabpanel">
                <div class="myaccount-content">
                    <h5>Refund & Replacement</h5>
                    <div class="myaccount-table table-responsive text-center">
                        <table class="table table-bordered">
                            <thead class="thead-light">
                                <tr>
                                    <th>S#</th>
                                    <td>Product</td>
                                    <th>Date</th>
                                    <th>Status</th>
                                    <th>Price</th>
                                    <th>Action</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>2</td>
                                    <td>
                                        <div class="productdetailtable">
                                            <img src="assets/img/product/product-18.jpg" alt="">
                                            <br>
                                            <a href="product-details.html" tabindex="0">Citygold Exclusive Ring</a>
                                        </div>
                                    </td>
                                    <td>Aug 22, 2018</td>
                                    <td>Pending</td>
                                    <td>3000/-</td>
                                    <td>
                                        <button class="btn btn-sqr" data-bs-toggle="modal" data-bs-target="#refundrequestmodal">Refund Request</button>
                                    </td>
                                </tr>
                                <tr>
                                    <td>2</td>
                                    <td>
                                        <div class="productdetailtable">
                                            <img src="assets/img/product/product-18.jpg" alt="">
                                            <br>
                                            <a href="product-details.html" tabindex="0">Citygold Exclusive Ring</a>
                                        </div>
                                    </td>
                                    <td>Aug 22, 2018</td>
                                    <td>Pending</td>
                                    <td>3000/-</td>
                                    <td>
                                        <button class="btn btn-sqr" data-bs-toggle="modal" data-bs-target="#refundrequestmodal">Refund Request</button>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>


                </div>
            </div>
            <!-- Single Tab Content End -->



            <!-- Single Tab Content Start -->
            <div class="tab-pane fade" id="download" role="tabpanel">
                <div class="myaccount-content">
                    <h5>Downloads</h5>
                    <div class="myaccount-table table-responsive text-center">
                        <table class="table table-bordered">
                            <thead class="thead-light">
                                <tr>
                                    <th>Product</th>
                                    <th>Date</th>
                                    <th>Expire</th>
                                    <th>Download</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>Haven - Free Real Estate PSD Template</td>
                                    <td>Aug 22, 2018</td>
                                    <td>Yes</td>
                                    <td><a href="#" class="btn btn-sqr"><i
                                        class="fa fa-cloud-download"></i>
                                        Download File</a></td>
                                </tr>
                                <tr>
                                    <td>HasTech - Profolio Business Template</td>
                                    <td>Sep 12, 2018</td>
                                    <td>Never</td>
                                    <td><a href="#" class="btn btn-sqr"><i
                                        class="fa fa-cloud-download"></i>
                                        Download File</a></td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
            <!-- Single Tab Content End -->

            <!-- Single Tab Content Start -->
            <div class="tab-pane fade" id="payment-method" role="tabpanel">
                <div class="myaccount-content">
                    <h5>Payment Method</h5>
                    <p class="saved-message">
                        You Can't Saved Your Payment Method yet.
                                                   
                    </p>
                </div>
            </div>
            <!-- Single Tab Content End -->

            <!-- Single Tab Content Start -->
            <div class="tab-pane fade" id="address-edit" role="tabpanel">
                <div class="myaccount-content">
                    <h5>Billing Address</h5>
                    <div class="row">
                        <div class="col-lg-4">
                            <div class="form-group">
                                <input type="text" placeholder="Street" name="" id="" class="form-control">
                            </div>
                        </div>
                        <div class="col-lg-4">
                            <div class="form-group">
                                <input type="text" placeholder="Near By" name="" id="" class="form-control">
                            </div>
                        </div>
                        <div class="col-lg-4">
                            <div class="form-group">
                                <input type="text" placeholder="Country" name="" id="" class="form-control">
                            </div>
                        </div>
                        <div class="col-lg-4">
                            <div class="form-group">
                                <input type="text" placeholder="State" name="" id="" class="form-control">
                            </div>
                        </div>
                        <div class="col-lg-4">
                            <div class="form-group">
                                <input type="text" placeholder="Pin code" name="" id="" class="form-control">
                            </div>
                        </div>
                    </div>
                    <a href="#" class="btn btn-sqr"><i class="fa fa-edit"></i>
                        Edit Address</a>
                </div>
            </div>
            <!-- Single Tab Content End -->

            <!-- Single Tab Content Start -->
            <div class="tab-pane fade" id="account-info" role="tabpanel">
                <div class="myaccount-content">
                    <h5>Account Details</h5>
                    <div class="account-details-form">
                        <form action="#">
                            <div class="row">
                                <div class="col-lg-6">
                                    <div class="single-input-item">
                                        <label for="first-name" class="required">
                                            First
                                                                            Name</label>
                                        <input type="text" id="first-name"
                                            placeholder="First Name" />
                                    </div>
                                </div>
                                <div class="col-lg-6">
                                    <div class="single-input-item">
                                        <label for="last-name" class="required">
                                            Last
                                                                            Name</label>
                                        <input type="text" id="last-name"
                                            placeholder="Last Name" />
                                    </div>
                                </div>
                            </div>
                            <div class="single-input-item">
                                <label for="display-name" class="required">
                                    Display
                                                                    Name</label>
                                <input type="text" id="display-name"
                                    placeholder="Display Name" />
                            </div>
                            <div class="single-input-item">
                                <label for="email" class="required">Email Addres</label>
                                <input type="email" id="email"
                                    placeholder="Email Address" />
                            </div>
                            <fieldset>
                                <legend>Password change</legend>
                                <div class="single-input-item">
                                    <label for="current-pwd" class="required">
                                        Current
                                                                        Password</label>
                                    <input type="password" id="current-pwd"
                                        placeholder="Current Password" />
                                </div>
                                <div class="row">
                                    <div class="col-lg-6">
                                        <div class="single-input-item">
                                            <label for="new-pwd" class="required">
                                                New
                                                                                Password</label>
                                            <input type="password" id="new-pwd"
                                                placeholder="New Password" />
                                        </div>
                                    </div>
                                    <div class="col-lg-6">
                                        <div class="single-input-item">
                                            <label for="confirm-pwd"
                                                class="required">
                                                Confirm
                                                                                Password</label>
                                            <input type="password" id="confirm-pwd"
                                                placeholder="Confirm Password" />
                                        </div>
                                    </div>
                                </div>
                            </fieldset>
                            <div class="single-input-item">
                                <button class="btn btn-sqr">Save Changes</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
            <!-- Single Tab Content End -->
        </div>
    </div>
    <!-- My Account Tab Content End -->
</asp:Content>

