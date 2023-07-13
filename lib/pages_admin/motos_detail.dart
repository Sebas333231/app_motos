import 'package:flutter/material.dart';
import 'show_motos.dart';
import 'package:http/http.dart' as http;
import 'package:motos_strapi_v1/pages/motos.dart';


class DeleteMotos extends StatefulWidget {
  final Motos motos;
  const DeleteMotos({Key? key, required this.motos}) : super(key: key);

  @override
  State<DeleteMotos> createState() => _DeleteMotosState();
}

class _DeleteMotosState extends State<DeleteMotos> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(

    );
  }
}
