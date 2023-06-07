import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:carousel_slider/carousel_slider.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class Status extends StatefulWidget {
  const Status({Key? key, required this.name}) : super(key: key);
  final String name;

  @override
  _StatusState createState() => _StatusState();
}

class _StatusState extends State<Status> {
  Map<String, double> waterLevels = {};
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchWaterLevels();
  }

  @override
  void dispose() {
    super.dispose();
    // Cancelar cualquier temporizador o animación activa aquí
  }

  Future<void> fetchWaterLevels() async {
    final response = await http.get(Uri.parse(
        'https://idrink-api-prod-idrink-api-fqemyp.mo2.mogenius.io/status'));
    if (response.statusCode == 200) {
      final Map<String, dynamic> data = jsonDecode(response.body)["data"];
      data.remove("created_at");
      data.remove("id");
      setState(() {
        waterLevels = {};
        data.forEach((key, value) {
          try {
            double waterLevel =
                double.parse(value) / 25.0; // Adaptar el valor al rango 0 - 1
            waterLevels[key] = waterLevel;
          } catch (e) {
            print('Error al convertir el valor $value a double: $e');
          }
        });
        isLoading = false;
      });
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
                      BorderRadius.vertical(bottom: Radius.circular(30)),
                ),
                padding: const EdgeInsets.all(20.0),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Find Your',
                      style: TextStyle(color: Colors.black87, fontSize: 25),
                    ),
                    SizedBox(height: 5),
                    Text(
                      'Status',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 20),
                    SizedBox(height: 10),
                  ],
                ),
              ),
              SizedBox(height: 20),
              isLoading
                  ? Center(child: CircularProgressIndicator())
                  : CarouselSlider.builder(
                      itemCount: waterLevels.length,
                      itemBuilder:
                          (BuildContext context, int index, int realIndex) {
                        String bottleName = waterLevels.keys.elementAt(index);
                        double waterLevel = waterLevels[bottleName]!;
                        Color backgroundColor =
                            index % 2 == 0 ? Colors.blue : Colors.green;
                        Color textColor = Colors.white;

                        return Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          color: backgroundColor,
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                CircularPercentIndicator(
                                  radius: 100.0,
                                  lineWidth: 15.0,
                                  percent: waterLevel,
                                  center: Text(
                                    (waterLevel * 100).toStringAsFixed(0) + "/100%",
                                    style: TextStyle(
                                      fontSize: 10,
                                      fontWeight: FontWeight.bold,
                                      color: textColor,
                                    ),
                                  ),
                                  progressColor: textColor,
                                ),
                                SizedBox(height: 20),
                                Text(
                                  'Nivel de $bottleName',
                                  style: TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                    color: textColor,
                                  ),
                                ),
                                SizedBox(height: 5),
                              ],
                            ),
                          ),
                        );
                      },
                      options: CarouselOptions(
                        height: 400,
                        enlargeCenterPage: true,
                        autoPlay: true,
                        autoPlayInterval: const Duration(seconds: 3),
                        onPageChanged: (index, reason) {
                          fetchWaterLevels();
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
