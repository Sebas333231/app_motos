import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:http/http.dart' as http;
import 'package:motos_strapi_v1/vistas/vista_page.dart';
import '../pages_admin/edit_motos.dart';
import '../responsive/responsive_layout_two.dart';
import '../vistas/vista_pc.dart';
import '../vistas/vista_tablet.dart';
import 'motos.dart';

class PcPage extends StatefulWidget {
  const PcPage({Key? key}) : super(key: key);

  @override
  State<PcPage> createState() => _PcPageState();
}

class _PcPageState extends State<PcPage> {
  List<Motos> motos = [];

  Future<List<Motos>> get() async{
    const String url = "http://localhost:65200/api/motos/";
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200){
      motos.clear();
    }

    Map<String, dynamic> decodeData = jsonDecode(response.body);
    Iterable motosData = decodeData.values;

    for (var item in motosData.elementAt(0)){
      motos.add(Motos(
          item['id'],
          item['attributes']['name'],
          item['attributes']['modelo'],
          item['attributes']['foto'],
          item['attributes']['representante'],
          item['attributes']['precio'],
          item['attributes']['foto1'],
          item['attributes']['foto2']
      )
      );
    }
    return motos;
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: MenuDrawer(),
          backgroundColor: Colors.black,
          elevation: 0,
          title: const Text(
            'Tienda de Motos',
            style: TextStyle(
                fontFamily: 'Poppins'
            ),
          ),
        ),
        backgroundColor: Colors.black,
        body: FutureBuilder(
          future: get(),
          builder: (context, AsyncSnapshot<List<Motos>> snapshot){
            if (snapshot.connectionState == ConnectionState.waiting){
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            return GridView.builder(
              itemCount: snapshot.data!.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio: (1.2),
                  crossAxisCount: 4
              ),
              itemBuilder: (BuildContext context, index){
                return GestureDetector(
                  onTap: (){
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (BuildContext) =>  Responsive(
                            mobileBody: VistasPage(
                              name: snapshot.data![index].name,
                              foto: snapshot.data![index].foto,
                              modelo: snapshot.data![index].modelo,
                              representante: snapshot.data![index].representante,
                              precio: snapshot.data![index].precio,
                              foto1: snapshot.data![index].foto1,
                              foto2: snapshot.data![index].foto2,
                            ),
                            tabletBody: VistaTablet(
                              name: snapshot.data![index].name,
                              foto: snapshot.data![index].foto,
                              modelo: snapshot.data![index].modelo,
                              representante: snapshot.data![index].representante,
                              precio: snapshot.data![index].precio,
                              foto1: snapshot.data![index].foto1,
                              foto2: snapshot.data![index].foto2,
                            ),
                            desktopBody: VistaPc(
                              name: snapshot.data![index].name,
                              foto: snapshot.data![index].foto,
                              modelo: snapshot.data![index].modelo,
                              representante: snapshot.data![index].representante,
                              precio: snapshot.data![index].precio,
                              foto1: snapshot.data![index].foto1,
                              foto2: snapshot.data![index].foto2,
                            )
                        )
                        )
                    );
                  },
                  child: Container(
                    width: 200,
                    height: 200,
                    margin: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(10),
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
                      ],
                      image: DecorationImage(
                          image: NetworkImage(snapshot.data![index].foto),
                          fit: BoxFit.cover
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 5, bottom: 7),
                          child: Container(
                              width: 120,
                              height: 42,
                              decoration: BoxDecoration(
                                  color: Colors.black12,
                                  borderRadius: BorderRadius.circular(5)
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    snapshot.data![index].name,
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 16
                                    ),
                                  ),
                                  Text(
                                    snapshot.data![index].representante,
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 14
                                    ),
                                  ),
                                ],
                              )
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 2, bottom: 7),
                          child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.black12,
                                  borderRadius: BorderRadius.circular(5)
                              ),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  IconButton(
                                      onPressed: (){
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (BuildContext) => EditMoto(
                                                    motos: snapshot
                                                        .data![
                                                    index])));
                                      },
                                      icon: Icon(Icons.edit, color: Colors.white,)
                                  ),
                                ],
                              )
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          },
        )
    );
  }
}

class MenuDrawer extends StatelessWidget {
  const MenuDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        ZoomDrawer.of(context)!.toggle();
      },
      icon: const Icon(Icons.menu, color: Colors.white),
    );
  }
}
