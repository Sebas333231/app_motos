import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:motos_strapi_v1/pages/user.dart';


class ShowUser extends StatefulWidget {
  const ShowUser({Key? key}) : super(key: key);

  @override
  State<ShowUser> createState() => _ShowUserState();
}

class _ShowUserState extends State<ShowUser> {
  List<Users> user = [];
  Future<List<Users>> getAll() async {
    const String url = "http://localhost:65200/api/usuarios/";
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      user.clear();
    }

    Map<String, dynamic> decodeData = jsonDecode(response.body);
    Iterable usuariosData = decodeData.values;

    for (var item in usuariosData.elementAt(0)) {
      user.add(Users(
          item['id'],
          item['attributes']['name'],
          item['attributes']['email'],
          item['attributes']['password'],
          item['attributes']['tipo']));
    }

    return user;
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
        title: Text('Usuarios registrados'),
      ),
      body: Container(
        child: Column(
          children: [
            Expanded(
              child: FutureBuilder(
                future: getAll(),
                builder: (context, AsyncSnapshot<List<Users>> snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  return ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (BuildContext context, index) =>
                          GestureDetector(
                            onTap: () {},
                            child: Container(
                              margin: EdgeInsets.symmetric(
                                  vertical: 5, horizontal: 5),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    snapshot.data![index].name,
                                    style: const TextStyle(
                                        fontSize: 20,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    snapshot.data![index].email,
                                    style: const TextStyle(
                                      fontSize: 15,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
