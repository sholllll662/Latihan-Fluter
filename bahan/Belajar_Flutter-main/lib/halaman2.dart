// ignore_for_file: unnecessary_import, prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'main.dart';

class hal2 extends StatefulWidget {
  @override
  State<hal2> createState() => _hal2State();
}

class _hal2State extends State<hal2> {
  final List<Widget> mylist = List.generate(6, (index) {
    return Container(
        height: 10,
        width: 20,
        color: Colors.blueGrey,
        child: Center(
          child: Text("50%"),
        ));
  });

  String a = "Ini halaman 2";
  var b = Container(
      height: 10,
      width: 20,
      color: Color.fromARGB(255, 35, 160, 222),
      child: Center(
        child: Text("50%"),
      ));
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        // ignore: prefer_const_literals_to_create_immutables
        appBar: AppBar(title: Text(a), actions: [
          Center(
            child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    a = "Halaman Kotak bagi 2";
                  });
                },
                child: Text("Refresh")),
          )
        ]),
        body: GridView(
          padding: EdgeInsets.all(10),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio: 1.1 / 1),
          children: mylist,
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => MyApp()))
          },
          child: Text("BACK"),
        ),
      ),
    );
  }
}
