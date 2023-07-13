import 'package:flutter/material.dart';
import 'package:motos_strapi_v1/pages/pc_page.dart';
import 'package:motos_strapi_v1/pages/tablet_page.dart';
import 'package:motos_strapi_v1/responsive/responsive_layout.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'drawer.dart';
import 'package:motos_strapi_v1/pages/principal_page.dart';

class DrawerPage extends StatefulWidget {
  const DrawerPage({Key? key}) : super(key: key);

  @override
  State<DrawerPage> createState() => _DrawerPageState();
}

class _DrawerPageState extends State<DrawerPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: ZoomDrawer(
        angle: 0.0,
        mainScreen: ResponsiveLayoutt(
            mobileBody: PrincipalPage(),
            tabletBody: TabletPage(),
            desktopBody: PcPage()
        ),
        menuScreen: DrawerEpa(),
      ),
    );
  }
}
