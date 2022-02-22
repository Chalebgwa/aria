import 'dart:math';

import 'package:aria/controllers/auth.dart';
import 'package:aria/controllers/form_generator.dart';
import 'package:aria/models/form_mdel.dart';
import 'package:aria/models/schema_model.dart';
import 'package:aria/src/constants.dart';
import 'package:aria/src/database.dart';
import 'package:aria/src/painters.dart';
import 'package:aria/src/views/form_view.dart';
import 'package:aria/src/views/home/chat_view.dart';
import 'package:aria/src/views/payments.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:badges/badges.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  static const String routeName = "/home";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Auth auth;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    auth = Provider.of<Auth>(context);
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return LayoutBuilder(builder: (context, constraints) {
      return Scaffold(
        backgroundColor: Colors.grey.shade300,
        body: SingleChildScrollView(
          child: Stack(
            children: [
              Column(
                children: [
                  ClipPath(
                    clipper: WaveClipperOne(),
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
              Column(
                children: [
                  Container(
                    width: size.width,
                    height: 300.h,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              IconButton(
                                onPressed: () {},
                                icon: Icon(FontAwesomeIcons.bars),
                                color: Colors.white,
                                iconSize: 30.sp,
                              ),
                              const Spacer(),
                              IconButton(
                                iconSize: 30.sp,
                                onPressed: () {
                                  Navigator.pushNamed(
                                    context,
                                    ChatView.routeName,
                                  );
                                },
                                icon: Badge(
                                  elevation: 3,
                                  badgeColor: Theme.of(context).primaryColor,
                                  badgeContent: const Text(
                                    "0",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  child: const Icon(
                                    FontAwesomeIcons.envelope,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: checkDeskTop(context) ? 10.w : 30.w,
                              ),
                              SizedBox(
                                width: 20.w,
                              ),
                            ],
                          ),
                        ),
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
                  ),
                  SizedBox(
                    width: !checkDeskTop(context) ? 300.w : 160.w,
                    child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.r)),
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: "Search Permit",
                          fillColor: Colors.white,
                          filled: true,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30.r),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 30.w),
                    child: Text(
                      "Permits",
                      style: TextStyle(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  FutureBuilder(
                      future: Database.getSchemas(),
                      builder:
                          (context, AsyncSnapshot<List<SchemaModel>> snapshot) {
                        if (!snapshot.hasData) {
                          return Container(
                            alignment: Alignment.center,
                            height: 200.h,
                            child: Text(
                              "No Permits Listed",
                              style: TextStyle(
                                fontSize: 30.sp,
                              ),
                            ),
                          );
                        }

                        return Wrap(
                          runAlignment: WrapAlignment.start,
                          crossAxisAlignment: WrapCrossAlignment.start,
                          children: [
                            for (SchemaModel item in snapshot.data ?? [])
                              _buildPermitForm(item),
                          ],
                        );
                      }),
                  SizedBox(
                    height: 20.h,
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 30.w),
                    child: Text(
                      "My Permits",
                      style: TextStyle(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  FutureBuilder<List<Map>>(
                      future: Database.getPermits(auth.currentUser?.uid ?? ""),
                      builder: (context, snapshot) {
                        if (!snapshot.hasData ||
                            (snapshot.data?.isEmpty ?? true)) {
                          return Container(
                            alignment: Alignment.center,
                            height: 200.h,
                            child: Text(
                              "No Permits Listed",
                              style: TextStyle(
                                fontSize: 30.sp,
                              ),
                            ),
                          );
                        }
                        return Wrap(
                          children: [
                            for (var item in snapshot.data ?? []) _buildPermit()
                          ],
                        );
                      }),
                  SizedBox(
                    height: 20.h,
                  ),
                  ClipPath(
                    clipper: WaveClipperTwo(reverse: true),
                    child: Container(
                      height: 100.h,
                      width: double.infinity,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("assets/images/bg.jpg"),
                          alignment: Alignment.bottomCenter,
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: Container(
                        color: Colors.black.withOpacity(.4),
                        height: 100.h,
                        width: double.infinity,
                        alignment: Alignment.bottomCenter,
                        child: Image.asset(
                          "assets/images/pic.png",
                          height: 300.w,
                          width: 300.w,
                          color: Colors.white.withOpacity(.3),
                        ),
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      );
    });
  }

  Widget _buildPermitForm(SchemaModel model) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (c) => ChangeNotifierProvider<PermitForm>(
              create: (_) =>
                  PermitForm(model, auth.currentUser?.uid ?? "", "", auth),
              child: const FormView(),
            ),
          ),
        );
      },
      child: Padding(
        padding: EdgeInsets.all(5.w),
        child: Card(
          elevation: 2,
          margin: EdgeInsets.zero,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          child: SizedBox(
            height: checkDeskTop(context) ? 120.h : 100.h,
            width: checkDeskTop(context) ? 120.h : 100.h,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.cottage,
                  color: Colors.green,
                  size: checkDeskTop(context) ? 10.w : 30.w,
                ),
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Text(
                    model.formName,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 10.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildPermit() {
    return Padding(
      padding: EdgeInsets.all(5.w),
      child: Card(
        elevation: 2,
        margin: EdgeInsets.zero,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: SizedBox(
          height: checkDeskTop(context) ? 120.h : 100.h,
          width: checkDeskTop(context) ? 120.h : 100.h,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.cottage,
                color: Colors.green,
                size: checkDeskTop(context) ? 10.w : 30.w,
              ),
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: Text(
                  "Permit",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 10.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
