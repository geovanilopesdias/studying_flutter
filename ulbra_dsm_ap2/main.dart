import 'package:flutter/material.dart';
import 'input_page.dart';

void main() {
  runApp(BMICalculator());
}

class BMICalculator extends StatelessWidget {
  const BMICalculator({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
                title: const Text(
              'BMI Calculator',
              style: TextStyle(
                  color: Colors.lightGreen,
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold),
            )),
            body: const HomeScreen()));
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      const Text('An app to help with your BMI calculation!'),
      ElevatedButton(
        onPressed: () {
          _goToInputPage(context);
        },
        child: const Center(
          child: Text('Let\'s get started!'),
        ),
      ),
    ]);
  }

  void _goToInputPage(BuildContext context) {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => InputPage(),
        ));
  }
}
