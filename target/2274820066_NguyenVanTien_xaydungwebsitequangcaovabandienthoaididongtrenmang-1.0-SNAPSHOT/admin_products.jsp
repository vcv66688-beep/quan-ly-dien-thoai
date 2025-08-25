<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Quản lý sản phẩm Điện thoại</title>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap" rel="stylesheet">
    <style>
        body { margin: 0; font-family: 'Roboto', sans-serif; background-color: #ecf0f1; display: flex; }
        .content {
            margin-left: 280px;
            padding: 5px 40px 40px 40px;
            flex: 1;
            max-width: 1200px;
            margin-right: 0px;
            transition: margin-left 0.3s ease, max-width 0.3s ease;
        }
        .content.full-width {
            margin-left: 111px;
            max-width: 1400px;
        }
        h1 { color: #2c3e50; font-size: 28px; margin-bottom: 20px; text-align: center; }
        .add-btn {
            display: inline-block;
            background-color: #2ecc71;
            color: white;
            padding: 12px 24px;
            border-radius: 6px;
            text-decoration: none;
            margin-bottom: 20px;
            font-weight: 700;
            transition: background-color 0.3s ease;
        }
        .add-btn:hover { background-color: #27ae60; }
        .product-table {
            width: 100%;
            border-collapse: collapse;
            background-color: white;
            border-radius: 10px;
            box-shadow: 0 4px 15px rgba(0,0,0,0.1);
            overflow: hidden;
        }
        .product-table th, .product-table td {
            padding: 15px;
            text-align: left;
            border-bottom: 1px solid #eee;
        }
        .product-table th {
            background-color: #3498db;
            color: white;
            font-weight: 700;
        }
        /* Căn giữa cột STT và Hành động */
        .product-table th:first-child, .product-table td:first-child,
        .product-table th:last-child, .product-table td:last-child {
            text-align: center;
        }
        

        .product-table tr:hover { background-color: #f8f9fa; }
        .product-table img { width: 50px; height: auto; border-radius: 5px; }
        .action-btn {
            color: #3498db;
            background: none;
            border: none;
            cursor: pointer;
            font-size: 18px;
            margin-right: 1px; /* căn 2 icon */
            transition: color 0.3s ease;
        }
        .action-btn.delete { color: #e74c3c; }
        .action-btn:hover { color: #2980b9; }
        .action-btn.delete:hover { color: #c0392b; }
    </style>
</head>
<body>
    <c:if test="${empty sessionScope.user || sessionScope.user.role != 'admin'}">
        <c:redirect url="index.jsp"/>
    </c:if>
    <%@include file="headeradmin.jsp"%>
    <div class="content" id="content">
        <h1><i class="fa-solid fa-list"></i> Quản lý sản phẩm điện thoại </h1>
        <p style="text-align: center">Hiển thị danh sách điện thoại. Admin thực hiện các chức năng: Thêm, Sửa, Xóa sản phẩm <i class="fa-solid fa-mobile-screen-button"></i> </p>
        <a href="admin_add_product.jsp" class="add-btn"><i class="fas fa-plus"></i> Thêm sản phẩm </a>
        <table class="product-table">
            <thead>
                <tr>
                    <th>STT</th>
                    <th>Mã điện thoại</th>
                    <th>Tên sản phẩm điện thoại</th>
                    <th>Hình ảnh</th>
                    <th>Giá gốc</th>
                    <th>Giá giảm</th>
                    <th>Danh mục</th>
                    <th>Tồn kho</th>
                    <th>Hành động</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="product" items="${products}" varStatus="loop">
                    <tr>
                        <td>${loop.count}</td>
                        <td>${product.id}</td>
                        <td>${product.name}</td>
                        <td><img src="${product.image}" alt="${product.name}"></td>
                        <td>${product.originalPrice}</td>
                        <td>${product.discountedPrice}</td>
                        <td>${product.category}</td>
                        <td>${product.stock}</td>
                        <td>
                            <a title="Sửa" href="EditProductServlet?productId=${product.id}" class="action-btn"><i class="fas fa-edit"></i></a>
                            <form action="DeleteProductServlet" method="post" style="display:inline;" onsubmit="return confirm('Bạn có chắc muốn xóa sản phẩm này?');">
                                <input type="hidden" name="productId" value="${product.id}">
                                <button title="Xóa" type="submit" class="action-btn delete"><i class="fas fa-trash"></i></button>
                            </form>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
    <script>
        document.getElementById('adminMenu').addEventListener('transitionend', function() {
            document.getElementById('content').classList.toggle('full-width');
        });
    </script>
</body>
</html>