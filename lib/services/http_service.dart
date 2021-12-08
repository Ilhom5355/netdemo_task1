import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:netdemo_task1/model/post_model.dart';

class Network {
  static String Base = "dummy.restapiexample.com";
  static Map<String, String> headers = {
    'Content-type': 'application/json; charset=UTF-8'
  };

  //* http apis * / /* API larni olish *//

  static String API_LIST1 = "/api/v1/employees";
  static String API_LIST2 = "/api/v1/employee/1";
  static String API_CREATE = "/api/v1/create";
  static String API_UPDATE = "/api/v1/update/21";
  static String API_DELETE = "/api/v1/delete/2";

/* Http Request */ /* Get Server bilan maylumotlarni oldi berdi qilish*/

  static Future<String?> GET(String api, Map<String, String> params) async {
    var uri = Uri.http(Base, api, params);
    var response = await get(uri, headers: headers);
    if (response.statusCode == 200) {
      return response.body;
    }
    return null;
  }

  /* POST */
  /* Biror yangi narsa yaratilsa POST orqali jo`natiladi*/
  /* Serverda yangi ma`lumot yaratish uchun*/

  static Future<String?> POST(String api, Map<String, String> params) async {
    var uri = Uri.http(Base, api);
    var response = await post(uri, headers: headers, body: jsonEncode(params));
    if (response.statusCode == 200 || response.statusCode == 201) {
      return response.body;
    }
    return null;
  }

  /* PUT */ /* Yaratib qo`ilgan ma`lumotni o`zgartirish uchun PUT
    orqali o`zgartirib jonatiladi*/

  static Future<String?> PUT(String api, Map<String, String> params) async {
    var uri = Uri.http(Base, api);
    var response = await put(uri, headers: headers, body: jsonEncode(params));
    if (response.statusCode == 200) {
      return response.body;
    }
    return null;
  }

  /* DELETE */ /*Ma`lumotlarni o`chirish uchun*/

  static Future<String?> DEL(String api, Map<String, String> params) async {
    var uri = Uri.http(Base, api, params);
    var response = await delete(uri, headers: headers);
    if (response.statusCode == 200) {
      return response.body;
    }
    return null;
  }

  //-------------------------------------//
  /* Http Params */

  static Map<String, String> paramsEmpty() {
    Map<String, String> params = Map();
    return params;
  }

  /* Creating*/

  static Map<String, String> paramsCreate(Post post) {
    Map<String, String> params = Map();
    params.addAll({
      'status': post.status,
      'name': post.name,
      'salary': post.salary.toString(),
      'age': post.age.toString(),
      'Id': post.id.toString(),
    });
    return params;
  }

  /* Update */

  static Map<String, String> paramsUpdate(Post post) {
    Map<String, String> params = Map();
    params.addAll({
      'status': post.status,
      'name': post.name,
      'salary': post.salary.toString(),
      'age': post.age.toString(),
      'Id': post.id.toString(),
    });
    return params;
  }
}
