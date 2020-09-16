import 'package:flutter/material.dart';

class ShadowButton extends StatelessWidget {
  final Color backgroundColor;
  final Color iconColor;
  final IconData icon;
  final Function callBack;

  const ShadowButton({
    Key key,
    this.backgroundColor,
    this.iconColor,
    @required this.icon,
    @required this.callBack,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.12,
      height: MediaQuery.of(context).size.height * 0.08,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.all(Radius.circular(10)),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.6),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child:
          IconButton(icon: Icon(icon, color: iconColor), onPressed: callBack),
    );
  }
}
