// ignore_for_file: prefer_const_constructors, import_of_legacy_library_into_null_safe

import 'dart:convert';

import 'package:codeigniter/helperurl.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String url = MyUrl().getUrlDevice();
  final emailAdmin = new TextEditingController();
  final passAdmin = new TextEditingController();

  void prosesLogin() async {
    var dataLogin = await http.post("$url/admin/login",
        body: {"email": emailAdmin.text, "password": passAdmin.text});

    var dataAdmin = json.decode(dataLogin.body);

    print(dataAdmin);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("PWABIN"),
      ),
      body: Container(
          child: Center(
        child: Column(
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            SizedBox(
              height: 20,
            ),
            TextField(
              controller: emailAdmin,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                hintText: "Masukan Email anda",
                labelText: "Email",
              ),
            ),
            SizedBox(
              height: 20,
            ),
            TextField(
              controller: passAdmin,
              keyboardType: TextInputType.emailAddress,
              obscureText: true,
              decoration: InputDecoration(
                hintText: "Masukan Password anda",
                labelText: "Password",
              ),
            ),
            SizedBox(
              height: 20,
            ),
            OutlinedButton(
                onPressed: () {
                  prosesLogin();
                },
                child: Text("MAHOOKK"))
          ],
        ),
      )),
    );
  }
}
