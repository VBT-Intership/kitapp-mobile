import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutterfoodapp/notification_screen/model/notification_general_model.dart';
import 'package:flutterfoodapp/sellers_screen/model/sellers_screen_model.dart';
import 'package:flutterfoodapp/core/extensions/future_builder.dart';
import 'package:flutterfoodapp/core/extensions/context_entension.dart';
import '../../core/extensions/string_extension.dart';

BuildContext mycontext;
List<NotificationGeneral> generallist = [
  new NotificationGeneral("eda", "kitap1", 2, 1),
  new NotificationGeneral("eda", "kitap2", 7, 0),
  new NotificationGeneral("eda", "kitap3", 12, 1),
  new NotificationGeneral("eda", "kitap4", 13, 0),
];

Container tab_general_page_view(BuildContext context) {
  mycontext = context;
  return Container(
      color: context.theme.scaffoldBackgroundColor,
      child: Future.value(generallist).toBuild<List<NotificationGeneral>>(
        onSuccess: (data) {
          return ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: data.length,
              itemBuilder: (context, index) =>
                  notification_general_page_card(data[index], context));
        },
      ));
}

Container notification_general_page_card(
        NotificationGeneral general, BuildContext context) =>
    Container(
      padding: context.paddingNormal,
      child: Column(
        children: [
          get_text(general, context),
          Row(
            children: [
              Expanded(
                flex: 5,
                child: Row(
                  children: [
                    Text(
                      general.username,
                      style:
                          TextStyle(color: mycontext.theme.primaryColorLight),x 
                    ),
                    SizedBox(width: context.normalValue),
                    Text(
                      general.time.toString() + " hours ago ".locale,
                      style: context.textTheme.bodyText2,
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 2,
                child: SizedBox(
                  width: context.mediumValue,
                  height: context.mediumValue,
                  child: get_button(general.status, context),
                ),
              ),
            ],
          ),
          Divider(
            color: Colors.grey,
            height: 20,
            thickness: 1,
            endIndent: 0,
          ),
        ],
      ),
    );

Widget get_text(NotificationGeneral general, BuildContext context) {
  String case_1_text = general.username +
      " named user ".locale+
      general.book +
     " accepted your offer to the book ".locale;
  String case_0_text = general.username +
      " named user ".locale+
      general.book +
      " rejected your offer to the book ".locale;
  switch (general.status) {
    case 1:
      return calling_book_status_text(case_1_text, context);
      break;
    case 0:
      return calling_book_status_text(case_0_text, context);
      break;
    default:
  }
}

AutoSizeText calling_book_status_text(String text, BuildContext context) {
  return AutoSizeText(
    text,
    overflow: TextOverflow.ellipsis,
    maxLines: 2,
    style: TextStyle(color: mycontext.theme.primaryColorLight),
  );
}

Widget get_button(int status, BuildContext context) {
  switch (status) {
    case 1:
      return calling_button("Contact".locale, Color(0xff5ABD8C), context, 1);
      break;
    case 0:
      return calling_button("Remove".locale, Colors.grey, context, 0);
      break;
    default:
  }
}

FlatButton calling_button(
    String text, Color color, BuildContext context, int status) {
  return FlatButton(
    color: color,
    child: Text(
      text,
      style: TextStyle(
          fontSize: context.normalValue, color: context.colors.onPrimary),
    ),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(context.lowValue),
    ),
    onPressed: () {
      if (status == 1)
        callmodal(context);
      else if (status == 0) delete(context);
    },
  );
}

void delete(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      // return object of type Dialog
      //generallist.removeAt(1);

      return AlertDialog(
        content: SingleChildScrollView(
          child: Center(
            child: Text("Delete".locale),
          ),
        ),
      );
    },
  );
}

void callmodal(BuildContext context) {
  // flutter defined function
  showDialog(
    context: context,
    builder: (BuildContext context) {
      // return object of type Dialog
      return AlertDialog(
        content: SingleChildScrollView(
          child: Center(
            child: Text("Call Now".locale),
          ),
        ),
      );
    },
  );
}
