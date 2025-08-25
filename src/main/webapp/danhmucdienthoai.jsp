<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Danh mục điện thoại - iPhone, Samsung, Xiaomi</title>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="css/filecss.css"> 
    <link rel="stylesheet" href="css/footer.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@400;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <style>
        :root {
            --primary: #007bff;
            --secondary: #6c757d;
            --dark: #343a40;
            --light: #f8f9fa;
            --danger: #dc3545;
        }
        
        body {
            font-family: 'Montserrat', sans-serif;
            margin: 0;
            padding: 0;
            color: #333;
            background-color: #f5f7fa;
        }
        
        /* Hero Section */
        .product-hero {
            background: linear-gradient(135deg, var(--dark), var(--primary));
            color: white;
            padding: 29px 20px;
            text-align: center;
            margin-bottom: 25px;
            border-radius: 0 0 20px 20px;
        }
        
        .product-hero h1 {
            font-size: 2.5rem;
            margin-bottom: 15px;
            font-weight: 700;
        }
        
        .product-hero p {
            font-size: 1.2rem;
            max-width: 700px;
            margin: 0 auto;
            opacity: 0.9;
        }
        
        /* Brand Navigation */
        .brand-nav {
            display: flex;
            justify-content: center;
            flex-wrap: wrap;
            gap: 10px;
            margin-bottom: 30px;
        }
        
        .brand-btn {
            padding: 12px 25px;
            background: var(--light);
            border: none;
            border-radius: 30px;
            cursor: pointer;
            font-weight: 600;
            transition: all 0.3s ease;
            display: flex;
            align-items: center;
            box-shadow: 0 2px 5px rgba(0,0,0,0.1);
        }
        
        .brand-btn img {
            width: 24px;
            height: 24px;
            margin-right: 10px;
        }
        
        .brand-btn:hover, .brand-btn.active {
            background: var(--primary);
            color: white;
            transform: translateY(-2px);
            box-shadow: 0 4px 8px rgba(0,123,255,0.2);
        }
        
        /* Filter Section */
        .filter-section {
            background: white;
            padding: 20px;
            border-radius: 12px;
            margin-bottom: 20px;
            box-shadow: 0 5px 15px rgba(0,0,0,0.05);
        }
        
        .filter-title {
            margin-bottom: 0px;
            font-size: 1.1rem;
            color: var(--dark);
            font-weight: 600;
        }
        
        .filter-row {
            display: flex;
            flex-wrap: wrap;
            gap: 15px;
            margin-bottom by: 15px;
        }
        
        .filter-group {
            flex: 1;
            min-width: 200px;
        }
        
        .filter-group h4 {
            margin-bottom: 8px;
            font-size: 0.8rem;
            color: var(--secondary);
        }
        
        select.filter-select {
            width: 100%;
            padding: 10px 15px;
            border: 1px solid #ddd;
            border-radius: 8px;
            font-size: 0.9rem;
            background: var(--light);
            cursor: pointer;
        }
        
        /* Product Grid */
        .product-grid {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(280px, 1fr));
            gap: 25px;
            margin-bottom: 40px;
        }
        
        .product-form {
            border-radius: 12px;
            overflow: hidden;
            box-shadow: 0 5px 15px rgba(0,0,0,0.08);
            transition: all 0.3s ease;
            background: white;
        }
        
        .product-form:hover {
            transform: translateY(-10px);
            box-shadow: 0 15px 30px rgba(0,0,0,0.1);
        }
        
        .product-image {
            height: 220px;
            width: 100%;
            overflow: hidden;
            position: relative;
            background: white;
            display: flex;           
            justify-content: center; 
            align-items: center;     
        }

        .product-image img {
            width: auto;
            height: 84%;
            max-width: 100%;
            object-fit: contain;
            padding: 20px;
            transition: transform 0.5s ease;
        }
        
        .product-form:hover .product-image img {
            transform: scale(1.1);
        }
        
        .product-badge {
            position: absolute;
            top: 10px;
            left: 10px;
            background: var(--danger);
            color: white;
            padding: 5px 12px;
            border-radius: 20px;
            font-size: 0.8rem;
            font-weight: 600;
            z-index: 2; /* trên */
        }
        
        .product-content {
            padding: 20px;
        }
        
        .product-brand {
            color: var(--primary);
            font-size: 0.9rem;
            font-weight: 600;
            margin-bottom: 5px;
            text-transform: uppercase;
        }
        
        .product-name {
            font-size: 1.1rem;
            margin-bottom: 10px;
            line-height: 1.4;
            height: 50px;
            overflow: hidden;
            font-weight: 600;
        }
        
        .product-price {
            display: flex;
            align-items: center;
            margin-bottom: 15px;
        }
        
        .current-price {
            font-size: 1.3rem;
            font-weight: 700;
            color: var(--danger);
        }
        
        .old-price {
            font-size: 0.9rem;
            color: var(--secondary);
            text-decoration: line-through;
            margin-left: 10px;
        }
        
        .product-actions {
            display: flex;
            justify-content: space-between;
            align-items: center;
        }
        
        .cta-button {
            background: var(--primary);
            color: white;
            border: none;
            padding: 10px 20px;
            border-radius: 8px;
            cursor: pointer;
            transition: all 0.3s;
            flex-grow: 1;
            font-weight: 600;
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 8px;
        }
        
        .cta-button:hover {
            background: var(--dark);
        }
        
        /* Responsive */
        @media (max-width: 768px) {
            .product-hero {
                padding: 70px 15px;
            }
            
            .product-hero h1 {
                font-size: 2.2rem;
            }
            
            .brand-nav {
                gap: 8px;
            }
            
            .brand-btn {
                padding: 10px 15px;
                font-size: 0.9rem;
            }
            
            .product-grid {
                grid-template-columns: 1fr 1fr;
            }
        }
        
        @media (max-width: 480px) {
            .product-grid {
                grid-template-columns: 1fr;
            }
            
            .filter-row {
                flex-direction: column;
                gap: 10px;
            }
            
            .filter-group {
                min-width: 100%;
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <%@include file="header.jsp"%>

        <!-- Hero Section -->
        <section class="product-hero">
            <h1><i class="fas fa-list"></i> DANH MỤC ĐIỆN THOẠI</h1>
            <p>Khám phá 3 thương hiệu hàng đầu: iPhone, Samsung, Xiaomi...</p>
        </section>

        <!-- Nội dung chính -->
        <main>
            <!-- Brand Navigation -->
            <div class="brand-nav">
                <button class="brand-btn active" data-brand="all">Tất cả</button>
                <button class="brand-btn" data-brand="iphone">
                    <img src="images/logo1tao.png" alt="iPhone"> iPhone
                </button>
                <button class="brand-btn" data-brand="samsung" style="color: #1528A0">
                    <img src="images/logo2samss.png" alt="Samsung"> Samsung
                </button>
                <button class="brand-btn" data-brand="xiaomi" style="color: #FF6900">
                    <img src="images/logo3xiaomi.png" alt="Xiaomi"> Xiaomi
                </button>
            </div>

            <!-- Filter Section -->
            <section class="filter-section">
                <h3 class="filter-title">LỌC SẢN PHẨM</h3>
                <div class="filter-row">
                    <div class="filter-group">
                        <h4>Mức giá</h4>
                        <select class="filter-select" id="price-filter">
                            <option value="all">Tất cả mức giá</option>
                            <option value="1-15">Dưới 15 triệu</option>
                            <option value="15-25">15 - 25 triệu</option>
                            <option value="25">Trên 25 triệu</option>
                        </select>
                    </div>
                    <div class="filter-group">
                        <h4>Dung lượng RAM</h4>
                        <select class="filter-select" id="ram-filter">
                            <option value="all">Tất cả RAM</option>
                            <option value="4">4GB</option>
                            <option value="6">6GB</option>
                            <option value="8">8GB</option>
                            <option value="12">12GB</option>
                        </select>
                    </div>
                    <div class="filter-group">
                        <h4>Bộ nhớ trong</h4>
                        <select class="filter-select" id="storage-filter">
                            <option value="all">Tất cả bộ nhớ</option>
                            <option value="64">64GB</option>
                            <option value="128">128GB</option>
                            <option value="256">256GB</option>
                            <option value="512">512GB</option>
                        </select>
                    </div>
                </div>
            </section>

            <!-- Product Grid -->
            <div class="product-grid">
                <!-- iPhone 15 Pro Max -->
                <form action="UpdateCartServlet" method="post" class="product-form" data-brand="iphone" data-price="30" data-ram="6" data-storage="256">
                    <div class="product-image">
                        <span class="product-badge">Mới</span>
                        <img src="images/thuonghieunoibat/danhmucdienthoai/16e.jpg" alt="iPhone 15 Pro Max">
                    </div>
                    <div class="product-content">
                        <div class="product-brand">iPhone</div>
                        <h3 class="product-name">iPhone 16e 256GB</h3>
                        <div class="product-price">
                            <span class="current-price">30.990.000đ</span>
                            <span class="old-price">33.990.000đ</span>
                        </div>
                        <div class="product-actions">
                            <input type="hidden" name="action" value="add">
                            <input type="hidden" name="productId" value="iphone_15_pro_max">
                            <input type="hidden" name="productName" value="iPhone 15 Pro Max 256GB">
                            <input type="hidden" name="image" value="images/thuonghieunoibat/danhmucdienthoai/16e.jpg">
                            <input type="hidden" name="originalPrice" value="33.990.000đ">
                            <input type="hidden" name="discountedPrice" value="30.990.000đ">
                            <input type="hidden" name="discountPercent" value="8.8%">
                            <button type="submit" class="cta-button">
                                <i class="fas fa-cart-plus"></i> ĐẶT MUA NGAY
                            </button>
                        </div>
                    </div>
                </form>

                <!-- Samsung S24 Ultra -->
                <form action="UpdateCartServlet" method="post" class="product-form" data-brand="samsung" data-price="26" data-ram="12" data-storage="256">
                    <div class="product-image">
                        <span class="product-badge">Giảm 15%</span>
                        <img src="images/thuonghieunoibat/danhmucdienthoai/s24utral.jpg" alt="Samsung S24 Ultra">
                    </div>
                    <div class="product-content">
                        <div class="product-brand">Samsung</div>
                        <h3 class="product-name">Galaxy S24 Ultra 256GB</h3>
                        <div class="product-price">
                            <span class="current-price">25.990.000đ</span>
                            <span class="old-price">29.990.000đ</span>
                        </div>
                        <div class="product-actions">
                            <input type="hidden" name="action" value="add">
                            <input type="hidden" name="productId" value="samsung_s24_ultra">
                            <input type="hidden" name="productName" value="Galaxy S24 Ultra 256GB">
                            <input type="hidden" name="image" value="images/thuonghieunoibat/danhmucdienthoai/s24utral.jpg">
                            <input type="hidden" name="originalPrice" value="29.990.000đ">
                            <input type="hidden" name="discountedPrice" value="25.990.000đ">
                            <input type="hidden" name="discountPercent" value="15%">
                            <button type="submit" class="cta-button">
                                <i class="fas fa-cart-plus"></i> ĐẶT MUA NGAY
                            </button>
                        </div>
                    </div>
                </form>
                
                         <!-- Xiaomi 15 Pro -->
                <form action="UpdateCartServlet" method="post" class="product-form" data-brand="xiaomi" data-price="34" data-ram="12" data-storage="256">
                    <div class="product-image">
                        <span class="product-badge">Bán chạy</span>
                        <img src="images/thuonghieunoibat/danhmucdienthoai/Xiaomi 15 Ultra 5G 16GB 512GB.jpg" alt="Xiaomi 15 Ultra 5G 16GB 512GB">
                    </div>
                    <div class="product-content">
                        <div class="product-brand">Xiaomi</div>
                        <h3 class="product-name">Xiaomi 15 Ultra 5G 512GB</h3>
                        <div class="product-price">
                            <span class="current-price">34.990.000đ</span>
                            <span class="old-price">32.990.000đ</span>
                        </div>
                        <div class="product-actions">
                            <input type="hidden" name="action" value="add">
                            <input type="hidden" name="productId" value="Xiaomi_15_Ultra_5G">
                            <input type="hidden" name="productName" value="Xiaomi 15 Ultra 5G 16GB 512GB">
                            <input type="hidden" name="image" value="images/thuonghieunoibat/danhmucdienthoai/Xiaomi 15 Ultra 5G 16GB 512GB.jpg">
                            <input type="hidden" name="originalPrice" value="34.990.000đ">
                            <input type="hidden" name="discountedPrice" value="32.990.000đ">
                            <input type="hidden" name="discountPercent" value="6%">
                            <button type="submit" class="cta-button">
                                <i class="fas fa-cart-plus"></i> ĐẶT MUA NGAY
                            </button>
                        </div>
                    </div>
                </form>
                         
                
                <!-- iPhone 14 -->
                <form action="UpdateCartServlet" method="post" class="product-form" data-brand="iphone" data-price="16" data-ram="6" data-storage="128">
                    <div class="product-image">
                        <img src="images/thuonghieunoibat/danhmucdienthoai/iPhone 14 128GB.jpg" alt="iPhone 14">
                    </div>
                    <div class="product-content">
                        <div class="product-brand">iPhone</div>
                        <h3 class="product-name">iPhone 14 128GB</h3>
                        <div class="product-price">
                            <span class="current-price">16.990.000đ</span>
                            <span class="old-price">19.990.000đ</span>
                        </div>
                        <div class="product-actions">
                            <input type="hidden" name="action" value="add">
                            <input type="hidden" name="productId" value="iphone_14">
                            <input type="hidden" name="productName" value="iPhone 14 128GB">
                            <input type="hidden" name="image" value="images/thuonghieunoibat/danhmucdienthoai/iPhone 14 128GB.jpg">
                            <input type="hidden" name="originalPrice" value="19.990.000đ">
                            <input type="hidden" name="discountedPrice" value="16.990.000đ">
                            <input type="hidden" name="discountPercent" value="15%">
                            <button type="submit" class="cta-button">
                                <i class="fas fa-cart-plus"></i> ĐẶT MUA NGAY
                            </button>
                        </div>
                    </div>
                </form>

                <!-- Samsung Z Fold5 -->
                <form action="UpdateCartServlet" method="post" class="product-form" data-brand="samsung" data-price="35" data-ram="12" data-storage="512">
                    <div class="product-image">
                        <span class="product-badge">Độc quyền</span>
                        <img src="images/thuonghieunoibat/danhmucdienthoai/Galaxy Z Fold5 512GB.jpg" alt="Samsung Z Fold5">
                    </div>
                    <div class="product-content">
                        <div class="product-brand">Samsung</div>
                        <h3 class="product-name">Galaxy Z Fold5 512GB</h3>
                        <div class="product-price">
                            <span class="current-price">35.990.000đ</span>
                        </div>
                        <div class="product-actions">
                            <input type="hidden" name="action" value="add">
                            <input type="hidden" name="productId" value="samsung_z_fold5">
                            <input type="hidden" name="productName" value="Galaxy Z Fold5 512GB">
                            <input type="hidden" name="image" value="images/thuonghieunoibat/danhmucdienthoai/Galaxy Z Fold5 512GB.jpg">
                            <input type="hidden" name="originalPrice" value="35.990.000đ">
                            <input type="hidden" name="discountedPrice" value="35.990.000đ">
                            <input type="hidden" name="discountPercent" value="0%">
                            <button type="submit" class="cta-button">
                                <i class="fas fa-cart-plus"></i> ĐẶT MUA NGAY
                            </button>
                        </div>
                    </div>
                </form>
                
                <!-- Xiaomi 14 Pro -->
                <form action="UpdateCartServlet" method="post" class="product-form" data-brand="xiaomi" data-price="18" data-ram="12" data-storage="256">
                    <div class="product-image">
                        <img src="images/thuonghieunoibat/danhmucdienthoai/Xiaomi 14 Pro 256GB.jpg" alt="Xiaomi 14 Pro">
                    </div>
                    <div class="product-content">
                        <div class="product-brand">Xiaomi</div>
                        <h3 class="product-name">Xiaomi 14 Pro 256GB</h3>
                        <div class="product-price">
                            <span class="current-price">18.990.000đ</span>
                            <span class="old-price">21.990.000đ</span>
                        </div>
                        <div class="product-actions">
                            <input type="hidden" name="action" value="add">
                            <input type="hidden" name="productId" value="xiaomi_14_pro">
                            <input type="hidden" name="productName" value="Xiaomi 14 Pro 256GB">
                            <input type="hidden" name="image" value="images/thuonghieunoibat/danhmucdienthoai/Xiaomi 14 Pro 256GB.jpg">
                            <input type="hidden" name="originalPrice" value="21.990.000đ">
                            <input type="hidden" name="discountedPrice" value="18.990.000đ">
                            <input type="hidden" name="discountPercent" value="13.6%">
                            <button type="submit" class="cta-button">
                                <i class="fas fa-cart-plus"></i> ĐẶT MUA NGAY
                            </button>
                        </div>
                    </div>
                </form>
                                <!-- 2xiao -->
                <form action="UpdateCartServlet" method="post" class="product-form" data-brand="xiaomi" data-price="2" data-ram="6" data-storage="128">
                    <div class="product-image">
                        <span class="product-badge">Giảm 21%</span>
                        <img src="images/13.jpg">
                    </div>
                    <div class="product-content">
                        <div class="product-brand">Xiaomi</div>
                        <h3 class="product-name">Xiaomi Poco C75 6GB/128GB</h3>
                        <div class="product-price">
                            <span class="current-price">3.390.000đ</span>
                            <span class="old-price">2.690.000đ</span>
                        </div>
                        <div class="product-actions">
                            <input type="hidden" name="action" value="add">
                            <input type="hidden" name="productId" value="xiaomi_14_pro">
                            <input type="hidden" name="productName" value="Xiaomi 14 Pro 256GB">
                            <input type="hidden" name="image" value="images/13.jpg">
                            <input type="hidden" name="originalPrice" value="3.390.000đ">
                            <input type="hidden" name="discountedPrice" value="2.990.000đ">
                            <input type="hidden" name="discountPercent" value="21%">
                            <button type="submit" class="cta-button">
                                <i class="fas fa-cart-plus"></i> ĐẶT MUA NGAY
                            </button>
                        </div>
                    </div>
                </form>
                <form action="UpdateCartServlet" method="post" class="product-form" data-brand="xiaomi" data-price="11" data-ram="12" data-storage="512">
                    <div class="product-image">
                        <span class="product-badge">Giảm 19%</span>
                        <img src="images/14.jpg">
                    </div>
                    <div class="product-content">
                        <div class="product-brand">Xiaomi</div>
                        <h3 class="product-name">Xiaomi 14T 12GB/512GB</h3>
                        <div class="product-price">
                            <span class="current-price">11.390.000đ</span>
                            <span class="old-price">13.990.000đ</span>
                        </div>
                        <div class="product-actions">
                            <input type="hidden" name="action" value="add">
                            <input type="hidden" name="productId" value="xiaomi_14T_12GB">
                            <input type="hidden" name="productName" value="Xiaomi 14T 12GB/512GB">
                            <input type="hidden" name="image" value="images/14.jpg">
                            <input type="hidden" name="originalPrice" value="13.990.000đ">
                            <input type="hidden" name="discountedPrice" value="11.390.000đ">
                            <input type="hidden" name="discountPercent" value="19%">
                            <button type="submit" class="cta-button">
                                <i class="fas fa-cart-plus"></i> ĐẶT MUA NGAY
                            </button>
                        </div>
                    </div>
                </form>
                
            </div>
        </main>

        <%@include file="footer.jsp"%>
    </div>

    <script>
        // Lọc sản phẩm theo thương hiệu
        document.querySelectorAll('.brand-btn').forEach(btn => {
            btn.addEventListener('click', function() {
                document.querySelectorAll('.brand-btn').forEach(b => b.classList.remove('active'));
                this.classList.add('active');
                
                const brand = this.dataset.brand;
                filterProducts();
            });
        });
        
        // Lắng nghe thay đổi bộ lọc
        document.querySelectorAll('.filter-select').forEach(select => {
            select.addEventListener('change', filterProducts);
        });
        
        // Hàm lọc sản phẩm
        function filterProducts() {
            const activeBrand = document.querySelector('.brand-btn.active').dataset.brand;
            const priceFilter = document.getElementById('price-filter').value;
            const ramFilter = document.getElementById('ram-filter').value;
            const storageFilter = document.getElementById('storage-filter').value;
            
            document.querySelectorAll('.product-form').forEach(product => {
                const brand = product.dataset.brand;
                const price = parseFloat(product.dataset.price);
                const ram = product.dataset.ram;
                const storage = product.dataset.storage;
                
                // Kiểm tra brand
                const brandMatch = activeBrand === 'all' || brand === activeBrand;
                
                // Kiểm tra price
                let priceMatch = true;
                if (priceFilter !== 'all') {
                    const [min, max] = priceFilter.split('-').map(Number);
                    if (max) {
                        priceMatch = price >= min && price <= max;
                    } else {
                        priceMatch = price >= min;
                    }
                }
                
                // Kiểm tra RAM
                const ramMatch = ramFilter === 'all' || ram === ramFilter;
                
                // Kiểm tra storage
                const storageMatch = storageFilter === 'all' || storage === storageFilter;
                
                // Hiển thị/ẩn sản phẩm
                if (brandMatch && priceMatch && ramMatch && storageMatch) {
                    product.style.display = 'block';
                } else {
                    product.style.display = 'none';
                }
            });
        }
    </script>
</body>
</html>