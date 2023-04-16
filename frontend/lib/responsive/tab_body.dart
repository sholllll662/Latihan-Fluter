// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:frontend/halaman2.dart';
import 'package:frontend/homepage2.dart';

class MyTabBody extends StatelessWidget {
  const MyTabBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple[200],
      appBar: AppBar(
        title: Text('T A B'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Expanded(
          child: Row(
            children: [
              // First column
              Expanded(
                child: Column(
                  children: [
                    // youtube video
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: AspectRatio(
                        aspectRatio: 2 / 1.2,
                        child: Container(
                          color: Colors.deepPurple[400],
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Container(
                                child: Column(
                                  // ignore: prefer_const_literals_to_create_immutables
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.all(
                                          20), //apply padding to all four sides
                                      child: Text(
                                        "S1 ~ 32.8%",
                                        style: TextStyle(
                                          fontSize: 50,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.all(
                                          20), //apply padding to all four sides
                                      child: Text(
                                        "S2 ~ 0%",
                                        style: TextStyle(
                                          fontSize: 50,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.all(
                                          20), //apply padding to all four sides
                                      child: Text(
                                        "Total ~ 19.7%",
                                        style: TextStyle(
                                          fontSize: 50,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.all(
                                          20), //apply padding to all four sides
                                      child: Text(
                                        "12 Jan 2023 (07.00) - 13 Jan 2023 (07.00)",
                                        style: TextStyle(
                                          fontSize: 30,
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

                    // comment section & recommended videos
                    // Expanded(
                    //   child: ListView.builder(
                    //     itemCount: 2,
                    //     itemBuilder: (context, index) {
                    //       return Padding(
                    //         padding: const EdgeInsets.all(8.0),
                    //         child: Container(
                    //           color: Colors.deepPurple[300],
                    //           height: 120,
                    //         ),
                    //       );
                    //     },
                    //   ),
                    // )
                    Row(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: AspectRatio(
                              aspectRatio: 3 / 3.5,
                              child: Container(
                                color: Colors.deepPurple[300],
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Container(
                                      child: Column(
                                        // ignore: prefer_const_literals_to_create_immutables
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.all(
                                                5), //apply padding to all four sides
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
                                                5), //apply padding to all four sides
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
                              aspectRatio: 3 / 3.5,
                              child: Container(
                                color: Colors.deepPurple[300],
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Container(
                                      child: Column(
                                        // ignore: prefer_const_literals_to_create_immutables
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.all(
                                                5), //apply padding to all four sides
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
                                                5), //apply padding to all four sides
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
                      ],
                    )
                  ],
                ),
              ),

              // second column
              // Padding(
              //   padding: const EdgeInsets.all(8.0),
              //   child: Container(
              //     width: 200,
              //     color: Colors.deepPurple[300],
              //   ),
              // )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => HomePage2()),
          )
        },
        child: Text("NEXT"),
      ),
    );
  }
}
