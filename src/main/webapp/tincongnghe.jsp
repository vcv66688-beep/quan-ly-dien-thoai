<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Tin Công Nghệ Điện Thoại Mới Nhất</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <style>
        :root {
            --primary-color: #1a237e;
            --secondary-color: #283593;
            --accent-color: #3949ab;
            --light-color: #e8eaf6;
            --dark-color: #0d153a;
        }
        
        /* Article Link Styles */
        .article-link {
            display: contents;
            text-decoration: none;
            color: inherit;
        }
        
        /* Hero Section */
        .tech-hero {
            border-radius: 0 0 20px 20px;
            overflow: hidden;
            background: linear-gradient(135deg, var(--dark-color), var(--primary-color)), url('images/phone-tech-banner.jpg');
            background-size: cover;
            background-position: center;
            color: white;
            padding: 29px 20px;
            text-align: center;
            margin-bottom: 20px;
        }
        
        .tech-hero h1 {
            font-size: 2.5rem;
            margin-bottom: 17px;
            text-shadow: 2px 2px 4px rgba(0,0,0,0.5);
        }
        
        /* News Section */
        .news-section {
            margin-bottom: 50px;
        }
        
        .section-title {
            color: var(--primary-color);
            margin-bottom: 20px;
            padding-bottom: 10px;
            border-bottom: 2px solid var(--accent-color);
            display: inline-block;
            font-size: 1.8rem;
        }
        
        /* News Grid */
        .news-grid {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(350px, 1fr));
            gap: 30px;
            margin-top: 30px;
        }
        
        .news-card {
            border-radius: 8px;
            overflow: hidden;
            box-shadow: 0 3px 10px rgba(0,0,0,0.1);
            transition: all 0.3s ease;
            background: white;
            position: relative;
        }
        
        .news-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 5px 15px rgba(0,0,0,0.2);
        }
        
        .news-image {
            height: 200px;
            overflow: hidden;
            position: relative;
            background-color: #f5f5f5; 
        }
        
        .news-image img {
            width: 100%;
            height: 100%;
            object-fit: cover;
            transition: transform 0.5s ease;
            display: block; 
        }
        
        .news-card:hover .news-image img {
            transform: scale(1.05);
        }
        
        .news-content {
            padding: 20px;
            background: white;
        }
        
        .news-category {
            display: inline-block;
            background: var(--primary-color);
            color: white;
            padding: 3px 10px;
            border-radius: 4px;
            font-size: 0.8rem;
            margin-bottom: 10px;
        }
        
        .news-title {
            font-size: 1.2rem;
            margin-bottom: 10px;
            line-height: 1.4;
            color: var(--dark-color);
        }
        
        .news-excerpt {
            color: #666;
            margin-bottom: 15px;
            line-height: 1.6;
        }
        
        .news-meta {
            display: flex;
            justify-content: space-between;
            color: #888;
            font-size: 0.9rem;
        }
        
        .news-meta i {
            margin-right: 5px;
        }
        
        /* Featured News */
        .featured-news {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 30px;
            margin-bottom: 50px;
        }
        
        .main-feature {
            grid-column: span 2;
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 30px;
            align-items: center;
            background: white;
            border-radius: 8px;
            overflow: hidden;
            box-shadow: 0 3px 10px rgba(0,0,0,0.1);
            transition: all 0.3s ease;
        }
        
        .main-feature:hover {
            transform: translateY(-5px);
            box-shadow: 0 5px 15px rgba(0,0,0,0.2);
        }
        
        .main-feature .news-image {
            height: 300px;
        }
        
        .main-feature .news-content {
            padding: 30px;
        }
        
        .main-feature .news-title {
            font-size: 1.8rem;
        }
        
        /* Newsletter */
        .newsletter {
            background: var(--light-color);
            padding: 40px;
            border-radius: 8px;
            text-align: center;
            margin-bottom: 50px;
        }
        
        .newsletter h3 {
            margin-bottom: 20px;
            color: var(--dark-color);
            font-size: 1.5rem;
        }
        
        .newsletter-form {
            display: flex;
            max-width: 500px;
            margin: 0 auto;
        }
        
        .newsletter-form input {
            flex: 1;
            padding: 12px;
            border: 1px solid #ddd;
            border-radius: 4px 0 0 4px;
            font-size: 1rem;
            border-right: none;
        }
        
        .newsletter-form button {
            background: var(--primary-color);
            color: white;
            border: none;
            padding: 0 20px;
            border-radius: 0 4px 4px 0;
            cursor: pointer;
            transition: background 0.3s;
            font-size: 1rem;
        }
        
        .newsletter-form button:hover {
            background: var(--secondary-color);
        }
        
        /* Responsive */
        @media (max-width: 768px) {
            .tech-hero {
                padding: 60px 15px;
            }
            
            .tech-hero h1 {
                font-size: 2rem;
            }
            
            .featured-news, 
            .main-feature {
                grid-template-columns: 1fr;
            }
            
            .main-feature {
                grid-column: span 1;
            }
            
            .main-feature {
                grid-template-columns: 1fr;
            }
            
            .news-grid {
                grid-template-columns: 1fr;
            }
            
            .newsletter-form {
                flex-direction: column;
            }
            
            .newsletter-form input,
            .newsletter-form button {
                width: 100%;
                border-radius: 4px;
            }
            
            .newsletter-form input {
                border-right: 1px solid #ddd;
                margin-bottom: 10px;
            }
            
            .newsletter-form button {
                margin-top: 0;
                padding: 12px;
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <%@include file="header.jsp"%>

        <!-- Hero Section -->
        <section class="tech-hero">
            <h1><i class="fas fa-newspaper"></i> TIN TỨC CÔNG NGHỆ</h1>
            <p>Cập nhật những xu hướng và đánh giá mới nhất về smartphone</p>
        </section>

        <!-- Nội dung chính -->
        <main>
            <!-- Tin nổi bật -->
            <section class="news-section">
                <h2 class="section-title">Tin nổi bật</h2>
                <div class="featured-news">
                    <a href="https://minhtuanmobile.com/tin-tuc/top-nhung-tinh-nang-moi-tren-iphone-15-pro-max/" class="article-link">
                        <article class="main-feature">
                            <div class="news-image">
                                <img src="${pageContext.request.contextPath}/images/Apple-iPhone-15-Pro-1024x576.jpg" alt="iPhone 15 Pro Max" onerror="this.src='${pageContext.request.contextPath}/images/default-image.jpg'">
                            </div>
                            <div class="news-content">
                                <span class="news-category">Đánh giá</span>
                                <h3 class="news-title">iPhone 15 Pro Max - Hiệu năng vượt trội với chip A17 Pro</h3>
                                <p class="news-excerpt">Với chip A17 Pro mới nhất, iPhone 15 Pro Max mang đến trải nghiệm mượt mà cùng camera 48MP đột phá...</p>
                                <div class="news-meta">
                                    <span><i class="far fa-calendar-alt"></i> 15/09/2023</span>
                                    <span><i class="far fa-eye"></i> 2.5K lượt xem</span>
                                </div>
                            </div>
                        </article>
                    </a>
                    
                    <a href="https://hoanghamobile.com/tin-tuc/chinh-thuc-galaxy-s23-ultra-ra-mat-camera-200mp-chip-snapdragon-8-gen-2-bo-nho-toi-1tb/#:~:text=Trang%20ch%E1%BB%A7%20%C2%BB%20Tin%20C%C3%B4ng%20Ngh%E1%BB%87%20%C2%BB%20%5BCH%C3%8DNH,%C4%91%E1%BB%A3i%20nh%E1%BA%A5t%20%E2%80%93%20%C4%91%C3%A3%20ch%C3%ADnh%20th%E1%BB%A9c%20ra%20m%E1%BA%AFt." class="article-link">
                        <article class="news-card">
                            <div class="news-image">
                                <img src="${pageContext.request.contextPath}/images/tincongnghe1.png" alt="Samsung Galaxy S23 Ultra" onerror="this.src='${pageContext.request.contextPath}/images/default-image.jpg'">
                            </div>
                            <div class="news-content">
                                <span class="news-category">Công nghệ</span>
                                <h3 class="news-title">Samsung Galaxy S23 Ultra: Camera 200MP có gì đặc biệt?</h3>
                                <p class="news-excerpt">Khám phá công nghệ camera 200MP đột phá trên Galaxy S23 Ultra...</p>
                                <div class="news-meta">
                                    <span><i class="far fa-calendar-alt"></i> 10/09/2023</span>
                                    <span><i class="far fa-eye"></i> 1.8K lượt xem</span>
                                </div>
                            </div>
                        </article>
                    </a>
                    
                    <a href="https://www.mi.com/vn/product/xiaomi-13-pro/" class="article-link">
                        <article class="news-card">
                            <div class="news-image">
                                <img src="${pageContext.request.contextPath}/images/tincongnghe2.png" alt="Xiaomi 13 Pro" onerror="this.src='${pageContext.request.contextPath}/images/default-image.jpg'">
                            </div>
                            <div class="news-content">
                                <span class="news-category">Mới ra mắt</span>
                                <h3 class="news-title">Xiaomi 13 Pro chính thức ra mắt với camera Leica</h3>
                                <p class="news-excerpt">Xiaomi 13 Pro trang bị hệ thống camera hợp tác với Leica, mang đến chất lượng ảnh chuyên nghiệp...</p>
                                <div class="news-meta">
                                    <span><i class="far fa-calendar-alt"></i> 05/09/2023</span>
                                    <span><i class="far fa-eye"></i> 1.2K lượt xem</span>
                                </div>
                            </div>
                        </article>
                    </a>
                </div>
            </section>

            <!-- Tin mới nhất -->
            <section class="news-section">
                <h2 class="section-title">Tin mới nhất</h2>
                <div class="news-grid">
                    <a href="https://vtcnews.vn/danh-gia-cac-phien-ban-iphone-14-o-thoi-diem-hien-tai-ar934269.html" class="article-link">
                        <article class="news-card">
                            <div class="news-image">
                                <img src="${pageContext.request.contextPath}/images/tincongnghe5.jpg" alt="Android 14" onerror="this.src='${pageContext.request.contextPath}/images/default-image.jpg'">
                            </div>
                            <div class="news-content">
                                <span class="news-category">Hệ điều hành</span>
                                <h3 class="news-title">Android 14 chính thức ra mắt với nhiều cải tiến</h3>
                                <p class="news-excerpt">Phiên bản mới nhất của Android mang đến nhiều tính năng bảo mật và tối ưu hiệu năng...</p>
                                <div class="news-meta">
                                    <span><i class="far fa-calendar-alt"></i> 01/09/2023</span>
                                    <span><i class="far fa-eye"></i> 950 lượt xem</span>
                                </div>
                            </div>
                        </article>
                    </a>
                    
                    <a href="https://thongsokythuat.vn/sp/oppo-find-x6-pro-2023/" class="article-link">
                        <article class="news-card">
                            <div class="news-image">
                                <img src="${pageContext.request.contextPath}/images/tincongnghe4.jpg" alt="Oppo Find X6 Pro" onerror="this.src='${pageContext.request.contextPath}/images/default-image.jpg'">
                            </div>
                            <div class="news-content">
                                <span class="news-category">Đánh giá</span>
                                <h3 class="news-title">Oppo Find X6 Pro - Đối thủ đáng gờm của Samsung và Apple</h3>
                                <p class="news-excerpt">Đánh giá chi tiết Oppo Find X6 Pro với camera Hasselblad và chip Snapdragon 8 Gen 2...</p>
                                <div class="news-meta">
                                    <span><i class="far fa-calendar-alt"></i> 28/08/2023</span>
                                    <span><i class="far fa-eye"></i> 1.1K lượt xem</span>
                                </div>
                            </div>
                        </article>
                    </a>
                    
                    <a href="https://hoanghamobile.com/tin-tuc/top-5-dien-thoai-so-huu-pin-trau-nhat-2023/#:~:text=Top%205%20%C4%91i%E1%BB%87n%20tho%E1%BA%A1i%20s%E1%BB%9F%20h%E1%BB%AFu%20pin%20tr%C3%A2u,5.%20Asus%20Zenfone%209%20%2813%20ti%E1%BA%BFng%2013%20ph%C3%BAt%29" class="article-link">
                        <article class="news-card">
                            <div class="news-image">
                                <img src="${pageContext.request.contextPath}/images/tincongnghe3.png" alt="Pin smartphone" onerror="this.src='${pageContext.request.contextPath}/images/default-image.jpg'">
                            </div>
                            <div class="news-content">
                                <span class="news-category">Công nghệ</span>
                                <h3 class="news-title">Top 5 smartphone pin trâu nhất 2023</h3>
                                <p class="news-excerpt">Những chiếc điện thoại có thời lượng pin ấn tượng nhất hiện nay...</p>
                                <div class="news-meta">
                                    <span><i class="far fa-calendar-alt"></i> 25/08/2023</span>
                                    <span><i class="far fa-eye"></i> 1.3K lượt xem</span>
                                </div>
                            </div>
                        </article>
                    </a>
                </div>
            </section>

            <!-- Newsletter -->
            <section class="newsletter">
                <h3>Đăng ký nhận tin công nghệ hàng tuần</h3>
                <form class="newsletter-form">
                    <input type="email" placeholder="Nhập email của bạn" required>
                    <button type="submit">Đăng ký</button>
                </form>
            </section>
        </main>

        <%@include file="footer.jsp"%>
    </div>

    <script>
        // Script đơn giản cho hiệu ứng
        document.addEventListener('DOMContentLoaded', function() {
            // Kiểm tra xem ảnh có load thành công không
            document.querySelectorAll('.news-image img').forEach(img => {
                img.onerror = function() {
                    this.src = '${pageContext.request.contextPath}/images/default-image.jpg';
                    this.alt = 'Image not available';
                };
            });
            
            // Thêm hiệu ứng khi click vào bài viết
            document.querySelectorAll('.article-link').forEach(link => {
                link.addEventListener('click', function(e) {
                    // Ngăn chặn hành vi mặc định nếu cần
                    // e.preventDefault();
                    console.log('Navigating to: ' + this.href);
                });
            });
        });
    </script>
</body>
</html>