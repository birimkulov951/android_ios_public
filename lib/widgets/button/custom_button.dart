import 'package:android_ios/common/styles/color_palettes.dart';
import 'file:///C:/Users/birim/StudioProjects/android_ios/lib/common/sizes.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatefulWidget {
  final Function onPressed;
  final String text;

  const CustomButton({Key key, this.onPressed, this.text}) : super(key: key);

  @override
  _CustomButtonState createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {


  @override
  Widget build(BuildContext context) {
    return Container(
        width: Sizes.width(context) * .9,
        height: Sizes.width(context) / 7,
        child: FlatButton(
          child: Text(
            widget.text,
            style: TextStyle(
              color: ColorPalettes.white,
              fontFamily: 'Golos_Regular',
              fontWeight: FontWeight.bold,
              fontSize: 21,
            ),
          ),
          //padding: EdgeInsets.symmetric(vertical: 20),
          color: ColorPalettes.deepPurple,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              Sizes.dp6(context),
            ),
          ),
          onPressed: widget.onPressed,

        ),

    );
  }
}