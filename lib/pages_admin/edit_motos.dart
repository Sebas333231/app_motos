import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:motos_strapi_v1/pages/principal_page.dart';
import 'package:motos_strapi_v1/pages_admin/show_motos.dart';
import 'dart:convert';
import 'package:motos_strapi_v1/pages/motos.dart';

import '../drawer/constants.dart';

class EditMoto extends StatefulWidget {

  final Motos motos;
  const EditMoto({Key? key, required this.motos}) : super(key: key);

  @override
  State<EditMoto> createState() => _EditMotoState();
}

class _EditMotoState extends State<EditMoto> {


  void editMotos({
   required Motos motos,
    required String name,
    required String modelo,
    required String foto,
    required String representante,
    required String precio,
    required String foto1,
    required String foto2}) async{

    @override
    const String url = "http://localhost:65200/api/motos/";
    final Map<String, String> dataHeader = {
      'Access-Control-Allow-Methods': '[GET, POST, DELETE, HEAD, OPTIONS]',
      'Content-Type': 'application/json; charset=UTF-8'
    };

    final Map<String, dynamic> dataBody = {
      "name": name,
      "modelo": modelo,
      "foto": foto,
      "representante": representante,
      "precio": precio,
      "foto1": foto1,
      "foto2": foto2
    };

    final response = await http.put(
      Uri.parse(url + motos.id.toString()),
      headers: dataHeader,
      body: json.encode({'data': dataBody})
    );

    if (response.statusCode == 200){
      print(response.reasonPhrase);
      Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (BuildContext context) => DrawerPage(),
        ),
          (Route<dynamic> route) => false
      );
    }else{
      print(response.statusCode);
      print(response.reasonPhrase);
    }
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController nameController = TextEditingController(text: widget.motos.name);
    TextEditingController modeloController = TextEditingController(text: widget.motos.modelo);
    TextEditingController fotoController = TextEditingController(text: widget.motos.foto);
    TextEditingController representanteController = TextEditingController(text: widget.motos.representante);
    TextEditingController precioController = TextEditingController(text: widget.motos.precio);
    TextEditingController foto1Controller = TextEditingController(text: widget.motos.foto1);
    TextEditingController foto2Controller = TextEditingController(text: widget.motos.foto2);

    void deletemotos()async {
      const String url = "http://localhost:65200/api/motos/";

      await http.delete(
          Uri.parse(url + widget.motos.id.toString())
      );
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(
              builder: (BuildContext context) => DrawerPage()
          ),
              (Route<dynamic> route) => false
      );
    }
    return  Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.black,
        title: Text(
          widget.motos.name,
          style: TextStyle(
            color: Colors.white
          ),
        ),
      ),
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Center(
            child: Container(
                width: 300,
                margin: EdgeInsets.symmetric(vertical: 10),
                height: 610,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15)
                ),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 10),
                        child: IconButton(
                          onPressed: (){
                            deletemotos() ;
                          },
                          icon: const Icon(
                            Icons.delete,
                            size: 20,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: Container(
                          width: 250,
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                            border: Border.all(color: Colors.white),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: TextField(
                            onChanged: (val){
                              nameController.text = val;
                              nameController.selection = TextSelection.fromPosition(TextPosition(offset: nameController.text.length));
                            },
                            controller: nameController,
                            decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(color: Color(0xFF8A2387)),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(color: Color(0xFF8A2387)),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              hintText: 'Name',
                              fillColor: Colors.grey[200],
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: Container(
                          width: 250,
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                            border: Border.all(color: Colors.white),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: TextField(
                            onChanged: (val){
                              modeloController.text = val;
                              modeloController.selection = TextSelection.fromPosition(TextPosition(offset: modeloController.text.length));
                            },
                            controller: modeloController,
                            decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(color: Color(0xFF8A2387)),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(color: Color(0xFF8A2387)),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              hintText: 'Modelo',
                              fillColor: Colors.grey[200],
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: Container(
                          width: 250,
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                            border: Border.all(color: Colors.white),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: TextField(
                            onChanged: (val){
                              fotoController.text = val;
                              fotoController.selection = TextSelection.fromPosition(TextPosition(offset: fotoController.text.length));
                            },
                            controller: fotoController,
                            decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(color: Color(0xFF8A2387)),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(color: Color(0xFF8A2387)),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              hintText: 'Foto',
                              fillColor: Colors.grey[200],
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: Container(
                          width: 250,
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                            border: Border.all(color: Colors.white),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: TextField(
                            onChanged: (val){
                              foto1Controller.text = val;
                              foto1Controller.selection = TextSelection.fromPosition(TextPosition(offset: foto1Controller.text.length));
                            },
                            controller: foto1Controller,
                            decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(color: Color(0xFF8A2387)),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(color: Color(0xFF8A2387)),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              hintText: 'Foto 1',
                              fillColor: Colors.grey[200],
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: Container(
                          width: 250,
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                            border: Border.all(color: Colors.white),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: TextField(
                            onChanged: (val){
                              foto2Controller.text = val;
                              foto2Controller.selection = TextSelection.fromPosition(TextPosition(offset: foto2Controller.text.length));
                            },
                            controller: foto2Controller,
                            decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(color: Color(0xFF8A2387)),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(color: Color(0xFF8A2387)),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              hintText: 'Foto 2',
                              fillColor: Colors.grey[200],
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: Container(
                          width: 250,
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                            border: Border.all(color: Colors.white),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: TextField(
                            onChanged: (val){
                              representanteController.text = val;
                              representanteController.selection = TextSelection.fromPosition(TextPosition(offset: representanteController.text.length));
                            },
                            controller: representanteController,
                            decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(color: Color(0xFF8A2387)),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(color: Color(0xFF8A2387)),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              hintText: 'Representante',
                              fillColor: Colors.grey[200],
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: Container(
                          width: 250,
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                            border: Border.all(color: Colors.white),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: TextField(
                            onChanged: (val){
                              precioController.text = val;
                              precioController.selection = TextSelection.fromPosition(TextPosition(offset: precioController.text.length));
                            },
                            controller: precioController,
                            decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(color: Color(0xFF8A2387)),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(color: Color(0xFF8A2387)),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              hintText: 'Precio',
                              fillColor: Colors.grey[200],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      GestureDetector(
                        onTap: (){
                          editMotos(
                              motos: widget.motos,
                              name: nameController.text,
                              modelo: modeloController.text,
                              foto: fotoController.text,
                              representante: representanteController.text,
                              precio: precioController.text,
                              foto1: foto1Controller.text,
                              foto2: foto2Controller.text
                          );
                        },
                        child: Container(
                            width: 150,
                            height: 40,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                gradient: const RadialGradient(
                                  radius: 1.7,
                                  colors: <Color>[
                                    Color(0xFFE94057),
                                    Color(0xFF8A2387),
                                    Color(0xFF000000),
                                  ],
                                ),
                                boxShadow: const[
                                  BoxShadow(
                                    color: Colors.white,
                                    offset: Offset(
                                      2.0,
                                      2.0,
                                    ),
                                    blurRadius: 3.0,
                                    spreadRadius: 1.0,
                                  ), //BoxShadow
                                  BoxShadow(
                                    color: Colors.white,
                                    offset: Offset(0.0, 0.0),
                                    blurRadius: 0.0,
                                    spreadRadius: 0.0,
                                  ), //BoxShadow
                                ]
                            ),
                            child: const Padding(
                              padding: EdgeInsets.only(top: 10),
                              child: Text(
                                'Confirmar',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold
                                ),
                                textAlign: TextAlign.center,
                              ),
                            )
                        ),
                      )
                    ],
                  ),
                )
            )
        ),
      )
    );
  }
}
