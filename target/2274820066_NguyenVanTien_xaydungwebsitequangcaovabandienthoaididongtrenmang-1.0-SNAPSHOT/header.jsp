<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Header</title>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="css/filecss.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <style>/* Menu ngang */
        .account-cart a:hover {
            color: #3498db;
        }
          
.category-menu {
    width: 100%;
    background-color: #3498db;
    color: #fff;
    padding: 10px 0; /* Thay đổi padding */
    position: sticky;
    top: 0;
    z-index: 100;
    transition: transform 0.3s ease;
    box-sizing: border-box;
    border-radius: 10px 10px 0 0;
}

.category-menu ul {
    display: flex;
    justify-content: space-evenly;
    list-style: none;
    margin: 0;
    padding: 0;
    width: 100%;
}
/*muc*/
.category-menu li {
    padding: 5px 18px;
    border-radius: 8px;
    transition: background-color 0.3s ease, color 0.3s ease;
}

.category-menu li:hover {
    background-color: rgba(0, 0, 255, 0.234);
    border-radius: 4px;
}

.category-menu li:hover a {
    color: #fff;
}

.category-menu.hidden {
    transform: translateY(-100%);
    transition: transform 0.3s ease;
}

/* Style cho link trong menu */
.category-menu a {
    color: white;
    text-decoration: none;
    display: block;
}
/*    <!--css2ben-->*/
        /* CSS cho các biểu tượng bên phải */
        /* CSS cho nút lên đầu trang (PHẦN BỔ SUNG) */
        .back-to-top {
            position: fixed;
            right: 55px;
            bottom: 58px;
            width: 50px;
            height: 50px;
            background-color: rgba(52, 152, 219, 0.8);
            border-radius: 50%;
            display: none;
            align-items: center;
            justify-content: center;
            color: white;
            font-size: 20px;
            cursor: pointer;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            transition: all 0.3s ease;
            z-index: 999;
            border: none;
            outline: none;
        }
        .back-to-top:hover {
            background-color: rgba(41, 128, 185, 1);
            transform: scale(1.1);
        }
/* CSS cho 3 biểu tượng bên trái */
.left-side-icons {
    position: fixed;
    left: 42px;
    top: 82%; /* Điều chỉnh xuống thấp  */
    transform: translateY(-50%);
    display: flex;
    flex-direction: column;
    gap: 15px;
    z-index: 999;
}

.left-side-icon {
    margin-left: 12px;
    width: 50px;
    height: 50px;
    background-color: rgba(52, 152, 219, 0.8);
    border-radius: 50%;
    display: flex;
    align-items: center;
    justify-content: center;
    color: white;
    font-size: 20px;
    cursor: pointer;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
    transition: all 0.3s ease;
    text-decoration: none; 
}

.left-side-icon:hover {
    background-color: rgba(41, 128, 185, 1);
    transform: scale(1.1);
}

/* CSS cho 2 hình ảnh hai bên */
.side-banner {
    position: fixed;
    width: 100px;
    height: auto;
    cursor: pointer;
    transition: all 0.3s ease;
    z-index: 998;
}

.side-banner:hover {
    transform: scale(1.05);
}

.left-banner {
    margin-left: 10px;
    left: 21px;
    top: 12%;
}

.right-banner {
    margin-right: 10px;
    right: 21px;
    top: 12%;
}

/* Hiệu ứng khi click */
.side-banner:active {
    transform: scale(1.1);
}
    </style>
    
    
    <!--css2-->
    <style>
    .logout-dropdown a:hover {
        color: #e74c3c;
    }
/*    // them*/
        .login-link {
        display: flex;
        align-items: center;
        gap: 8px;
        color: #3498db;
        text-decoration: none;
    }
    .login-text {
        font-size: 16px; /*dangnhap*/
        color: #333;
    }
    
    .login-text:hover {
        color: #2980b9;
    }

    .top-right-account {
        position: fixed;
        top: 10px;
        right: 10px;
        z-index: 1000;
    }
    
    .account-info {
        display: flex;
        align-items: center;
        gap: 8px;
        position: relative;
        cursor: pointer;
    }
    
    .account-name {
        font-size: 18px; /* admin */
        color: #333;
    }
    .account-name:hover {
        color: #2980b9;
    }
    
    .logout-dropdown {
        display: none;
        position: absolute;
        top: 100%;
        right: 0;
        background: white;
        border: 1px solid #ddd;
        border-radius: 4px;
        padding: 5px 10px;
        box-shadow: 0 2px 5px rgba(0,0,0,0.1);
        min-width: 100px;
        text-align: center;
        width: auto;
        min-width: 80px;
    }
    
    .logout-dropdown a {
        color: #333;
        text-decoration: none;
        font-size: 15px; /* đăng xuaats */
        display: block;
        padding: 3px 6px;
        white-space: nowrap;
    }
    
    .logout-dropdown a:hover {
        color: red;
    }
    
    .account-info:hover .logout-dropdown {
        display: block; /* Hiển thị khi hover */
    }
    
    .top-right-account i {
        font-size: 31px; /* icon */
        color: #3498db;
        margin-left: 3px;
    }
</style>
    
    <!--css3-->
    <style>
        /* Hiệu ứng tỏa sáng cho icon hỗ trợ */
        .left-side-icon.pulse-effect {
            position: relative;
            animation: pulse 2s infinite;
        }

        @keyframes pulse {
            0% {
                box-shadow: 0 0 0 0 rgba(0, 104, 255, 0.7);
            }
            70% {
                box-shadow: 0 0 0 15px rgba(0, 104, 255, 0);
            }
            100% {
                box-shadow: 0 0 0 0 rgba(0, 104, 255, 0);
            }
        }

        /* Hiệu ứng ánh sáng tỏa ra */
        .left-side-icon.pulse-effect::after {
            content: '';
            position: absolute;
            width: 100%;
            height: 100%;
            top: 0;
            left: 0;
            background: radial-gradient(circle, rgba(0,168,255,0.4) 0%, rgba(0,168,255,0) 70%);
            border-radius: 50%;
            animation: ripple 2s infinite;
            z-index: -1;
        }

        @keyframes ripple {
            0% {
                transform: scale(0.8);
                opacity: 1;
            }
            100% {
                transform: scale(1.5);
                opacity: 0;
            }
        }

        /* Màu sắc đặc biệt cho icon hỗ trợ */
        .left-side-icon.pulse-effect {
            color: white;
        }

        .left-side-icon.pulse-effect:hover {
            background-color: #0055cc;
            animation: none; /* Tạm dừng hiệu ứng khi hover */
        }

        .left-side-icon.pulse-effect:hover::after {
            animation: none;
        }
</style>
</head>
<body>
    <!--ICON đăng nhập-->
    <div class="top-right-account" id="account-container">
    <c:choose>
        <c:when test="${not empty sessionScope.user}">
            <div class="account-info">
                <span class="account-name">${sessionScope.user.username}</span>
                <i class="fas fa-user-circle"></i>
                <div class="logout-dropdown">
                    <a href="LogoutServlet">Đăng xuất</a>
                </div>
            </div>
        </c:when>
        <c:otherwise>
            <a href="login.jsp" class="login-link" title="Đăng nhập">
                <span class="login-text">Đăng nhập</span>
                <i class="fas fa-user-circle"></i>
            </a>
        </c:otherwise>
    </c:choose>
</div>



<script>
document.addEventListener('DOMContentLoaded', function() {
    const accountContainer = document.getElementById('account-container');
    
    if (accountContainer) {
        accountContainer.addEventListener('click', function(e) {
            e.stopPropagation();
            const dropdown = this.querySelector('.logout-dropdown');
            if (dropdown) {
                dropdown.style.display = dropdown.style.display === 'block' ? 'none' : 'block';
            }
        });
        
        document.addEventListener('click', function() {
            const dropdowns = document.querySelectorAll('.logout-dropdown');
            dropdowns.forEach(dropdown => {
                dropdown.style.display = 'none';
            });
        });
    }
});
</script>

<!-- Các biểu tượng bên trái với liên kết -->
<div class="left-side-icons">
    <a href="https://zalo.me/0972044460?message=lienhe" class="left-side-icon pulse-effect" title="Liên hệ">
        <i class="fas fa-headset"></i>
    </a>
    <a href="cart.jsp" class="left-side-icon" title="Giỏ hàng">
        <i class="fas fa-shopping-cart"></i>
    </a>
    <a href="login.jsp" class="left-side-icon" title="Đăng nhập Tài khoản">
        <i class="fas fa-user"></i>
    </a>
</div>

<!-- 2 hình ảnh hai bên -->
<img src="images/benphai.jpg" class="side-banner left-banner" alt="Khuyến mãi bên trái" onclick="window.location.href='sinhnhat8.jsp'">
<img src="images/80.jpg" class="side-banner right-banner" alt="Khuyến mãi bên phải" onclick="window.location.href='sinhnhat8.jsp'">

<!-- Nút lên đầu trang -->
<div class="back-to-top" title="Lên đầu trang">
    <i class="fas fa-arrow-up"></i>
</div>
<!--them-->
    <div class="container">
        <header>
            <div class="top-header">
                <div class="logo">
                    <a href="index.jsp"><img src="images/ngvantienlogo.png" alt="Logo"></a>
                </div>
                <div class="search-bar">
                    <input type="text" placeholder="Bạn cần tìm...">
                    <button><i class="fas fa-search"></i> Tìm kiếm</button>
                </div>
                <div class="account-cart">
                    <a href="cart.jsp"><i class="fas fa-shopping-cart"></i> Giỏ hàng</a>
                    <a href="login.jsp"><i class="fas fa-user"></i> Tài khoản</a>
                </div>
            </div>
            <nav class="category-menu">
                <ul>
                    <li><a href="index.jsp"><i class="fas fa-home"></i> Trang chủ</a></li>
                    <li><a href="danhmucdienthoai.jsp"><i class="fas fa-list"></i> Danh mục điện thoại</a></li>
                    <li><a href="gioithieumenu.jsp"><i class="fas fa-info-circle"></i> Giới thiệu cửa hàng</a></li>
                    <li><a href="giaohangnhanh.jsp"><i class="fas fa-truck"></i> Giao hàng nhanh 24h</a></li>
                    <li><a href="bayngaydoitra.jsp"><i class="fas fa-undo"></i> 7 ngày đổi trả</a></li>
                    <li><a href="tincongnghe.jsp"><i class="fas fa-newspaper"></i> Tin tức công nghệ</a></li>
                </ul>
            </nav>
        </header>

        <!--/*ẩn hiện menu*/-->
        <script>
            // JavaScript để ẩn/hiện menu khi cuộn trang
            let lastScrollTop = 0;
            const menu = document.querySelector('.category-menu');

            window.addEventListener('scroll', function() {
                let scrollTop = window.pageYOffset || document.documentElement.scrollTop;

                if (scrollTop > lastScrollTop) {
                    // Cuộn xuống
                    menu.classList.add('hidden');
                } else {
                    // Cuộn lên
                    menu.classList.remove('hidden');
                }

                lastScrollTop = scrollTop <= 0 ? 0 : scrollTop; // Đảm bảo giá trị không âm
            });
        </script>
        
        
        <script>

    // Hiệu ứng click cho hình ảnh hai bên
    const sideBanners = document.querySelectorAll('.side-banner');
    sideBanners.forEach(banner => {
        banner.addEventListener('click', function() {
            // Thêm hiệu ứng khi click
            this.style.transform = 'scale(1.1)';
            setTimeout(() => {
                this.style.transform = 'scale(1.05)';
            }, 200);
        });
    });

</script>
<script>
    // Nút lên đầu trang
    const backToTopButton = document.querySelector('.back-to-top');
    
    // Hiển thị nút khi cuộn xuống
    window.addEventListener('scroll', function() {
        if (window.pageYOffset > 300) {
            backToTopButton.style.display = 'flex';
        } else {
            backToTopButton.style.display = 'none';
        }
    });
    
    // Xử lý click để cuộn lên đầu trang
    backToTopButton.addEventListener('click', function(e) {
        e.preventDefault();
        window.scrollTo({
            top: 0,
            behavior: 'smooth'
        });
    });
</script>
</body>
</html>