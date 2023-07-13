import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:motos_strapi_v1/drawer/constants.dart';
import 'package:motos_strapi_v1/pages/user.dart';
import 'dart:convert';
import 'dart:async';


class RegisterPage extends StatefulWidget {
  final int? id;
  const RegisterPage({Key? key, this.id}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

Users users = Users(0, '', '', '', '');

class _RegisterPageState extends State<RegisterPage> {

  final TextEditingController _namecontroller = TextEditingController(text: users.name);
  final TextEditingController _emailcontroller = TextEditingController(text: users.email);
  final TextEditingController _passwordcontroller = TextEditingController(text: users.password);
  final TextEditingController _tipocontroller = TextEditingController(text: users.tipo);


  @override
  void dispose(){
    super.dispose();
    _namecontroller.dispose();
    _emailcontroller.dispose();
    _passwordcontroller.dispose();
    _tipocontroller.dispose();
  }

  Future save() async{
    const String url = "http://localhost:65200/api/usuarios/";
    final Map<String, String> dataHeader = {
      'Content-Type': 'application/json; charset=UTF-8',
    };

    final Map<String, dynamic> dataBody = {
      "name": users.name,
      "email": users.email,
      "password": users.password,
      "tipo": users.tipo
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
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
          icon: Icon(FontAwesomeIcons.arrowLeft, color: Colors.white,),
          onPressed: (){
            Navigator.pop(context);
          },
        ),
        title: const Text('Registro de Usuario'),
      ),
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          color: Colors.black,
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.only(
                  top: 100,
                  left: 10,
                  right: 10
                ),
                child: Text(
                  'Agrega nuevos usuarios',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold
                  ),
                  textAlign: TextAlign.start,
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(
                    top: 20, left: 20
                ),
                child: Text(
                  'Preparate para tener una variedad de contenido',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 14
                  ),
                  textAlign: TextAlign.start,
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
                    controller: _namecontroller,
                    onChanged: (val){
                      users.name = val;
                    },
                    decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Color(0xFF8A2387),),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Color(0xFF8A2387),),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        hintText: 'name',
                        fillColor: Colors.grey[200],
                        filled: true
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
                    controller: _emailcontroller,
                    onChanged: (val){
                      users.email = val;
                    },
                    decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Color(0xFF8A2387)),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Color(0xFF8A2387)),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        hintText: 'Email',
                        fillColor: Colors.grey[200],
                        filled: true
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
                    controller: _passwordcontroller,
                    onChanged: (val){
                      users.password = val;
                    },
                    decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Color(0xFF8A2387),),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Color(0xFF8A2387),),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        hintText: 'Password',
                        fillColor: Colors.grey[200],
                        filled: true
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
                    controller: _tipocontroller,
                    onChanged: (val){
                      users.tipo = val;
                    },
                    decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Color(0xFF8A2387),),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Color(0xFF8A2387),),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        hintText: 'tipo',
                        fillColor: Colors.grey[200],
                        filled: true
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 40),
              GestureDetector(
                onTap: save,
                child: Container(
                    width: 130,
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
                      padding: EdgeInsets.only(top: 13),
                      child: Text(
                        'Agregar',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 17,
                            fontWeight: FontWeight.bold
                        ),
                        textAlign: TextAlign.center,
                      ),
                    )
                ),
              ),
            ],
          ),
        ),
      )
    );
  }
}
