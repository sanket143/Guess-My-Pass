import 'dart:math';
import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  List<int> numbers = [0, 0, 0, 0];
  List<int> pass = [0, 0, 0, 0];
  Random rng = new Random();
  bool isGameFinished = false;

  void generatePass(){
    for(var i = 0; i < 4; i++){
      pass[i] = rng.nextInt(10);
    }
    print(pass);
  }

  bool findNum(){
    var temp = pass;
    for(var i = 0; i < 4; i++){
      for(var j = 0; j < 4; j++){
        if(numbers[i] == temp[j]){
          if(i == j){

          }
        }
      }
    }
  }

  void test(){
    for(var i = 0; i < 4; i++){
      print(pass.where((item) => item == numbers[i]));
    }
  }

  @override
  void initState() {
    generatePass();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget> [
          SizedBox(
            height: 10,
          ),
          Container(
            height: 200,
            child: Center(
              child: Text(
                "GUESS MY PASS!",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold
                ),
              )
            )
          ),
          SizedBox(
            height: 100,
          ),
          Container(
            child: Center(
              child: Text(
                "1 0 1 1",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w700
                )
              )
            )
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            height: 150,
            child: GridView.builder(
              itemCount: this.numbers.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4
              ),
              itemBuilder: (BuildContext context, int index){
                return Container(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      onTap: (){
                        print(index);
                        setState((){
                          this.numbers[index] = (this.numbers[index] + 1) % 10;
                        });
                      },
                      child: Card(
                        color: Colors.blue,

                        child: Center(
                          child: Text(
                            numbers[index].toString(),
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20
                            )
                          )
                        )
                      ),
                    ),
                  ),
                );
              }
            ),
          ),
          Container(
            child: RaisedButton(
              onPressed: test,
              color: isGameFinished ? Colors.blueAccent : Colors.blue,
              child: Text(
                isGameFinished ? "Play Again" : "Test",
                style: TextStyle(
                  color: Colors.white
                )
              )
            ),
          )
        ]
      ),
    );
  }
}