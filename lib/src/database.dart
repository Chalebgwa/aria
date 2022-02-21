import 'package:aria/models/form_mdel.dart';
import 'package:aria/models/schema_model.dart';
import 'package:aria/models/user.dart';

class Database {
  static const String URL =
      "http://localhost:5001/permit-management/us-central1/api/";

  static Future<void> createUser(User user) async {}

  static Future<void> createPermit(Permit permit) async {}

  static Future<User> login(String email, String password) async {
    return User(
        fullname: "",
        email: "",
        uid: "",
        omang: "",
        gender: "",
        dob: "",
        imageUrl: "",
        signature: "");
  }

  static Future<List<Permit>> getForms(String uid) async {
    return [];
  }

  static Future<List<SchemaModel>> getSchemas() async {
    return [
      SchemaModel(
        "export permit",
        {
          "email": {
            "value": "",
            "type": "text",
            "options": [],
            "validation": "",
            "error": "invalid email address",
          },
          "fullname": {
            "value": "",
            "type": "text",
            "options": [],
            "validation": "",
            "error": "invalid email address",
          },
          "omang": {
            "value": "",
            "type": "text",
            "options": [],
            "validation": "",
            "error": "invalid email address",
          },
          "password": {
            "value": "",
            "type": "text",
            "options": [],
            "validation": "",
            "error": "invalid email address",
          },
          "age": {
            "value": "",
            "type": "text",
            "options": [],
            "validation": "",
            "error": "invalid email address",
          },
        },
      )
    ];
  }
}
