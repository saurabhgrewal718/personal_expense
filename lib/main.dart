import 'package:flutter/material.dart';
import 'package:personal_expence/widgets/user_transactions.dart';
import './widgets/user_transactions.dart';

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
  // String titleInput;
  // String amountInput;
 
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
                child: Text('Chart')
              ),
            ),
            UserTransactions(),
          ],
        ),
      ),
      
    );
  }
}
