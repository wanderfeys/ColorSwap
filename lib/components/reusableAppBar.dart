import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// Creating reusable app bar with parametrs for all screens
class BaseAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Color backgroundColor = Color(0xFF80bc95);
  final Text title;
  final AppBar appBar;
  final bool showLeading;
  final bool showButton;
  final String routeName;
  final Function onPress;
  final Color colorButton;

  ///Constructor with parameters
  BaseAppBar({
    this.title,
    this.appBar,
    this.routeName,
    this.showLeading,
    this.colorButton,
    this.showButton,
    this.onPress,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      title: title,
      backgroundColor: backgroundColor,

      ///Arrow buttons for navigation
      leading: showLeading != true
          ? IconButton(
              padding: EdgeInsets.only(left: 20.0),
              icon: Icon(
                Platform.isAndroid
                    ? Icons.arrow_back
                    : CupertinoIcons.arrow_left,
                size: 30,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            )
          : null,
      actions: [
        showButton != true
            ? IconButton(
                padding: EdgeInsets.only(right: 30.0),
                icon: Icon(
                  Platform.isAndroid
                      ? Icons.arrow_forward
                      : CupertinoIcons.arrow_right,
                  size: 30,
                ),
                onPressed: () {
                  Navigator.pushNamed(context, routeName);
                },
              )
            : Padding(
                padding: EdgeInsets.only(
                  right: 10.0,
                  top: 5.0,
                  bottom: 5.0,
                ),

                ///Button for change color in level five
                child: FloatingActionButton(
                  onPressed: onPress,
                  backgroundColor: colorButton,
                ),
              )
      ],
    );
  }

  @override
  Size get preferredSize => new Size.fromHeight(appBar.preferredSize.height);
}
