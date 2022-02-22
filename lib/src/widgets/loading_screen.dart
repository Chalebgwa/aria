import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:animated_rotation/animated_rotation.dart' as rotate;

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: Duration(microseconds: 100));
    _controller.addListener(() {
      print("loading");
      setState(() {});
    });
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _controller.repeat();
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: Container(
          color: Colors.black.withOpacity(.7),
          child: Center(
            child: rotate.AnimatedRotation(
              duration: Duration(
                seconds: 2,
              ),
              angle: _controller.value,
              child: Image.asset(
                "assets/images/pic.png",
                height: 100.w,
              ),
            ),
          ),
        ),
        decoration: const BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage("assets/images/bg.jpg"),
          ),
        ),
      ),
    );
  }
}
