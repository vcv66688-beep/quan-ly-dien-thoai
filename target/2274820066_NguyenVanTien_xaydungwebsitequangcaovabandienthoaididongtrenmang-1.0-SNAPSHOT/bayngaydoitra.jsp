<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Chính sách 7 ngày đổi trả - Cửa hàng Tivi cao cấp</title>
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
        }

        /* Hero Section */
        .return-hero {
            border-radius: 0 0 20px 20px;
            overflow: hidden;
            background: linear-gradient(135deg, var(--primary-color), var(--secondary-color));
            color: white;
            padding: 29px 20px;
            text-align: center;
            margin-bottom: 20px;
        }
        
        .return-hero h1 {
            font-size: 2.5rem;
            margin-bottom: 17px;
        }
        
        /* Content Section */
        .policy-section {
            margin-bottom: 20px;
            padding: 30px;
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 2px 15px rgba(0,0,0,0.1);
        }
        
        .policy-section h2 {
            color: var(--primary-color);
            margin-bottom: 20px;
            padding-bottom: 10px;
            border-bottom: 2px solid var(--accent-color);
            display: inline-block;
        }
        
        /* Policy Highlights */
        .policy-highlights {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
            gap: 30px;
            margin-top: 30px;
        }
        
        .highlight-card {
            padding: 25px;
            background: var(--light-color);
            border-radius: 8px;
            border-left: 4px solid var(--accent-color);
        }
        
        .highlight-card i {
            font-size: 2rem;
            color: var(--primary-color);
            margin-bottom: 15px;
        }
        
        /* Conditions Table */
        .conditions-table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }
        
        .conditions-table th, .conditions-table td {
            padding: 12px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }
        
        .conditions-table th {
            background-color: var(--primary-color);
            color: white;
        }
        
        .conditions-table tr:nth-child(even) {
            background-color: var(--light-color);
        }
        
        /* Process Steps */
        .return-process {
            margin-top: 30px;
        }
        
        .process-step {
            display: flex;
            margin-bottom: 20px;
            align-items: flex-start;
        }
        
        .step-number {
            background: var(--primary-color);
            color: white;
            width: 30px;
            height: 30px;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            margin-right: 15px;
            flex-shrink: 0;
        }
        
        /* FAQ Section */
        .faq-item {
            margin-bottom: 20px;
            border: 1px solid #eee;
            border-radius: 5px;
            overflow: hidden;
        }
        
        .faq-question {
            padding: 15px;
            background: var(--light-color);
            font-weight: bold;
            cursor: pointer;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }
        
        .faq-answer {
            padding: 15px;
            display: none;
        }
        
        .faq-question i {
            transition: transform 0.3s ease;
        }
        
        .faq-item.active .faq-question i {
            transform: rotate(180deg);
        }
        
        .faq-item.active .faq-answer {
            display: block;
        }
        
        /* Responsive */
        @media (max-width: 768px) {
            .return-hero {
                padding: 60px 15px;
            }
            
            .return-hero h1 {
                font-size: 2rem;
            }
            
            .policy-highlights {
                grid-template-columns: 1fr;
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <%@include file="header.jsp"%>

        <!-- Hero Section -->
        <section class="return-hero">
            <h1><i class="fas fa-undo"></i> 7 NGÀY ĐỔI TRẢ</h1>
            <p>Đổi trả dễ dàng - Bảo vệ quyền lợi khách hàng</p>
        </section>

        <!-- Nội dung chính -->
        <main>
            <section class="policy-section">
                <h2>Tổng quan chính sách</h2>
                <p>Chúng tôi tự tin về chất lượng sản phẩm và cam kết đổi trả trong vòng 7 ngày nếu sản phẩm không đúng như mô tả hoặc có lỗi từ nhà sản xuất.</p>
                
                <div class="policy-highlights">
                    <div class="highlight-card">
                        <i class="fas fa-exchange-alt"></i>
                        <h3>Đổi trả miễn phí</h3>
                        <p>Đổi trả sản phẩm trong 7 ngày không cần lý do (áp dụng điều kiện)</p>
                    </div>
                    <div class="highlight-card">
                        <i class="fas fa-shield-alt"></i>
                        <h3>Bảo hành chính hãng</h3>
                        <p>Bảo hành từ 12-24 tháng tùy sản phẩm tại tất cả các trung tâm bảo hành</p>
                    </div>
                    <div class="highlight-card">
                        <i class="fas fa-undo"></i>
                        <h3>Hoàn tiền nhanh</h3>
                        <p>Hoàn tiền trong vòng 24h sau khi nhận lại sản phẩm</p>
                    </div>
                </div>
            </section>

            <section class="policy-section">
                <h2>Điều kiện đổi trả</h2>
                <p>Các trường hợp được áp dụng chính sách đổi trả:</p>
                
                <table class="conditions-table">
                    <thead>
                        <tr>
                            <th>Trường hợp</th>
                            <th>Thời gian</th>
                            <th>Điều kiện</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>Sản phẩm lỗi</td>
                            <td>7 ngày</td>
                            <td>Còn nguyên seal, đầy đủ phụ kiện</td>
                        </tr>
                        <tr>
                            <td>Không đúng mô tả</td>
                            <td>7 ngày</td>
                            <td>Kèm bằng chứng hình ảnh</td>
                        </tr>
                        <tr>
                            <td>Đổi size/màu</td>
                            <td>3 ngày</td>
                            <td>Sản phẩm chưa sử dụng, còn nguyên bao bì</td>
                        </tr>
                        <tr>
                            <td>Không ưng ý</td>
                            <td>2 ngày</td>
                            <td>Áp dụng phí 10% giá trị đơn hàng</td>
                        </tr>
                    </tbody>
                </table>
            </section>

            <section class="policy-section">
                <h2>Quy trình đổi trả</h2>
                <div class="return-process">
                    <div class="process-step">
                        <div class="step-number">1</div>
                        <div>
                            <h3>Liên hệ hỗ trợ</h3>
                            <p>Gọi hotline 1900 1234 hoặc chat với nhân viên để thông báo đổi trả</p>
                        </div>
                    </div>
                    <div class="process-step">
                        <div class="step-number">2</div>
                        <div>
                            <h3>Chuẩn bị sản phẩm</h3>
                            <p>Đóng gói đầy đủ sản phẩm, phụ kiện và hóa đơn mua hàng</p>
                        </div>
                    </div>
                    <div class="process-step">
                        <div class="step-number">3</div>
                        <div>
                            <h3>Gửi sản phẩm</h3>
                            <p>Nhân viên sẽ đến nhà thu hồi sản phẩm hoặc gửi qua bưu điện</p>
                        </div>
                    </div>
                    <div class="process-step">
                        <div class="step-number">4</div>
                        <div>
                            <h3>Nhận sản phẩm mới/hoàn tiền</h3>
                            <p>Sau khi kiểm tra, chúng tôi sẽ giao sản phẩm mới hoặc hoàn tiền</p>
                        </div>
                    </div>
                </div>
            </section>

            <section class="policy-section">
                <h2>Câu hỏi thường gặp</h2>
                <div class="faq-list">
                    <div class="faq-item">
                        <div class="faq-question">
                            <span>Sản phẩm đã sử dụng có đổi trả được không?</span>
                            <i class="fas fa-chevron-down"></i>
                        </div>
                        <div class="faq-answer">
                            <p>Theo quy định của cửa hàng, sản phẩm đã qua sử dụng sẽ không được áp dụng chính sách đổi trả trong mọi trường hợp, trừ khi sản phẩm có lỗi kỹ thuật xuất phát từ nhà sản xuất (hư hỏng phần cứng, lỗi phần mềm không thể khắc phục).</p>
                        </div>
                    </div>
                    <div class="faq-item">
                        <div class="faq-question">
                            <span>Tôi cần chuẩn bị gì khi đổi trả sản phẩm?</span>
                            <i class="fas fa-chevron-down"></i>
                        </div>
                        <div class="faq-answer">
                            <p>Bạn cần chuẩn bị: sản phẩm nguyên vẹn, hộp đựng, phụ kiện đi kèm, hóa đơn mua hàng và phiếu bảo hành (nếu có).</p>
                        </div>
                    </div>
                    <div class="faq-item">
                        <div class="faq-question">
                            <span>Thời gian xử lý đổi trả mất bao lâu?</span>
                            <i class="fas fa-chevron-down"></i>
                        </div>
                        <div class="faq-answer">
                            <p>Thông thường quá trình xử lý mất 1-3 ngày làm việc sau khi chúng tôi nhận được sản phẩm đổi trả.</p>
                        </div>
                    </div>
                </div>
            </section>
        </main>

        <%@include file="footer.jsp"%>
    </div>

    <script>
        // Xử lý click cho FAQ
        document.querySelectorAll('.faq-question').forEach(question => {
            question.addEventListener('click', () => {
                const item = question.parentElement;
                item.classList.toggle('active');
                
                // Đóng các câu hỏi khác
                document.querySelectorAll('.faq-item').forEach(otherItem => {
                    if (otherItem !== item) {
                        otherItem.classList.remove('active');
                    }
                });
            });
        });
    </script>
</body>
</html>