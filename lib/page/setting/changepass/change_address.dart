// import 'package:flutter/material.dart';
// import 'package:one_store/data/model/users.dart';
// import 'package:one_store/page/setting/addressScreen.dart';

// class ChangeAddressScreen extends StatefulWidget {
//   final Users users;

//   const ChangeAddressScreen({Key? key, required this.users}) : super(key: key);

//   @override
//   _ChangeAddressScreenState createState() => _ChangeAddressScreenState();
// }

// class _ChangeAddressScreenState extends State<ChangeAddressScreen> {
//   bool isDefault = false;

//   @override
//   void initState() {
//     super.initState();
//     isDefault = widget.users.isDefault ?? false;
//   }

//   void _navigateToAddressScreen() {
//     Navigator.pushReplacement(
//       context,
//       MaterialPageRoute(
//         builder: (context) => const AddressScreen(),
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SingleChildScrollView(
//         child: SafeArea(
//           child: Column(
//             children: <Widget>[
//               Stack(
//                 children: <Widget>[
//                   SizedBox(
//                     width: MediaQuery.of(context).size.width,
//                     child: Image.asset(
//                       "assets/layout/layout_1.png",
//                       fit: BoxFit.cover,
//                     ),
//                   ),
//                   Positioned(
//                     top: 40,
//                     left: 50,
//                     right: 50,
//                     child: Column(
//                       children: <Widget>[
//                         Stack(
//                           children: [
//                             Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                               children: [
//                                 Image.asset(
//                                   "assets/image/logo_2.png",
//                                   width: 140,
//                                   height: 140,
//                                 ),
//                                 const Positioned(
//                                   top: 0,
//                                   child: Icon(
//                                     Icons.notifications,
//                                     size: 40,
//                                     color: Colors.white,
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ],
//                         ),
//                         Row(
//                           children: [
//                             ElevatedButton(
//                               onPressed: _navigateToAddressScreen,
//                               style: ElevatedButton.styleFrom(
//                                 foregroundColor: Colors.black,
//                                 backgroundColor: const Color(0xFFF3B664),
//                               ),
//                               child: const Icon(
//                                 Icons.arrow_back_ios,
//                                 size: 15,
//                               ),
//                             ),
//                           ],
//                         ),
//                       ],
//                     ),
//                   )
//                 ],
//               ),
//               const SizedBox(
//                 height: 60,
//               ),
//               Column(
//                 children: [
//                   const Row(
//                     children: [
//                       SizedBox(
//                         width: 31,
//                       ),
//                       Text(
//                         'Liên hệ',
//                         style: TextStyle(
//                           fontSize: 16,
//                           fontWeight: FontWeight.bold,
//                           color: Color(0xFF4D4A4A),
//                         ),
//                       )
//                     ],
//                   ),
//                   const SizedBox(
//                     height: 12,
//                   ),
//                   Container(
//                     height: 1.0,
//                     color: Colors.grey[300], // Màu xám nhạt
//                     margin: const EdgeInsets.symmetric(
//                         horizontal: 0), // Khoảng cách ngang
//                   ),
//                   const SizedBox(
//                     height: 14,
//                   ),
//                   Row(
//                     children: [
//                       const SizedBox(
//                         width: 31,
//                       ),
//                       Text(
//                         '${widget.users.fullname}',
//                         style: const TextStyle(
//                             fontSize: 15, fontWeight: FontWeight.bold),
//                       )
//                     ],
//                   ),
//                   const SizedBox(
//                     height: 12,
//                   ),
//                   Container(
//                     height: 1.0,
//                     color: Colors.grey[300], // Màu xám nhạt
//                     margin: const EdgeInsets.symmetric(
//                         horizontal: 0), // Khoảng cách ngang
//                   ),
//                   const SizedBox(
//                     height: 14,
//                   ),
//                   Row(
//                     children: [
//                       const SizedBox(
//                         width: 31,
//                       ),
//                       Text(
//                         '(+84) ${widget.users.phoneNumber}',
//                         style: const TextStyle(
//                             fontSize: 16, fontWeight: FontWeight.bold),
//                       )
//                     ],
//                   ),
//                   const SizedBox(
//                     height: 12,
//                   ),
//                   Container(
//                     height: 1.0,
//                     color: Colors.grey[300], // Màu xám nhạt
//                     margin: const EdgeInsets.symmetric(
//                         horizontal: 0), // Khoảng cách ngang
//                   ),
//                   const SizedBox(
//                     height: 50,
//                   ),
//                   const Row(
//                     children: [
//                       SizedBox(
//                         width: 31,
//                       ),
//                       Text(
//                         'Địa chỉ',
//                         style: TextStyle(
//                           fontSize: 16,
//                           fontWeight: FontWeight.bold,
//                           color: Color(0xFF4D4A4A),
//                         ),
//                       )
//                     ],
//                   ),
//                   const SizedBox(
//                     height: 12,
//                   ),
//                   Container(
//                     height: 1.0,
//                     color: Colors.grey[300], // Màu xám nhạt
//                     margin: const EdgeInsets.symmetric(
//                         horizontal: 0), // Khoảng cách ngang
//                   ),
//                   InkWell(
//                     onTap: () {},
//                     child: Container(
//                       padding: const EdgeInsets.only(top: 12, left: 31),
//                       child: const Column(
//                         children: [
//                           Row(
//                             children: [
//                               Text(
//                                 'TP HCM',
//                                 style: TextStyle(
//                                     fontSize: 16, fontWeight: FontWeight.bold),
//                               )
//                             ],
//                           ),
//                           SizedBox(
//                             height: 12,
//                           ),
//                           Row(
//                             children: [
//                               Text(
//                                 'Quận 10',
//                                 style: TextStyle(
//                                     fontSize: 16, fontWeight: FontWeight.bold),
//                               ),
//                               SizedBox(
//                                 width: 265,
//                               ),
//                               Icon(Icons.navigate_next_outlined),
//                             ],
//                           ),
//                           SizedBox(
//                             height: 12,
//                           ),
//                           Row(
//                             children: [
//                               Text(
//                                 'Phường 6',
//                                 style: TextStyle(
//                                     fontSize: 16, fontWeight: FontWeight.bold),
//                               ),
//                             ],
//                           ),
//                           SizedBox(
//                             height: 12,
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                   Container(
//                     height: 1.0,
//                     color: Colors.grey[300], // Màu xám nhạt
//                     margin: const EdgeInsets.symmetric(
//                         horizontal: 0), // Khoảng cách ngang
//                   ),
//                   const SizedBox(
//                     height: 14,
//                   ),
//                   const Row(
//                     children: [
//                       SizedBox(
//                         width: 31,
//                       ),
//                       Text(
//                         '123 Thành Thái',
//                         style: TextStyle(
//                             fontSize: 16, fontWeight: FontWeight.bold),
//                       ),
//                     ],
//                   ),
//                   const SizedBox(
//                     height: 12,
//                   ),
//                   Container(
//                     height: 1.0,
//                     color: Colors.grey[300], // Màu xám nhạt
//                     margin: const EdgeInsets.symmetric(
//                         horizontal: 0), // Khoảng cách ngang
//                   ),
//                   const SizedBox(
//                     height: 60,
//                   ),
//                   Row(
//                     children: [
//                       const SizedBox(
//                         width: 31,
//                       ),
//                       const Text(
//                         'Địa chỉ mặc định',
//                         style: TextStyle(
//                           fontSize: 16,
//                           fontWeight: FontWeight.bold,
//                           color: Color(0xFF4D4A4A),
//                         ),
//                       ),
//                       const SizedBox(
//                         width: 140,
//                       ),
//                       Transform.scale(
//                         scale:
//                             0.85, // Thay đổi giá trị scale để điều chỉnh kích thước
//                         child: Switch(
//                           value: isDefault,
//                           onChanged: (value) {
//                             setState(() {
//                               isDefault = value;
//                             });
//                           },
//                           activeTrackColor: Colors.greenAccent,
//                           activeColor: Colors.green,
//                         ),
//                       ),
//                     ],
//                   ),
//                   const SizedBox(
//                     height: 128,
//                   ),
//                   GestureDetector(
//                     onTap: () {
//                       // Xử lý khi người dùng nhấn vào nút
//                     },
//                     child: Container(
//                       width: 286, // Độ rộng của nút vuông
//                       height: 43, // Độ cao của nút vuông
//                       decoration: BoxDecoration(
//                           color:
//                               const Color(0xFFEC8F5E), // Màu nền của nút vuông
//                           borderRadius: BorderRadius.circular(
//                               10), // Độ cong góc của nút vuông
//                           boxShadow: [
//                             BoxShadow(
//                               color: Colors.grey.withOpacity(0.5),
//                               spreadRadius: 2,
//                               blurRadius: 5,
//                               offset: const Offset(0, 3), // Độ lệch của bóng đổ
//                             ),
//                           ],
//                           border: Border.all(
//                             color: const Color(0xFFEC8F5E),
//                             width: 1,
//                           )),
//                       child: const Center(
//                         child: Text(
//                           'LƯU THAY ĐỔI',
//                           style: TextStyle(
//                             color: Colors.white, // Màu chữ của văn bản
//                             fontSize: 16, // Kích thước chữ
//                             fontWeight: FontWeight.bold, // Độ đậm của chữ
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                   const SizedBox(
//                     height: 30,
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
