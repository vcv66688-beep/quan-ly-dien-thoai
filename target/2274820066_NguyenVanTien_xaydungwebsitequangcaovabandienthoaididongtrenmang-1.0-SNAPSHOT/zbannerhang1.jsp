<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Banner 2 ảnh</title>
    <style>
        .banner-container123 {
            width: 100%;
            display: flex;
            justify-content: center;
            gap: 5px;
            padding: 20px;
            overflow: hidden;
        }
        
        .banner-image123 {
            width: 50%;
            max-width: 600px;
            height: auto;
            border-radius: 10px;
            object-fit: cover;
            min-width: 0;
            transition: all 0.3s ease;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            cursor: pointer;
        }
        
        /* Hiệu ứng đẩy lên nhẹ khi hover */
        .banner-image123:hover {
            box-shadow: 0 0 15px 5px rgba(173, 216, 230, 0.81);
            transform: translateY(-3.5px);
        }
        
        /* Hiệu ứng khi click */
        .banner-image123:active {
            box-shadow: 0 0 15px 5px rgba(173, 216, 230, 1.2);
            transform: translateY(-2px);
        }
        
        /* Responsive */
        @media (max-width: 768px) {
            .banner-container123 {
                flex-direction: column;
                align-items: center;
                gap: 20px;
            }
            
            .banner-image123 {
                width: 90%;
                border-radius: 8px;
            }
        }
        
        /* Cho màn hình rất nhỏ */
        @media (max-width: 480px) {
            .banner-image123 {
                border-radius: 6px;
            }
        }
    </style>
    <script>
        function redirectToPage123(url) {
            window.location.href = url;
        }
    </script>
</head>
<body>
    <div class="banner-container123">
        <img title="samsungS25" src="images/s25utraldt.jpg" alt="Galaxy S25" class="banner-image123" 
             onclick="redirectToPage123('s25utral.jsp')">
        
        <img src="images/iphone-16-pro-banner.jpg" alt="iPhone 16" class="banner-image123"
             onclick="redirectToPage123('s2_iphone16prm.jsp')">
    </div>
</body>
</html>