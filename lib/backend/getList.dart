import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:io';
import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:fluttertoast/fluttertoast.dart';

bool erreur = true;
String liste;

String getListe() {
  final map = jsonDecode(liste) as Map<String, dynamic>;
  String j = map['data']['projects_surveys'];
  print("j= "+j);
  print("liste = "+liste);
  return liste;
}

final username = 'username';
final password = 'password';
final credentials = '$username:$password';
final stringToBase64 = utf8.fuse(base64);
final encodedCredentials = stringToBase64.encode(credentials);
final storage = new FlutterSecureStorage();
final domainName = 'http://192.168.43.10:8000';

String token = '';
Map<String, String> headers = {
  HttpHeaders.contentTypeHeader: "application/json", // or whatever
  HttpHeaders.authorizationHeader: "Bearer $token",
};

makeGetRequest() async {
  // make GET request
  token = await storage.read(key: 'jwt');
  String url = domainName;
  Response response = await get(url + '/api/feed', headers: {
    "Authorization": "Bearer " + token,
    "Content-type": "application/json"
  });
  // sample info available in response
  int statusCode = response.statusCode;
  Map<String, String> headers = response.headers;
  String contentType = headers['content-type'];
  String json = response.body;
  liste = json;
  // TODO convert json to object...
}

Future<bool> makePostRequest(String email, String password) async {
  // set up POST request arguments

  String url = domainName + '/api/login';
  Map<String, String> headers = {"Content-type": "application/json"};
  String json = '{"email": "$email", "password": "$password"}';
  // make POST request
  Response response = await post(url, headers: headers, body: json);
  // check the status code for the result
  int statusCode = response.statusCode;
  // this API passes back the id of the new item added to the body
  //try {
  String body = response.body;
  final map = jsonDecode(body) as Map<String, dynamic>;
  body = map['data']['token'];
  
  await storage.write(key: 'jwt', value: body);
  if (body == "null")
    return erreur = true;
  else
    return erreur = false;
}

makePutRequest(String proposition) async {
  // set up PUT request arguments
  token = await storage.read(key: 'jwt');
  String url = domainName+ "/api/proposition";
  Map<String, String> headers = {"Content-type": "application/json","Authorization" : "Bearer "+token};
  String json = '{"content": "$proposition"}';
  // make PUT request
  Response response = await post(url, headers: headers, body: json);
  // check the status code for the result
  int statusCode = response.statusCode;
  // this API passes back the updated item with the id added
  String body = response.body;
  print(body);
  // {
  //   "title": "Hello",
  //   "body": "body text",
  //   "userId": 1,
  //   "id": 1
  // }
}

makePatchRequest() async {
  // set up PATCH request arguments
  String url = 'https://jsonplaceholder.typicode.com/posts/1';
  Map<String, String> headers = {"Content-type": "application/json"};
  String json = '{"title": "Hello"}';
  // make PATCH request
  Response response = await patch(url, headers: headers, body: json);
  // check the status code for the result
  int statusCode = response.statusCode;
  // only the title is updated
  String body = response.body;
  // {
  //   "userId": 1,
  //   "id": 1
  //   "title": "Hello",
  //   "body": "quia et suscipit\nsuscipit recusandae... (old body text not changed)",
  // }
}

makeDeleteRequest() async {
  // post 1
  String url = 'https://jsonplaceholder.typicode.com/posts/1';
  // make DELETE request
  Response response = await delete(url);
  // check the status code for the result
  int statusCode = response.statusCode;
}
