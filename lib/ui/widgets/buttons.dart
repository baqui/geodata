import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final bool isLoading;
  final Function handlePress;
  CustomButton({Key key, this.text, this.handlePress, this.isLoading = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: RawMaterialButton(
        onPressed: (){ handlePress(); },
        fillColor: Colors.black,
        elevation: 0,
        constraints: BoxConstraints(minWidth: double.infinity, minHeight: 52),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
        textStyle: TextStyle(
          fontSize: 16,
          color: Colors.white,
          fontWeight: FontWeight.w500,
          letterSpacing: 0.5
        ),
        child: isLoading ? CircularProgressIndicator(
          strokeWidth: 3.0,
          valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
        ) : Text(text)
      ),
    );
  }
}