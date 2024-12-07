import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'drop_down_menu.dart';

enum Currency {
  
  euro(0.95),
  khr(4009.77),
  yuan(7.25);

  final double value;
  const Currency(this.value);
}
 
class DeviceConverter extends StatefulWidget {
  const DeviceConverter({super.key});

  @override
  State<DeviceConverter> createState() => _DeviceConverterState();
}

class _DeviceConverterState extends State<DeviceConverter> {

  TextEditingController _inputController =  TextEditingController();
  double displayValue = 0;
  Currency selectedCurrency = Currency.euro;
 
  final BoxDecoration textDecoration = BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(12),
  );
 

  @override
  void initState() {
    super.initState();
  }

  void changeCurrency(Currency currency){
    setState(() {
     selectedCurrency = currency;
    });
    updateResult();
  }
  void updateResult(){
    
    setState(() {
    displayValue = _inputController.text.isEmpty
    ? 0
    : double.parse(_inputController.text) * selectedCurrency.value;
    });
  }
 
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(40.0),
      child: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Icon(
            Icons.money,
            size: 60,
            color: Colors.white,
          ),
          const Center(
            child: Text(
              "Converter",
              style: TextStyle(color: Colors.white, fontSize: 30),
            ),
          ),
          const SizedBox(height: 50),
          const Text("Amount in dollars:"),
          const SizedBox(height: 10),

          TextField(
             inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
            ],
            onChanged: (value) {
              updateResult();
            },
            controller: _inputController,
              decoration: InputDecoration(
                  prefix: const Text('\$ '),
                  enabledBorder: OutlineInputBorder(
                    borderSide:
                        const BorderSide(color: Colors.white, width: 1.0),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  hintText: 'Enter an amount in dollar',
                  hintStyle: const TextStyle(color: Colors.white)),
              style: const TextStyle(color: Colors.white)),

          const SizedBox(height: 30),
          DropDownMenu(selectedCurrency: selectedCurrency, trigger:  changeCurrency),
          const SizedBox(height: 30),
          const Text("Amount in selected device:"),
          const SizedBox(height: 10),
          Container(
              padding: const EdgeInsets.all(10),
              decoration: textDecoration,
              child:  Text("$displayValue"))
        ],
      )),
    );
  }
}
