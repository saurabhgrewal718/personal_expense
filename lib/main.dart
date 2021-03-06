import 'package:flutter/material.dart';
import './widgets/new_transaction.dart';
import './models/transactions.dart';
import './widgets/transaction_list.dart';
import './widgets/chart.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Expenses',
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
    // Transaction(
    //   id:'t1',
    //   amount: 89.87,
    //   title: 'New Shoes',
    //   date: DateTime.now(),
    // ),
    // Transaction(
    //   id:'t2',
    //   amount: 8.87,
    //   title: 'Shoes',
    //   date: DateTime.now(),
    // ),
    // Transaction(
    //   id:'t3',
    //   amount: 9.87,
    //   title: 'New',
    //   date: DateTime.now(),
    // ),
  ];

  List<Transaction> get _recentTransactions{
    return _usertransaction.where((tx){
      return tx.date.isAfter(
        DateTime.now().subtract(
          Duration(days:7),
        ),
      );
    }).toList();
  }

  void _addNewTransaction(String txtitle,double txamount,DateTime choosenDate){
    final newTx = Transaction(
      title:txtitle,
      amount: txamount,
      date: choosenDate,
      id: DateTime.now().toString(),
    );
  
    setState((){
      _usertransaction.add(newTx);
    });
  }

  void _startAddNewTransaction(BuildContext ctx){
    showModalBottomSheet(
      isScrollControlled:true,
      context: ctx, 
      builder: (_){
        return GestureDetector(
          onTap: (){},
          child: Container(
            child: Column(
              children: <Widget>[
                Container(
                  height: 150,
                  child: Image.asset('assets/images/victor.gif',fit: BoxFit.cover,),
                ),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: NewTransaction(_addNewTransaction),
                ),
                Text("Swipe down to go to home Screen",style: TextStyle(fontWeight: FontWeight.w100,color: Colors.black),),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Icon(Icons.arrow_downward),
                ),
              ],
            )),
          behavior:HitTestBehavior.opaque,
        );
     },
    );
  }

  void _deleteTransaction(String id){
    _usertransaction.removeWhere((tx) => tx.id == id);
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
              Chart(_recentTransactions),
              TransactionLisst(_usertransaction,_deleteTransaction),
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

