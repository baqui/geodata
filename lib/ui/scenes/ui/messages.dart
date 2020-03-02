import 'package:flutter/material.dart';
import 'package:geodata/ui/widgets/buttons.dart';
import 'package:geodata/ui/widgets/modal_bottom_sheet.dart';

class Messages extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            SizedBox(height: 80),
            CustomButton(
                text: 'Show bottom modal button',
                handlePress: () {
                  _showModalBottomSheet(context);
                }),
            SizedBox(height: 40),
            CustomButton(
                text: 'Button with loader',
                isLoading: false,
                handlePress: () {})
          ],
        ),
      ),
    );
  }

  void _showModalBottomSheet(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return ModalBottomSheet();
        });
  }
}
