import 'package:flutter/material.dart';
import 'package:suitmedia_project_seleksi/components/custom_button.dart';
import 'package:suitmedia_project_seleksi/screens/thrid_screen.dart';

class SecondScreen extends StatefulWidget {
  const SecondScreen({Key? key, required this.name}) : super(key: key);

  final String name;

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  String selectedUserName = 'Selected User Name';

  Future<void> navigateToListUser(BuildContext context) async {
    var selectedUser = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ThridScreen(),
      ),
    );
    setState(() {
      selectedUserName = selectedUser;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: buildAppbar(),
      body: Stack(
        children: [
          buildHeader(),
          buildCenter(),
          buildBottom(),
        ],
      ),
    );
  }

  Widget buildHeader() {
    return Positioned(
      left: 24,
      top: 16,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Welcome',
            style: TextStyle(
              fontFamily: 'Poppins',
              fontSize: 12,
              fontWeight: FontWeight.w400,
            ),
          ),
          Text(
            widget.name,
            style: TextStyle(
              fontFamily: 'Poppins',
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  Widget buildCenter() {
    return Align(
      alignment: Alignment.center,
      child: Text(
        selectedUserName,
        style: TextStyle(
          fontFamily: 'Poppins',
          fontSize: 24,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  Widget buildBottom() {
    return Positioned(
      bottom: 32,
      left: 24,
      right: 24,
      child: Container(
        // margin: EdgeInsets.symmetric(horizontal: 24, vertical: 32),
        child: CustomButton(
          onClick: () {
            navigateToListUser(context);
          },
          textButton: 'Choose a User',
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
        "Second Screen",
        style: TextStyle(
          color: Colors.black,
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
