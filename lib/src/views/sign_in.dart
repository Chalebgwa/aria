import 'package:aria/controllers/auth.dart';
import 'package:aria/src/database.dart';
import 'package:aria/src/layouts/form_layout.dart';
import 'package:aria/src/painters.dart';
import 'package:aria/src/views/home/home_screen.dart';
import 'package:aria/src/views/sign_up.dart';
import 'package:aria/src/widgets/loading_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';

///Displays landing page with navigation to a sign in / sign up screen

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  static const routeName = "/sign_in_page";

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final Auth auth = Provider.of<Auth>(context);
    bool isDesktop = MediaQuery.of(context).size.width >= 1100;
    return isLoading
        ? const LoadingScreen()
        : SafeArea(
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
                            color:
                                Colors.green, //Theme.of(context).primaryColor,
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
                              ],
                            ),
                          ),
                        ),
                        Spacer(),
                        ElevatedButton(
                          onPressed: () async {
                            await auth.login(email.text, password.text);
                            if (auth.currentUser != null) {
                              Navigator.pushNamed(
                                  context, HomeScreen.routeName);
                            } else {
                              ScaffoldMessenger.of(context).showMaterialBanner(
                                MaterialBanner(
                                  content: Text(
                                    "Invalid email/password",
                                    style: TextStyle(
                                      color: Colors.red,
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
                            }
                          },
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
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => const SignUpPage(),
                                ),
                              );
                            },
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
