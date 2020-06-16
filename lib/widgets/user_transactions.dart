import 'package:flutter/material.dart';
import './new_transaction.dart';
import './transaction_list.dart';
import '../models/transactions.dart';

class UserTransactions extends StatefulWidget {
  @override
  _UserTransactionsState createState() => _UserTransactionsState();
}

class _UserTransactionsState extends State<UserTransactions> {
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



  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        NewTransaction(_addNewTransaction),
        TransactionLisst(_usertransaction),
      ],
    );
  }
}