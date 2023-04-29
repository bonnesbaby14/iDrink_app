import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


void main() {
  runApp(MaterialApp(
    title: 'iDrink',
    home: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('iDrink'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () async {
                final response = await http
                    .get(Uri.parse('https://idrink-api-prod-idrink-api-fqemyp.mo2.mogenius.io/serve/greyhound'));
                if (response.statusCode == 200) {
                  ScaffoldMessenger.of(context)
                      .showSnackBar(const SnackBar(content: Text('Sirviendo...')));
                }
              },
              child: const Text('Greyhound'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () async {
                final response = await http
                    .get(Uri.parse('https://idrink-api-prod-idrink-api-fqemyp.mo2.mogenius.io/serve/tequila_sunrise'));
                if (response.statusCode == 200) {
                  ScaffoldMessenger.of(context)
                      .showSnackBar(const SnackBar(content: Text('Sirviendo...')));
                }
              },
              child: const Text('Tequila Sunrise'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () async {
                final response = await http
                    .get(Uri.parse('https://idrink-api-prod-idrink-api-fqemyp.mo2.mogenius.io/serve/desarmador'));
                if (response.statusCode == 200) {
                  ScaffoldMessenger.of(context)
                      .showSnackBar(const SnackBar(content: Text('Sirviendo...')));
                }
              },
              child: const Text('Desarmador'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () async {
                final response = await http
                    .get(Uri.parse('https://idrink-api-prod-idrink-api-fqemyp.mo2.mogenius.io/serve/cosmopolitan'));
                if (response.statusCode == 200) {
                  ScaffoldMessenger.of(context)
                      .showSnackBar(const SnackBar(content: Text('Sirviendo...')));
                }
              },
              child: const Text('Cosmopolitan'),
            ),
          ],
        ),
      ),
    );
  }
}
