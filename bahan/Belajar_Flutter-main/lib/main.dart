// ignore_for_file: prefer_const_constructors, unnecessary_import, use_key_in_widget_constructors, unused_local_variable, no_logic_in_create_state, unnecessary_new, duplicate_ignore, unused_import

// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';

// import 'halaman2.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   final List<Widget> mylist = List.generate(3, (index) {
//     return Container(
//       height: 10,
//       width: 20,
//       color: Colors.blueGrey,
//     );
//   });

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: Builder(
//           builder: (context) => Scaffold(
//                 appBar: AppBar(
//                   title: Text("Pembagian Kotak"),
//                   actions: [
//                     Center(
//                       child: ElevatedButton(
//                           onPressed: () {}, child: Text("1/26/2023")),
//                     )
//                   ],
//                 ),
//                 body: GridView(
//                     padding: EdgeInsets.all(10),
//                     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                         crossAxisCount: 1,
//                         crossAxisSpacing: 10,
//                         mainAxisSpacing: 10,
//                         childAspectRatio: 2.1 / 1),
//                     children: [
//                       Expanded(
//                         child: Container(
//                             //color: Colors.blueGrey,
//                             height: 10,
//                             width: 20,
//                             decoration: BoxDecoration(
//                                 border: Border(
//                                     bottom: BorderSide(
//                                         color:cscf
//                                             Theme.of(context).dividerColor))),
//                             child: Column(
//                               mainAxisAlignment: MainAxisAlignment.spaceAround,
//                               // ignore: prefer_const_literals_to_create_immutables
//                               children: [
//                                 Container(
//                                   // decoration: BoxDecoration(gagag
//                                     padding: EdgeInsets.all(1.0),
//                                     child: Text(
//                                       "S1 ~ 32.8%",
//                                       style: TextStyle(
//                                           color:
//                                               Color.fromARGB(255, 12, 11, 11),
//                                           fontSize: 25),
//                                     ),
//                                   ),
//                                 ),
//                                 Container(
//                                   // decoration: BoxDecoration(
//                                   //     borderRad1212122ius: BorderRadius.circular(10),
//                                   //     color: Colors.green),
//                                   child: const Padding(
//                                     padding: EdgeInsets.all(1.0),
//                                     child: Text(
//                                       "S2 ~ 0%",
//                                       style: TextStyle(
//                                           color:
//                                               Color.fromARGB(255, 12, 11, 11),
//                                           fontSize: 25),
//                                     ),
//                                   ),
//                                 ),
//                                 Container(
//                                   // decoration: BoxDecoration(
//                                   //     borderRadius: BorderRadius.circular(10),
//                                   //     color: Colors.green),
//                                   child: const Padding(
//                                     padding: EdgeInsets.all(1.0),
//                                     child: Text(
//                                       "Total ~ 19.7%",
//                                       style: TextStyle(
//                                           color:
//                                               Color.fromARGB(255, 12, 11, 11),
//                                           fontSize: 25),
//                                     ),
//                                   ),
//                                 ),
//                                 Container(
//                                   // decoration: BoxDecoration(
//                                   //     borderRadius: BorderRadius.circular(10),
//                                   //     color: Colors.green),
//                                   child: const Padding(
//                                     padding: EdgeInsets.all(1.0),
//                                     child: Text(
//                                       "12 Jan 2023 (07.00) - 13 Jan 2023 (07.00)",
//                                       style: TextStyle(
//                                           color:
//                                               Color.fromARGB(255, 12, 11, 11),
//                                           fontSize: 15),
//                                     ),
//                                   ),
//                                 ),
//                               ],
//                             )
//                             //,

//                             ),
//                       ),
//                       Expanded(
//                         child: Container(
//                             //color: Colors.blueGrey,
//                             height: 10,
//                             width: 20,
//                             decoration: BoxDecoration(
//                                 border: Border(
//                                     bottom: BorderSide(
//                                         color:
//                                             Theme.of(context).dividerColor))),
//                             child: Center(
//                               child: Text("100%"),
//                             )),
//                       ),
//                       Expanded(
//                         child: Container(
//                             //color: Colors.blueGrey,
//                             height: 10,
//                             width: 20,
//                             decoration: BoxDecoration(
//                                 border: Border(
//                                     bottom: BorderSide(
//                                         color:
//                                             Theme.of(context).dividerColor))),
//                             child: Center(
//                               child: Text("100%"),
//                             )),
//                       ),

//                       // Column(
//                       //   children: [
//                       //     ElevatedButton(onPressed: () {}, child: Text("Next"))
//                       //   ],
//                       // )
//                     ]),
// floatingActionButton: FloatingActionButton(
//   onPressed: () => {
//     Navigator.push(context,
//         MaterialPageRoute(builder: (context) => hal2()))
//   },
//   child: Text("NEXT"),
// ),
//               )),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'homepage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
      theme: ThemeData(primarySwatch: Colors.deepPurple),
    );
  }
}
