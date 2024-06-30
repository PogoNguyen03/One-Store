// import 'package:flutter/material.dart';
// import 'package:circle_nav_bar/circle_nav_bar.dart';
// import 'package:one_store/mainpage.dart';
// // import 'package:one_store/page/setting/addressScreen.dart';
// import '../../data/model/users.dart';
// import '../setting/profileUserScreen.dart';
// import './changePasswordScreen.dart';

// // ignore: camel_case_types
// class SettingScreen extends StatefulWidget {
//   // final Users users;
//   // const SettingScreen({Key? key, required this.users}) : super(key: key);
//   const SettingScreen({super.key});

//   @override
//   State<SettingScreen> createState() => _settingScreenState();
// }

// class _settingScreenState extends State<SettingScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: Container(
//           width: double.infinity,
//           height: double.infinity,
//           child: Stack(
//             children: <Widget>[
//               SizedBox(
//                 width: MediaQuery.of(context).size.width,
//                 child: Image.asset(
//                   "assets/layout/layout_1.png",
//                   fit: BoxFit.cover,
//                 ),
//               ),
//               Positioned(
//                 left: 0,
//                 right: 0,
//                 child: Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 20.0),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.start,
//                     children: [
//                       Image.asset(
//                         "assets/image/logo_2.png",
//                         width: 150,
//                         height: 150,
//                         fit: BoxFit.contain,
//                       ),
//                       Spacer(flex: 1),
//                       IconButton(
//                         iconSize: 40,
//                         icon: const Icon(Icons.notifications,
//                             color: Colors.white),
//                         onPressed: () {
//                           // Hành động khi nút được nhấn
//                         },
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//               // Positioned(
//               //   top: 160,
//               //   left: 40,
//               //   child: Center(
//               //     child: IconButton(
//               //       onPressed: () {
//               //         Navigator.pop(context);
//               //       },
//               //       icon: const Icon(
//               //         Icons.arrow_back_ios_new_rounded,
//               //         color: Colors.white,
//               //       ),
//               //       style: ElevatedButton.styleFrom(
//               //         shape: const CircleBorder(),
//               //         backgroundColor: const Color(0xFFF3B664),
//               //         padding: const EdgeInsets.all(15),
//               //       ),
//               //     ),
//               //   ),
//               // ),
//               Positioned(
//                 top: 270,
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     InkWell(
//                       onTap: () {
//                         // Navigator.push(
//                         //   context,
//                         //   MaterialPageRoute(
//                         //     builder: (context) => ProfileUserScreen(),
//                         //   ),
//                         // );
//                       },
//                       child: const Row(
//                         children: [
//                           SizedBox(
//                             width: 44,
//                           ),
//                           Icon(
//                             Icons.supervised_user_circle_outlined,
//                             size: 30,
//                           ),
//                           SizedBox(
//                             width: 36,
//                           ),
//                           Text(
//                             "Chỉnh sửa thông tin cá nhân",
//                             style: TextStyle(fontSize: 16),
//                           ),
//                         ],
//                       ),
//                     ),
//                     const SizedBox(height: 30), // Adjust the height as needed
//                     InkWell(
//                       onTap: () {
//                         // Navigator.push(
//                         //   context,
//                         //   MaterialPageRoute(
//                         //     builder: (context) => const changePasswordScreen(),
//                         //   ),
//                         // );
//                       },
//                       child: const Row(
//                         children: [
//                           SizedBox(
//                             width: 44,
//                           ),
//                           Icon(
//                             Icons.lock,
//                             size: 30,
//                           ),
//                           SizedBox(
//                             width: 36,
//                           ),
//                           Text(
//                             "Đổi mật khẩu",
//                             style: TextStyle(fontSize: 16),
//                           ),
//                         ],
//                       ),
//                     ),
//                     const SizedBox(height: 30), // Adjust the height as needed
//                     InkWell(
//                       onTap: () {
//                         // Navigator.push(context,
//                         //     MaterialPageRoute(builder: (context) => const AddressScreen()));
//                       },
//                       child: const Row(
//                         children: [
//                           SizedBox(
//                             width: 44,
//                           ),
//                           Icon(
//                             Icons.fmd_good_sharp,
//                             size: 30,
//                           ),
//                           SizedBox(
//                             width: 36,
//                           ),
//                           Text(
//                             "Địa chỉ",
//                             style: TextStyle(fontSize: 16),
//                           ),
//                         ],
//                       ),
//                     ),
//                     const SizedBox(height: 30), // Adjust the height as needed
//                     InkWell(
//                       onTap: () {
//                         // Navigator.push(context,
//                         //     MaterialPageRoute(builder: (context) => const AddressScreen()));
//                       },
//                       child: const Row(
//                         children: [
//                           SizedBox(
//                             width: 44,
//                           ),
//                           Icon(
//                             Icons.card_travel_outlined,
//                             size: 30,
//                           ),
//                           SizedBox(
//                             width: 36,
//                           ),
//                           Text(
//                             "Đơn hàng",
//                             style: TextStyle(fontSize: 16),
//                           ),
//                         ],
//                       ),
//                     ),
//                     const SizedBox(height: 80), // Adjust the height as needed
//                     InkWell(
//                       onTap: () {
//                         // Navigator.push(context,
//                         //     MaterialPageRoute(builder: (context) => const AddressScreen()));
//                       },
//                       child: const Row(
//                         children: [
//                           SizedBox(
//                             width: 44,
//                           ),
//                           Icon(
//                             Icons.exit_to_app,
//                             size: 30,
//                           ),
//                           SizedBox(
//                             width: 36,
//                           ),
//                           Text(
//                             "Đăng xuất",
//                             style: TextStyle(fontSize: 16),
//                           ),
//                         ],
//                       ),
//                     ),
//                     const SizedBox(height: 30), // Adjust the height as needed
//                     InkWell(
//                       onTap: () {
//                         // Navigator.push(context,
//                         //     MaterialPageRoute(builder: (context) => const AddressScreen()));
//                       },
//                       child: const Row(
//                         children: [
//                           SizedBox(
//                             width: 44,
//                           ),
//                           Icon(
//                             Icons.delete_outline,
//                             size: 30,
//                             color: Colors.red,
//                           ),
//                           SizedBox(
//                             width: 36,
//                           ),
//                           Text(
//                             "Xóa tài khoản",
//                             style: TextStyle(fontSize: 16, color: Colors.red),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:one_store/data/model/users.dart';
import '../setting/profileUserScreen.dart';

class SettingScreen extends StatefulWidget {
  final Users user; // Khai báo trường user

  const SettingScreen({Key? key, required this.user}) : super(key: key);

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cài đặt'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ProfileUserScreen(user: widget.user),
              ),
            );
          },
          child: Text('Xem thông tin cá nhân'),
        ),
      ),
    );
  }
}
