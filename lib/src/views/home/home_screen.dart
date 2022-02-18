import 'dart:math';

import 'package:aria/src/painters.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  static String routeName = "/home";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return LayoutBuilder(builder: (context, constraints) {
      return Scaffold(
        backgroundColor: Colors.grey.shade300,
        body: Stack(
          children: [
            Column(
              children: [
                ClipPath(
                  clipper: LogoClipper(),
                  child: Stack(
                    children: [
                      Image.asset(
                        "assets/images/bg.jpg",
                        width: size.width,
                        height: 300.h,
                        fit: BoxFit.cover,
                      ),
                      Positioned(
                        child: Image.asset(
                          "assets/images/pic.png",
                          width: size.width,
                          color: Colors.white.withOpacity(.4),
                          height: 300.h,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Container(
                        width: size.width,
                        height: 300.h,
                        color: Colors.black.withOpacity(.5),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            CustomScrollView(
              physics: const ClampingScrollPhysics(),
              slivers: [
                SliverToBoxAdapter(
                  child: Column(
                    children: [
                      Container(
                        width: size.width,
                        height: 300.h,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Welcome",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 40.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              "to Botswana's ePermit Services",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20.sp,
                                fontWeight: FontWeight.w100,
                              ),
                            ),
                            SizedBox(
                              height: 20.h,
                            ),
                            Hero(
                              tag: "logo",
                              child: Image.asset(
                                "assets/images/pic.png",
                                //width: size.width,
                                height: 100.h,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                SliverPadding(
                  padding: EdgeInsets.only(
                    left: 20.w,
                    right: 20.w,
                  ),
                  sliver: SliverGrid(
                    delegate: SliverChildBuilderDelegate(
                      (_, i) => _buildPermit(),
                      childCount: 8,
                    ),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 4,
                        mainAxisSpacing: 10.w,
                        crossAxisSpacing: 10.w
                        //childAspectRatio: .3,
                        ),
                  ),
                ),
              ],
            ),
          ],
        ),
      );
    });
  }

  Widget _buildPermit() {
    return Card(
      child: SizedBox(
        height: 50.h,
        width: 50.h,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Permit",
              style: TextStyle(color: Colors.black, fontSize: 10.sp),
            ),
          ],
        ),
      ),
    );
  }
}
