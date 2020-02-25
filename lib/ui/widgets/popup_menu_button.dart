import 'package:flutter/material.dart';

class CustomPopupMenuButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
      icon: Icon(
        Icons.info_outline,
        size: 30.0
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
      itemBuilder: (context) => [
        PopupMenuItem(
          value: 'Text 1',
          child: Text('Text 1 option')
        ),
        PopupMenuItem(
          value: 'Text 2',
          child: Text('Text 1 option')
        ),
        PopupMenuItem(
          value: 'Text 3',
          child: Text('Text 1 option')
        )
      ]
    );
  }
}

//TODO: add onSelected callback function, and pass array with options to choose

// PopupMenuButton({
//     Key key,
//     @required this.itemBuilder,
//     this.initialValue,
//     this.onSelected,
//     this.onCanceled,
//     this.tooltip,
//     this.elevation = 8.0,
//     this.padding = const EdgeInsets.all(8.0),
//     this.child,
//     this.icon,
//     this.offset = Offset.zero,
//   })