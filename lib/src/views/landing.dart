import 'package:aria/src/painters.dart';
import 'package:aria/src/views/sign_in.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({Key? key}) : super(key: key);

  static const routeName = "/landing_page";

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    bool isDesktop = MediaQuery.of(context).size.width >= 1100;
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
                image: DecorationImage(
              image: Image.asset(
                "assets/images/bg.jpg",
              ).image,
              fit: BoxFit.cover,
            )),
          ),
          Container(
            width: size.width,
            height: size.height,
            color: Colors.black.withOpacity(.5),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Spacer(),
                Hero(
                  tag: "logo",
                  child: Image.asset(
                    "assets/images/pic.png",
                    color: Theme.of(context).secondaryHeaderColor,
                    height: 200.h,
                  ),
                ),
                SizedBox(
                  //width: 150.w,
                  child: Text(
                    "Welcome to\n ePermit",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 40.sp,
                      fontWeight: FontWeight.w100,
                    ),
                  ),
                ),
                const Spacer(),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (c) => const SignInPage(),
                      ),
                    );
                  },
                  child: const Text("Sign In"),
                  style: ElevatedButton.styleFrom(
                      fixedSize: Size(isDesktop ? 100.w : 335.w, 50.h),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.r),
                      )),
                ),
                SizedBox(
                  height: 10.h,
                ),
                OutlinedButton(
                  onPressed: () {},
                  child: const Text("Create Account"),
                  style: ElevatedButton.styleFrom(
                      fixedSize: Size(isDesktop ? 100.w : 335.w, 50.h),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.r),
                      )),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
