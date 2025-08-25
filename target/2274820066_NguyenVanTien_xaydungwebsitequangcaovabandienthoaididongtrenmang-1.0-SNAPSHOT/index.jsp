<%@page import="com.nguyenvantien.dao.DBConnect"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="com.nguyenvantien.dao.ProductDAO, com.nguyenvantien.dao.DBConnect, java.sql.*, java.util.*" %>

<!DOCTYPE html>
<html>
<head>
    <title>Trang Chủ</title>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="css/filecss.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    
    <style>
        /* Product grid layout */
        .product-row {
            display: flex;
            flex-wrap: wrap;
            gap: 14px;
        }

        /* Product card styling */
        .product {
            position: relative;
            flex: 1 1 calc(25% - 20px);
            box-sizing: border-box;
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 8px;
            text-align: center;
            background-color: #fff;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            overflow: hidden;
        }

        /* Product image */
        .product img {
            width: 100%;
            height: auto;
            display: block;
            margin-top: 40px;
        }

        /* Discount and installment badges */
        .discount-badge {
            position: absolute;
            top: 10px;
            left: 10px;
            background-color: rgba(255, 0, 0, 0.86);
            color: #fff;
            padding: 5px 10px;
            border-radius: 4px;
            font-size: 12px;
            font-weight: bold;
            z-index: 1;
        }

        .tragop0phantram {
            position: absolute;
            top: 10px;
            left: 63px;
            background-color: rgba(240, 240, 240, 0.9);
            color: rgba(0, 0, 0, 0.88);
            padding: 5px 10px;
            border-radius: 4px;
            font-size: 12px;
            z-index: 1;
        }

        /* Product title */
        .product h3 {
            display: -webkit-box;
            -webkit-line-clamp: 2;
            -webkit-box-orient: vertical;
            overflow: hidden;
            text-overflow: ellipsis;
            line-height: 1.45;
            height: 3em;
            margin: 10px 0;
            font-weight: 499;
        }

        /* Price styling */
        .price {
            font-weight: bold;
            color: #f00;
            margin-bottom: 10px;
        }

        .original-price {
            text-decoration: line-through;
            color: #999;
            font-size: 14px;
            margin-right: 10px;
        }

        .discounted-price {
            color: #f00;
            font-size: 18px;
        }

        .discount-amount {
            color: #f00;
            font-size: 14px;
            margin-bottom: 10px;
        }

        /* Rating and stock info */
        .rating-stock {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 10px;
        }

        .rating {
            color: #ffcc00;
            font-size: 16px;
        }

        .stock {
            color: #00a650;
            font-size: 14px;
        }

        /* Add to cart button */
        form[action="UpdateCartServlet"] {
            margin: 10px auto;
            width: 100%;
            display: flex;
            justify-content: center;
        }

        .buy-now {
            display: flex;
            align-items: center;
            justify-content: center;
            background-color: rgba(0, 0, 255, 0.60);
            color: white;
            padding: 8px 12px;
            text-decoration: none;
            border-radius: 4px;
            transition: all 0.3s ease;
            width: 100%;
            margin-right: 29px;
            max-width: 220px;
            border: none;
            cursor: pointer;
            font-size: 14px;
            gap: 8px;
        }

        .buy-now:hover {
            background-color: rgba(0, 0, 255, 0.685);
            transform: translateY(-1px);
            box-shadow: 0 2px 5px rgba(0,0,0,0.2);
        }

        .buy-now i {
            font-size: 16px;
        }
        
        
        
        [id="apple"], [id="sony"], [id="samsung"], [id="xiao"] {
          scroll-margin-top: 224px;
        }
    </style>
</head>
<body>
    <%@include file="header.jsp"%>
    <!-- Phần nội dung chính -->
        <div class="main-content">
            <!-- Banner quảng cáo ( trái) -->
            <div class="ad-banner left-banner">
                <img src="images/quảng cáo 1.jpg" alt="Quảng cáo bên trái">
                <div class="ad-content">
                    <h2>Samsung Galaxy S25 Ultra 12GB 256GB</h2>
                    <p style="text-align: justify"> Trải nghiệm âm thanh sống động, chân thực.
                        Chống nước, chống bụi, thiết kế cao cấp, sang trọng.
                        Hiển thị sắc nét, Mượt mà, tiết kiệm pin.<br>
                    </p>
                    <p><em>Kết quả được thống kê từ samsung.</em></p>
                    <a href="s25utral.jsp" class="see-more"> <i class="fa-solid fa-magnifying-glass" style="margin-right: 5px"></i> Xem thêm</a>
                </div>
            </div>

            <!-- Slide ảnh ( giưax) -->
            <div class="slideshow-container">
                <img src="images/qc1.jpg" alt="Slide 1" class="active" onclick="window.location.href='s25utral.jsp'">
                <img src="images/qc2.jpg" alt="Slide 2" onclick="window.location.href='s2_iphone16prm.jsp'">
                <a class="prev" onclick="plusSlides(-1)">&#10094;</a>
                <a class="next" onclick="plusSlides(1)">&#10095;</a>
            </div>

            <!-- Danh mục sản phẩm nổi bật ( phải ) -->
            <div class="featured-categories">
                <div class="new-posts">
                    <span>THƯƠNG HIỆU NỔI BẬT</span>
                </div>
                <ul>
                    <li><a href="zTHnoibatapple.jsp" class="category-link">Thương hiệu Apple, biểu tượng toàn cầu công nghệ</a></li><hr>
                    <li><a href="zTHnoibatssung.jsp" class="category-link">Samsung, thương hiệu điện tử hàng đầu thế giới đến từ Hàn Quốc</a></li><hr>
                    <li><a href="zTHnoibatsony.jsp" class="category-link">Sony những sáng tạo đột phá mang tính cách mạng và chất lượng sản phẩm</a></li><hr>
                    <li><a href="zTHnoibatxiao.jsp" class="category-link">Thương hiệu Xiaomi, Sản phẩm nổi bật và lịch sử hình thành của nó.</a></li>
                </ul>
            </div>
        </div>

        <!-- Thumbnail ảnh -->
        <div class="thumbnail-container">
            <img src="images/táo4.jpg" alt="Thumbnail 1" onclick="window.location.href='#apple'">
            <img src="images/ss4.jpg" alt="Thumbnail 2" onclick="window.location.href='#samsung'">
            <img src="images/sony4.png" alt="Thumbnail 3" onclick="window.location.href='#sony'">
            <img src="images/xm4.jpg" alt="Thumbnail 4" onclick="window.location.href='#xiao'">
        </div>
    <!-- dưới 4 logo ip, ss, xia, sony -->
    
    
    <section class="product-list">
    <div class="content">
        <%@include file="zbannerhang1.jsp"%>
    <!-- Phần hiển thị sản phẩm Apple -->
    <div class="content-section">
    <h3 id="apple">
        <img src="images/logo1tao.png" 
           style="height: 1em; vertical-align: middle;">
      <span style="vertical-align: middle;">ĐIỆN THOẠI APPLE</span>
    </h3>
        <div class="product-row">
            <%
            try (Connection conn = DBConnect.getConnection()) {
                ProductDAO productDAO = new ProductDAO(conn);
                List<Map<String, String>> appleProducts = productDAO.getProductsByCategory("apple");
                
                if (appleProducts.isEmpty()) {
                    out.println("<p>Không có sản phẩm nào trong danh mục này</p>");
                } else {
                    for (Map<String, String> product : appleProducts) {
                        double originalPrice = Double.parseDouble(product.get("originalPrice").replaceAll("[^0-9]", ""));
                        double discountedPrice = Double.parseDouble(product.get("discountedPrice").replaceAll("[^0-9]", ""));
                        double discountAmount = originalPrice - discountedPrice;
                        String formattedDiscount = String.format("%,.0fđ", discountAmount).replace(",", ".");
            %>
            <article class="product">
                <div class="discount-badge">-<%= product.get("discountPercent") %>%</div>
                <div class="tragop0phantram">Trả góp 0%</div>
                <img src="<%= product.get("image") %>" alt="<%= product.get("name") %>">
                <h3><%= product.get("name") %></h3>
                <p class="price">
                    <span class="original-price"><%= product.get("originalPrice") %></span>
                    <span class="discounted-price"><%= product.get("discountedPrice") %></span>
                </p>
                <p class="discount-amount">Giảm <%= formattedDiscount %></p>
                <div class="rating-stock">
                    <div class="rating">★★★★★ <%= product.get("rating") %></div>
                    <p class="stock"> SL:<%= product.get("stock") %> <i class="fa-solid fa-mobile-screen-button"></i></p>
                </div>
                <form action="UpdateCartServlet" method="post">
                    <input type="hidden" name="action" value="add">
                    <input type="hidden" name="productId" value="<%= product.get("id") %>">
                    <input type="hidden" name="productName" value="<%= product.get("name") %>">
                    <input type="hidden" name="image" value="<%= product.get("image") %>">
                    <input type="hidden" name="originalPrice" value="<%= product.get("originalPrice") %>">
                    <input type="hidden" name="discountedPrice" value="<%= product.get("discountedPrice") %>">
                    <input type="hidden" name="discountPercent" value="<%= product.get("discountPercent") %>%">
                    <button type="submit" class="buy-now">
                        <i class="fas fa-cart-plus"></i> Đặt mua ngay
                    </button>
                </form>
            </article>
            <%
                    }
                }
            } catch (Exception e) {
                e.printStackTrace();
                out.println("<p style='color:red'>Lỗi khi tải sản phẩm Apple: " + e.getMessage() + "</p>");
            }
            %>
        </div>
    </div>
        
        <%@include file="zbannerhang2.jsp"%>
    <!-- Phần hiển thị sản phẩm Samsung -->
    <div class="content-section">
        <h3 style="color: #1528A0" id="samsung">
        <img src="images/logo2samss.png" 
           style="height: 1em; vertical-align: middle;">
      <span style="vertical-align: middle;">ĐIỆN THOẠI SAMSUNG</span>
    </h3>
        <div class="product-row">
            <%
            try (Connection conn = DBConnect.getConnection()) {
                ProductDAO productDAO = new ProductDAO(conn);
                List<Map<String, String>> samsungProducts = productDAO.getProductsByCategory("samsung");
                
                if (samsungProducts.isEmpty()) {
                    out.println("<p>Không có sản phẩm nào trong danh mục này</p>");
                } else {
                    for (Map<String, String> product : samsungProducts) {
                        double originalPrice = Double.parseDouble(product.get("originalPrice").replaceAll("[^0-9]", ""));
                        double discountedPrice = Double.parseDouble(product.get("discountedPrice").replaceAll("[^0-9]", ""));
                        double discountAmount = originalPrice - discountedPrice;
                        String formattedDiscount = String.format("%,.0fđ", discountAmount).replace(",", ".");
            %>
            <article class="product">
                <div class="discount-badge">-<%= product.get("discountPercent") %>%</div>
                <div class="tragop0phantram">Trả góp 0%</div>
                <img src="<%= product.get("image") %>" alt="<%= product.get("name") %>">
                <h3><%= product.get("name") %></h3>
                <p class="price">
                    <span class="original-price"><%= product.get("originalPrice") %></span>
                    <span class="discounted-price"><%= product.get("discountedPrice") %></span>
                </p>
                <p class="discount-amount">Giảm <%= formattedDiscount %></p>
                <div class="rating-stock">
                    <div class="rating">★★★★★ <%= product.get("rating") %></div>
                    <p class="stock"> SL:<%= product.get("stock") %> <i class="fa-solid fa-mobile-screen-button"></i></p>
                </div>
                <form action="UpdateCartServlet" method="post">
                    <input type="hidden" name="action" value="add">
                    <input type="hidden" name="productId" value="<%= product.get("id") %>">
                    <input type="hidden" name="productName" value="<%= product.get("name") %>">
                    <input type="hidden" name="image" value="<%= product.get("image") %>">
                    <input type="hidden" name="originalPrice" value="<%= product.get("originalPrice") %>">
                    <input type="hidden" name="discountedPrice" value="<%= product.get("discountedPrice") %>">
                    <input type="hidden" name="discountPercent" value="<%= product.get("discountPercent") %>%">
                    <button type="submit" class="buy-now">
                        <i class="fas fa-cart-plus"></i> Đặt mua ngay
                    </button>
                </form>
            </article>
            <%
                    }
                }
            } catch (Exception e) {
                e.printStackTrace();
                out.println("<p style='color:red'>Lỗi khi tải sản phẩm Samsung: " + e.getMessage() + "</p>");
            }
            %>
        </div>
    </div>
        
        <%@include file="zbannerhang3.jsp"%>
    <!-- Phần hiển thị sản phẩm Xiaomi -->
    <div class="content-section">
    <h3 style="color: #FF6900" id="xiao">
            <img src="images/logo3xiaomi.png" 
               style="height: 1em; vertical-align: middle;">
          <span style="vertical-align: middle;">ĐIỆN THOẠI XIAOMI</span>
        </h3>
        <div class="product-row">
            <%
            try (Connection conn = DBConnect.getConnection()) {
                ProductDAO productDAO = new ProductDAO(conn);
                List<Map<String, String>> xiaomiProducts = productDAO.getProductsByCategory("xiaomi");
                
                if (xiaomiProducts.isEmpty()) {
                    out.println("<p>Không có sản phẩm nào trong danh mục này</p>");
                } else {
                    for (Map<String, String> product : xiaomiProducts) {
                        double originalPrice = Double.parseDouble(product.get("originalPrice").replaceAll("[^0-9]", ""));
                        double discountedPrice = Double.parseDouble(product.get("discountedPrice").replaceAll("[^0-9]", ""));
                        double discountAmount = originalPrice - discountedPrice;
                        String formattedDiscount = String.format("%,.0fđ", discountAmount).replace(",", ".");
            %>
            <article class="product">
                <div class="discount-badge">-<%= product.get("discountPercent") %>%</div>
                <div class="tragop0phantram">Trả góp 0%</div>
                <img src="<%= product.get("image") %>" alt="<%= product.get("name") %>">
                <h3><%= product.get("name") %></h3>
                <p class="price">
                    <span class="original-price"><%= product.get("originalPrice") %></span>
                    <span class="discounted-price"><%= product.get("discountedPrice") %></span>
                </p>
                <p class="discount-amount">Giảm <%= formattedDiscount %></p>
                <div class="rating-stock">
                    <div class="rating">★★★★★ <%= product.get("rating") %></div>
                    <p class="stock"> SL:<%= product.get("stock") %> <i class="fa-solid fa-mobile-screen-button"></i></p>
                </div>
                <form action="UpdateCartServlet" method="post">
                    <input type="hidden" name="action" value="add">
                    <input type="hidden" name="productId" value="<%= product.get("id") %>">
                    <input type="hidden" name="productName" value="<%= product.get("name") %>">
                    <input type="hidden" name="image" value="<%= product.get("image") %>">
                    <input type="hidden" name="originalPrice" value="<%= product.get("originalPrice") %>">
                    <input type="hidden" name="discountedPrice" value="<%= product.get("discountedPrice") %>">
                    <input type="hidden" name="discountPercent" value="<%= product.get("discountPercent") %>%">
                    <button type="submit" class="buy-now">
                        <i class="fas fa-cart-plus"></i> Đặt mua ngay
                    </button>
                </form>
            </article>
            <%
                    }
                }
            } catch (Exception e) {
                e.printStackTrace();
                out.println("<p style='color:red'>Lỗi khi tải sản phẩm Xiaomi: " + e.getMessage() + "</p>");
            }
            %>
        </div>
    </div>
        
        <%@include file="zbannerhang4.jsp"%>
    <!-- Phần hiển thị sản phẩm Other -->
    <div class="content-section">
        <h2 id="sony">CÁC MẪU ĐIỆN THOẠI KHÁC</h2>
        <div class="product-row">
            <%
            try (Connection conn = DBConnect.getConnection()) {
                ProductDAO productDAO = new ProductDAO(conn);
                List<Map<String, String>> otherProducts = productDAO.getProductsByCategory("other");
                
                if (otherProducts.isEmpty()) {
                    out.println("<p>Không có sản phẩm nào trong danh mục này</p>");
                } else {
                    for (Map<String, String> product : otherProducts) {
                        double originalPrice = Double.parseDouble(product.get("originalPrice").replaceAll("[^0-9]", ""));
                        double discountedPrice = Double.parseDouble(product.get("discountedPrice").replaceAll("[^0-9]", ""));
                        double discountAmount = originalPrice - discountedPrice;
                        String formattedDiscount = String.format("%,.0fđ", discountAmount).replace(",", ".");
            %>
            <article class="product">
                <div class="discount-badge">-<%= product.get("discountPercent") %>%</div>
                <div class="tragop0phantram">Trả góp 0%</div>
                <img src="<%= product.get("image") %>" alt="<%= product.get("name") %>">
                <h3><%= product.get("name") %></h3>
                <p class="price">
                    <span class="original-price"><%= product.get("originalPrice") %></span>
                    <span class="discounted-price"><%= product.get("discountedPrice") %></span>
                </p>
                <p class="discount-amount">Giảm <%= formattedDiscount %></p>
                <div class="rating-stock">
                    <div class="rating">★★★★★ <%= product.get("rating") %></div>
                    <p class="stock"> SL:<%= product.get("stock") %> <i class="fa-solid fa-mobile-screen-button"></i></p>
                </div>
                <form action="UpdateCartServlet" method="post">
                    <input type="hidden" name="action" value="add">
                    <input type="hidden" name="productId" value="<%= product.get("id") %>">
                    <input type="hidden" name="productName" value="<%= product.get("name") %>">
                    <input type="hidden" name="image" value="<%= product.get("image") %>">
                    <input type="hidden" name="originalPrice" value="<%= product.get("originalPrice") %>">
                    <input type="hidden" name="discountedPrice" value="<%= product.get("discountedPrice") %>">
                    <input type="hidden" name="discountPercent" value="<%= product.get("discountPercent") %>%">
                    <button type="submit" class="buy-now">
                        <i class="fas fa-cart-plus"></i> Đặt mua ngay
                    </button>
                </form>
            </article>
            <%
                    }
                }
            } catch (Exception e) {
                e.printStackTrace();
                out.println("<p style='color:red'>Lỗi khi tải sản phẩm khác: " + e.getMessage() + "</p>");
            }
            %>
        </div>
    </div>

    <%@include file="footer.jsp"%>
    
    </div>
    </section> 
<!--đóng thẻ secti on-->
    
    <script>
        // JavaScript để điều khiển slide ảnh tự động
        let slideIndex = 0;
        showSlides();

        function showSlides() {
            let slides = document.querySelectorAll(".slideshow-container img");
            slides.forEach(slide => slide.classList.remove("active"));
            slideIndex++;
            if (slideIndex > slides.length) { slideIndex = 1 }
            slides[slideIndex - 1].classList.add("active");
            setTimeout(showSlides, 3000); // Chuyển ảnh sau mỗi 3 giây
        }

        function plusSlides(n) {
            slideIndex += n;
            let slides = document.querySelectorAll(".slideshow-container img");
            if (slideIndex > slides.length) { slideIndex = 1 }
            if (slideIndex < 1) { slideIndex = slides.length }
            slides.forEach(slide => slide.classList.remove("active"));
            slides[slideIndex - 1].classList.add("active");
        }
    </script>
</body>
</html>