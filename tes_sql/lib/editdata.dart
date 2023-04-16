// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:tes_sql/homepage.dart';

class EditDataPage extends StatefulWidget {
  final Map ListData;
  const EditDataPage({Key? key, required this.ListData}) : super(key: key);

  @override
  State<EditDataPage> createState() => _EditDataPageState();
}

class _EditDataPageState extends State<EditDataPage> {
  final formkey = GlobalKey<FormState>();
  TextEditingController nama = TextEditingController();
  TextEditingController tlp = TextEditingController();
  TextEditingController asal = TextEditingController();
  TextEditingController id = TextEditingController();
  Future _update() async {
    final respone = await http.post(
        Uri.parse('http://192.168.10.176/flutterAPI/coba/edit.php'),
        body: {
          "nama": nama.text,
          "tlp": tlp.text,
          "asal": asal.text,
          "id": id.text,
        });
    if (respone.statusCode == 200) {
      return true;
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    nama.text = widget.ListData['nama'];
    tlp.text = widget.ListData['tlp'];
    asal.text = widget.ListData['asal'];
    id.text = widget.ListData['id'];
    return Scaffold(
      appBar: AppBar(
        title: Text("EDIT Data"),
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
                      _update().then((value) {
                        if (value) {
                          final snackBar = SnackBar(
                            content: const Text("Data Berhasil di Update"),
                          );
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        } else {
                          final snackbar = SnackBar(
                              content: const Text("Data Gagal Di Update "));
                          ScaffoldMessenger.of(context).showSnackBar(snackbar);
                        }
                      });
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(builder: ((context) => HomePage())),
                          (route) => false);
                    }
                  },
                  child: Text("Update"))
            ]),
          )),
    );
  }
}
