
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/constant.dart';

class IconContent extends StatelessWidget {
  const IconContent({
    super.key, required this.icon, required this.text
  });

  final String text;
  final IconData icon;


  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: 80,
        ),
        SizedBox(
          height: 15,
        ),
        Text(text,
        style: labelTextStyle, )
      ],
    );
  }
}

class ReusableCard extends StatefulWidget {
  const ReusableCard({
    super.key, required this.color, required this.cardChild, required this.onPressed
  });

  final Color color;
  final Widget cardChild;
  final void Function() onPressed;

  @override
  State<ReusableCard> createState() => _ReusableCardState();
}

class _ReusableCardState extends State<ReusableCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onPressed,
      child: Container(
        width: double.infinity,
        child: widget.cardChild,
        margin: EdgeInsets.all(15.0),
        decoration:BoxDecoration(
          color: widget.color ,
          borderRadius: BorderRadius.circular(10),
          ) ,
        ),
    );
  }
}


class BottomButton extends StatefulWidget {
  const BottomButton({
    super.key , required this.onTap, required this.buttonTitle
  });

  final void Function()  onTap;
  final String buttonTitle;

  @override
  State<BottomButton> createState() => _BottomButtonState();
}

class _BottomButtonState extends State<BottomButton> {

  @override
  Widget build(BuildContext context) {
    
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        color: Color(bottomColor),
        margin: EdgeInsets.only(top: 10),
        width: double.infinity,
        height: bottomContainer,
        padding: EdgeInsets.only(bottom:20 ),
        child: Center(
          child: Text( 
            buttonTitle,
            style: LargeButtonTextStyle,
            ),
          ),
      ),
    );
  }
}


class RoundIconButton extends StatefulWidget {
  const RoundIconButton({  required this.icon , required this.onPressed});

final IconData icon;
final void Function() onPressed;

  @override
  State<RoundIconButton> createState() => _RoundIconButtonState();
}

class _RoundIconButtonState extends State<RoundIconButton> {

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(widget.icon),
      elevation: 5,
      constraints: BoxConstraints.tightFor(
        width: 56,
        height: 56,
      ),
      onPressed: widget.onPressed,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      fillColor: Color(0xff4c4f5e),);
  }
}
