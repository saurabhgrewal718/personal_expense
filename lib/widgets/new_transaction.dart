import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  final Function addTx;

  NewTransaction(this.addTx);

  final titleController = TextEditingController();
  final amountController = TextEditingController();

  void submitData(){
    final enteredTitle= titleController.text;
    final enteredAmount= double.parse(amountController.text);

    if(enteredAmount<=0 || enteredTitle.isEmpty){
      return;
    }

    addTx(
      enteredTitle,
      enteredAmount,
    );

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