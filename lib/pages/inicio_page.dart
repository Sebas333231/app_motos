import 'package:flutter/material.dart';
import 'package:motos_strapi_v1/drawer/constants.dart';
import 'login_page.dart';
import 'registrarse_page.dart';
import 'package:motos_strapi_v1/responsive/responsive_layout.dart';



class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        color: Colors.black,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                top: 80
              ),
              child: Container(
                width: 220,
                height: 220,
                child: const Image(
                  image: AssetImage('../images/th.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const Padding(
                padding: EdgeInsets.only(
                  top: 30,
                ),
              child: Text(
                  'Bienvenido a la mejor app, \npara que adquieras tu moto',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                    fontFamily: 'Poppins'
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                top: 160
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: (){
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (BuildContext) => DrawerPage())
                      );
                    },
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
                          padding: EdgeInsets.only(top: 11),
                          child: Text(
                            'Continuar',
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
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
