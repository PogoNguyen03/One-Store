import 'package:flutter/material.dart';
import 'package:one_store/SQLite/sqlite.dart';
import 'package:one_store/data/model/address.dart';
import 'package:your_package_name_here/data/model/address.dart'; // Thay đổi thành model của địa chỉ của bạn
import 'package:your_package_name_here/data/database_helper.dart'; // Thay đổi thành helper class của bạn

class AddressScreen extends StatefulWidget {
  final int userId; // Nhận userId từ các tham số của widget

  const AddressScreen({Key? key, required this.userId}) : super(key: key);

  @override
  _AddressScreenState createState() => _AddressScreenState();
}

class _AddressScreenState extends State<AddressScreen> {
  late List<Address> addresses;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchAddresses();
  }

  Future<void> fetchAddresses() async {
    try {
      addresses = await DatabaseHelper().getAddressesByUserId(widget.userId);
      setState(() {
        isLoading = false;
      });
    } catch (e) {
      // Xử lý lỗi khi fetch địa chỉ không thành công
      print('Fetch addresses error: $e');
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Danh sách địa chỉ'),
      ),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : addresses.isEmpty
              ? Center(
                  child: Text('Không có địa chỉ nào'),
                )
              : ListView.builder(
                  itemCount: addresses.length,
                  itemBuilder: (context, index) {
                    Address address = addresses[index];
                    return ListTile(
                      title: Text(address.street ?? ''),
                      subtitle: Text(
                          '${address.city ?? ''}, ${address.district ?? ''}'),
                      // Thêm các thông tin địa chỉ khác vào đây
                    );
                  },
                ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Chuyển sang màn hình thêm địa chỉ mới
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddAddressScreen(userId: widget.userId),
            ),
          ).then((_) {
            // Sau khi thêm địa chỉ, làm mới danh sách
            fetchAddresses();
          });
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

class AddAddressScreen extends StatefulWidget {
  final int userId; // Nhận userId từ các tham số của widget

  const AddAddressScreen({Key? key, required this.userId}) : super(key: key);

  @override
  _AddAddressScreenState createState() => _AddAddressScreenState();
}

class _AddAddressScreenState extends State<AddAddressScreen> {
  late TextEditingController streetController;
  late TextEditingController cityController;
  late TextEditingController districtController;
  late TextEditingController wardController;

  @override
  void initState() {
    super.initState();
    streetController = TextEditingController();
    cityController = TextEditingController();
    districtController = TextEditingController();
    wardController = TextEditingController();
  }

  @override
  void dispose() {
    streetController.dispose();
    cityController.dispose();
    districtController.dispose();
    super.dispose();
  }

  Future<void> saveAddress() async {
    Address newAddress = Address(
      userId: widget.userId,
      street: streetController.text,
      city: cityController.text,
      district: districtController.text,
      ward: wardController.text,

      // Thêm các trường dữ liệu khác của địa chỉ nếu cần
    );

    try {
      await DatabaseHelper().insertAddress(newAddress);
      Navigator.pop(
          context); // Quay lại màn hình trước đó sau khi thêm địa chỉ thành công
    } catch (e) {
      // Xử lý lỗi khi thêm địa chỉ không thành công
      print('Save address error: $e');
      // Hiển thị thông báo lỗi
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Lỗi: Không thể thêm địa chỉ')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Thêm địa chỉ mới'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: streetController,
              decoration: InputDecoration(
                labelText: 'Đường',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 12.0),
            TextField(
              controller: cityController,
              decoration: InputDecoration(
                labelText: 'Thành phố',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 12.0),
            TextField(
              controller: districtController,
              decoration: InputDecoration(
                labelText: 'Quận/Huyện',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 12.0),
            TextField(
              controller: wardController,
              decoration: InputDecoration(
                labelText: 'Phường/Xã',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 24.0),
            ElevatedButton(
              onPressed: saveAddress,
              child: Text('Lưu địa chỉ'),
            ),
          ],
        ),
      ),
    );
  }
}
