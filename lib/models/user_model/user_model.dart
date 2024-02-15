import 'package:equatable/equatable.dart';

class UserModel extends Equatable {
  final String? name;
  final String? uId;
  final String? email;
  final String? phone;
  final bool? isEmailVerified;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        name: json['name'],
        uId: json['uId'],
        email: json['email'],
        phone: json['phone'],
        isEmailVerified: json['isEmailVerified'],
      );

  const UserModel({
    this.name,
    this.email,
    this.phone,
    this.uId,
    this.isEmailVerified,
  });

  Map<String, dynamic> toJson() => {
        'name': name,
        'uId': uId,
        'email': email,
        'phone': phone,
        'isEmailVerified': isEmailVerified,
      };

  @override
  List<Object?> get props {
    return [
      name,
      email,
      phone,
      uId,
      isEmailVerified,
    ];
  }
}
