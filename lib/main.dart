import 'package:flutter/material.dart';
import 'package:one_store/data/provider/categoryprovider.dart';
import 'package:one_store/data/provider/orderprovideradmin.dart';
import 'package:one_store/data/provider/promotionprovider.dart';
import 'package:one_store/data/provider/stationeryprovideradmin.dart';
import 'package:one_store/data/provider/userprovider.dart';
import 'package:provider/provider.dart';
import 'package:one_store/data/provider/bookprovideradmin.dart';
import 'package:one_store/page/Admin/admindashboard.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
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
        home:
            AdminDashboard(), // Or any other starting page of your application
      ),
    );
  }
}
