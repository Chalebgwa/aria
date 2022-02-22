import 'dart:math';

import 'package:aria/models/user.dart';
import 'package:aria/src/constants.dart';
import 'package:aria/src/database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hexcolor/hexcolor.dart';

///Displays landing page with navigation to a sign in / sign up screen

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  static const routeName = "/sign_up_page";

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirm = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController fullname = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    bool isDesktop = checkDeskTop(context);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Stack(
          children: [
            Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/bg.jpg"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              color: Colors.black.withOpacity(.5),
            ),
            Positioned(
              right: 100.w,
              //bottom: 300.h,
              child: Image.asset(
                "assets/images/pic.png",
                color: Colors.white30,
                height: size.height,
              ),
            ),
            Positioned(
              left: 100.w,
              bottom: 300.h,
              child: Image.asset(
                "assets/images/pic.png",
                color: Colors.white30,
                height: size.height,
              ),
            ),
            SingleChildScrollView(
              child: Container(
                //height: size.height,
                width: double.infinity,
                child: Column(
                  children: [
                    Hero(
                      tag: "logo",
                      child: Image.asset(
                        "assets/images/pic.png",
                        color: Colors.green, //Theme.of(context).primaryColor,
                        height: 200.h,
                      ),
                    ),
                    Text(
                      "Welcome to ePermit",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 40.sp,
                        fontWeight: FontWeight.w100,
                      ),
                    ),
                    SizedBox(
                      height: 40.h,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 20.w, right: 20.w),
                      child: SizedBox(
                        width: isDesktop ? 100.w : 300.w,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Row(
                              children: [
                                Text(
                                  "Sign Up",
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20.sp,
                                    //fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 20.h,
                            ),
                            TextFormField(
                              controller: fullname,
                              decoration: InputDecoration(
                                fillColor: Colors.green.shade50,
                                filled: true,
                                hintText: "Fullname",
                                hintStyle: TextStyle(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                                border: const UnderlineInputBorder(),
                              ),
                            ),
                            SizedBox(
                              height: 20.h,
                            ),
                            TextFormField(
                              controller: email,
                              decoration: InputDecoration(
                                fillColor: Colors.green.shade50,
                                filled: true,
                                hintText: "Email",
                                hintStyle: TextStyle(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                                border: const UnderlineInputBorder(),
                              ),
                            ),
                            SizedBox(
                              height: 20.h,
                            ),
                            TextFormField(
                              controller: phone,
                              decoration: InputDecoration(
                                fillColor: Colors.green.shade50,
                                filled: true,
                                hintText: "Phone",
                                hintStyle: TextStyle(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                                border: const UnderlineInputBorder(),
                              ),
                            ),
                            SizedBox(
                              height: 20.h,
                            ),
                            TextFormField(
                              controller: password,
                              obscureText: true,
                              decoration: InputDecoration(
                                fillColor: Colors.green.shade50,
                                filled: true,
                                hintStyle: TextStyle(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                                hintText: "Password",
                                border: const UnderlineInputBorder(),
                              ),
                            ),
                            SizedBox(
                              height: 20.h,
                            ),
                            TextFormField(
                              controller: confirm,
                              obscureText: true,
                              decoration: InputDecoration(
                                fillColor: Colors.green.shade50,
                                filled: true,
                                hintStyle: TextStyle(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                                hintText: "Confirm Password",
                                border: const UnderlineInputBorder(),
                              ),
                            ),
                            SizedBox(
                              height: 20.h,
                            ),
                          ],
                        ),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () async {
                        User user = User(
                          fullname: fullname.text,
                          email: email.text,
                          uid: "",
                          omang: "",
                          gender: "",
                          dob: "",
                          imageUrl: "",
                          signature: "",
                        );

                        ScaffoldMessenger.of(context).showMaterialBanner(
                          MaterialBanner(
                            content: Text(
                              "Account Created,now login",
                              style: TextStyle(
                                color: Colors.green,
                                fontSize: 20.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            actions: [
                              IconButton(
                                  onPressed: () {
                                    ScaffoldMessenger.of(context)
                                        .clearMaterialBanners();
                                  },
                                  icon: Icon(
                                    FontAwesomeIcons.windowClose,
                                  ))
                            ],
                          ),
                        );

                        Database.createUser(user, password.text)
                            .then((value) => Navigator.pop(context));
                      },
                      child: Text(
                        "Create Account",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        primary: HexColor("#008000"),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.r),
                        ),
                        fixedSize: Size(
                          isDesktop ? 100.w : 335.w,
                          50.h,
                        ),
                      ),
                    ),
                    Container(
                      child: TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text("Back To Sign In"),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            if (!isDesktop)
              Positioned(
                child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    Icons.arrow_back_ios_new,
                    color: Colors.green,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
