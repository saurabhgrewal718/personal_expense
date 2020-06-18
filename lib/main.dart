import 'package:flutter/material.dart';
import './widgets/new_transaction.dart';
import './models/transactions.dart';
import './widgets/transaction_list.dart';

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

class MyHomePage extends StatefulWidget {
  // String titleInput;
  // String amountInput;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
final List<Transaction> _usertransaction = [
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

  void _addNewTransaction(String txtitle,double txamount){
    final newTx = Transaction(
      title:txtitle,
      amount: txamount,
      date: DateTime.now(),
      id: DateTime.now().toString(),
    );
  
    setState((){
      _usertransaction.add(newTx);
    });
  }

  void _startAddNewTransaction(BuildContext ctx){
    showModalBottomSheet(
      context: ctx, 
      builder: (_){
        return GestureDetector(
          onTap: (){},
          child: NewTransaction(_addNewTransaction),
          behavior:HitTestBehavior.opaque,
        );
     },
    );
  }
  
  @override
  Widget build(BuildContext context) {
  
    return Scaffold(
      appBar: AppBar(
        title: Text("Expenses"),
        actions: <Widget>[
          IconButton(
            icon:Icon(Icons.add) ,
            onPressed: () => _startAddNewTransaction(context),
          )
        ],
      ),
      body: SingleChildScrollView(
              child: Center(
          child: Column(
            children: <Widget>[
              Card(
                child:Container(
                  child: Text('Chart')
                ),
              ),
              TransactionLisst(_usertransaction),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed:() => _startAddNewTransaction(context),
      ),
      
    );
  }
}

