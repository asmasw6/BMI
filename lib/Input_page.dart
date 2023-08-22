
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/calculateBMI.dart';
import 'package:flutter_application_1/result_page.dart';
import 'package:flutter_application_1/widgets.dart';
import 'constant.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

enum Gender {
  male,
  female,
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}


class _InputPageState extends State<InputPage> {
  int height = 180;
  int weight = 58;
  int age =23;

   // ignore: non_constant_identifier_names
    Gender? SelectedGender ;

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text('BMI CALCULATOR',
        textAlign: TextAlign.center),
      ),

      body:Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
           Expanded(
            child: Row(
            children: [

              Expanded(
                child: ReusableCard(
                onPressed: (){
                  setState(() {
                    SelectedGender=Gender.male;
                  });
                },
                color: SelectedGender == Gender.male ? Color(activeColor) : Color(inActiveColor),
                cardChild: IconContent(icon: FontAwesomeIcons.mars , text: 'MALE'),
                              
                            ),
                ) ,

              Expanded(
                child: GestureDetector(
                onTap: () {
                  setState(() {
                    SelectedGender = Gender.female;
                  });
                },
                child: ReusableCard(
                  onPressed: (){
                    setState(() {
                      SelectedGender=Gender.female;
                    });
                  },
                  color: SelectedGender == Gender.female ? Color(activeColor) : Color(inActiveColor),
                  cardChild: IconContent(icon: FontAwesomeIcons.venus, text: 'FEMALE')
                ),
              )),
    
            ],
          )),

              Expanded(child: ReusableCard(
                onPressed: (){

                },
                color: Color(activeColor),
                cardChild:  Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('HEIGHT',
                    style: labelTextStyle),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(height.toString(),
                        style: NumberTextStyle,),
                        Text(
                          'cm',
                        style: labelTextStyle,),
                      ],),

                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        inactiveTickMarkColor: Color(0xff8d8e98),
                        thumbColor: Color(0xffeb1555),
                        activeTickMarkColor: Colors.white,
                        overlayColor: Color(0x29eb1555),
                        thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15),
                        overlayShape: RoundSliderOverlayShape(overlayRadius: 30),
                      ),
                      child: Slider(
                        value: height.toDouble(),
                        min: 120,
                        max: 220,
                        activeColor: Color(0xffeb1555),
                        inactiveColor: Color(smothGray),
                        onChanged: (double newVlaue){
                          setState(() {
                             height= newVlaue.round();
                          });
                    
                        }),
                    )
                  

                  ],),
              )),
       

            Expanded(
              child: Row(
                  children: [
                  Expanded(child: ReusableCard(
                    onPressed: (){

                    },
                    color: Color(activeColor),
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'WEIGHT',
                        style: labelTextStyle,),
                        Text(weight.toString(),
                        style: NumberTextStyle,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              onPressed: (){
                                setState(() {
                                  weight--;
                                });
                              },),
                              SizedBox(
                                width: 10,
                                ),

                            RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              onPressed: (){
                                setState(() {
                                  weight++;
                                });
                              },),
                          ],),
                      ],

                    ),
                  )),

                  Expanded(child: ReusableCard(
                    onPressed: (){

                    },
                    color: Color(activeColor),
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('AGE',
                        style: labelTextStyle,),
                        Text(age.toString(),
                        style: NumberTextStyle,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              onPressed: (){
                                setState(() {
                                  age--;
                                });
                              },),
                              SizedBox(
                                width: 10,
                                ),

                            RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              onPressed: (){
                                setState(() {
                                  age++;
                                });
                              },),
                          ],),
                      ],

                    ),
                  
                  )),
            ],
          )),
        BottomButton(
          buttonTitle: 'CALCULATE',
          onTap: (){
            CalculateBrain total = 
               CalculateBrain(height: height, weight: weight);
            
            Navigator.push(
              context, 
              MaterialPageRoute(builder: (context)=> new ResultPage(
                bmiResult: total.calculateBMI(),
                interpretation: total.getInterpretation(),
                resultText: total.getresult(),

              )));
          },
        ),
        
        ],
      )

    );
  }
}

