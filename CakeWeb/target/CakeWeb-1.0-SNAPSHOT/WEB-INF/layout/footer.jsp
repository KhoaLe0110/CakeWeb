<%-- 
    Document   : footer
    Created on : Jul 21, 2023, 1:12:29 PM
    Author     : admin
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  

<!-- Remove the container if you want to extend the Footer to full width. -->
<div class="my-5">
    <!-- Footer -->
    <footer
        class="text-center text-lg-start text-dark"
        style="background-color: #ECEFF1"
        >
        <!-- Section: Social media -->
        <section
            class="d-flex justify-content-between p-4 text-white"
            style="background-color: #20c997"
            >
            <!-- Left -->
            <div class="me-5">
                <span>Get connected with us on social networks:</span>
            </div>
            <!-- Left -->

            <!-- Right -->
            <div>
                <a href="" class="text-white me-4">
                    <i class="fa fa-facebook-f"></i>
                </a>
                <a href="" class="text-white me-4">
                    <i class="fa fa-twitter"></i>
                </a>
                <a href="" class="text-white me-4">
                    <i class="fa fa-google"></i>
                </a>
                <a href="" class="text-white me-4">
                    <i class="fa fa-instagram"></i>
                </a>
                <a href="" class="text-white me-4">
                    <i class="fa fa-linkedin"></i>
                </a>
                <a href="" class="text-white me-4">
                    <i class="fa fa-github"></i>
                </a>
            </div>
            <!-- Right -->
        </section>
        <!-- Section: Social media -->

        <!-- Section: Links  -->
        <section class="">
            <div class="container text-center text-md-start mt-5">
                <!-- Grid row -->
                <div class="row mt-3">
                    <!-- Grid column -->
                    <div class="col-md-3 col-lg-4 col-xl-3 mx-auto mb-4">
                        <!-- Content -->
                        <h6 class="text-uppercase fw-bold">Khoa Bakery</h6>
                        <hr
                            class="mb-4 mt-0 d-inline-block mx-auto"
                            style="width: 60px; background-color: #7c4dff; height: 2px"
                            />
                        <p>
                            Hãy đến với chúng tôi để có những chiếc bánh chất lượng nhất 
                            cũng như yên tâm về giá cả niêm yết
                        </p>
                    </div>
                    <!-- Grid column -->

                    <!-- Grid column -->
                    <div class="col-md-2 col-lg-2 col-xl-2 mx-auto mb-4">
                        <!-- Links -->
                        <h6 class="text-uppercase fw-bold">Các loại bánh</h6>
                        <hr
class="mb-4 mt-0 d-inline-block mx-auto"
                            style="width: 60px; background-color: #7c4dff; height: 2px"
                            />
                        <p>
                            <a href="#!" class="text-dark">Bánh kem cỡ lớn</a>
                        </p>
                        <p>
                            <a href="#!" class="text-dark">Bánh kem cỡ nhỏ</a>
                        </p>
                        <p>
                            <a href="#!" class="text-dark">Bánh kem hình vuông</a>
                        </p>
                        <p>
                            <a href="#!" class="text-dark">Bánh kem không đường</a>
                        </p>
                    </div>
                    <!-- Grid column -->

                    <!-- Grid column -->
                    <div class="col-md-3 col-lg-2 col-xl-2 mx-auto mb-4">
                        <!-- Links -->
                        <h6 class="text-uppercase fw-bold">Các liên kết</h6>
                        <hr
                            class="mb-4 mt-0 d-inline-block mx-auto"
                            style="width: 60px; background-color: #7c4dff; height: 2px"
                            />
                        <p>
                            <a href="#" class="text-dark">Your Account</a>
                        </p>
                        <p>
                            <a href="<c:url value="/address" />" class="text-dark">Địa chỉ</a>
                        </p>
                        <p>
                            <a href="#" class="text-dark">Shipping Rates</a>
                        </p>
                        <p>
                            <a href="#" class="text-dark">Help</a>
                        </p>
                    </div>
                    <!-- Grid column -->

                    <!-- Grid column -->
                    <div class="col-md-4 col-lg-3 col-xl-3 mx-auto mb-md-0 mb-4">
                        <!-- Links -->
                        <h6 class="text-uppercase fw-bold">Contact</h6>
                        <hr
                            class="mb-4 mt-0 d-inline-block mx-auto"
                            style="width: 60px; background-color: #7c4dff; height: 2px"
                            />
                        <p><i class="fa fa-home mr-3"></i> Khu dân cư Nhơn Đức , Nhà bè
                        Thành phố Hồ Chí Minh</p>
                        <p><i class="fa fa-envelope mr-3"></i> khoale1102002@gmail.com</p>
                        <p><i class="fa fa-phone mr-3"></i> + 84 78 9066 173</p>
                       
                    </div>
                    <!-- Grid column -->
                </div>
                <!-- Grid row -->
            </div>
        </section>
        <!-- Section: Links  -->

        <!-- Copyright -->
        <div
            class="text-center p-3"
            style="background-color: rgba(0, 0, 0, 0.2)"
            >
           Khoa Bakery © 2023 Copyright:

        </div>
        <!-- Copyright -->
    </footer>
    <!-- Footer -->
</div>
<!-- End of .container -->