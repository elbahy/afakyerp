class TokenModel {
  TokenModel({
    required this.token,
  });

  final String? token;

  factory TokenModel.fromJson(Map<String, dynamic> json) {
    return TokenModel(
      token: json["token"],
    );
  }

  @override
  String toString() {
    return "$token, ";
  }
}
