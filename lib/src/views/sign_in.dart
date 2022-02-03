import 'dart:html';

import 'package:aria/src/layouts/form_layout.dart';
import 'package:aria/src/painters.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';

///Displays landing page with navigation to a sign in / sign up screen

class SignInPage extends StatelessWidget {
  const SignInPage({Key? key}) : super(key: key);

  static const routeName = "/sign_in_page";

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    bool isDesktop = MediaQuery.of(context).size.width >= 1100;
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
              )),
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
            Container(
              height: size.height,
              width: double.infinity,
              child: Column(
                children: [
                  Spacer(),
                  Hero(
                    tag: "logo",
                    child: Image.asset(
                      "assets/images/pic.png",
                      color: Colors.green, //Theme.of(context).primaryColor,
                      height: 200.h,
                    ),
                  ),
                  Text(
                    "ePermit",
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
                                "Sign In",
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
                        ],
                      ),
                    ),
                  ),
                  Spacer(),
                  ElevatedButton(
                    onPressed: () {},
                    child: Text(
                      "Sign In",
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
                      onPressed: () {},
                      child: const Text("Create Account"),
                    ),
                  ),
                  Spacer()
                ],
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
