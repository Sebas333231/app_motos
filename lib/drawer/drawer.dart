import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:motos_strapi_v1/pages_admin/show_motos.dart';
import 'package:motos_strapi_v1/pages_admin/show_page.dart';
import '../pages/registrarse_page.dart';
import '../pages_admin/config_page.dart';



class MenuOption {
  final IconData icon;
  final String title;

  const MenuOption(this.icon, this.title);
}


class DrawerEpa extends StatefulWidget {
  const DrawerEpa({Key? key}) : super(key: key);

  @override
  State<DrawerEpa> createState() => _DrawerEpaState();
}

class _DrawerEpaState extends State<DrawerEpa> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(
              top: 50,
            ),
            child: CircleAvatar(
              radius: 50,
              backgroundImage: const AssetImage(
                  '../images/epa.png',
              ),
              backgroundColor: Colors.white,
              child: Container(
                decoration: const BoxDecoration(
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 70
            ),
            child: Column(
              children: [
                ListTile(
                  leading: const Icon(
                    Icons.settings,
                    color: Colors.white,
                  ),
                  title: const Text(
                    'Configuracion',
                    style: TextStyle(
                        color: Colors.white,
                      fontFamily: 'Poppins'
                    ),
                  ),
                  onTap: (){
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (BuildContext) => ConfigPage())
                    );
                  },
                ),
                ListTile(
                  leading: const Icon(
                    Icons.person,
                    color: Colors.white,
                  ),
                  title: const Text(
                    'Usuarios',
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Poppins'
                    ),
                  ),
                  onTap: (){
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (BuildContext) => ShowUser())
                    );
                  },
                ),
                ListTile(
                  leading: const Icon(
                    Icons.motorcycle,
                    color: Colors.white,
                  ),
                  title: const Text(
                    'Motos',
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Poppins'
                    ),
                  ),
                  onTap: (){
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (BuildContext) => AdminPage())
                    );
                  },
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
