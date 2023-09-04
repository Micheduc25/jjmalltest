class User {
  String id;
  String name;
  String phone;
  String email;
  String? country;
  DateTime birthDay;
  String status;
  String profileImage;
  String nickName;
  String gender;
  DateTime createdAt;
  DateTime updatedAt;

  User(
      {required this.id,
      required this.name,
      required this.phone,
      required this.email,
      this.country,
      required this.birthDay,
      required this.status,
      required this.profileImage,
      required this.nickName,
      required this.gender,
      required this.createdAt,
      required this.updatedAt});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
        id: json['id'],
        name: json['name'],
        phone: json['phone'],
        email: json['email'],
        country: json['country'],
        birthDay: DateTime.parse(json['birth_day']),
        status: json['status'],
        profileImage: json['profile_image'],
        nickName: json['nick_name'],
        gender: json['gender'],
        createdAt: DateTime.parse(json['created_at']),
        updatedAt: DateTime.parse(json['updated_at']));
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['phone'] = phone;
    data['email'] = email;
    data['country'] = country;
    data['birth_day'] = birthDay.toIso8601String();
    data['status'] = status;
    data['profile_image'] = profileImage;
    data['nick_name'] = nickName;
    data['gender'] = gender;
    data['created_at'] = createdAt.toIso8601String();
    data['updated_at'] = updatedAt.toIso8601String();
    return data;
  }
}
