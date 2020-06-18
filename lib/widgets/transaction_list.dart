import 'package:flutter/material.dart';
import '../models/transactions.dart';
import 'package:intl/intl.dart';


class TransactionLisst extends StatelessWidget {
//   @override
//   _TransactionLisstState createState() => _TransactionLisstState();
// }

// class _TransactionLisstState extends State<TransactionLisst> {
  final List<Transaction> transactions;

  TransactionLisst(this.transactions); 
  @override
  Widget build(BuildContext context) {
    return Container(
              height: 350,
              child: ListView.builder(
                itemBuilder: (ctx,index){
                 return Card(
                  child: Row(children: <Widget>[
                    Container(
                      margin: EdgeInsets.symmetric(
                        vertical: 10,
                        horizontal: 15,
                      ),
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(border: Border.all(color: Colors.black,width: 2,)),
                      child: Text('\$ ${transactions[index].amount.toStringAsFixed(2)}',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.purple),),
                    ),
                    Column(
                      crossAxisAlignment:CrossAxisAlignment.start ,
                      children:<Widget>[
                        Text(
                          transactions[index].title,
                          style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17,color: Colors.black)),
                        Text(
                          DateFormat('dd/MM/yyyy').format(transactions[index].date),
                          style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15,color: Colors.black26),
                        ),
                      ],
                    ),
                  ],)
                );
                },
                itemCount: transactions.length,
    )
    );
  }
}