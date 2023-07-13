import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:motos_strapi_v1/pages/user.dart';
import 'package:motos_strapi_v1/pages/motos.dart';
import 'dart:convert';
import 'package:motos_strapi_v1/pages_admin/edit_motos.dart';

class AdminPage extends StatefulWidget {
  const AdminPage({Key? key}) : super(key: key);
  @override
  State<AdminPage> createState() => _AdminPageState();
}

class _AdminPageState extends State<AdminPage> {
  List<Motos> motos = [];
  Future<List<Motos>> getMotos() async {
    const String url = "http://localhost:65200/api/motos/";
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      motos.clear();
    }

    Map<String, dynamic> decodeData = jsonDecode(response.body);
    Iterable motosData = decodeData.values;

    for (var item in motosData.elementAt(0)) {
      motos.add(Motos(
          item['id'],
          item['attributes']['name'],
          item['attributes']['modelo'],
          item['attributes']['foto'],
          item['attributes']['representante'],
          item['attributes']['precio'],
          item['attributes']['foto1'],
          item['attributes']['foto2']
      ));
    }
    return motos;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(FontAwesomeIcons.arrowLeft, color: Colors.white,),
            onPressed: (){
              Navigator.pop(context);
            },
          ),
          backgroundColor: Colors.black,
          title: Text('Motos registradas'),
          elevation: 0,
        ),
        body: Container(
          child: Column(
            children: [
              Expanded(
                child: FutureBuilder(
                  future: getMotos(),
                  builder: (context, AsyncSnapshot<List<Motos>> snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    return ListView.builder(
                        itemCount: snapshot.data!.length,
                        itemBuilder: (BuildContext context, index) =>
                            GestureDetector(
                                child: Container(
                                  width: 150,
                                    margin: const EdgeInsets.symmetric(
                                        vertical: 15, horizontal: 5),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          snapshot.data![index].name,
                                          style: const TextStyle(
                                              fontSize: 20,
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          snapshot.data![index].representante,
                                          style: const TextStyle(fontSize: 15),
                                        ),
                                        SizedBox(height: 15),
                                        Row(
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            GestureDetector(
                                              onTap: () {
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (BuildContext) => EditMoto(
                                                            motos: snapshot
                                                                .data![
                                                            index])));
                                              },
                                              child: Container(
                                                child: const Icon(
                                                    Icons.edit,
                                                  size: 20,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    )
                                )
                            )
                    );
                  },
                ),
              )
            ],
          ),
        ));
  }
}
