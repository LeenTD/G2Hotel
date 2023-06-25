<%@page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Chi tiết các loại phòng</title>
    <style>
        body {
            font-family: Arial, sans-serif;
        }
        h1 {
            text-align: center;
            margin-top: 20px;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }
        th, td {
            padding: 10px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }
        th {
            background-color: #f2f2f2;
        }
        img {
            width: 200px;
            height: auto;
        }
    </style>
</head>
<body>
    <%@include file="/includes/header.jsp" %>
    <h1>Chi tiết các loại phòng</h1>
    <table>
        <thead>
            <tr>
                <th>Loại phòng</th>
                <th>Số lượng giường</th>
                <th>Số lượng nhà tắm</th>
                <th>Wifi</th>
                <th>Dịch vụ</th>
                <th>Nội dung</th>
                <th>Hình ảnh</th>
            </tr>
        </thead>
        <tbody>
            <% 
            while (resultSet.next()) {
                String loaiPhong = resultSet.getString("loai_phong");
                int soLuongGiuong = resultSet.getInt("so_luong_giuong");
                int soLuongNhaTam = resultSet.getInt("so_luong_nha_tam");
                boolean wifi = resultSet.getBoolean("wifi");
                String dichVu = resultSet.getString("dich_vu");
                String content = resultSet.getString("content");
                String hinhAnh = resultSet.getString("hinh_anh");
            %>
            <tr>
                <td><%= loaiPhong %></td>
                <td><%= soLuongGiuong %></td>
                <td><%= soLuongNhaTam %></td>
                <td><%= wifi %></td>
                <td><%= dichVu %></td>
                <td><%= content %></td>
                <td><img src="<%= hinhAnh %>" alt="Hình ảnh phòng"></td>
            </tr>
            <% } %>
        </tbody>
    </table>

    <%@include file="/includes/footer.jsp" %>
</body>
</html>
