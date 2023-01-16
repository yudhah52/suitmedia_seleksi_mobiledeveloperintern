import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';

class ThridScreen extends StatefulWidget {
  const ThridScreen({Key? key}) : super(key: key);

  @override
  State<ThridScreen> createState() => _ThridScreenState();
}

class _ThridScreenState extends State<ThridScreen> {
  final JsonDecoder _decoder = const JsonDecoder();
  List userList = [];
  int pageApi = 1;
  int perPage = 8;

  @override
  void initState() {
    getUserList();
    // TODO: implement initState
    super.initState();
  }

  getUserList() async {
    String url = 'https://reqres.in/api/users?page=$pageApi&per_page=$perPage';
    dynamic res = await http.get(Uri.parse(url)).then((http.Response response) {
      final int statusCode = response.statusCode;

      if (statusCode < 200 || statusCode > 400 || json == null) {
        throw Exception("Error while fetching data");
      }
      return _decoder.convert(response.body);
    });
    print("==============DATA $res");
    setState(() {
      userList += res["data"];
    });
  }

  Future<void> refresh() async {
    setState(() {
      userList = [];
      pageApi = 1;
    });
    getUserList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: buildAppbar(),
      body: LazyLoadScrollView(
          onEndOfPage: () {
            setState(() {
              pageApi++;
            });
            getUserList();
          },
          child: RefreshIndicator(
            onRefresh: refresh,
            child: buildUserList(),
          )),
    );
  }

  Widget buildUserList() {
    return ListView.builder(
      padding: EdgeInsets.only(top: 8, bottom: 16),
      shrinkWrap: true,
      itemCount: userList.length,
      itemBuilder: (context, index) {
        var user = userList[index];
        return userTile(
          email: user['email'],
          firstName: user['first_name'],
          lastName: user['last_name'],
          imgUrl: user['avatar'],
        );
      },
    );
  }

  Widget userTile({
    required String imgUrl,
    required String firstName,
    required String lastName,
    required String email,
  }) {
    return InkWell(
      onTap: () {
        Navigator.pop(context, firstName + ' ' + lastName);
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 24),
        child: Container(
          decoration: BoxDecoration(
            border: Border(bottom: BorderSide(width: 0.5, color: Colors.grey)),
          ),
          padding: EdgeInsets.symmetric(
            horizontal: 18,
            vertical: 16,
          ),
          child: Row(
            children: [
              Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(imgUrl),
                  ),
                  shape: BoxShape.circle,
                ),
              ),
              SizedBox(
                width: 20,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '$firstName $lastName',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    '$email',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500,
                      fontSize: 10,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  AppBar buildAppbar() {
    return AppBar(
      elevation: 1,
      backgroundColor: Colors.white,
      leading: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: Icon(
          Icons.arrow_back_ios_new_rounded,
          color: Colors.blue,
        ),
      ),
      centerTitle: true,
      title: Text(
        "Thrid Screen",
        style: TextStyle(
          color: Colors.black,
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
