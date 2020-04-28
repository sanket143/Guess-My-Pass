import 'dart:math';
import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  List<int> numbers = [0, 0, 0, 0];
  List<int> pass = [0, 0, 0, 0];
  List<int> indicator = [];
  int lives = 10;
  Random rng = new Random();
  bool isGameFinished = false;

  void generatePass(){
    for(var i = 0; i < 4; i++){
      pass[i] = rng.nextInt(6);
    }
    print(pass);
  }

  void test(){
    List<int> temp = List.from(pass.cast());
    List<int> tempIndi = [];
    print(pass);
    for(var i = 0; i < 4; i++){
      if(numbers[i] == temp[i]){
        tempIndi.add(1);
        temp[i] = -1;
      }
    }
    for(var i = 0; i < 4; i++){
      for(var j = 0; j < 4; j++){
        if(numbers[i] == temp[j]){
          tempIndi.add(0);
          temp[j] = -1;
        }
      }
    }

    setState(() {
      if(tempIndi.join(" ") == "1 1 1 1"){
        isGameFinished = true;
      }
      indicator = tempIndi;
    });
  }

  @override
  void initState() {
    generatePass();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
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
                  fontWeight: FontWeight.bold,
                  color: Colors.white
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
                "TRIES: $lives",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 28
                )
              )
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            child: Center(
              child: Text(
                indicator.join(" "),
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w700,
                  color: Colors.white
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
                          this.numbers[index] = (this.numbers[index] + 1) % 6;
                        });
                      },
                      child: Card(
                        color: Colors.white,

                        child: Center(
                          child: Text(
                            numbers[index].toString(),
                            style: TextStyle(
                              color: Colors.black,
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
              color: isGameFinished ? Colors.blueAccent : Colors.white,
              child: Text(
                isGameFinished ? "Play Again" : "Test",
                style: TextStyle(
                  color: Colors.black
                )
              )
            ),
          )
        ]
      ),
    );
  }
}