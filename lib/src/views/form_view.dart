import 'dart:math';

import 'package:aria/controllers/auth.dart';
import 'package:aria/controllers/form_generator.dart';
import 'package:aria/models/schema_model.dart';
import 'package:aria/src/constants.dart';
import 'package:aria/src/database.dart';
import 'package:aria/src/painters.dart';
import 'package:aria/src/views/home/chat_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:badges/badges.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:provider/provider.dart';
import 'package:im_stepper/main.dart';
import 'package:im_stepper/stepper.dart';

class FormView extends StatefulWidget {
  const FormView({Key? key}) : super(key: key);

  @override
  State<FormView> createState() => _FormViewState();
}

class _FormViewState extends State<FormView> {
  late PermitForm form;
  List<List<Widget>> pages = [];
  double currentPage = 0;
  final PageController _pageController = PageController();

  void next() {
    if (currentPage - 1 < pages.length) {
      setState(() {
        currentPage++;
      });
    }
    _pageController.nextPage(
        duration: const Duration(
          microseconds: 3000,
        ),
        curve: Curves.bounceIn);
  }

  void prev() {
    if (currentPage > 0) {
      setState(() {
        currentPage--;
      });
    }
    _pageController.previousPage(
        duration: const Duration(
          microseconds: 3000,
        ),
        curve: Curves.bounceIn);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    form = Provider.of<PermitForm>(context);
    pages = [];

    for (var i = 0; i < form.fields.length; i += 3) {
      pages.add(
        form.fields.sublist(
          i,
          i + 3 > form.fields.length ? form.fields.length : i + 3,
        ),
      );
    }
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
                                    "1",
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
                              Badge(
                                badgeContent: const Text(
                                  "1",
                                  style: TextStyle(color: Colors.white),
                                ),
                                badgeColor: Theme.of(context).primaryColor,
                                child: Icon(
                                  FontAwesomeIcons.user,
                                  color: Colors.white,
                                  size: 30.sp,
                                ),
                              ),
                              SizedBox(
                                width: 20.w,
                              ),
                            ],
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
                        Text(
                          form.schema.formName,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 40.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  NumberStepper(
                    steppingEnabled: false,
                    activeStep: currentPage.toInt(),
                    numbers: List.generate(pages.length, (index) => index + 1),
                    lineColor: Colors.green,
                    activeStepBorderColor: Colors.green,
                    stepColor: Colors.white,
                    numberStyle: const TextStyle(
                      color: Colors.black,
                    ),
                  ),
                  Container(
                    height: 300.h,
                    width: !checkDeskTop(context) ? 300.w : 150.w,
                    child: _buildPages(),
                  ),
                  SizedBox(
                    width: !checkDeskTop(context) ? 300.w : 150.w,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        if (currentPage < pages.length - 1)
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                fixedSize: Size(50.w, 40.h),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30.r))),
                            onPressed: prev,
                            child: const Icon(
                              FontAwesomeIcons.caretLeft,
                            ),
                          ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              fixedSize: Size(50.w, 40.h),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30.r),
                              )),
                          onPressed: next,
                          child: Icon(
                            currentPage < pages.length - 1
                                ? FontAwesomeIcons.caretRight
                                : FontAwesomeIcons.save,
                          ),
                        ),
                      ],
                    ),
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

  Widget _buildPages() {
    return PageView.builder(
        itemCount: pages.length,
        allowImplicitScrolling: false,
        controller: _pageController,
        itemBuilder: (context, i) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: pages[i],
            ),
          );
        });
  }
}
