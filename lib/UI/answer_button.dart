import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget{

 final bool _answer;
 final VoidCallback _onTap;

  // ignore: use_key_in_widget_constructors
  const AnswerButton(this._answer, this._onTap);

  @override
   Widget build(BuildContext context){
   return Expanded(    //True buttion
    child:  Material(
     color: _answer == true ? Colors.greenAccent : Colors.redAccent,
      child:  InkWell(
       onTap: () => _onTap(),
        child:  Center(
         child:  Container(
           decoration:  BoxDecoration(
             border:  Border.all(color: Colors.white, width: 5.0)
           ),
           padding:  const EdgeInsets.all(10.0),
          child:  Text(_answer == true ? "True" : "False",
           style:  const TextStyle(color: Colors.white, fontSize: 40.0, fontWeight: FontWeight.bold, fontStyle: FontStyle.italic)
          ),
           ),
          )
        ),
      ),
    );
  }
}