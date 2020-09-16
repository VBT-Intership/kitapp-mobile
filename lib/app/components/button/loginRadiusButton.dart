import 'package:flutter/material.dart';
import '../../../core/extensions/context_entension.dart';

class OutlineIconButton extends StatelessWidget {
  final Widget icon;
  final String text;
  final Color color;
  final double iconPadding;
  final Function onpressed;
  const OutlineIconButton({
    Key key,
    this.icon,
    this.text,
    this.color,
    this.onpressed,
    this.iconPadding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
          height: double.infinity,
          child: RaisedButton(
            color: Colors.green[500],
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(40.0)),
            onPressed: onpressed,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                icon != null ? icon : Container(),
                SizedBox(width: iconPadding ?? 10),
                Text(
                  text,
                  style:
                      context.textTheme.bodyText2.copyWith(color: Colors.white),
                )
              ],
            ),
          )),
    );
  }
}
