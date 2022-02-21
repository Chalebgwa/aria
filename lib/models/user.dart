class User {
  final String fullname;
  final String email;
  final String uid;
  final String omang;
  final String gender;
  final String dob;
  final String imageUrl;
  final String signature;

  User({
    required this.fullname,
    required this.email,
    required this.uid,
    required this.omang,
    required this.gender,
    required this.dob,
    required this.imageUrl,
    required this.signature,
  });

  factory User.fromMap(Map<String, dynamic> json) {
    final String fullname = json["fullname"];
    final String email = json["email"];
    final String uid = json["uid"];
    final String omang = json["omang"];
    final String gender = json["gender"];
    final String dob = json["dob"];
    final String imageUrl = json["iamgeUrl"];
    final String signature = json["signature"];

    return User(
      fullname: fullname,
      email: email,
      uid: uid,
      omang: omang,
      gender: gender,
      dob: dob,
      imageUrl: imageUrl,
      signature: signature,
    );
  }

  toMap() {
    return {
      "fullname": fullname,
      "email": email,
      "uid": uid,
      "omang": omang,
      "gender": gender,
      "dob": dob,
      "imageUrl": imageUrl,
      "signature": signature
    };
  }
}
