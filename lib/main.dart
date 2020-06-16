import 'package:flutter/material.dart';

import './transactions.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
      primaryColor: Colors.black,
      accentColor: Colors.orange,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final List<Transaction>transactions = [
    Transaction(
      id:'t1',
      amount: 89.87,
      title: 'New Shoes',
      date: DateTime.now(),
    ),
    Transaction(
      id:'t2',
      amount: 8.87,
      title: 'Shoes',
      date: DateTime.now(),
    ),
    Transaction(
      id:'t3',
      amount: 9.87,
      title: 'New',
      date: DateTime.now(),
    ),
  ];


  @override
  Widget build(BuildContext context) {
  
    return Scaffold(
      appBar: AppBar(
        title: Text("Expenses"),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Card(
              child:Container(
                child: Text('You have pushed the button this many times:')
              ),
            ),
            Column(
              children: transactions.map((tx) {
                return Card(
                  child: Row(children: <Widget>[
                    Container(
                      margin: EdgeInsets.symmetric(
                        vertical: 10,
                        horizontal: 15,
                      ),
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(border: Border.all(color: Colors.black,width: 2,)),
                      child: Text(tx.amount.toString(),style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.purple),),
                    ),
                    Column(
                      crossAxisAlignment:CrossAxisAlignment.start ,
                      children:<Widget>[
                        Text(tx.title,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17,color: Colors.black)),
                        Text(tx.date.toString(),style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15,color: Colors.black26)),
                      ],
                    ),
                  ],)
                );
              }).toList(),
            ),
          ],
        ),
      ),
      
    );
  }
}
