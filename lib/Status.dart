import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:carousel_slider/carousel_slider.dart';

class Status  extends StatefulWidget {
  const Status({Key? key, required this.name}) : super(key: key);
  final String name;

  @override
  // ignore: library_private_types_in_public_api
  _StatusState createState() => _StatusState();
}

class _StatusState extends State<Status> {
  List<String> imageUrls = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchImages();
  }

  @override
  void dispose() {
    super.dispose();
    // Cancelar cualquier temporizador o animación activa aquí
  }

  Future<void> fetchImages() async {
    final List<String> urls = [
      'https://idrink-api-prod-idrink-api-fqemyp.mo2.mogenius.io/graphics_orders', // URL de la primera imagen
      'https://idrink-api-prod-idrink-api-fqemyp.mo2.mogenius.io/graphics_orders_users', // URL de la segunda imagen
      'https://idrink-api-prod-idrink-api-fqemyp.mo2.mogenius.io/graphics_status' // URL de la tercera imagen
    ];

    for (String url in urls) {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final Map<String, dynamic> data = jsonDecode(response.body);
        String imageUrl = data['image_base64'];
        setState(() {
          imageUrls.add(imageUrl);
          isLoading = false;
        });
      } else {
        print('Error en la solicitud HTTP');
      }
    }
  }

  Future<void> updateImages(int index) async {
    final List<String> urls = [
      'https://idrink-api-prod-idrink-api-fqemyp.mo2.mogenius.io/graphics_orders', // URL de la primera imagen
      'https://idrink-api-prod-idrink-api-fqemyp.mo2.mogenius.io/graphics_orders_users', // URL de la segunda imagen
      'https://idrink-api-prod-idrink-api-fqemyp.mo2.mogenius.io/graphics_status' // URL de la tercera imagen
    ];

    final response = await http.get(Uri.parse(urls[index]));
    if (response.statusCode == 200) {
      final Map<String, dynamic> data = jsonDecode(response.body);
      String imageUrl = data['image_base64'];
      if (mounted) {
        setState(() {
          imageUrls[index] = imageUrl;
        });
      }
    } else {
      print('Error en la solicitud HTTP');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(244, 243, 243, 1),
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
                      'Graphics',
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
              isLoading
                  ? Center(
                      child: CircularProgressIndicator(),
                    )
                  : CarouselSlider.builder(
                      itemCount: imageUrls.length,
                      itemBuilder: (BuildContext context, int index, int realIndex) {
                        String imageUrl = imageUrls[index];
                        Uint8List bytes = base64Decode(imageUrl.split(',')[1]);
                        return Image.memory(
                          bytes,
                          fit: BoxFit.contain, // Cambiar a BoxFit.contain para ajustar la imagen
                        );
                      },
                      options: CarouselOptions(
                        height: 400,
                        enlargeCenterPage: true,
                        autoPlay: true,
                        autoPlayInterval: const Duration(seconds: 3),
                        onPageChanged: (index, reason) {
                          updateImages(index);
                        },
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: const Status(name: 'Graphics'),
  ));
}
