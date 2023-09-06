import "package:flutter/cupertino.dart";

class CurrencyConvertCupertinoPage extends StatefulWidget {
  const CurrencyConvertCupertinoPage({super.key});

  @override
  State<CurrencyConvertCupertinoPage> createState() => _CurrencyConvertCupertinoPageState();
}

class _CurrencyConvertCupertinoPageState extends State<CurrencyConvertCupertinoPage> {
  double inputAmout = 0;
  final TextEditingController textEditingController = TextEditingController();

  void convert() {               
    // print(inputAmout!*33);
    setState(() {
      inputAmout = double.parse(textEditingController.text);
    });
  }

  @override
  Widget build(BuildContext context) {

    // const boderInputStyle = OutlineInputBorder(
    //   borderSide: BorderSide(
    //     style: BorderStyle.none,
    //   ),
    //   borderRadius: BorderRadius.all(Radius.circular(12)),
    // );

    return CupertinoPageScaffold(
      backgroundColor: const Color.fromRGBO(5, 6, 61, 1),
      navigationBar: const CupertinoNavigationBar(
        backgroundColor: Color.fromRGBO(5, 6, 61, 1),
        middle: Text(
          "Currency Converter", 
          style: TextStyle(
            fontSize: 25,
            color: CupertinoColors.activeOrange,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
            Text(
            "${(inputAmout*33).toStringAsFixed(2)} THB", 
            style: const TextStyle(
              fontSize: 25,
              color: CupertinoColors.activeOrange,
              fontWeight: FontWeight.bold,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15),
            child: CupertinoTextField(
              controller: textEditingController, 
              keyboardType: const TextInputType.numberWithOptions(
                decimal: true,
              ),
              style: const TextStyle(
                color: Color.fromRGBO(255, 255, 255, 1),
              ),
              suffix: const Icon(CupertinoIcons.money_dollar),
              decoration: BoxDecoration(
                border: Border.all(),
                borderRadius: BorderRadius.circular(12),
                color: CupertinoColors.activeOrange,
              ),
              placeholder: "Enter USD dollar amount",
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: CupertinoButton(
              onPressed: convert, 
              color: CupertinoColors.white,
              child: const Text("Convert",
              style: TextStyle(
                color: CupertinoColors.black,
              )
              ),
            ),
          )
        ],
      )
    );
  }
}