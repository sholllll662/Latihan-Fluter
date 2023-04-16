// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'dart:collection';
import 'dart:convert';
import 'dart:developer';
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_titled_container/flutter_titled_container.dart';
import 'package:http/http.dart' as http;
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class sql extends StatefulWidget {
  const sql({super.key});

  @override
  State<sql> createState() => _sqlState();
}

class _sqlState extends State<sql> {
  List _listdata = [];
  List _listdata2 = [];

  Future refreshData() async {
    await Future.delayed(Duration(seconds: 1));
    _getdata();
    _getdata2();
    setState(() {});
  }

  Future _getdata() async {
    try {
      final respone = await http.get(
          Uri.parse('http://192.168.10.176:8080/flutterAPI/APIQC/get6day.php'));
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

  Future _getdata2() async {
    try {
      final respone = await http.get(
          Uri.parse('http://192.168.10.176:8080/flutterAPI/APIQC/connect.php'));
      if (respone.statusCode == 200) {
        print(respone.body);
        final data = jsonDecode(respone.body);
        setState(() {
          _listdata2 = data;
        });
      }
    } catch (e) {
      print(e);
    }

    // var shift1 = 'aktual';
    // var shift2 = 'target';
    // var shift1_int = int.parse(shift1);
    // var shift2_int = int.parse(shift2);
    // var total = shift1_int + shift2_int;
  }

  @override
  void initState() {
    _getdata();
    _getdata2();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //_listdata.sort((a, b) => b['date'].compareTo(a['date']));

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text("TWITOO dan FWABINNN"),
          bottom: TabBar(tabs: [
            Tab(text: '6 Days Ago', icon: Icon(Icons.work_history_rounded)),
            Tab(
              text: 'Today',
              icon: Icon(Icons.today),
            )
          ]),
        ),
        body: TabBarView(
          children: [
            //hal 1
            RefreshIndicator(
              onRefresh: refreshData,
              child: ListView.builder(
                itemCount: _listdata
                    .length, //< 8 ? features.length : 8,//pake ini jdi eror bentar
                itemBuilder: (context, index) {
                  int persen = 100;
                  // int aktual = ${int.parse(_listdata[index]['aktual']) / int.parse(_listdata[index]['target']) * 100};
                  return Card(
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.grey[400],
                          border: Border.all(color: Colors.black, width: 3.0)),
                      child: ListTile(
                        title: Text(
                          'AKTUAL = ${int.parse(_listdata[index]['aktual'])}',
                          style: GoogleFonts.titilliumWeb(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                        subtitle: Text('TARGET = ${_listdata[index]['target']}',
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        leading: Text(_listdata[index]['id'],
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        trailing: Text(_listdata[index]['date'],
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 15.0)),
                      ),
                    ),
                  );
                },
              ),
            ),
            //hal 2
            Container(
              color: Colors.blueAccent[100],
              padding: EdgeInsets.all(5),
              child: InkWell(
                child: Column(
                  children: [
                    //TARGET SHIFT
                    Expanded(
                        child: Card(
                      child: TitledContainer(
                        titleColor: Colors.black87,
                        title: 'TARGET SIFT 1 dan SIFT 2',
                        textAlign: TextAlignTitledContainer.Center,
                        fontSize: 20.0,
                        backgroundColor: Colors.blueAccent[100],
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.blueAccent,
                            border: Border.all(
                                color: Color.fromARGB(255, 57, 57, 58),
                                width: 5.0),
                          ),
                          child: ListView.builder(
                              itemCount: _listdata2.length,
                              itemBuilder: ((context, index) {
                                return Container(
                                  //DATA SHIFT
                                  child: Padding(
                                    padding: EdgeInsets.only(top: 30),
                                    child: Column(
                                      children: [
                                        Center(
                                          child: Text(
                                              'SHIFT 1 = ${_listdata[index]['aktual']}',
                                              style: GoogleFonts.titilliumWeb(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 35)),
                                        ),
                                        Center(
                                          child: Text(
                                              'SHIFT 2 = ${_listdata[index]['target']}',
                                              style: GoogleFonts.titilliumWeb(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 35)),
                                        ),
                                        Center(
                                          child: Text(
                                              'TOTAL = ${int.parse(_listdata[index]['target']) + int.parse(_listdata[index]['aktual'])}',
                                              style: GoogleFonts.titilliumWeb(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 35)),
                                        ),
                                        //TANGGALLLLLL
                                        Row(
                                          children: [
                                            Padding(
                                              padding: EdgeInsets.only(
                                                left: 18,
                                              ),
                                              child: Text(
                                                  DateFormat('dd-MM-yyyy')
                                                      .format(DateTime.now()),
                                                  style:
                                                      GoogleFonts.titilliumWeb(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 18)),
                                            ),
                                            Text("  (07.00) - ",
                                                style: GoogleFonts.titilliumWeb(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 18)),
                                            Text(
                                                DateFormat('dd-MM-yyyy').format(
                                                    DateTime.now().subtract(
                                                        Duration(days: -1))),
                                                style: GoogleFonts.titilliumWeb(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 18)),
                                            Text("  (07.00)",
                                                style: GoogleFonts.titilliumWeb(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 18)),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              })),
                        ),
                      ),
                    )),
                    Expanded(
                        child: Row(
                      children: [
                        //AKTUAL
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
                                child: ListView.builder(
                                    itemCount: _listdata2.length,
                                    itemBuilder: ((context, index) {
                                      return Container(
                                        child: Padding(
                                          padding: EdgeInsets.only(top: 120),
                                          child: Center(
                                            child: Text(
                                                '${_listdata[index]['aktual']}',
                                                style: GoogleFonts.titilliumWeb(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 40)),
                                          ),
                                        ),
                                      );
                                    })),
                              ),
                            ),
                          ),
                        ),
                        //TARGET
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
                                child: ListView.builder(
                                    itemCount: _listdata2.length,
                                    itemBuilder: ((context, index) {
                                      return Container(
                                        child: Padding(
                                          padding: EdgeInsets.only(top: 120),
                                          child: Center(
                                            child: Text(
                                                '${_listdata[index]['target']}',
                                                style: GoogleFonts.titilliumWeb(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 40)),
                                          ),
                                        ),
                                      );
                                    })),
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
      ),
    );
  }
}
