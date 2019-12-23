import 'package:bemyapp/backend/getList.dart' as prefix0;
import 'package:flutter/material.dart';
import '../models/buttons.dart';
import '../models/projectElements.dart';
import '../backend/getList.dart';
import 'dart:async';
import 'package:bemyapp/backend/listItem.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'dart:io';
import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class MyList extends StatefulWidget {
  MyList({Key key, this.title}) : super(key: key);

  final String title;

  @override
  MyListView createState() => MyListView();
}

class MyListView extends State<MyList> {
  List data;
  creat() async {
    await makePostRequest("ga_namani@esi.dz", "azerty");
    await makeGetRequest();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    creat();
  }

  Future<List<ProjectItem>> _fetchJobs() async {
    await prefix0.makePostRequest("ga_namani@esi.dz", "azerty");
    String token = await storage.read(key: 'jwt');
    String url = domainName;
    Response response = await get(url + '/api/feed', headers: {
      "Authorization": "Bearer " + token,
      "Content-type": "application/json"
    });

    print(response.body);
    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);

      return jsonResponse.map((job) => new ProjectItem.fromJson(job)).toList();
    } else {
      throw Exception('Failed to load jobs from API');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(""),
      ),
      body: FutureBuilder<List<ProjectItem>>(
        future: _fetchJobs(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<ProjectItem> data = snapshot.data;
            return _jobsListView(data);
          } else if (snapshot.hasError) {
            return Text("${snapshot.error}");
          }
          return CircularProgressIndicator();
        },
      ),
    );
  }

  ListView _jobsListView(data) {
    return ListView.builder(
        itemCount: data.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(data[index].position,
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 20,
                )),
            leading: Icon(
              Icons.work,
              color: Colors.blue[500],
            ),
          );
        });
  }
}
