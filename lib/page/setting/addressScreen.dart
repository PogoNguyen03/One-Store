import 'package:flutter/material.dart';
import 'package:one_store/page/setting/settingScreen.dart';
import 'package:provider/provider.dart';
import '../../data/model/address_model.dart';
import '../../data/provider/addressprovider.dart';
import './address_body.dart';
import './settingScreen.dart';

class AddressScreen extends StatefulWidget {
  const AddressScreen({Key? key}) : super(key: key);

  @override
  State<AddressScreen> createState() => _AddressScreenState();
}

class _AddressScreenState extends State<AddressScreen> {
  List<Address> addresses = [];

  Future<String> loadAddressList() async {
    addresses = await ReadAddressData().loadAddressData();
    setState(() {});
    return '';
  }

  @override
  void initState() {
    super.initState();
    loadAddressList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: <Widget>[
              Stack(
                children: <Widget>[
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: Image.asset(
                      "assets/layout/layout_1.png",
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    top: 40,
                    left: 50,
                    right: 50,
                    child: Column(
                      children: <Widget>[
                        Stack(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Image.asset(
                                  "assets/image/logo_2.png",
                                  width: 140,
                                  height: 140,
                                ),
                                const Positioned(
                                  top: 0,
                                  child: Icon(
                                    Icons.notifications,
                                    size: 40,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const settingScreen(),
                                  ),
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                foregroundColor: Colors.black,
                                backgroundColor: const Color(0xFFF3B664),
                              ),
                              child: const Icon(
                                Icons.arrow_back_ios,
                                size: 15,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 60,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(
                    width: 31,
                  ),
                  const Text(
                    'Địa chỉ',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    width: 240,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const settingScreen(),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFEC8F5E),
                      shape: const CircleBorder(),
                      padding: const EdgeInsets.all(8),
                    ),
                    child: const Icon(
                      Icons.add,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: addresses.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Container(
                        height: 1.0,
                        color: Colors.grey[300], // Màu xám nhạt
                        margin: const EdgeInsets.symmetric(
                            horizontal: 10.0), // Khoảng cách ngang
                      ),
                      ItemAddressGridView(
                          addresses[index]), // Widget item của bạn
                      Container(
                        height: 1.0,
                        color: Colors.grey[300], // Màu xám nhạt
                        margin: const EdgeInsets.symmetric(
                            horizontal: 10.0), // Khoảng cách ngang
                      ),
                    ],
                  );
                },
              ),
              const SizedBox(
                height: 100,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
