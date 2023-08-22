import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/constant.dart';
import 'package:flutter_application_1/widgets.dart';

class ResultPage extends StatelessWidget {
   const ResultPage({ required this.bmiResult, required this.interpretation, required this.resultText});


  final String bmiResult;
  final String resultText;
  final String interpretation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(
        title: Text('BMI CACULATOR'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.all(15),
              child: Center(child: Text('Your Result', style: titleTextStyle,)),
          )),
          Expanded(
            flex: 5,
            child: ReusableCard(
              color: Color(activeColor), 
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    resultText.toUpperCase(),
                    style: resultTextStyle,
                  ),
                  Text(
                    bmiResult,
                    style: BMITextStyle,
                  ),
                  Text(
                    interpretation,
                    textAlign: TextAlign.center,
                    style: bodyTextStyle,
                  ),

                ],
              ), 
              onPressed: (){

              }),),

              BottomButton(
                  buttonTitle: 'RE-CALCULATE',
                  onTap: () {

                    Navigator.pop(context);
                    
                  }, 
               ),
        ],)
      
    );
  }
}