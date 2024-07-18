import 'package:flutter/material.dart';
import 'package:one_store/data/model/users.dart';
import 'package:one_store/mainpage.dart';
import 'package:one_store/page/admin/adminscreen';
import 'package:one_store/page/home/homescreen.dart';
import 'package:one_store/page/login/loginscreen.dart';
import 'package:one_store/data/provider/categoryprovider.dart';
import 'package:one_store/data/provider/orderprovideradmin.dart';
import 'package:one_store/data/provider/promotionprovider.dart';
import 'package:one_store/data/provider/stationeryprovideradmin.dart';
import 'package:one_store/data/provider/userprovider.dart';
import 'package:provider/provider.dart';
import 'package:one_store/data/provider/bookprovideradmin.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => BookProvider()),
        ChangeNotifierProvider(create: (_) => StationeryProvider()),
        ChangeNotifierProvider(create: (_) => UserProvider()),
        ChangeNotifierProvider(create: (_) => OrderProvider()),
        ChangeNotifierProvider(create: (_) => PromotionProvider()),
        ChangeNotifierProvider(create: (_) => CategoryProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.white,
          primarySwatch: Colors.amber,
        ),
        home: LoginScreen(), // Trang khởi đầu là LoginScreen
        routes: {
          '/adminDashboard': (context) => AdminDashboard(),
          '/home': (context) => HomeScreen(), // Đường dẫn đến HomeScreen
          '/mainpage': (context) => Mainpage(
              user: Users(
                  usrName: '',
                  usrPassword: '')), // Đường dẫn đến Mainpage với truyền Users
        },
      ),
    );
  }
}
