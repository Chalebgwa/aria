class Permit {
  final String? formName;
  final String? formId;
  final String? applicantId;
  final String? timestamp;
  final String? officialID;
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
    final defaults = <String, dynamic>{
      "approval_state": false,
      "timestamp": DateTime.now().toString(),
      "published": true,
    };
    return <String, dynamic>{
      "formName": formName?.replaceFirst(" ", "_"),
      "formId": formId,
      "applicantId": applicantId,
      "timestamp": timestamp,
      "officialID": officialID,
    }..addAll(data..addAll(defaults));
  }

  fromMap() {}
}
