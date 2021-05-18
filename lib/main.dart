import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String dropDownOperator;
  double hasilKalkulator = 0;
  List<double> numberList = [];
  String listAngka = "";
  String hasilShare = "";
  TextEditingController myController = TextEditingController();

  void basePrint() {
    print("Clicked");
  }

  void shareFunction() {
    String tempName = myController.text;
    setState(() {
      hasilShare = tempName + " " + hasilKalkulator.toString();
    });
  }

  void calculate() {
    double temp = 0;
    if (dropDownOperator == "+" || dropDownOperator == null) {
      for (var i = 0; i < numberList.length; i++) {
        temp += numberList[i];
      }
    } else if (dropDownOperator == "-") {
      for (var i = 0; i < numberList.length; i++) {
        temp -= numberList[i];
      }
    } else if (dropDownOperator == "*") {
      for (var i = 0; i < numberList.length; i++) {
        temp *= numberList[i];
      }
    } else {
      for (var i = 0; i < numberList.length; i++) {
        temp /= numberList[i];
      }
    }
    setState(() {
      hasilKalkulator = temp;
      listAngka = "";
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Container(
            margin: EdgeInsets.all(50),
            child: ListView(
              children: <Widget>[
                Container(
                  width: double.infinity,
                  height: 80,
                  color: Colors.black,
                  child: Text(
                    listAngka,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 34,
                    ),
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  // crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          ElevatedButton(
                              onPressed: () {
                                print("1");
                                setState(() {
                                  listAngka = listAngka + "1";
                                  numberList.add(1);
                                });
                              },
                              child: Text("1")),
                          ElevatedButton(
                              onPressed: () {
                                print("2");
                                setState(() {
                                  listAngka = listAngka + "2";
                                  numberList.add(2);
                                });
                              },
                              child: Text("2")),
                          ElevatedButton(
                              onPressed: () {
                                print("3");
                                setState(() {
                                  listAngka = listAngka + "3";
                                  numberList.add(3);
                                });
                              },
                              child: Text("3")),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          ElevatedButton(
                              onPressed: () {
                                print("4");
                                setState(() {
                                  listAngka = listAngka + "4";
                                  numberList.add(4);
                                });
                              },
                              child: Text("4")),
                          ElevatedButton(
                              onPressed: () {
                                print("5");
                                setState(() {
                                  listAngka = listAngka + "5";
                                  numberList.add(5);
                                });
                              },
                              child: Text("5")),
                          ElevatedButton(
                              onPressed: () {
                                print("6");
                                setState(() {
                                  listAngka = listAngka + "6";
                                  numberList.add(6);
                                });
                              },
                              child: Text("6")),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          ElevatedButton(
                              onPressed: () {
                                print("7");
                                setState(() {
                                  listAngka = listAngka + "7";
                                  numberList.add(7);
                                });
                              },
                              child: Text("7")),
                          ElevatedButton(
                              onPressed: () {
                                print("8");
                                setState(() {
                                  listAngka = listAngka + "8";
                                  numberList.add(8);
                                });
                              },
                              child: Text("8")),
                          ElevatedButton(
                              onPressed: () {
                                print("9");
                                setState(() {
                                  listAngka = listAngka + "9";
                                  numberList.add(9);
                                });
                              },
                              child: Text("9")),
                        ],
                      ),
                    ),
                    OutlinedButton(onPressed: calculate, child: Text("=")),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("Hasil hitung: $hasilKalkulator"),
                ),
                DropdownButton<String>(
                  isExpanded: true,
                  value: dropDownOperator,
                  onChanged: (value) {
                    setState(() {
                      dropDownOperator = value;
                    });
                  },
                  items: <String>["+", "-", "*", "/"]
                      .map<DropdownMenuItem<String>>((e) {
                    return DropdownMenuItem<String>(
                      value: e,
                      child: Text(e),
                    );
                  }).toList(),
                ),
                TextField(
                  controller: myController,
                  decoration: InputDecoration(
                    labelText: "Input Name Here",
                  ),
                ),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: OutlinedButton(
                          onPressed: shareFunction, child: Text("Share")),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("Hasil share: $hasilShare"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void dispose() {
    myController.dispose();
    super.dispose();
  }
}
