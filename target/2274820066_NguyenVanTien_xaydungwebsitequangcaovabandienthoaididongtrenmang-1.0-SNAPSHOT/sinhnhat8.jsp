<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Siêu Sale Sinh Nhật 8 Năm - Công Nghệ Vàng</title>
<link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@400;700&family=Orbitron:wght@500;700&display=swap" rel="stylesheet">
<style>
:root {
    --primary: #ffd700; /* Vàng chủ đạo */
    --secondary: #ffaa00;
    --accent: #ff6b00;
    --dark: #000000; /* Nền đen */
    --light: #121212;
    --neon: #fff200;
    --gold-light: #ffec80;
    --gold-dark: #b8860b;
}

body {
    font-family: 'Montserrat', sans-serif;
    margin: 0;
    padding: 0;
    background-color: #ffffff; /* Nền ngoài trắng */
    color: #333;
    overflow-x: hidden;
}

/* Header */
.header {
    background-color: #ffffff;
    box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
    padding: 15px 0;
}

/* Main Banner - Nền đen chữ vàng */
.banner {
    width: 100%;
    margin: 0px auto;
    padding: 50px;
    box-sizing: border-box;
    text-align: center;
    background-color: var(--dark);
    color: var(--primary);
    border-radius: 0px;
    box-shadow: 0 8px 20px rgba(0, 0, 0, 0.5);
    border: 1px solid var(--primary);
    position: relative;
    overflow: hidden;
}

.banner h2 {
    font-family: 'Orbitron', sans-serif;
    font-size: 3.5em;
    margin-bottom: 25px;
    text-shadow: 0 0 10px rgba(255, 215, 0, 0.5);
    letter-spacing: 2px;
}

.banner h2::after {
    position: absolute;
    bottom: -25px;
    left: 50%;
    transform: translateX(-50%);
    font-size: 0.5em;
    color: var(--accent);
    font-weight: bold;
    letter-spacing: 3px;
}

.banner img {
    max-width: 100%;
    height: auto;
    margin: 30px 0;
    border-radius: 10px;
    box-shadow: 0 10px 25px rgba(255, 215, 0, 0.2);
    border: 2px solid var(--primary);
}

.banner p {
    font-size: 1.4em;
    line-height: 1.8;
    margin-bottom: 40px;
    color: var(--primary);
}

.banner ul {
    list-style-type: none;
    padding: 0;
    margin: 0 auto;
    width: 75%;
}

.banner li {
    font-size: 1.2em;
    margin-bottom: 15px;
    position: relative;
    padding-left: 30px;
    text-align: left;
    color: var(--primary);
}

.banner li:before {
    content: '→';
    position: absolute;
    left: 0;
    color: var(--neon);
    font-weight: bold;
}

/* Countdown Timer */
.countdown {
    display: flex;
    justify-content: center;
    gap: 15px;
    margin: 40px 0;
}

.countdown-item {
    background: rgba(0, 0, 0, 0.5);
    padding: 15px 25px;
    border-radius: 10px;
    min-width: 80px;
    text-align: center;
    border: 1px solid var(--primary);
}

.countdown-number {
    font-size: 2.5em;
    font-family: 'Orbitron', sans-serif;
    color: var(--primary);
    margin-bottom: 5px;
}

.countdown-label {
    font-size: 0.9em;
    text-transform: uppercase;
    letter-spacing: 2px;
    color: var(--primary);
    opacity: 0.8;
}

/* Footer */
.footer {
    background-color: #ffffff;
    padding: 30px 0;
    text-align: center;
    border-top: 1px solid #eee;
}

/* Hiệu ứng ánh vàng */
.gold-effect {
    position: absolute;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    background: radial-gradient(circle at center, 
        rgba(255, 215, 0, 0.1) 0%, 
        transparent 70%);
    pointer-events: none;
    z-index: 0;
}

/* Responsive */
@media (max-width: 768px) {
    .banner {
        width: 95%;
        padding: 30px;
    }
    
    .banner h2 {
        font-size: 2.5em;
    }
    
    .banner ul {
        width: 100%;
    }
    
    .countdown {
        flex-wrap: wrap;
    }
}
</style>
</head>
<body>

<jsp:include page="header.jsp" />

<div class="banner">
    <div class="gold-effect"></div>
    <h2>SIÊU SALE SINH NHẬT 8 NĂM</h2>
    <p>Công nghệ vàng - Ưu đãi kim cương</p>
    
    <div class="countdown">
        <div class="countdown-item">
            <div class="countdown-number" id="days">08</div>
            <div class="countdown-label">Ngày</div>
        </div>
        <div class="countdown-item">
            <div class="countdown-number" id="hours">23</div>
            <div class="countdown-label">Giờ</div>
        </div>
        <div class="countdown-item">
            <div class="countdown-number" id="minutes">59</div>
            <div class="countdown-label">Phút</div>
        </div>
        <div class="countdown-item">
            <div class="countdown-number" id="seconds">59</div>
            <div class="countdown-label">Giây</div>
        </div>
    </div>
    <img src="images/sinhnhat8tuoi.jpg" alt="Công nghệ vàng 8 năm">
    <ul>
        <li>Chip Snapdragon 8 Gen 2 mạ vàng: Hiệu năng đỉnh cao</li>
        <li>Màn hình AMOLED 120Hz: Hiển thị chuẩn màu vàng kim</li>
        <li>Camera 200MP: Bắt trọn từng khoảnh khắc vàng</li>
        <li>Pin 5000mAh + Sạc nhanh 80W: Năng lượng bền bỉ</li>
        <li>Thiết kế khung vàng Titanium: Sang trọng đẳng cấp</li>
        <li>Ưu đãi đặc biệt: Giảm đến 8.888.000đ</li>
        <li>Quà tặng độc quyền: Tai nghe không dây mạ vàng</li>
        <li>Bảo hành kim cương: 8 năm cho 8 sản phẩm đầu tiên</li>
    </ul>
</div>

<jsp:include page="footer.jsp" />

<script>
// Countdown Timer
function updateCountdown() {
    const now = new Date();
    const eventDate = new Date(now);
    eventDate.setDate(now.getDate() + 8); // 8 days from now
    
    const diff = eventDate - now;
    
    const days = Math.floor(diff / (1000 * 60 * 60 * 24));
    const hours = Math.floor((diff % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
    const minutes = Math.floor((diff % (1000 * 60 * 60)) / (1000 * 60));
    const seconds = Math.floor((diff % (1000 * 60)) / 1000);
    
    document.getElementById('days').textContent = days.toString().padStart(2, '0');
    document.getElementById('hours').textContent = hours.toString().padStart(2, '0');
    document.getElementById('minutes').textContent = minutes.toString().padStart(2, '0');
    document.getElementById('seconds').textContent = seconds.toString().padStart(2, '0');
}

setInterval(updateCountdown, 1000);
updateCountdown();
</script>

</body>
</html>