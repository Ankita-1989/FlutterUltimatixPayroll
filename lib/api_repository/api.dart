import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter_payrollapp/Constant/Constant.dart';
import 'package:flutter_payrollapp/Constant/PreferenceUtils.dart';
import 'package:http/http.dart' as http;

Future callPostMethod(BuildContext context, String url, Map params) async {
  var body=json.encode(params);
  return await http.post(url, body: body, headers: {
    "Content-Type": "application/json",
    HttpHeaders.authorizationHeader:"Bearer "+PreferenceUtils.getString("Bearer")
  }).then((http.Response response) {
    print(response.statusCode);
    final int statusCode = response.statusCode;
    if (statusCode < 200 || statusCode > 404 || json == null) {
      // throw new Exception("Error while fetching data");
      return Constant.error_response;
    }
    return response.body;
  });
}

Future callGetMethod(BuildContext context, String url) async {
  return await http
      .get(Uri.encodeFull(url), headers: { "Content-Type": "application/json",
    HttpHeaders.authorizationHeader:"Bearer "+PreferenceUtils.getString("Bearer")}).then((http.Response response) {
    print(response.statusCode);
    final int statusCode = response.statusCode;
    if (statusCode < 200 || statusCode > 404 || json == null) {
      // throw new Exception("Error while fetching data");
      return Constant.error_response;
    }
    return response.body;
  });
}

Future postRequest(String url, Map mbody) async {
  var url1 = url;
  //encode Map to JSON
  var body = json.encode(mbody);
  var response = await http.post(url1,
      headers: {"Content-Type": "application/json"}, body: body);
  final int statusCode = response.statusCode;
  if (statusCode < 200 || statusCode > 404 || json == null) {
    // throw new Exception("Error while fetching data");
    return Constant.error_response;
  }
  return response.body;
}
