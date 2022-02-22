// ignore_for_file: constant_identifier_names

import 'package:aria/models/schema_model.dart';
import 'package:aria/models/user.dart';
import 'package:aria/src/database.dart';
import 'package:flutter/material.dart';

enum AuthState { LOGGEDIN, LOGGEDOUT }

class Auth extends ChangeNotifier {
  User? currentUser;

  AuthState state = AuthState.LOGGEDOUT;
  List<SchemaModel> schemas = [];

  Future<void> login(String email, String password) async {
    currentUser = await Database.login(email, password);
    notifyListeners();
  }

  void createUser(
      String fullname, String email, String password, String phone) {}

  void signOut() {}

  Future<List<SchemaModel>> fetchSchemas() async {
    return Database.getSchemas();
  }
}
