<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/FirstMaster.Master" AutoEventWireup="true" CodeBehind="Dashboard.aspx.cs" Inherits="AvniemporiumNet.Admin.Dashboard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

  
        <div class="col-lg-12">
            <div class="welcomenote">
                <h5>Welcome Back</h5>
                <h3>Atul Kumar</h3>
                <p>Everything is going good</p>
                <img src="../Content/Admin/images/dashboardimg1.png" alt="">
            </div>
        </div>

        <div class="row">
            <div class="col-lg-3 col-md-6 col-sm-6 col-6">
                <div class="totalquerycard">
                    <img src="../Content/Admin/images/email.png" alt="">
                    <div class="querynumber">
                        <h5>Total Orders</h5>
                        <p>2000</p>
                    </div>
                </div>
            </div>
            <div class="col-lg-3 col-md-6 col-sm-6 col-6">
                <div class="totalquerycard">
                    <img src="../Content/Admin/images/subscribe.png" alt="">
                    <div class="querynumber">
                        <h5>Total User</h5>
                        <p>230</p>
                    </div>
                </div>
            </div>
            <div class="col-lg-3 col-md-6 col-sm-6 col-6">
                <div class="totalquerycard">
                    <img src="../Content/Admin/images/subscribe.png" alt="">
                    <div class="querynumber">
                        <h5>Refund Request</h5>
                        <p>230</p>
                    </div>
                </div>
            </div>
            <div class="col-lg-3 col-md-6 col-sm-6 col-6">
                <div class="totalquerycard">
                    <img src="../Content/Admin/images/click.png" alt="">
                    <div class="querynumber">
                        <h5>Total Products</h5>
                        <p>15000</p>
                    </div>
                </div>
            </div>

        </div>

        <div class="row">
            <div class="col-lg-7">
                <div class="performancecard whitecard">
                    <h4 class="cardheading">Audience Overview</h4>
                    <p class="perioddate">28 January, 2023 - 4 January, 2023</p>

                    <div class="row">
                        <div class="col-lg-3">
                            <div class="userper">
                                <p>New Users</p>
                                <h5>19,202</h5>
                                <i></i>
                            </div>
                        </div>
                        <div class="col-lg-3">
                            <div class="userper">
                                <p>Page Views</p>
                                <h5>21,202</h5>
                                <i></i>
                            </div>
                        </div>
                        <div class="col-lg-3">
                            <div class="userper">
                                <p>Page Sessions</p>
                                <h5>15,202</h5>
                                <i></i>
                            </div>
                        </div>
                        <div class="col-lg-3">
                            <div class="userper">
                                <p>Bounce Rate</p>
                                <h5>15,202</h5>
                                <i></i>
                            </div>
                        </div>
                    </div>

                    <div id="chartdiv"></div>
                </div>
            </div>

            <div class="col-lg-5">
                <div class="visitorcard whitecard">
                    <h4 class="cardheading">Total Visits</h4>
                    <div class="table-responsive mt-3">
                        <table class="table table-bordered table-hover">
                            <thead>
                                <tr>
                                    <th>Link</th>
                                    <th>Page Title</th>
                                    <th>Visitors</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td><a href=""><i class='bx bx-link'></i></a></td>
                                    <td>HomePage</td>
                                    <td>22,000</td>
                                </tr>
                                <tr>
                                    <td><a href=""><i class='bx bx-link'></i></a></td>
                                    <td>About Us</td>
                                    <td>11,239</td>
                                </tr>
                                <tr>
                                    <td><a href=""><i class='bx bx-link'></i></a></td>
                                    <td>Service</td>
                                    <td>22,000</td>
                                </tr>
                                <tr>
                                    <td><a href=""><i class='bx bx-link'></i></a></td>
                                    <td>Testimonial</td>
                                    <td>22,000</td>
                                </tr>
                                <tr>
                                    <td><a href=""><i class='bx bx-link'></i></a></td>
                                    <td>Contact Us</td>
                                    <td>22,000</td>
                                </tr>
                            </tbody>
                        </table>
                    </div>

                </div>
            </div>

            <div class="col-lg-6">
                <div class="whitecard devicereportcard">
                    <h4 class="cardheading">Device Sessions</h4>

                    <div id="devicereportdiv"></div>
                </div>
            </div>

            <div class="col-lg-6">
                <div class="whitecard devicereportcard">
                    <h4 class="cardheading">Website Performance</h4>

                    <div class="col-lg-12">
                        <div class="websiteratewrap">
                            <div class="websiteratetext">
                                <p>Bounce Rate (avg)</p>
                                <h5>24.67% </h5>
                            </div>
                            <div class="webpermeter">
                                <div id="websiteperformancemeter"></div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-12">
                        <div class="websiteratewrap">
                            <div class="websiteratetext">
                                <p>Page Views (avg)</p>
                                <h5>24.67% </h5>
                            </div>
                            <div class="webpermeter">
                                <div id="websiteperformancemeter"></div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-12">
                        <div class="websiteratewrap">
                            <div class="websiteratetext">
                                <p>Time On Site (avg)</p>
                                <h5>24.67% </h5>
                            </div>
                            <div class="webpermeter">
                                <div id="websiteperformancemeter"></div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="row">
            <div class="col-lg-12">
                <div class="whitecard">
                    <h5 class="cardheading">Browser Used By Users</h5>
                    <div class="table-responsive">
                        <table class="table-hover table">
                            <thead>
                                <tr>
                                    <th>Browser</th>
                                    <th>User</th>
                                    <th>Session Timing</th>
                                    <th>Bounce Rate</th>
                                </tr>
                            </thead>

                            <tbody>
                                <tr>
                                    <td>
                                        <img src="../Content/Admin/images/chrome.png" alt="" class="browslist">
                                        Google chrome</td>
                                    <td>22,958</td>
                                    <td>15 Minutes</td>
                                    <td>24.5%</td>
                                </tr>
                                <tr>
                                    <td>
                                        <img src="../Content/Admin/images/safari.png" alt="" class="browslist">
                                        Apple Safari</td>
                                    <td>22,958</td>
                                    <td>15 Minutes</td>
                                    <td>24.5%</td>
                                </tr>
                                <tr>
                                    <td>
                                        <img src="../Content/Admin/images/microsoft.png" alt="" class="browslist">
                                        Microsoft Edge
                                    </td>
                                    <td>22,958</td>
                                    <td>15 Minutes</td>
                                    <td>24.5%</td>
                                </tr>
                                <tr>
                                    <td>
                                        <img src="../Content/Admin/images/opera.png" alt="" class="browslist">
                                        Opera</td>
                                    <td>22,958</td>
                                    <td>15 Minutes</td>
                                    <td>24.5%</td>
                                </tr>
                                <tr>
                                    <td>
                                        <img src="../Content/Admin/images/firefox.png" alt="" class="browslist">
                                        Mozilla Firefox
                                    </td>
                                    <td>22,958</td>
                                    <td>15 Minutes</td>
                                    <td>24.5%</td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    
</asp:Content>
