import 'package:android_ios/common/icon_assets.dart';
import 'package:android_ios/common/sizes.dart';
import 'package:android_ios/common/styles/color_palettes.dart';
import 'package:android_ios/utils/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomTextField extends StatefulWidget {

  final String text;

  const CustomTextField({Key key, this.text}) : super(key: key);

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {

  bool _isHiddenObscureText = true;

  void _toggleVisibility() {
    setState(() {
      _isHiddenObscureText = !_isHiddenObscureText;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      width: Sizes.width(context) * .9,
      //height: Sizes.height(context) / 7,
      child: TextField(
        decoration: InputDecoration(
          //contentPadding: EdgeInsets.all(8),
        //hintText: hintText,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(6)),
          borderSide: BorderSide(
            color: ColorPalettes.deepPurple,
            width: 1.0,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(6)),
          borderSide: BorderSide(
            color: ColorPalettes.deepPurple,
            width: 1.0,
          ),
        ),
        suffixIcon:
        widget.text == AppLocalizations.of(context).translate('password') ? IconButton(
                onPressed: _toggleVisibility,
                icon: _isHiddenObscureText
                 ? SvgPicture.asset(IconAssets.invisibleIcon)
                //Icon(Icons.visibility_off)
                 : SvgPicture.asset(IconAssets.visibleIcon),
        )
            : null,
      ),
      obscureText: widget.text == AppLocalizations.of(context).translate('password') ? _isHiddenObscureText : false,
    ));
  }
}