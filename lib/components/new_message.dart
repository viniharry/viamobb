import 'package:flutter/material.dart';
import 'package:viamobb_passageiro/constants.dart';

class NewMessage extends StatefulWidget {
  NewMessage({Key key}) : super(key: key);

  @override
  _NewMessageState createState() => _NewMessageState();
}

class _NewMessageState extends State<NewMessage> {
  String _enteredMEssage = '';
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
        child: Row(
      children: [
        Expanded(
          child: TextField(
            decoration: InputDecoration(labelText: 'Enviar mensagem'),
            onChanged: (value) {
              _enteredMEssage = value;
            },
          ),
        ),
        IconButton(
          color: kAmberColor,
          icon: Icon(Icons.send),
           onPressed:_enteredMEssage.trim().isEmpty? null : () {})
      ],
    ));
  }
}
