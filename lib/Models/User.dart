// import 'dart:ffi';

class User {
  final String uid;
  final String Email;
  final int number;

  const User({
    required this.Email,
    required this.uid,
    required this.number,
  });

  Map<String, dynamic> toJson() => {
        "emailverification": {
          "emailAddress": "",
          "verified": false,
        },
        "phoneNumber": number,
        "cart": [],
        "orders": []
      };
}
