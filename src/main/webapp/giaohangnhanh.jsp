<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Giao hàng siêu tốc 24h | Công nghệ đột phá</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@400;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <style>
        :root {
            --tech-blue: #007bff;
            --tech-dark: #0056b3;
            --highlight: #00ff88;
        }
        
        body {
            font-family: 'Montserrat', sans-serif;
            margin: 0;
            padding: 0;
            color: #333;
            background-color: #f5f9ff;
        }
        

        
        /* Hero Section */
        .delivery-hero {
            border-radius: 0 0 20px 20px;
            overflow: hidden;
            background: linear-gradient(135deg, var(--tech-dark), var(--tech-blue));
            color: white;
            padding: 29px 20px;
            text-align: center;
            position: relative;
            overflow: hidden;
            margin-bottom: 17px;
        }
        
        .delivery-hero h1 {
            font-size: 2.5rem;
            margin-bottom: 17px;
            
        }
        
        .delivery-hero p {
            font-size: 1.2rem;
            max-width: 700px;
            margin: 0 auto;
        }
        
        /* Tech Card Section */
        .tech-card {
            background: white;
            border-radius: 12px;
            box-shadow: 0 10px 30px rgba(0,0,0,0.08);
            padding: 40px;
            margin-bottom: 20px;
            position: relative;
            overflow: hidden;
            transition: transform 0.3s ease;
        }
        
        .tech-card:hover {
            transform: translateY(-5px);
        }
        
        .tech-card h2 {
            color: var(--tech-blue);
            font-size: 1.8rem;
            margin-bottom: 25px;
            position: relative;
            display: inline-block;
        }
        
        .tech-card h2:after {
            content: "";
            position: absolute;
            bottom: -10px;
            left: 0;
            width: 60px;
            height: 3px;
            background: var(--highlight);
        }
        
        /* Process Steps */
        .process-steps {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
            gap: 25px;
            margin-top: 30px;
        }
        
        .process-step {
            text-align: center;
            padding: 30px 20px;
            background: #f8faff;
            border-radius: 10px;
            border-top: 4px solid var(--tech-blue);
            transition: all 0.3s ease;
        }
        
        .process-step:hover {
            background: #e6f0ff;
            box-shadow: 0 5px 15px rgba(0,123,255,0.1);
        }
        
        .process-step i {
            font-size: 2.5rem;
            color: var(--tech-blue);
            margin-bottom: 15px;
            background: linear-gradient(to right, var(--tech-blue), var(--highlight));
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
        }
        
        .process-step h3 {
            margin-bottom: 10px;
            font-size: 1.2rem;
        }
        
        /* Delivery Areas */
        .area-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            gap: 20px;
            margin-top: 30px;
        }
        
        .area-card {
            padding: 25px;
            background: #f8faff;
            border-radius: 10px;
            border-left: 4px solid var(--highlight);
            transition: all 0.3s ease;
        }
        
        .area-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 5px 15px rgba(0,0,0,0.05);
        }
        
        .area-card h3 {
            color: var(--tech-dark);
            margin-bottom: 10px;
            display: flex;
            align-items: center;
        }
        
        .area-card h3 i {
            margin-right: 10px;
            color: var(--tech-blue);
        }
        
        /* Time Table */
        .time-table {
            width: 100%;
            border-collapse: separate;
            border-spacing: 0;
            margin-top: 30px;
            border-radius: 10px;
            overflow: hidden;
            box-shadow: 0 5px 15px rgba(0,0,0,0.05);
        }
        
        .time-table th {
            background: linear-gradient(to right, var(--tech-blue), var(--tech-dark));
            color: white;
            padding: 15px;
            text-align: left;
            font-weight: 600;
        }
        
        .time-table td {
            padding: 15px;
            border-bottom: 1px solid #e0e9ff;
            background: white;
        }
        
        .time-table tr:last-child td {
            border-bottom: none;
        }
        
        .time-table tr:hover td {
            background: #f0f6ff;
        }
        
        /* Policy List */
        .policy-list {
            list-style: none;
            padding: 0;
            margin-top: 20px;
        }
        
        .policy-list li {
            padding: 12px 0;
            padding-left: 30px;
            position: relative;
            border-bottom: 1px dashed #e0e9ff;
        }
        
        .policy-list li:last-child {
            border-bottom: none;
        }
        
        .policy-list li:before {
            content: "\f00c";
            font-family: "Font Awesome 6 Free";
            font-weight: 900;
            position: absolute;
            left: 0;
            color: var(--highlight);
        }
        
        /* Responsive */
        @media (max-width: 768px) {
            .delivery-hero h1 {
                font-size: 2.2rem;
            }
            
            .delivery-hero p {
                font-size: 1rem;
            }
            
            .tech-card {
                padding: 25px;
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <%@include file="header.jsp"%>

        <!-- Hero Section -->
        <section class="delivery-hero">
            <h1><i class="fas fa-truck"></i> GIAO HÀNG NHANH 24H</h1>
            <p> Tối ưu hóa lộ trình - Giao hàng nhanh chóng và chính xác</p>
        </section>

        <!-- Main Content -->
        <main>
            <!-- Quy trình giao hàng -->
            <section class="tech-card">
                <h2>QUY TRÌNH GIAO HÀNG NHANH 24h</h2>
                <p>Hệ thống công nghệ cao của chúng tôi đảm bảo quy trình giao hàng nhanh chóng và hiệu quả:</p>

                <div class="process-steps">
                    <div class="process-step">
                        <i class="fa-solid fa-user-tie"></i>
                        <h3>BƯỚC 1</h3>
                        <p>Tiếp nhận và xử lý đơn hàng</p>
                    </div>
                    <div class="process-step">
                        <i class="fa-solid fa-box"></i>
                        <h3>BƯỚC 2</h3>
                        <p> Đóng gói đơn hàng</p>
                    </div> 
                    <div class="process-step">
                        <i class="fa-solid fa-truck"></i>
                        <h3>BƯỚC 3</h3>
                        <p>Giao cho đơn vị vận chuyển</p>
                    </div>
                    <div class="process-step">
                        <i class="fa-solid fa-money-bill"></i>
                        <h3>BƯỚC 4</h3>
                        <p>Thanh toán đơn hàng</p>
                    </div>
                </div>
            </section>

            <!-- Khu vực giao hàng -->
            <section class="tech-card">
                <h2>KHU VỰC GIAO HÀNG CÔNG NGHỆ</h2>
                <p>Hệ thống phân phối thông minh của chúng tôi phủ sóng các khu vực sau:</p>
                
                <div class="area-grid">
                    <div class="area-card">
                        <h3><i class="fas fa-map-marked-alt"></i> HÀ NỘI</h3>
                        <p>Giao hàng trong 2-4 giờ bằng drone</p>
                    </div>
                    <div class="area-card">
                        <h3><i class="fas fa-map-marked-alt"></i> TP.HCM</h3>
                        <p>Giao hàng trong 3-5 giờ bằng xe tự lái</p>
                    </div>
                    <div class="area-card">
                        <h3><i class="fas fa-map-marked-alt"></i> ĐÀ NẴNG</h3>
                        <p>Giao hàng trong 4-6 giờ</p>
                    </div>
                    <div class="area-card">
                        <h3><i class="fas fa-map-marked-alt"></i> CÁC TỈNH KHÁC</h3>
                        <p>Giao hàng trong 24h bằng hệ thống logistics</p>
                    </div>
                </div>
            </section>

            <!-- Thời gian giao hàng -->
            <section class="tech-card">
                <h2>THỜI GIAN GIAO HÀNG CHÍNH XÁC</h2>
                <p>Công nghệ dự báo thời gian giao hàng chính xác đến từng phút:</p>
                
                <table class="time-table">
                    <thead>
                        <tr>
                            <th>KHUNG GIỜ</th>
                            <th>PHƯƠNG THỨC</th>
                            <th>PHÍ DỊCH VỤ</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>8h - 12h</td>
                            <td>Drone giao sáng</td>
                            <td>30,000đ</td>
                        </tr>
                        <tr>
                            <td>12h - 17h</td>
                            <td>Xe tự lái giao chiều</td>
                            <td>30,000đ</td>
                        </tr>
                        <tr>
                            <td>17h - 21h</td>
                            <td>Giao tối ưu tiên</td>
                            <td>50,000đ</td>
                        </tr>
                        <tr>
                            <td>21h - 8h</td>
                            <td>Giao đêm công nghệ</td>
                            <td>80,000đ</td>
                        </tr>
                    </tbody>
                </table>
            </section>

            <!-- Chính sách đặc biệt -->
            <section class="tech-card">
                <h2>CHÍNH SÁCH CÔNG NGHỆ ĐỘC QUYỀN</h2>
                <ul class="policy-list">
                    <li>Miễn phí giao hàng cho đơn từ 5 triệu đồng</li>
                    <li>Hoàn tiền 100% nếu giao hàng trễ quá 2 giờ</li>
                    <li>Kiểm tra hàng bằng AR trước khi thanh toán</li>
                    <li>Hỗ trợ lắp đặt thông qua AI hướng dẫn</li>
                    <li>Theo dõi lộ trình giao hàng thời gian thực</li>
                </ul>
            </section>
        </main>

        <%@include file="footer.jsp"%>
    </div>
</body>
</html>