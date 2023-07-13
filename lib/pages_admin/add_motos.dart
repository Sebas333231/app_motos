import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:motos_strapi_v1/pages_admin/show_motos.dart';
import 'dart:convert';
import 'package:motos_strapi_v1/pages/motos.dart';

import '../drawer/constants.dart';

class AddMoto extends StatefulWidget {
  final int? id;
  const AddMoto({Key? key, this.id}) : super(key: key);

  @override
  State<AddMoto> createState() => _AddMotoState();
}

Motos motos = Motos(0, '', '', '', '', '', '', '');

class _AddMotoState extends State<AddMoto> {
  final TextEditingController _nameController = TextEditingController(text: motos.name);
  final TextEditingController _modeloController = TextEditingController(text: motos.modelo);
  final TextEditingController _fotoController = TextEditingController(text: motos.foto);
  final TextEditingController _representanteController = TextEditingController(text: motos.representante);
  final TextEditingController _precioController = TextEditingController(text: motos.precio);
  final TextEditingController _foto1Controller = TextEditingController(text: motos.foto1);
  final TextEditingController _foto2Controller = TextEditingController(text: motos.foto2);



  @override
  void dispose(){
    super.dispose();
    _nameController.dispose();
    _modeloController.dispose();
    _fotoController.dispose();
    _representanteController.dispose();
    _precioController.dispose();
    _foto1Controller.dispose();
    _foto2Controller.dispose();
  }
  Future save() async{
    const String url = "http://localhost:65200/api/motos/";
    final Map<String, String> dataHeader = {
      'Content-Type': 'application/json; charset=UTF-8',
    };

    final Map<String, dynamic> dataBody = {
      "name": motos.name,
      "modelo": motos.modelo,
      "foto": motos.foto,
      "representante": motos.representante,
      "precio": motos.precio,
      "foto1": motos.foto1,
      "foto2": motos.foto2
    };

    await http.post(
      Uri.parse(url),
      headers: dataHeader,
      body: json.encode({'data': dataBody}),
    );

    Navigator.pushAndRemoveUntil<void>(
        context,
        MaterialPageRoute<void>(
            builder: (BuildContext context) => const DrawerPage())
        as Route<void>,
            (Route<dynamic> route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.black,
        title: Text(
          'Agrega tu moto',
          style: TextStyle(
              color: Colors.white
          ),
        ),
      ),
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Center(
            child: Container(
              width: 350,
              margin: EdgeInsets.symmetric(vertical: 10),
              height: 550,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15)
              ),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 30),
                      child: Container(
                        width: 300,
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          border: Border.all(color: Colors.white),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: TextField(
                          onChanged: (val){
                            motos.name = val;
                          },
                          controller: _nameController,
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
                      padding: const EdgeInsets.only(top: 30),
                      child: Container(
                        width: 300,
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          border: Border.all(color: Colors.white),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: TextField(
                          onChanged: (val){
                            motos.modelo = val;
                          },
                          controller: _modeloController,
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
                      padding: const EdgeInsets.only(top: 30),
                      child: Container(
                        width: 300,
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          border: Border.all(color: Colors.white),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: TextField(
                          onChanged: (val){
                            motos.foto = val;
                          },
                          controller: _fotoController,
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
                      padding: const EdgeInsets.only(top: 30),
                      child: Container(
                        width: 300,
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          border: Border.all(color: Colors.white),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: TextField(
                          onChanged: (val){
                            motos.foto1 = val;
                          },
                          controller: _foto1Controller,
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
                      padding: const EdgeInsets.only(top: 30),
                      child: Container(
                        width: 300,
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          border: Border.all(color: Colors.white),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: TextField(
                          onChanged: (val){
                            motos.foto2 = val;
                          },
                          controller: _foto2Controller,
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
                      padding: const EdgeInsets.only(top: 30),
                      child: Container(
                        width: 300,
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          border: Border.all(color: Colors.white),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: TextField(
                          onChanged: (val){
                            motos.representante = val;
                          },
                          controller: _representanteController,
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
                      padding: const EdgeInsets.only(top: 30),
                      child: Container(
                        width: 300,
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          border: Border.all(color: Colors.white),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: TextField(
                          onChanged: (val){
                            motos.precio = val;
                          },
                          controller: _precioController,
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
                    SizedBox(height: 15),
                    GestureDetector(
                      onTap: save,
                      child: Container(
                          width: 150,
                          height: 50,
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
                              'Agregar',
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
