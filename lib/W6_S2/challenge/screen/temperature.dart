import 'package:flutter/material.dart';
import 'package:fluttermain/W6_S2/EXERCISE-3/screen/welcome.dart';

class Temperature extends StatefulWidget {
  const Temperature({super.key});

  @override
  State<Temperature> createState() => _TemperatureState();
}

class _TemperatureState extends State<Temperature> {
  final BoxDecoration textDecoration = BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(12),
  );
  
  bool next = false;
  double fahrenheitValue = 0;

  final InputDecoration inputDecoration = InputDecoration(
      enabledBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.white, width: 1.0),
        borderRadius: BorderRadius.circular(12),
      ),
      hintText: 'Enter a temperature',
      hintStyle: const TextStyle(color: Colors.white));

  @override
  Widget build(BuildContext context) {
    void switchPage() {
      setState(() {
        next = !next;
      });
    }

    void convertToFahrenheit(double value) {      
      setState(() {
        fahrenheitValue = (value * (9 / 5)) + 32;
      });
    }

    return next
        ? Padding(
            padding: const EdgeInsets.all(40.0),
            child: Center(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Icon(
                  Icons.thermostat_outlined,
                  size: 120,
                  color: Colors.white,
                ),
                const Center(
                  child: Text(
                    "Converter",
                    style: TextStyle(color: Colors.white, fontSize: 45),
                  ),
                ),
                const SizedBox(height: 50),
                const Text("Temperature in Degrees:"),
                const SizedBox(height: 10),
                TextField(
                    keyboardType: TextInputType.number,
                    onChanged: (value) {
                      if (value.isNotEmpty) {
                        convertToFahrenheit(double.parse(value));
                      }
                    },
                    decoration: inputDecoration,
                    style: const TextStyle(color: Colors.white)),
                const SizedBox(height: 30),
                const Text("Temperature in Fahrenheit:"),
                const SizedBox(height: 10),
                Container(
                    padding: const EdgeInsets.all(10),
                    decoration: textDecoration,
                    child: Text(fahrenheitValue.toString()))
              ],
            )),
          )
        : Welcome(trigger: switchPage);
  }
}
