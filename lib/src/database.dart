import 'package:aria/models/form_mdel.dart';
import 'package:aria/models/schema_model.dart';
import 'package:aria/models/user.dart';
import 'package:dio/dio.dart';

class Database {
  static const String URL =
      "http://localhost:5001/permit-management/us-central1/api/";

  static Future<void> createUser(User user, password) async {
    var url = URL + "register";

    var data = user.toMap();
    data["password"] = password;
    data["phone"] = "";
    var response = await Dio().post(url, data: data);
    print(response.data);
  }

  static Future<void> createPermit(Permit permit) async {
    try {
      var url = URL + "permit";
      var response = await Dio().post(url, data: permit.toMap());
      print(response.data);
    } catch (e) {}
  }

  static Future<User?> login(String email, String password) async {
    try {
      var url = URL + "login";
      var response = await Dio().post(url, data: {
        "email": email,
        "password": password,
      });

      final data = response.data;

      return User(
          fullname: data["fullnames"],
          email: data["email"],
          uid: data["uid"],
          omang: "",
          gender: "",
          dob: "",
          imageUrl: "",
          signature: "");
    } catch (e) {
      return null;
    }
  }

  static Future<List<Map>> getPermits(String uid) async {
    try {
      var url = URL + "/permits";
      var response = await Dio().get(url, queryParameters: {"uid": uid});
      print(response.data);

      return response.data;
    } catch (e) {
      return [];
    }
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
      ),
      SchemaModel(
        "import permit",
        {
          "applicant_fullname": {
            "value": "",
            "type": "text",
            "options": [],
            "validation": "",
            "error": "invalid email address",
          },
          "contact_number": {
            "value": "",
            "type": "text",
            "options": [],
            "validation": "",
            "error": "invalid email address",
          },
          "email_address": {
            "value": "",
            "type": "text",
            "options": [],
            "validation": "",
            "error": "invalid email address",
          },
          "physical_address": {
            "value": "",
            "type": "text",
            "options": [],
            "validation": "",
            "error": "invalid email address",
          },
          "postal_address": {
            "value": "",
            "type": "text",
            "options": [],
            "validation": "",
            "error": "invalid email address",
          },
          "trading_license": {
            "value": "",
            "type": "text",
            "options": [],
            "validation": "",
            "error": "invalid email address",
          },
          "vat_registration_number": {
            "value": "",
            "type": "text",
            "options": [],
            "validation": "",
            "error": "invalid email address",
          },
          "country_imported_from": {
            "value": "",
            "type": "text",
            "options": [],
            "validation": "",
            "error": "invalid email address",
          },
          "customs_value": {
            "value": "",
            "type": "text",
            "options": [],
            "validation": "",
            "error": "invalid email address",
          },
          "description": {
            "value": "",
            "type": "text",
            "options": [],
            "validation": "",
            "error": "invalid email address",
          },
          "port_of_entry": {
            "value": "",
            "type": "text",
            "options": [],
            "validation": "",
            "error": "invalid email address",
          },
          "quantity_of_goods": {
            "value": "",
            "type": "text",
            "options": [],
            "validation": "",
            "error": "invalid email address",
          },
          "tarrif_heading_hs_code": {
            "value": "",
            "type": "text",
            "options": [],
            "validation": "",
            "error": "invalid email address",
          },
          "bill_of_lading": {
            "value": "",
            "type": "text",
            "options": [],
            "validation": "",
            "error": "invalid email address",
          },
          "company_name": {
            "value": "",
            "type": "text",
            "options": [],
            "validation": "",
            "error": "invalid email address",
          },
          "company_registration_number": {
            "value": "",
            "type": "text",
            "options": [],
            "validation": "",
            "error": "invalid email address",
          },
          "details_of_invoice": {
            "value": "",
            "type": "text",
            "options": [],
            "validation": "",
            "error": "invalid email address",
          },
          "business_physical_address": {
            "value": "",
            "type": "text",
            "options": [],
            "validation": "",
            "error": "invalid email address",
          },
          "purpose_of_goods": {
            "value": "",
            "type": "text",
            "options": [],
            "validation": "",
            "error": "invalid email address",
          },
          "tin_vat_registration_number": {
            "value": "",
            "type": "text",
            "options": [],
            "validation": "",
            "error": "invalid email address",
          },
        },
      ),
      SchemaModel(
        "rebate",
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
      ),
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
      ),
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
      ),
    ];
  }
}
