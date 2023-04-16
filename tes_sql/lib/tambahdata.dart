// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:tes_sql/homepage.dart';

class TambahDataPage extends StatefulWidget {
  const TambahDataPage({super.key});

  @override
  State<TambahDataPage> createState() => _TambahDataPageState();
}

class _TambahDataPageState extends State<TambahDataPage> {
  final formkey = GlobalKey<FormState>();
  TextEditingController nama = TextEditingController();
  TextEditingController tlp = TextEditingController();
  TextEditingController asal = TextEditingController();
  Future _simpan() async {
    final respone = await http.post(
        Uri.parse('http://192.168.10.176/flutterAPI/coba/create.php'),
        body: {
          "nama": nama.text,
          "tlp": tlp.text,
          "asal": asal.text,
        });
    if (respone.statusCode == 200) {
      return true;
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tambah Data"),
      ),
      body: Form(
          key: formkey,
          child: Container(
            padding: EdgeInsets.all(10),
            child: Column(children: [
              TextFormField(
                controller: nama,
                decoration: InputDecoration(
                    hintText: "nama",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10))),
                validator: (value) {
                  if (value!.isEmpty) {
                    return "NAMA Tidak Boleh Kosong";
                  }
                },
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: tlp,
                decoration: InputDecoration(
                    hintText: "tlp",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10))),
                validator: (value) {
                  if (value!.isEmpty) {
                    return "TLP Tidak Boleh Kosong";
                  }
                },
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: asal,
                decoration: InputDecoration(
                    hintText: "asal",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10))),
                validator: (value) {
                  if (value!.isEmpty) {
                    return "NAMA Tidak Boleh Kosong";
                  }
                },
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15))),
                  onPressed: () {
                    if (formkey.currentState!.validate()) {
                      _simpan().then((value) {
                        if (value) {
                          final snackBar = SnackBar(
                            content: const Text("Data Berhasil di Simpan"),
                          );
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        } else {
                          final snackbar = SnackBar(
                              content: const Text("Data Gagal Di Simpan "));
                          ScaffoldMessenger.of(context).showSnackBar(snackbar);
                        }
                      });
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(builder: ((context) => HomePage())),
                          (route) => false);
                    }
                  },
                  child: Text("Simpan"))
            ]),
          )),
    );
  }
}
