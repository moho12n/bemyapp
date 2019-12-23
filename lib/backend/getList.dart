import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:io';
import 'dart:convert';

final username = 'username';
final password = 'password';
final credentials = '$username:$password';
final stringToBase64 = utf8.fuse(base64);
final encodedCredentials = stringToBase64.encode(credentials);

final token = 'WIiOiIxMjM0NTY3ODkwIiwibmFtZSI6Ikpv';
Map<String, String> headers = {
  HttpHeaders.contentTypeHeader: "application/json", // or whatever
  HttpHeaders.authorizationHeader: "Bearer $token",
};

_makeGetRequest() async {
  // make GET request
  String url = 'https://jsonplaceholder.typicode.com/posts';
  Response response = await get(url);
  // sample info available in response
  int statusCode = response.statusCode;
  Map<String, String> headers = response.headers;
  String contentType = headers['content-type'];
  String json = response.body;
  // TODO convert json to object...
}

_makePostRequest() async {
  // set up POST request arguments
  String url = 'https://jsonplaceholder.typicode.com/posts';
  Map<String, String> headers = {"Content-type": "application/json"};
  String json = '{"title": "Hello", "body": "body text", "userId": 1}';
  // make POST request
  Response response = await post(url, headers: headers, body: json);
  // check the status code for the result
  int statusCode = response.statusCode;
  // this API passes back the id of the new item added to the body
  String body = response.body;
  // {
  //   "title": "Hello",
  //   "body": "body text",
  //   "userId": 1,
  //   "id": 101
  // }
}

_makePutRequest() async {
  // set up PUT request arguments
  String url = 'https://jsonplaceholder.typicode.com/posts/1';
  Map<String, String> headers = {"Content-type": "application/json"};
  String json = '{"title": "Hello", "body": "body text", "userId": 1}';
  // make PUT request
  Response response = await put(url, headers: headers, body: json);
  // check the status code for the result
  int statusCode = response.statusCode;
  // this API passes back the updated item with the id added
  String body = response.body;
  // {
  //   "title": "Hello",
  //   "body": "body text",
  //   "userId": 1,
  //   "id": 1
  // }
}

_makePatchRequest() async {
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

_makeDeleteRequest() async {
  // post 1
  String url = 'https://jsonplaceholder.typicode.com/posts/1';
  // make DELETE request
  Response response = await delete(url);
  // check the status code for the result
  int statusCode = response.statusCode;
}
