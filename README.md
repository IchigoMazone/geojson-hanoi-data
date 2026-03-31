<h2 align="center">Dữ liệu của repo Webgis, Healthcare</h2>

<p><strong>{*name}</strong> &nbsp : Kí hiệu có các file khác tên *</p>

<p>Đây là bộ data về bản đồ Hà Nội đã được lọc từ các bộ data lớn nhằm cá nhân hóa khu vực và hỗ trợ đầy đủ cho các định dạng khác nhau phù hợp cho nhu cầu ứng dụng thực tiễn.</p>

<p><strong>[NOTE]</strong>: Đây là setup mỗi trường bắt buộc và sẽ không được chấp nhận nếu không tuân thủ đúng.</p>

<h2>Các loại dữ liệu hiện có</h2>

<table border="1" cellspacing="0" align="center">
<tr>
    <th>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;STT&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</th>
    <th>&nbsp;&nbsp;&nbsp;Thể loại&nbsp;&nbsp;&nbsp;</th>
    <th>&nbsp;&nbsp;&nbsp;Tên nhóm&nbsp;&nbsp;&nbsp;</th>
    <th>&nbsp;&nbsp;&nbsp;Số lượng lựa chọn&nbsp;&nbsp;&nbsp;</th>
    <th>&nbsp;&nbsp;&nbsp;Ghi chú&nbsp;&nbsp;&nbsp;</th>
</tr>
<tr>
    <td align="center">1</td>
    <td align="center">Danh giới quận/huyện</td>
    <td align="center">__districts_{*name}__</td>
    <td align="center">2</td>
    <td align="center">Vì bản đồ danh giới quận huyện cũ vẫn chưa được công khai nên đây sẽ là bản cũ theo các quận/huyện trước 1/7/2025.</td>
</tr>
<tr>
    <td align="center">2</td>
    <td align="center">Bản đồ đường đi của thành phố</td>
    <td align="center">__roads_hanoi__</td>
    <td align="center">7</td>
    <td align="center">Đây là bản đồ các tuyến đường trong thành phố với đa dạng option để lựa chọn để phù hợp và tối ưu việc load trang mượt mà.</td>
</tr>
<tr>
    <td align="center">3</td>
    <td align="center">Danh giới của thành phố</td>
    <td align="center">__boundary_hanoi__</td>
    <td align="center">1</td>
    <td align="center">Danh giới thành phố là bản đồ phân làn danh giữa các tỉnh/thành lân cận đảm nhận nhu cầu nổi bật hóa địa điểm đánh dấu.</td>
</tr>
<tr>
    <td align="center">4</td>
    <td align="center">Danh giới xã/phường của thành phố</td>
    <td align="center">__wards_{*name}__</td>
    <td align="center">2</td>
    <td align="center">Danh giới xã/phường thành phố và cả nước là bản đồ phân làn danh giữa các tỉnh/thành lân cận đảm nhận nhu cầu nổi bật hóa địa điểm đánh dấu.</td>
</tr>
<tr>
    <td align="center">5</td>
    <td align="center">Mật độ giao thông của thành phố</td>
    <td align="center">__traffic_hanoi__</td>
    <td align="center">1</td>
    <td align="center">Đây là dữ liệu minh họa của mật độ giao thông trong thành phố tại thời điểm hiện tại</td>
</tr>
<tr>
    <td align="center">6</td>
    <td align="center">Dữ liệu backup của Webgis</td>
    <td align="center">_webgis__</td>
    <td align="center">1</td>
    <td align="center">Đây là dữ liệu backup của toàn bộ repo Webgis</td>
</tr>
<tr>
    <td align="center">7</td>
    <td align="center">Dữ liệu backup của Healthcare</td>
    <td align="center">_healthcare__</td>
    <td align="center">1</td>
    <td align="center">Đây là dữ liệu backup của toàn bộ repo Healthcare</td>
</tr>
<tr>
    <td align="center">8</td>
    <td align="center">Các file còn lại trong repo</td>
    <td align="center">_{*name}__</td>
    <td align="center">12</td>
    <td align="center">Đây là dữ liệu backup của từng bảng trong repo Webgis</td>
</tr>
</table>

<h2>Hết...</h2>

v1.0 Trịnh Như Nhất
