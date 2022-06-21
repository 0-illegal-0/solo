import 'package:flutter/material.dart';
import 'package:solo/view/screens/fotter/fotter.dart';
import 'package:solo/view/widget/head/head.dart';

class Login extends StatelessWidget {
  const Login({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Head(width: width),
            Container(
              decoration:
                  const BoxDecoration(color: Color(0xFFffffff), boxShadow: [
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
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: " Email & Phone",
                      enabled: true,
                      filled: true,
                      fillColor: Colors.white,
                      constraints: BoxConstraints(
                          maxHeight: 40, maxWidth: double.infinity),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(0)),
                        borderSide:
                            BorderSide(color: Color(0xFF000000), width: 0.5),
                      ),
                      contentPadding: EdgeInsets.only(bottom: 30),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(0)),
                        borderSide:
                            BorderSide(color: Color(0xFF8a8a88), width: 0.5),
                      ),
                    ),
                    onChanged: (value) {},
                  ),
                  const SizedBox(height: 30),
                  TextFormField(
                    obscureText: true,
                    decoration: const InputDecoration(
                      labelText: " Password",
                      enabled: true,
                      filled: true,
                      fillColor: Colors.white,
                      constraints: BoxConstraints(
                          maxHeight: 40, maxWidth: double.infinity),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(0)),
                        borderSide:
                            BorderSide(color: Color(0xFF000000), width: 0.5),
                      ),
                      contentPadding: EdgeInsets.only(bottom: 30),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(0)),
                        borderSide:
                            BorderSide(color: Color(0xFF8a8a88), width: 0.5),
                      ),
                    ),
                    onChanged: (value) {},
                  ),
                  const SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(
                          style: ButtonStyle(
                              padding:
                                  MaterialStateProperty.all(EdgeInsets.zero)),
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
                  ElevatedButton(
                    onPressed: () {},
                    child:
                        const Text("Sign In", style: TextStyle(fontSize: 20)),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.cyan),
                      minimumSize: MaterialStateProperty.all(
                          const Size(double.infinity, 45)),
                    ),
                  ),
                  const SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () {},
                    child: const Text(
                      "Register",
                      style: TextStyle(fontSize: 20),
                    ),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.cyan),
                      minimumSize: MaterialStateProperty.all(
                          const Size(double.infinity, 45)),
                    ),
                  ),
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
          ],
        ),
      ),
    );
  }
}

List<String> loginIcon = [
  "assets/images/login_icons/google.png",
  "assets/images/login_icons/facebook.png",
  "assets/images/login_icons/twitter.png"
];
