import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:tes_sql/editdata.dart';
import 'package:tes_sql/tambahdata.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List _listdata = [];

  Future _getdata() async {
    try {
      final respone = await http
          .get(Uri.parse('http://192.168.10.176/flutterAPI/coba/connect.php'));
      if (respone.statusCode == 200) {
        print(respone.body);
        final data = jsonDecode(respone.body);
        setState(() {
          _listdata = data;
        });
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    _getdata();
    print(_listdata);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("HOME PAGE"),
      ),
      body: ListView.builder(
          itemCount: _listdata.length,
          itemBuilder: ((context, index) {
            return Card(
              child: InkWell(
                // onTap: () {
                //   Navigator.push(
                //       context,
                //       MaterialPageRoute(
                //           builder: (context) => EditDataPage(
                //                 ListData: {
                //                   "nama": _listdata[index]['nama'],
                //                   "tlp": _listdata[index]['tlp'],
                //                   "asal": _listdata[index]['asal'],
                //                   "id": _listdata[index]['id'],
                //                 },
                //               )));
                // },
                child: ListTile(
                  title: Text(_listdata[index]['nama']),
                  subtitle: Text(_listdata[index]['asal']),
                ),
              ),
            );
          })),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.plus_one),
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => TambahDataPage()));
          }),
    );
  }
}
