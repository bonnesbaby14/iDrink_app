import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class HomePage2 extends StatefulWidget {
  const HomePage2({Key? key,  required this.name,}) : super(key: key);
    final String name;
  @override
  // ignore: library_private_types_in_public_api
  _HomePageState2 createState() => _HomePageState2();
}

class _HomePageState2 extends State<HomePage2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 223, 17, 17),
      appBar: AppBar(
        backgroundColor: Colors.white,
       
        elevation: 0,
       
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius:
                        BorderRadius.vertical(bottom: Radius.circular(30))),
                padding: const EdgeInsets.all(20.0),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Find Your',
                      style: TextStyle(color: Colors.black87, fontSize: 25),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      'Drink',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 40,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                  
                    SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    const Text(
                      'Promo Today',
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    SizedBox(
                      height: 200,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: <Widget>[
                          GestureDetector(
                            onTap: () async {
                              // Agrega aquí la acción que deseas realizar
                              final response = await http.post(
                                Uri.parse(
                                    'https://idrink-api-prod-idrink-api-fqemyp.mo2.mogenius.io/serve'),
                                headers: {
                                  'Content-Type': 'application/json',
                                },
                                body: jsonEncode({
                                  'drink': 'greyhound',
                                  'user': 'tu_usuario'
                                }),
                              );

                              print(response.statusCode);
                              print(response.body);
                              if (response.statusCode == 200) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        content: Text('Sirviendo...')));
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        content: Text(
                                            'El servicio no esta disponible...')));
                              }
                            },
                            child: promoCard('assets/images/one.jpg'),
                          ),
                          GestureDetector(
                            onTap: () async {
                              final response = await http.post(
                                Uri.parse(
                                    'https://idrink-api-prod-idrink-api-fqemyp.mo2.mogenius.io/serve'),
                                headers: {
                                  'Content-Type': 'application/json',
                                },
                                body: jsonEncode({
                                  'drink': 'tequila_sunrise',
                                  'user': 'tu_usuario'
                                }),
                              );

                              
                              if (response.statusCode == 200) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        content: Text('Sirviendo...')));
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        content: Text(
                                            'El servicio no esta disponible...')));
                              }
                            },
                            child: promoCard('assets/images/two.jpg'),
                          ),
                          GestureDetector(
                            onTap: () async {
                              // Agrega aquí la acción que deseas realizar
                              final response = await http.post(
                                Uri.parse(
                                    'https://idrink-api-prod-idrink-api-fqemyp.mo2.mogenius.io/serve'),
                                headers: {
                                  'Content-Type': 'application/json',
                                },
                                body: jsonEncode({
                                  'drink': 'desarmador',
                                  'user': 'tu_usuario'
                                }),
                              );

                             
                              if (response.statusCode == 200) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        content: Text('Sirviendo...')));
                              } else {
                                // ignore: use_build_context_synchronously
                                ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        content: Text(
                                            'El servicio no esta disponible...')));
                              }
                            },
                            child: promoCard('assets/images/three.jpg'),
                          ),
                          GestureDetector(
                            onTap: () async {
                              // Agrega aquí la acción que deseas realizar
                              final response = await http.post(
                                Uri.parse(
                                    'https://idrink-api-prod-idrink-api-fqemyp.mo2.mogenius.io/serve'),
                                headers: {
                                  'Content-Type': 'application/json',
                                },
                                body: jsonEncode({
                                  'drink': 'cosmopolitan',
                                  'user': 'tu_usuario'
                                }),
                              );

                              
                              if (response.statusCode == 200) {
                                // ignore: use_build_context_synchronously
                                ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        content: Text('Sirviendo...')));
                              } else {
                                // ignore: use_build_context_synchronously
                                ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        content: Text(
                                            'El servicio no esta disponible...')));
                              }
                            },
                            child: promoCard('assets/images/four.jpg'),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      height: 150,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        image: const DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage('assets/images/five.jpg')),
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          gradient: LinearGradient(
                              begin: Alignment.bottomRight,
                              stops: const [
                                0.3,
                                0.9
                              ],
                              colors: [
                                Colors.black.withOpacity(.8),
                                Colors.black.withOpacity(.2)
                              ]),
                        ),
                        child: const Align(
                          alignment: Alignment.bottomLeft,
                          child: Padding(
                            padding: EdgeInsets.all(15.0),
                            child: Text(
                              'Best Flavour',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget promoCard(image) {
    return AspectRatio(
      aspectRatio: 2.62 / 3,
      child: Container(
        margin: const EdgeInsets.only(right: 15.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          image: DecorationImage(fit: BoxFit.cover, image: AssetImage(image)),
        ),
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              gradient: LinearGradient(begin: Alignment.bottomRight, stops: const [
                0.1,
                0.9
              ], colors: [
                Colors.black.withOpacity(.8),
                Colors.black.withOpacity(.1)
              ])),
        ),
      ),
    );
  }
}
