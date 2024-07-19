import 'package:flutter/material.dart';

Widget buildImage(String urlImage, int index, BoxFit fit) => Container(
      // color: Colors.grey,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(0),
        child: Image.asset(
          urlImage,
          fit: BoxFit.contain, // Thêm cách hình ảnh được hiển thị trong khung
        ),
      ),
    );
