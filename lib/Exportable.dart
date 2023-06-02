import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:carousel_slider/carousel_slider.dart';

import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as path;

class Exportable extends StatefulWidget {
  const Exportable({Key? key, required this.name}) : super(key: key);
  final String name;

  @override
  // ignore: library_private_types_in_public_api
  _ExportableState createState() => _ExportableState();
}

class _ExportableState extends State<Exportable> {
  List<String> imageUrls = [];

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    // Cancelar cualquier temporizador o animación activa aquí
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
                      'Exportables',
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
              CarouselSlider.builder(
                itemCount: 2, // Cambiar a 2 para mostrar solo dos tarjetas
                itemBuilder: (BuildContext context, int index, int realIndex) {
                  // Definir los nombres de los assets y los textos para cada tarjeta
                  List<String> imageAssets = [
                    'assets/images/excel.png',
                    'assets/images/excel.png',
                  ];
                  List<String> texts = [
                    'Exportar Consumos',
                    'Exportar Historial de status',
                  ];
                  List<String> urls = [
                    'https://idrink-api-prod-idrink-api-fqemyp.mo2.mogenius.io/export_orders',
                    'https://idrink-api-prod-idrink-api-fqemyp.mo2.mogenius.io/export_status',
                  ];

                  return Card(
                    child: Column(
                      children: [
                        SizedBox(height: 20),
                        Image.asset(
                          imageAssets[index],
                          width: 280,
                          fit: BoxFit
                              .contain, // Ajustar la imagen dentro del contenedor
                        ),
                        SizedBox(
                            height: 5), // Espacio entre la imagen y el texto
                        Text(
                          texts[index],
                          style: const TextStyle(
                            fontSize: 20, // Tamaño del texto
                            fontWeight: FontWeight.bold, // Negrita del texto
                            color: Colors.black, // Color del texto
                          ),
                        ),
                        SizedBox(
                            height: 5), // Espacio adicional después del texto
                        ElevatedButton(
                          onPressed: () async {
                            String url =
                                urls[index]; // URL del archivo a descargar
                            final response = await http.get(Uri.parse(url));

                            if (response.statusCode == 200) {
                              final directory =
                                  await getExternalStorageDirectory();
                              String fileName = path.basename(
                                  url); // Obtener el nombre del archivo con extensión
                              String filePath = '${directory!.path}/$fileName.xlsx';

                              File file = File(filePath);
                              await file.writeAsBytes(response.bodyBytes);

                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                      'Archivo descargado y guardado en: $filePath'),
                                ),
                              );
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content:
                                      Text('Error al descargar el archivo.'),
                                ),
                              );
                            }
                          },
                          child: Text('Descargar'),
                        ),
                      ],
                    ),
                  );
                },
                options: CarouselOptions(
                  height: 450,
                  enlargeCenterPage: true,
                  autoPlay: true,
                  autoPlayInterval: const Duration(seconds: 3),
                  onPageChanged: (index, reason) {
                    // Acciones al cambiar de página en el carousel
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: const Exportable(name: 'Graphics'),
  ));
}
