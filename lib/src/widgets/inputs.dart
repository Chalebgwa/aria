import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextInput extends StatefulWidget {
  const TextInput(
      {Key? key,
      this.value,
      required this.label,
      required this.onChanged,
      this.error})
      : super(key: key);
  final String? value;
  final String label;
  final Function(String, String) onChanged;
  final String? error;

  @override
  State<TextInput> createState() => _TextInputState();
}

class _TextInputState extends State<TextInput> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 5.w),
          child: Text(
            widget.label,
            style: TextStyle(
              fontSize: 20.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(
          height: 10.h,
        ),
        Container(
          child: TextFormField(
            initialValue: widget.value,
            onChanged: (value) {
              widget.onChanged(widget.label, value);
            },
            decoration: InputDecoration(
              //errorText: widget.error,
              fillColor: Colors.white,
              filled: true,
              border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(
                  20.r,
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          height: 10.h,
        ),
      ],
    );
  }
}
