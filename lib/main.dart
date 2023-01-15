import 'package:flutter/material.dart';
import 'package:suitmedia_project_seleksi/components/custom_button.dart';
import 'package:suitmedia_project_seleksi/components/custom_text_form_field.dart';
import 'package:suitmedia_project_seleksi/screens/first_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const FirstScreen(),
    );
  }
}

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({Key? key}) : super(key: key);

//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   bool isPalindrome = false;
//   TextEditingController _name = TextEditingController();
//   TextEditingController _palindrome = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: BoxDecoration(
//         image: DecorationImage(
//           image: AssetImage('assets/images/background.png'),
//           fit: BoxFit.cover,
//         ),
//       ),
//       child: Scaffold(
//         // resizeToAvoidBottomInset: false,
//         backgroundColor: Colors.transparent,
//         body: Center(
//           child: Container(
//             margin: EdgeInsets.symmetric(
//               horizontal: 32,
//             ),
//             child: SingleChildScrollView(
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: <Widget>[
//                   Container(
//                     width: 116,
//                     height: 116,
//                     decoration: BoxDecoration(
//                       shape: BoxShape.circle,
//                       color: Colors.white.withOpacity(0.3),
//                     ),
//                     child: Icon(
//                       Icons.person_add_alt_rounded,
//                       color: Colors.white,
//                       size: 32,
//                     ),
//                   ),
//                   SizedBox(
//                     height: 56,
//                   ),
//                   CustomTextFormField(
//                     controller: _name,
//                     hintText: 'Name',
//                   ),
//                   SizedBox(
//                     height: 20,
//                   ),
//                   CustomTextFormField(
//                     controller: _palindrome,
//                     hintText: 'Palindrome',
//                   ),
//                   SizedBox(
//                     height: 45,
//                   ),
//                   CustomButton(onClick: () {}, textButton: 'CHECK'),
//                   SizedBox(
//                     height: 20,
//                   ),
//                   CustomButton(onClick: () {}, textButton: 'NEXT'),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
