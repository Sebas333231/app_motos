import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class VistaTablet extends StatelessWidget {
  String name;
  String foto;
  String modelo;
  String representante;
  String precio;
  String foto1;
  String foto2;

  VistaTablet({Key? key, required this.name,
    required this.foto,
    required this.modelo,
    required this.precio,
    required this.representante,
    required this.foto1,
    required this.foto2}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List motos = [
      name,modelo,foto, foto1,foto2,representante,precio
    ];


    final List images = [foto, foto1, foto2];

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          elevation: 0,
          title: Text(
            name,
            style: const TextStyle(
                fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
        backgroundColor: Colors.black,
        body: SingleChildScrollView(
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CarouselSlider(
                    items: images
                        .map((item) => Container(
                      width: 450,
                      height: 250,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: NetworkImage(
                                item,
                              ),
                              fit: BoxFit.cover
                          ),
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: const[
                            BoxShadow(
                              color: Colors.white,
                              offset: Offset(
                                3.0,
                                3.0,
                              ),
                              blurRadius: 4.0,
                              spreadRadius: 2.0,
                            ), //BoxShadow
                            BoxShadow(
                              color: Colors.white,
                              offset: Offset(0.0, 0.0),
                              blurRadius: 0.0,
                              spreadRadius: 0.0,
                            ), //BoxShadow
                          ]
                      ),
                    ))
                        .toList(),
                    options: CarouselOptions(
                        autoPlay: true, aspectRatio: 2.3, enlargeCenterPage: true)),
                Padding(
                  padding: EdgeInsets.only(top: 40, left: 15),
                  child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(bottom: 8),
                          child: Row(
                            children: [
                              RatingBar.builder(
                                initialRating: 5,
                                unratedColor: Colors.white,
                                minRating: 1,
                                direction: Axis.horizontal,
                                itemCount: 5,
                                itemSize: 15,
                                itemPadding: const EdgeInsets.symmetric(
                                    horizontal: 4),
                                itemBuilder: (context, _) => const Icon(
                                    Icons.favorite,
                                    color: Colors.red),
                                onRatingUpdate: (index) {},
                              ),
                              const Text(
                                'Calificacion',
                                style: TextStyle(
                                    fontSize: 11, color: Colors.white),
                              )
                            ],
                          ),
                        ),
                        Text(
                          'Modelo: ' + modelo,
                          style: TextStyle(color: Colors.white, fontSize: 17),
                        ),
                        Text(
                          'Represemtante: ' + representante,
                          style: TextStyle(color: Colors.white, fontSize: 17),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 90),
                          child: Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                GestureDetector(
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
                                      child:  Padding(
                                        padding: EdgeInsets.only(top: 11),
                                        child: Text(
                                          precio,
                                          style: const TextStyle(
                                              color: Colors.white,
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
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        )
    );
  }
}

