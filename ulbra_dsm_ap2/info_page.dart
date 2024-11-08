import 'package:flutter/material.dart';

double dataFontSize = 25.0;
double meaningFontSize = 15.0;

class InfoPage extends StatelessWidget {
  const InfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: const Center(
                child: Text('BMI Cathegories',
                    style: TextStyle(
                      color: Colors.lightGreen,
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                    ))),
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center, 
              crossAxisAlignment:
                  CrossAxisAlignment.start, 
              mainAxisSize: MainAxisSize
                  .min, 

              children: [
                const Text('Below 18.5',
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                const Text('It means you\'re underweight',
                    style:
                        TextStyle(fontSize: 18, fontStyle: FontStyle.italic)),
                const Text('Between 18.5 and 24.9',
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                const Text('It means you\'re healthy',
                    style:
                        TextStyle(fontSize: 18, fontStyle: FontStyle.italic)),
                const Text('Between 25 and 29.9',
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                const Text('It means you\'re overweighted',
                    style:
                        TextStyle(fontSize: 18, fontStyle: FontStyle.italic)),
                const Text('Between 30 and 39.9',
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                const Text('It means you\'re obese',
                    style:
                        TextStyle(fontSize: 18, fontStyle: FontStyle.italic)),
                const Text('Above 40',
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                const Text('It means you\'re severely obese',
                    style:
                        TextStyle(fontSize: 18, fontStyle: FontStyle.italic)),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('Back to calculation!'),
                ),
              ],
            ),
          )),
    );
  }
}
