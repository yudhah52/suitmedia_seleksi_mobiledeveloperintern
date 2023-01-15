import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:suitmedia_project_seleksi/components/custom_alert.dart';
import 'package:suitmedia_project_seleksi/components/custom_button.dart';
import 'package:suitmedia_project_seleksi/components/custom_text_form_field.dart';
import 'package:suitmedia_project_seleksi/screens/second_screen.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({Key? key}) : super(key: key);

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  bool isPalindrome = false;
  TextEditingController _name = TextEditingController();
  TextEditingController _palindrome = TextEditingController();

  void checkPalindrome() {
    String normalText = _palindrome.text.replaceAll(' ', '');
    String reverseText =
        _palindrome.text.split('').reversed.join('').replaceAll(' ', '');
    setState(() {
      isPalindrome = normalText == reverseText;
    });
    showDialogResult();
  }

  void showDialogResult() {
    CustomAlert(context: context).alertDialog(
      text: (_palindrome.text.isNotEmpty)
          ? (isPalindrome)
              ? 'isPalindrome'
              : 'not palindrome'
          : 'to check, please fill in the pallindrome field',
      type: (_palindrome.text.isNotEmpty)
          ? (isPalindrome)
              ? AlertType.success
              : AlertType.warning
          : null,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/background.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        // resizeToAvoidBottomInset: false,
        backgroundColor: Colors.transparent,
        body: Center(
          child: Container(
            margin: const EdgeInsets.symmetric(
              horizontal: 32,
            ),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    width: 116,
                    height: 116,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white.withOpacity(0.3),
                    ),
                    child: const Icon(
                      Icons.person_add_alt_rounded,
                      color: Colors.white,
                      size: 32,
                    ),
                  ),
                  const SizedBox(
                    height: 56,
                  ),
                  CustomTextFormField(
                    controller: _name,
                    hintText: 'Name',
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomTextFormField(
                    controller: _palindrome,
                    hintText: 'Palindrome',
                  ),
                  const SizedBox(
                    height: 45,
                  ),
                  CustomButton(
                      onClick: () {
                        checkPalindrome();
                      },
                      textButton: 'CHECK'),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomButton(
                      onClick: () {
                        (_name.text.isNotEmpty)
                            ? Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => SecondScreen(
                                    name: _name.text,
                                  ),
                                ),
                              )
                            : CustomAlert(context: context).alertDialog(
                                text: 'to next, please fill in the name field',
                              );
                      },
                      textButton: 'NEXT'),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
