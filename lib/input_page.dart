import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'icont_content.dart';
import 'reusable_card.dart';

const bottoContainerHeight = 80.0;
const activeCardColor = Color(0xFF1D1E33);
const inactiveCardColour = Color(0xFF111328);
const bottomContainerColour = Color(0xFFEB1555);
class InputPage extends StatefulWidget {
  @override
  _InputPageState createState () => _InputPageState();

}



class _InputPageState extends State<InputPage> {
  Color maleCardColour = inactiveCardColour;
  Color femaleCardColor = inactiveCardColour;

  //1 = male, 2 = female
  void updateColour (int gender){
    //male card pressed
    if(gender ==1){
      if(maleCardColour == inactiveCardColour){
        maleCardColour = activeCardColor;
        femaleCardColor = inactiveCardColour;
      }else{
        maleCardColour = inactiveCardColour;
      }
    }
    //female card pressed
    if(gender ==2){
      if(femaleCardColor == inactiveCardColour){
        femaleCardColor = activeCardColor;
        maleCardColour = inactiveCardColour;
      }else {
        femaleCardColor = inactiveCardColour;
      }
    }
  }
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
                      updateColour(1);
                    });
                  },
                  child: ReusableCard(
                    colour: maleCardColour,

                  cardChild: IconContent(icon: FontAwesomeIcons.mars, label: 'MALE',),
                  ),
                ),
              ),
              Expanded(
                child: GestureDetector(
                  onTap: (){
                    setState(() {
                      updateColour(2);
                    });
                  },
                  child: ReusableCard(colour: femaleCardColor,
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



