import 'package:flutter/material.dart';
import 'package:solo/view/widget/close/close.dart';
import 'package:solo/view/widget/head/head.dart';
import 'package:solo/view/widget/navigation_bar.dart';
import '../../responsive.dart';

class Login extends StatelessWidget {
  const Login({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color(0xFFe1e1e3),
      body: SafeArea(
        bottom: false,
        child: Stack(
          alignment: AlignmentDirectional.center,
          children: [
            SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.only(
                    right: width / 24,
                    left: width / 24,
                    top: device == DeviceType.Mobile
                        ? 115
                        : device == DeviceType.Tablet
                            ? 170
                            : 170),
                child: Column(
                  children: [
                    Container(
                      decoration: const BoxDecoration(
                          color: Color(0xFFffffff),
                          boxShadow: [
                            BoxShadow(
                                color: Color(0xFFb1b3b5),
                                blurRadius: 5,
                                spreadRadius: 0.1,
                                offset: Offset(0, 0))
                          ]),
                      width: width < 600 ? width : 550,
                      alignment: Alignment.center,
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text("Sign In",
                              style: TextStyle(
                                  fontSize: width < 600 ? 20 : 25,
                                  fontWeight: FontWeight.bold)),
                          const SizedBox(height: 20),
                          const input(
                              label: " Email & Phone", obscureText: false),
                          const SizedBox(height: 30),
                          const input(label: " Password", obscureText: true),
                          const SizedBox(height: 15),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              TextButton(
                                  style: ButtonStyle(
                                      padding: MaterialStateProperty.all(
                                          EdgeInsets.zero)),
                                  onPressed: () {},
                                  child: const Text(
                                    "Forgot password ?",
                                    style: TextStyle(color: Colors.black),
                                  )),
                              SizedBox(
                                height: 20,
                                child: Row(
                                  children: [
                                    const Text("Remember me"),
                                    Checkbox(
                                      value: true,
                                      onChanged: (val) {},
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          const LoginButtons(title: "Sign In"),
                          const SizedBox(height: 10),
                          const LoginButtons(title: "Register"),
                          const SizedBox(height: 10),
                          FotterItems(
                            rowWidth: double.infinity,
                            item: loginIcon,
                            iconHeight: 29,
                            height: 40,
                            title: "Login With",
                            titleWidth: 165,
                            maxWidthState: true,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    Close(width: width)
                  ],
                ),
              ),
            ),
            Align(child: Head(width: width), alignment: Alignment.topCenter),
            const BottomRow(),
          ],
        ),
      ),
    );
  }
}

class input extends StatelessWidget {
  const input({
    Key? key,
    this.label,
    this.obscureText,
  }) : super(key: key);
  final String? label;
  final bool? obscureText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText!,
      decoration: InputDecoration(
        labelText: label!,
        enabled: true,
        filled: true,
        fillColor: Colors.white,
        constraints:
            const BoxConstraints(maxHeight: 40, maxWidth: double.infinity),
        focusedBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(0)),
          borderSide: BorderSide(color: Color(0xFF000000), width: 0.5),
        ),
        contentPadding: const EdgeInsets.only(bottom: 30),
        enabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(0)),
          borderSide: BorderSide(color: Color(0xFF8a8a88), width: 0.5),
        ),
      ),
      onChanged: (value) {},
    );
  }
}

class LoginButtons extends StatelessWidget {
  const LoginButtons({
    Key? key,
    this.title,
  }) : super(key: key);
  final String? title;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      child: Text(title!, style: TextStyle(fontSize: 20)),
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(const Color(0xFF168994)),
        minimumSize: MaterialStateProperty.all(const Size(double.infinity, 45)),
      ),
    );
  }
}

List<String> loginIcon = [
  "assets/images/login_icons/google.png",
  "assets/images/login_icons/facebook.png",
  "assets/images/login_icons/twitter.png"
];
