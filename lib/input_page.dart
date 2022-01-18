import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'icont_content.dart';
import 'reusable_card.dart';

const bottoContainerHeight = 80.0;
const activeCardColor = Color(0xFF1D1E33);
const inactiveCardColour = Color(0xFF111328);
const bottomContainerColour = Color(0xFFEB1555);

enum Gender {
  male,
  female,
}


class InputPage extends StatefulWidget {
  @override
  _InputPageState createState () => _InputPageState();

}



class _InputPageState extends State<InputPage> {

  Gender selectedGender;

  // Color maleCardColour = inactiveCardColour;
  // Color femaleCardColor = inactiveCardColour;
  //
  // //1 = male, 2 = female
  // void updateColour (Gender selectedGender){
  //   //male card pressed
  //   if(selectedGender == Gender.male){
  //     if(maleCardColour == inactiveCardColour){
  //       maleCardColour = activeCardColor;
  //       femaleCardColor = inactiveCardColour;
  //     }else{
  //       maleCardColour = inactiveCardColour;
  //     }
  //   }
  //   //female card pressed
  //   if(selectedGender == Gender.female){
  //     if(femaleCardColor == inactiveCardColour){
  //       femaleCardColor = activeCardColor;
  //       maleCardColour = inactiveCardColour;
  //     }else {
  //       femaleCardColor = inactiveCardColour;
  //     }
  //   }
  // }
  @override
  Widget build (BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        children: <Widget>[

          Expanded(child: Row(
            children: <Widget>[
              Expanded(

                child: GestureDetector(
                  onTap: (){
                    setState(() {
                      // updateColour(Gender.male);
                      selectedGender = Gender.male;
                    });
                  },
                  child: ReusableCard(
                    // colour: maleCardColour,
                    colour: selectedGender == Gender.male ? activeCardColor : inactiveCardColour,
                  cardChild: IconContent(icon: FontAwesomeIcons.mars, label: 'MALE',),
                  ),
                ),
              ),
              Expanded(
                child: GestureDetector(
                  onTap: (){
                    setState(() {
                      // updateColour(Gender.female);
                      selectedGender = Gender.female;
                    });
                  },
                  child: ReusableCard(
                    // colour: femaleCardColor,
                    colour: selectedGender == Gender.female ? activeCardColor : inactiveCardColour,
                  cardChild: IconContent(
                    icon: FontAwesomeIcons.venus,
                    label: 'FEMALE',
                  ),
                  ),
                ),
              ),
            ],
          )),
          Expanded(
            child: ReusableCard(colour: activeCardColor,),),
          Expanded(
              child: Row(
            children: <Widget>[
              Expanded(
                child: ReusableCard(colour: activeCardColor,),),
              Expanded(
                child: ReusableCard(colour: activeCardColor,),),
            ],
          )),
          Container(
            color: bottomContainerColour,
            margin: EdgeInsets.only(top: 10.0),
            width: double.infinity,
            height: bottoContainerHeight,

          )
        ],
      )
    );
  }
}



