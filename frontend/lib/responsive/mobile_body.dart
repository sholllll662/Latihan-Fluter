// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, unused_import

import 'package:flutter/material.dart';
import 'package:frontend/responsive_hal2/mobile_body.dart';
import 'package:frontend/responsive_hal2/tab_body.dart';
import 'package:frontend/homepage2.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:intl/intl.dart';

class MyMobileBody extends StatelessWidget {
  const MyMobileBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple[200],
      appBar: AppBar(
        title: Text('M O B I L E'),
        actions: [
          Center(
            child: ElevatedButton(
                onPressed: () {},
                child: Text(DateFormat('dd-MM-yyyy').format(DateTime.now()))),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            // youtube video
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: AspectRatio(
                aspectRatio: 3 / 2.5,
                child: Container(
                    color: Colors.deepPurple[400],
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      // ignore: prefer_const_literals_to_create_immutables
                      children: [
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.all(
                                20), //apply padding to all four sides
                            child: Text(
                              "S1 ~ 32.8%",
                              style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.all(
                                20), //apply padding to all four sides
                            child: Text(
                              "S2 ~ 0%",
                              style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.all(
                                20), //apply padding to all four sides
                            child: Text(
                              "Total ~ 19.7%",
                              style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.all(
                                20), //apply padding to all four sides
                            child: Text(
                              "12 Jan 2023 (07.00) - 13 Jan 2023 (07.00)",
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    )),
              ),
            ),

            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: AspectRatio(
                  aspectRatio: 3 / 1.5,
                  child: Container(
                    color: Colors.deepPurple[300],
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          child: Column(
                            // ignore: prefer_const_literals_to_create_immutables
                            children: [
                              Padding(
                                padding: EdgeInsets.all(
                                    10), //apply padding to all four sides
                                child: Text(
                                  "AKTUAL",
                                  style: TextStyle(
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.all(
                                    10), //apply padding to all four sides
                                child: Text(
                                  "104,825",
                                  style: TextStyle(
                                    fontSize: 35,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),

            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: AspectRatio(
                  aspectRatio: 3 / 1.5,
                  child: Container(
                    color: Colors.deepPurple[300],
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          child: Column(
                            // ignore: prefer_const_literals_to_create_immutables
                            children: [
                              Padding(
                                padding: EdgeInsets.all(
                                    5), //apply padding to all four sides
                                child: Text(
                                  "TARGET",
                                  style: TextStyle(
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.all(
                                    5), //apply padding to all four sides
                                child: Text(
                                  "533,000",
                                  style: TextStyle(
                                    fontSize: 35,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => HomePage2()))
        },
        child: Text("NEXT"),
      ),
    );
  }
}
