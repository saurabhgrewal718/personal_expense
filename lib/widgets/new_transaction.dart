import 'package:flutter/material.dart';

class NewTransaction extends StatefulWidget {
  final Function addTx;

  NewTransaction(this.addTx);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();

  final amountController = TextEditingController();

  void submitData(){
    final enteredTitle= titleController.text;
    final enteredAmount= double.parse(amountController.text);

    if(enteredAmount<=0 || enteredTitle.isEmpty){
      return;
    }

    widget.addTx(
      enteredTitle,
      enteredAmount,
    );

    Navigator.of(context).pop();

  }

  @override
  Widget build(BuildContext context) {
    return Card(
              child: Container(
                padding: EdgeInsets.all(10),
                child: Column(children: <Widget>[
                  TextField(
                    decoration: InputDecoration(labelText: 'Title'),
                    // onChanged: (val){
                    //   titleInput=val;
                    // },
                    controller:titleController,
                    onSubmitted: (_) => submitData,
                  ),
                  TextField(
                    decoration: InputDecoration(labelText: 'Amount'),
                    keyboardType: TextInputType.number,
                    // onChanged: (val){
                    //   amountInput=val;
                    // },
                    onSubmitted: (_) => submitData,
                    controller: amountController,
                  ),
                  RaisedButton(
                    child: Text("Submit"),
                    color: Colors.orange,
                    onPressed:submitData,
                  )
                ],),
              ),
            );
  }
}