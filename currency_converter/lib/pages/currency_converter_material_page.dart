// import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class CurrencyConverterMaterialPage extends StatefulWidget {
  const CurrencyConverterMaterialPage({super.key});

  @override
  State<CurrencyConverterMaterialPage> createState() {
    return _CurrencyConverterMaterialPageState();
  }
}

class _CurrencyConverterMaterialPageState extends State<CurrencyConverterMaterialPage> {
  late double inputAmout;
  final TextEditingController textEditingController = TextEditingController();

  void convert() {               
    // print(inputAmout!*33);
    setState(() {
      if(textEditingController.text != "") {
        inputAmout = double.parse(textEditingController.text);
      }
      else {
        inputAmout = 0;
      }
    });
  }

  @override
  void initState() {
    super.initState();
    inputAmout = 0;
  }
  
  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    const boderInputStyle = OutlineInputBorder(
      borderSide: BorderSide(
        style: BorderStyle.none,
      ),
      borderRadius: BorderRadius.all(Radius.circular(12)),
    );

    return Scaffold(
      backgroundColor: const Color.fromRGBO(5, 6, 61, 1),
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(5, 6, 61, 1),
        elevation: 0,
        title: const Text(
          "Currency Converter", 
          style: TextStyle(
            fontSize: 25,
            color: Colors.amber,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
             Text(
              "${(inputAmout*33).toStringAsFixed(2)} THB", 
              style: const TextStyle(
                fontSize: 25,
                color: Colors.amber,
                fontWeight: FontWeight.bold,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15),
              child: TextField(
                controller: textEditingController, 
                keyboardType: const TextInputType.numberWithOptions(
                  decimal: true,
                ),
                style: const TextStyle(
                  color: Color.fromRGBO(5, 6, 61, 1),
                ),
                decoration: const InputDecoration(
                  hintText: "Enter USD",
                  hintStyle: TextStyle(
                    color: Color.fromARGB(255, 0, 0, 0),
                  ),
                  suffixIcon: Icon(Icons.monetization_on),
                  suffixIconColor: Colors.blueGrey,
                  filled: true,
                  fillColor: Colors.amber,
                  focusedBorder: boderInputStyle,
                  enabledBorder: boderInputStyle,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: TextButton(
                onPressed: convert, 
                style: TextButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.black,
                  minimumSize: const Size(double.infinity,50),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10))
                  ),
                ),
                child: const Text("Convert"),
              ),
            )
          ],
        )
      ) 
    );
  }
}


