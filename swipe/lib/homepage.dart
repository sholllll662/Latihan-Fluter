import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_titled_container/flutter_titled_container.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;

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
          .get(Uri.parse('http://192.168.10.176/flutterAPI/APIQC/get6day.php'));
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
        title: Text("DISPLAY QC"),
        //TANGGALLLLLLLLLL
        actions: [
          Center(
            child: ElevatedButton(
                onPressed: () {},
                child: Text(DateFormat('dd-MM-yyyy').format(DateTime.now()))),
          )
        ],
      ),
      body: PageView(
        children: [
          //HALAMAN 1
          Container(
            color: Colors.greenAccent[100],
            child: InkWell(
              child: Row(
                children: [
                  Expanded(
                    child: Card(
                      child: Container(
                        color: Colors.greenAccent[100],
                        child: Column(
                          children: [
                            Expanded(
                                child: Card(
                              child: TitledContainer(
                                titleColor: Colors.black87,
                                title: DateFormat('dd-MM-yyyy').format(
                                    DateTime.now().subtract(Duration(days: 1))),
                                textAlign: TextAlignTitledContainer.Center,
                                fontSize: 16.0,
                                backgroundColor: Colors.greenAccent[100],
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.greenAccent,
                                    border: Border.all(
                                        color: Color.fromARGB(255, 57, 57, 58),
                                        width: 5.0),
                                  ),
                                  //isi datanya
                                  //child: ListView.builder(itemBuilder: itemBuilder),
                                ),
                              ),
                            )),
                            Expanded(
                                child: Card(
                              child: TitledContainer(
                                titleColor: Colors.black87,
                                title: DateFormat('dd-MM-yyyy').format(
                                    DateTime.now().subtract(Duration(days: 3))),
                                textAlign: TextAlignTitledContainer.Center,
                                fontSize: 16.0,
                                backgroundColor: Colors.greenAccent[100],
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.greenAccent,
                                    border: Border.all(
                                        color: Color.fromARGB(255, 57, 57, 58),
                                        width: 5.0),
                                  ),
                                ),
                              ),
                            )),
                            Expanded(
                                child: Card(
                              child: TitledContainer(
                                titleColor: Colors.black87,
                                title: DateFormat('dd-MM-yyyy').format(
                                    DateTime.now().subtract(Duration(days: 5))),
                                textAlign: TextAlignTitledContainer.Center,
                                fontSize: 16.0,
                                backgroundColor: Colors.greenAccent[100],
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.greenAccent,
                                    border: Border.all(
                                        color: Color.fromARGB(255, 57, 57, 58),
                                        width: 5.0),
                                  ),
                                ),
                              ),
                            )),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Card(
                      child: Container(
                        color: Colors.greenAccent[100],
                        child: Column(
                          children: [
                            Expanded(
                                child: Card(
                              child: TitledContainer(
                                titleColor: Colors.black87,
                                title: DateFormat('dd-MM-yyyy').format(
                                    DateTime.now().subtract(Duration(days: 2))),
                                textAlign: TextAlignTitledContainer.Center,
                                fontSize: 16.0,
                                backgroundColor: Colors.greenAccent[100],
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.greenAccent,
                                    border: Border.all(
                                        color: Color.fromARGB(255, 57, 57, 58),
                                        width: 5.0),
                                  ),
                                ),
                              ),
                            )),
                            Expanded(
                                child: Card(
                              child: TitledContainer(
                                titleColor: Colors.black87,
                                title: DateFormat('dd-MM-yyyy').format(
                                    DateTime.now().subtract(Duration(days: 4))),
                                textAlign: TextAlignTitledContainer.Center,
                                fontSize: 16.0,
                                backgroundColor: Colors.greenAccent[100],
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.greenAccent,
                                    border: Border.all(
                                        color: Color.fromARGB(255, 57, 57, 58),
                                        width: 5.0),
                                  ),
                                ),
                              ),
                            )),
                            Expanded(
                                child: Card(
                              child: TitledContainer(
                                titleColor: Colors.black87,
                                title: DateFormat('dd-MM-yyyy').format(
                                    DateTime.now().subtract(Duration(days: 6))),
                                textAlign: TextAlignTitledContainer.Center,
                                fontSize: 16.0,
                                backgroundColor: Colors.greenAccent[100],
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.greenAccent,
                                    border: Border.all(
                                        color: Color.fromARGB(255, 57, 57, 58),
                                        width: 5.0),
                                  ),
                                ),
                              ),
                            )),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          //HALAMAN 2
          Container(
            color: Colors.blueAccent[100],
            padding: EdgeInsets.all(5),
            child: InkWell(
              child: Column(
                children: [
                  Expanded(
                      child: Card(
                    child: TitledContainer(
                      titleColor: Colors.black87,
                      title: 'TARGET SIFT 1 dan SIFT 2',
                      textAlign: TextAlignTitledContainer.Center,
                      fontSize: 15.0,
                      backgroundColor: Colors.blueAccent[100],
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.blueAccent,
                          border: Border.all(
                              color: Color.fromARGB(255, 57, 57, 58),
                              width: 5.0),
                        ),
                      ),
                    ),
                  )),
                  Expanded(
                      child: Row(
                    children: [
                      Expanded(
                        child: Card(
                          child: TitledContainer(
                            titleColor: Colors.black87,
                            title: 'AKTUAL',
                            textAlign: TextAlignTitledContainer.Center,
                            fontSize: 15.0,
                            backgroundColor: Colors.blueAccent[100],
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.blueAccent,
                                border: Border.all(
                                    color: Color.fromARGB(255, 57, 57, 58),
                                    width: 5.0),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Card(
                          child: TitledContainer(
                            titleColor: Colors.black87,
                            title: 'TARGET',
                            textAlign: TextAlignTitledContainer.Center,
                            fontSize: 15.0,
                            backgroundColor: Colors.blueAccent[100],
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.blueAccent,
                                border: Border.all(
                                    color: Color.fromARGB(255, 57, 57, 58),
                                    width: 5.0),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  )),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
