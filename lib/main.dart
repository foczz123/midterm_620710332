import 'package:flutter/material.dart';
import 'package:midterm_620710332/Pig_weight_calculator.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pig Weight Calculator',
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
  var pig = Game();
  final _controller = TextEditingController();
  final _controller2 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/bg.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Column(
                  children: [
                    Text("PIG WEIGHT",
                        style: TextStyle(
                            fontSize: 40.0,
                            color: Colors.pink,
                            fontWeight: FontWeight.bold)),
                    Text("CALCULATOR",
                        style: TextStyle(
                            fontSize: 40.0,
                            color: Colors.pink,
                            fontWeight: FontWeight.bold)),
                    SizedBox(height: 60.0),
                    Image.asset('assets/images/pig.png', height: 200),
                    SizedBox(height: 50.0),
                  ],
                ),
                Row(
                  children: [
                    Container(
                      child: Expanded(
                        child: TextField(
                          textAlign: TextAlign.center,
                          controller: _controller,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            filled: true,
                            fillColor: Colors.white.withOpacity(0.7),
                            labelText: 'LENGTH \n (cm)',
                            hintText: 'Enter length',
                          ),
                        ),
                      ),
                    ),
                    Container(
                      child: Expanded(
                        child: TextField(
                          textAlign: TextAlign.center,
                          controller: _controller2,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            filled: true,
                            fillColor: Colors.white.withOpacity(0.7),
                            labelText: 'GIRTH \n (cm)',
                            hintText: 'Enter girth',

                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(50),
                      child: SizedBox(
                        height: 45.0,
                        width: 130,
                        child: TextButton(
                          child:
                              Text('CALCULATE', style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold)),
                          style: TextButton.styleFrom(
                              primary: Colors.white,
                              backgroundColor: Colors.pink),
                          onPressed: () {
                            var input = _controller.text;
                            var input2 = _controller2.text;
                            var length = double.tryParse(input);
                            var girth = double.tryParse(input2);
                            if (length == null || girth ==null) {
                              showDialog(
                                  context: context,
                                  barrierDismissible: false,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      title: Text('ERROR'),
                                      content: Text('Invalid input', style: TextStyle(fontWeight: FontWeight.bold)),
                                      actions: [
                                        ElevatedButton(
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                          child: Text('OK'),
                                        )
                                      ],
                                    );
                                  });
                            }
                            var result = pig.calWeight(girth!, length!);
                            var price = pig.calPrice(result);
                            var minusResult =
                                (result + (result * (-0.03))).round();
                            var plusResult =
                                (result + (result * (0.03))).round();
                            var minusPrice =
                                (price + (price * (-0.03))).round();
                            var plusPrice = (price + (price * (0.03))).round();
                            showDialog(

                                context: context,
                                barrierDismissible: false,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: Image.asset("assets/images/ic_pig.png" , height: 40 ),
                                    content: Text(
                                        'Weight: $minusResult - $plusResult Kg \n\nPrice: $minusPrice - $plusPrice Baht',style: TextStyle(fontWeight: FontWeight.bold)),
                                    actions: [
                                      ElevatedButton(
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                        child: Text('OK'),
                                      )
                                    ],
                                  );
                                });
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
