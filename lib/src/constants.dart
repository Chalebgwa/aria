import 'package:flutter/material.dart';

bool checkDeskTop(BuildContext context) {
  return MediaQuery.of(context).size.width >= 1100;
}
