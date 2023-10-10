// To parse this JSON data, do
//
//     final loginModel = loginModelFromJson(jsonString);

import 'dart:convert';

LoginModel loginModelFromJson(String str) => LoginModel.fromJson(json.decode(str));

String loginModelToJson(LoginModel data) => json.encode(data.toJson());

class LoginModel {
  int? id;
  dynamic firstName;
  dynamic lastName;
  dynamic username;
  dynamic password;
  String? pwdPrompt;
  dynamic confirmPassword;
  String? token;
  String? message;
  int? compCode;
  dynamic module;
  int? msgType;
  dynamic authType;
  dynamic ipAddress;

  LoginModel({
    this.id,
    this.firstName,
    this.lastName,
    this.username,
    this.password,
    this.pwdPrompt,
    this.confirmPassword,
    this.token,
    this.message,
    this.compCode,
    this.module,
    this.msgType,
    this.authType,
    this.ipAddress,
  });

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
    id: json["id"],
    firstName: json["firstName"],
    lastName: json["lastName"],
    username: json["username"],
    password: json["password"],
    pwdPrompt: json["pwdPrompt"],
    confirmPassword: json["confirmPassword"],
    token: json["token"],
    message: json["message"],
    compCode: json["compCode"],
    module: json["module"],
    msgType: json["msgType"],
    authType: json["authType"],
    ipAddress: json["ipAddress"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "firstName": firstName,
    "lastName": lastName,
    "username": username,
    "password": password,
    "pwdPrompt": pwdPrompt,
    "confirmPassword": confirmPassword,
    "token": token,
    "message": message,
    "compCode": compCode,
    "module": module,
    "msgType": msgType,
    "authType": authType,
    "ipAddress": ipAddress,
  };
}
