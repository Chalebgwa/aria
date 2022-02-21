class Permit {
  final String formName;
  final String formId;
  final String applicantId;
  final String timestamp;
  final String officialID;
  final Map<String, dynamic> data;

  Permit({
    required this.formName,
    required this.formId,
    required this.applicantId,
    required this.timestamp,
    required this.officialID,
    required this.data,
  });

  toMap() {
    return {
      "formName": formName,
      "formId": formId,
      "applicantId": applicantId,
      "timestamp": timestamp,
      "officialID": officialID,
      "data": data,
    };
  }

  fromMap() {}
}
