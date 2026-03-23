<h2 align="center">Dữ liệu bản đồ Hà Nội</h2>

<p><strong>[NOTE], *</strong> &nbsp : Kí hiệu các nội dung quan trọng *</p>

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
    <td align="center">distmap</td>
    <td align="center">2</td>
    <td align="center">Vì bản đồ danh giới quận huyện cũ vẫn chưa được công khai nên đây sẽ là bản cũ theo các quận/huyện trong thành phố trước 1/7/2025.</td>
</tr>
<tr>
    <td align="center">2</td>
    <td align="center">Bản đồ đường đi của thành phố</td>
    <td align="center">geojson</td>
    <td align="center">7</td>
    <td align="center">Đây là bản đồ các tuyến đường trong thành phố với đa dạng option để lựa chọn để phù hợp và tối ưu việc load trang mượt mà.</td>
</tr>
<tr>
    <td align="center">3</td>
    <td align="center">Danh giới của thành phố</td>
    <td align="center">geomap</td>
    <td align="center">1</td>
    <td align="center">Danh giới thành phố là bản đồ phân làn danh giữa các tỉnh/thành lân cận đảm nhận nhu cầu nổi bật hóa địa điểm đánh dấu.</td>
</tr>
</table>

<h2>Giới thiệu về các gói</h2>

<table border="1" cellspacing="0" align="center">
<tr>
    <th>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;STT&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</th>
    <th>&nbsp;&nbsp;&nbsp;Tên nhóm&nbsp;&nbsp;&nbsp;</th>
    <th>&nbsp;&nbsp;&nbsp;Tên gói&nbsp;&nbsp;&nbsp;</th>
    <th>&nbsp;&nbsp;&nbsp;Kích thước&nbsp;&nbsp;&nbsp;</th>
    <th>&nbsp;&nbsp;&nbsp;Mô tả&nbsp;&nbsp;&nbsp;</th>
</tr>
<tr>
    <td align="center">1.0</td>
    <td align="center">distmap</td>
    <td align="center">distmap_00.6.0.json</td>
    <td align="center">0.6MB</td>
    <td align="center">Bản đồ riêng mỗi thành phố</td>
</tr>
<tr>
    <td align="center">1.1</td>
    <td align="center">distmap</td>
    <td align="center">distmap_02.2.0.json</td>
    <td align="center">2.2MB</td>
    <td align="center">Bản đồ toàn Hà Nội</td>
</tr>
<tr>
    <td align="center">2.0</td>
    <td align="center">geojson</td>
    <td align="center">geojson_05.4.0.json</td>
    <td align="center">5.4MB</td>
    <td align="center">Bản đồ đường thành phố dung lượng thấp hơi thô</td>
</tr>
<tr>
    <td align="center">2.1</td>
    <td align="center">geojson</td>
    <td align="center">geojson_06.6.0.json</td>
    <td align="center">6.4MB</td>
    <td align="center">Bản đồ đường thành phố dung lượng cao hơn nhưng vẫn thô</td>
</tr>
<tr>
    <td align="center">2.2</td>
    <td align="center">geojson</td>
    <td align="center">geojson_07.1.0.json</td>
    <td align="center">7.1MB</td>
    <td align="center">Đã nâng cấp nhưng mà bản đồ thành phố vẫn thưa, dự phòng</td>
</tr>
<tr>
    <td align="center">2.3</td>
    <td align="center">geojson</td>
    <td align="center">geojson_07.1.1.json</td>
    <td align="center">7.1MB</td>
    <td align="center">Đây là bản được ưu tiên nhất</td>
</tr>
<tr>
    <td align="center">2.4</td>
    <td align="center">geojson</td>
    <td align="center">geojson_49.9.0.json</td>
    <td align="center">49.9MB</td>
    <td align="center">Đẹp nhưng mà không mượt</td>
</tr>
<tr>
    <td align="center">2.5</td>
    <td align="center">geojson</td>
    <td align="center">geojson_50.9.0.json</td>
    <td align="center">50.9MB</td>
    <td align="center">Rất đẹp nhưng mà không mượt</td>
</tr>
<tr>
    <td align="center">2.6</td>
    <td align="center">geojson</td>
    <td align="center">geojson_83.8.0.json</td>
    <td align="center">83.8MB</td>
    <td align="center">Cực đẹp nhưng mà sẽ đơ máy</td>
</tr>
<tr>
    <td align="center">3.0</td>
    <td align="center">geomap</td>
    <td align="center">geomap_00.6.0.json</td>
    <td align="center">0.6MB</td>
    <td align="center">Bản duy nhất đủ dùng và tối ưu</td>
</tr>
</table>

<h2>Lựa chọn tối ưu cho từng nhóm</h2>

<table border="1" cellspacing="0" align="center">
<tr>
    <th>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;STT&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</th>
    <th>&nbsp;&nbsp;&nbsp;Tên nhóm&nbsp;&nbsp;&nbsp;</th>
    <th>&nbsp;&nbsp;&nbsp;Tên gói&nbsp;&nbsp;&nbsp;</th>
    <th>&nbsp;&nbsp;&nbsp;Kích thước&nbsp;&nbsp;&nbsp;</th>
    <th>&nbsp;&nbsp;&nbsp;Mô tả&nbsp;&nbsp;&nbsp;</th>
</tr>
<tr>
    <td align="center">1</td>
    <td align="center">distmap</td>
    <td align="center">distmap_00.6.0.json</td>
    <td align="center">0.6MB</td>
    <td align="center">Bản đồ duy nhất về địa giới của thành phố, dung lượng nhỏ và mượt</td>
</tr>
<tr>
    <td align="center">2</td>
    <td align="center">geojson</td>
    <td align="center">geojson_07.1.1.json</td>
    <td align="center">7.1MB</td>
    <td align="center">Lựa chọn tối ưu nhất có dung lượng đủ ổn không có cao, tổng quan đường đủ ôn, chi tiêt</td>
</tr>
<tr>
    <td align="center">3</td>
    <td align="center">geomap</td>
    <td align="center">geomap_00.6.0.json</td>
    <td align="center">0.6MB</td>
    <td align="center">Bản đồ duy nhất về danh giới của thành phố, dung lượng nhỏ đảm nhiệm tốt như cầu</td>
</tr>
</table>

<h2>Môi trường cần thiết</h2>

```bash
Visual Studio Code, Javascript, Python, Leaflet
```

<h2>* Cài extension cần thiết</h2>

```bash
Live Server
```

<h2>* Cách chạy chương trình</h2>

<p>Tìm kiếm file trong thư mục</p>

```bash
index.html
```

<p>Thực thi code bằng cách ấn nút ở góc phải bên dưới màn hình</p>

```bash
Go Live
```

<p>Nút trên thay đổi sang</p>

```bash
Port: xyzt với xyzt là số nguyên là thành công.
```

<h2>Cách tách file distmap cho các tỉnh/thành khác</h2>

<p>Tìm kiếm file trong thư mục</p>

```bash
index.py
```

<p>Thay đổi các tham số trong file theo quy tắc</p>

```bash
distmap_xy.z.t.json
```

<p>Trong đó:</p>

```bash
xy: Là số nguyên trước dấu phẩy của dung lượng file theo đơn vị MB
```

```bash
z: Là số làm tròn đầu tiên của dung lượng file theo đơn vị MB
```

```bash
t: Là số lần xuất hiện của file cùng định dạng, cùng dung lượng
```

<p>Lệnh thực thi của đoạn code</p>

```bash
python index.py
```

<h2>Hết...</h2>

v0.1 Trịnh Như Nhất


