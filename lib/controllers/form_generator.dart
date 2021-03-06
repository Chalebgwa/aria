import 'package:aria/controllers/auth.dart';
import 'package:aria/models/form_mdel.dart';
import 'package:aria/models/schema_model.dart';
import 'package:aria/src/database.dart';
import 'package:aria/src/widgets/inputs.dart';
import 'package:flutter/material.dart';

class PermitForm extends ChangeNotifier {
  final SchemaModel schema;
  final String uid;
  final String timestamp;
  List<Widget> fields = [];
  Map<String, dynamic> data = {};
  final Auth auth;
  PermitForm(this.schema, this.uid, this.timestamp, this.auth) {
    generate();
  }

  void onChanged(String field, String value) {
    data[field] = value;
    notifyListeners();
  }

  void submit() {
    data["userId"] = auth.currentUser?.uid;
    final permit = Permit(
      formName: schema.formName,
      formId: "",
      applicantId: "",
      timestamp: timestamp,
      officialID: "",
      data: data,
    );
    Database.createPermit(permit);
  }

  void generate() {
    for (MapEntry<String, dynamic> item in schema.fields.entries) {
      if (item.value["type"] == "text") {
        TextInput input = TextInput(
          label: item.key,
          onChanged: onChanged,
          error: "",
          value: data[item.key],
        );

        fields.add(input);
      }
    }
  }
}
