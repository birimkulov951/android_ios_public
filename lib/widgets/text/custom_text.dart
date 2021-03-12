import 'package:flutter/material.dart';

class CustomText extends StatefulWidget {

  final String text;

  const CustomText({Key key, this.text}) : super(key: key);

  @override
  _CustomText createState() => _CustomText();
}

class _CustomText extends State<CustomText> {

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Text(widget.text,
              style: TextStyle(
                color: Colors.grey[700],
                fontFamily: 'Golos_Regular',
                fontSize: 13,
              )),
        ],
      ),
    );
  }
}