import 'package:aria/src/painters.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FormLayout extends StatefulWidget {
  const FormLayout({Key? key, required this.child}) : super(key: key);
  final Widget child;

  @override
  State<FormLayout> createState() => _FormLayoutState();
}

class _FormLayoutState extends State<FormLayout> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: CustomPaint(
              painter: LogoPainter(),
              child: Container(
                width: double.infinity,
                height: 300.h,
                color: Theme.of(context).primaryColor,
              ),
            ),
          )
        ],
      ),
    );
  }
}
