import 'package:flutter/material.dart';
import 'info_page.dart';

class InputPage extends StatelessWidget {
  const InputPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center, 
              crossAxisAlignment: CrossAxisAlignment.center, 
              mainAxisSize: MainAxisSize.min, 
              children: [
                const Text('BMI Calculation',
                      style: TextStyle(
                        color: Colors.lightGreen,
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                      )),
                IconButton(
                  icon: const Icon(Icons.info_outline, color: Colors.black),
                  onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => InfoPage(),
                    ) 
                  )
                ),
              ]
          ),)
        ),
        body: 
          const InputScreen(),
          
      ),
    );
  }
}

class InputScreen extends StatefulWidget {
  const InputScreen({super.key});

  @override
  State<InputScreen> createState() => _InputScreenState();
}

enum Gender { male, female }

class _InputScreenState extends State<InputScreen> {
  Gender? _gender = Gender.male;
  final weightController = TextEditingController();
  final heightController = TextEditingController();

  String? _bmiResult;

  String _setBMIInterpretation(bmi) {
    if (bmi < 18.5) {
      return 'underweight';
    } else if (18.5 <= bmi && bmi < 24.9) {
      return 'healthy';
    } else if (25 <= bmi && bmi < 29.9) {
      return 'overweighted';
    } else if (30 <= bmi && bmi < 39.9) {
      return 'obese';
    } else {
      return 'under severe obesity';
    }
  }

  void _calculateBMI() {
    final double? weight = double.tryParse(weightController.text);
    final double? height = double.tryParse(heightController.text);

    final dataIsntNull = weight != null && height != null;
    final dataValuesAreNormal = weight! > 3 && height! < 2.5;

    if (dataIsntNull && dataValuesAreNormal) {
      final double bmi = weight / (height * height);
      final interpretation = _setBMIInterpretation(bmi);

      setState(() {
        _bmiResult =
            'Your BMI is ${bmi.toStringAsFixed(2)} | You\'re $interpretation';
      });
    } else {
      setState(() {
        _bmiResult = 'Please enter valid numbers for weight and height';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        const Text('Select your gender:', style: TextStyle(fontSize: 20)),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            GestureDetector(
              onTap: () {
                setState(() {
                  _gender = Gender.male;
                });
              },
              child: Column(
                children: [
                  Icon(
                    Icons.male,
                    size: 50,
                    color: _gender == Gender.male ? Colors.blue : Colors.grey,
                  ),
                  Text('Male',
                      style: TextStyle(
                          color: _gender == Gender.male
                              ? Colors.blue
                              : Colors.grey)),
                ],
              ),
            ),
            const SizedBox(width: 30),
            GestureDetector(
              onTap: () {
                setState(() {
                  _gender = Gender.female;
                });
              },
              child: Column(
                children: [
                  Icon(
                    Icons.female,
                    size: 50,
                    color: _gender == Gender.female ? Colors.pink : Colors.grey,
                  ),
                  Text('Female',
                      style: TextStyle(
                          color: _gender == Gender.female
                              ? Colors.pink
                              : Colors.grey)),
                ],
              ),
            ),
          ],
        ),
        const Divider(color: Colors.lightGreen),
        const SizedBox(height: 20),
        const Text('Insert your weight and height below'),
        const SizedBox(height: 20),
        Row(
          children: <Widget>[
            Expanded(
              child: TextField(
                controller: weightController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Weight (kg)',
                ),
                keyboardType: TextInputType.number,
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: TextField(
                controller: heightController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Height (m)',
                ),
                keyboardType: TextInputType.number,
              ),
            ),
          ],
        ),
        const SizedBox(height: 20),
        if (_bmiResult != null)
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              _bmiResult!,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
        ElevatedButton(
          onPressed: _calculateBMI,
          child: Text(_bmiResult == null ? 'Calculate!' : 'Calculate Again'),
        ),
      ],
    );
  }
}
