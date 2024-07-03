// manage_users_page.dart

import 'package:flutter/material.dart';
import 'package:one_store/data/model/usermodeladmin.dart';
import 'package:one_store/data/provider/userprovider.dart';
import 'package:one_store/page/Admin/user/adduserpage.dart';
import 'package:one_store/page/Admin/user/updateuserpage.dart';
import 'package:provider/provider.dart';
import 'package:one_store/conf/const.dart';

class ManageUsersPage extends StatefulWidget {
  @override
  _ManageUsersPageState createState() => _ManageUsersPageState();
}

class _ManageUsersPageState extends State<ManageUsersPage> {
  @override
  void initState() {
    super.initState();
    Provider.of<UserProvider>(context, listen: false).loadUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Quản lý người dùng'),
        backgroundColor: buttonBackgroundColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      labelText: 'Tìm kiếm',
                      labelStyle: TextStyle(color: buttonBackgroundColor),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: buttonBackgroundColor),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: buttonBackgroundColor),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: buttonBackgroundColor),
                      ),
                      prefixIcon:
                          Icon(Icons.search, color: buttonBackgroundColor),
                    ),
                    onChanged: (value) {
                      Provider.of<UserProvider>(context, listen: false)
                          .searchQuery = value;
                    },
                  ),
                ),
                SizedBox(width: 8),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: buttonBackgroundColor),
                    borderRadius: BorderRadius.circular(4.0),
                  ),
                  child: IconButton(
                    icon: Icon(Icons.add),
                    color: buttonBackgroundColor,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => AddUserPage()),
                      );
                    },
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
            Expanded(
              child: Consumer<UserProvider>(
                builder: (context, userProvider, _) {
                  List<User> filteredUsers = userProvider.users.where((user) {
                    return user.name
                            .toLowerCase()
                            .contains(userProvider.searchQuery.toLowerCase()) ||
                        user.username
                            .toLowerCase()
                            .contains(userProvider.searchQuery.toLowerCase()) ||
                        user.phone
                            .toLowerCase()
                            .contains(userProvider.searchQuery.toLowerCase());
                  }).toList();

                  return ListView(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Row(
                          children: [
                            Expanded(
                                flex: 2,
                                child: Text('Tên',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold))),
                            SizedBox(width: 8),
                            Expanded(
                                flex: 2,
                                child: Text('Tài khoản',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold))),
                            SizedBox(width: 8),
                            Expanded(
                                flex: 1,
                                child: Text('SĐT',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold))),
                          ],
                        ),
                      ),
                      Divider(),
                      ...filteredUsers.map((user) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    UpdateUserPage(user: user),
                              ),
                            ).then((_) {
                              Provider.of<UserProvider>(context, listen: false)
                                  .loadUsers();
                            });
                          },
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: Row(
                              children: [
                                Expanded(flex: 2, child: Text(user.name)),
                                SizedBox(width: 8),
                                Expanded(flex: 2, child: Text(user.username)),
                                SizedBox(width: 8),
                                Expanded(flex: 1, child: Text(user.phone)),
                              ],
                            ),
                          ),
                        );
                      }).toList(),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
