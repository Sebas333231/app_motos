import 'package:flutter/material.dart';

import '../pages/registrarse_page.dart';
import 'add_motos.dart';


class ConfigPage extends StatefulWidget {
  const ConfigPage({Key? key}) : super(key: key);

  @override
  State<ConfigPage> createState() => _ConfigPageState();
}

class _ConfigPageState extends State<ConfigPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('Configuraciones'),
      ),
      backgroundColor: Colors.black,
      body: Container(
        child: Column(
          children: [
            Row(
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Text(
                      '¿Quieres agregar un nuevo usuario?',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 13
                    ),
                  ),
                ),
                const SizedBox(width: 13),
                Padding(
                  padding: EdgeInsets.only(right: 10),
                  child: GestureDetector(
                    onTap: (){
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (BuildContext) => RegisterPage())
                      );
                    },
                    child: Container(
                      width: 80,
                      height: 30,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
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
                        padding: EdgeInsets.only(top: 7),
                        child: Text(
                            'Agregar',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 13
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Row(
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Text(
                    '¿Quieres agregar una nueva moto?',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 13
                    ),
                  ),
                ),
                const SizedBox(width: 13),
                Padding(
                  padding: EdgeInsets.only(right: 10),
                  child: GestureDetector(
                    onTap: (){
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (BuildContext) => AddMoto())
                      );
                    },
                    child: Container(
                      width: 80,
                      height: 30,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
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
                        padding: EdgeInsets.only(top: 7),
                        child: Text(
                          'Agregar',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 13
                          ),
                          textAlign: TextAlign.center,
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
    );
  }
}
