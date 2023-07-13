import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'principal_page.dart';
import 'package:http/http.dart' as http;
import 'package:motos_strapi_v1/pages/user.dart';
import 'inicio_page.dart';
import 'package:motos_strapi_v1/pages_admin/show_motos.dart';
import 'package:motos_strapi_v1/pages/principal_page.dart';


class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}
class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        color: Colors.black,
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.only(
                top: 100,
              ),
              child: Text(
                  'Login',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 55,
                  fontWeight: FontWeight.bold
                ),
                textAlign: TextAlign.start,
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(
                top: 30, left: 20
              ),
              child: Text(
                'Bienvenido a la mejor app en la que puedes adquirir tu moto',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18
                ),
                textAlign: TextAlign.start,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30),
              child: Container(
                width: 350,
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  border: Border.all(color: Colors.white),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TextField(
                  decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.cyanAccent),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.cyanAccent),
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
                width: 350,
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  border: Border.all(color: Colors.white),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TextField(
                  decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.cyanAccent),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.cyanAccent),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      hintText: 'Password',
                      fillColor: Colors.grey[200],
                      filled: true
                  ),
                ),
              ),
            ),
            const SizedBox(height: 40),
            GestureDetector(
              onTap: (){
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (BuildContext) => PrincipalPage())
                );
              },
              child: Container(
                  width: 150,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.cyanAccent,
                  ),
                  child: const Padding(
                    padding: EdgeInsets.only(top: 15),
                    child: Text(
                      'Iniciar Sesion',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold
                      ),
                      textAlign: TextAlign.center,
                    ),
                  )
              ),
            ),
            SizedBox(height: 50),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Icon(
                  FontAwesomeIcons.facebook,
                  color: Colors.white,
                  size: 30,
                ),
                Icon(
                  FontAwesomeIcons.whatsapp,
                  color: Colors.white,
                  size: 30,
                ),
                Icon(
                  FontAwesomeIcons.instagram,
                  color: Colors.white,
                  size: 30,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
