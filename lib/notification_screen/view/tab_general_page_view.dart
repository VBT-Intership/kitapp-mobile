import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutterfoodapp/notification_screen/model/notification_general_model.dart';
import 'package:flutterfoodapp/sellers_screen/model/sellers_screen_model.dart';
import 'package:flutterfoodapp/core/extensions/future_builder.dart';
import 'package:flutterfoodapp/core/extensions/context_entension.dart';

BuildContext mycontext;
Container tab_general_view_page(BuildContext context) {
  mycontext = context;
  List<NotificationGeneral> generallist = [
    new NotificationGeneral("eda", "k1", 2, 5),
    new NotificationGeneral("eda", "k2", 2, 5),
    new NotificationGeneral("eda", "k3", 2, 5),
    new NotificationGeneral("eda", "k4", 2, 5),
  ];
  return Container(
      child: Future.value(generallist).toBuild<List<NotificationGeneral>>(
    onSuccess: (data) {
      return ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: data.length,
          itemBuilder: (context, index) =>
              notification_general_page_card(data[index]));
    },
  ));
}

Container notification_general_page_card(NotificationGeneral general) =>
    Container(
      padding: mycontext.paddingNormal,
      child: Column(
        children: [
          AutoSizeText(
            general.username +
                " adlı kullanıcı " +
                general.book +
                " kitabına verdiğiniz teklifi kabul etti",
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
            style: mycontext.textTheme.bodyText1,
          ),
          Row(
            children: [
              Expanded(
                flex: 5,
                child: Row(
                  children: [
                    Text(
                      general.username,
                      style: mycontext.textTheme.bodyText2,
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Text(
                      general.time.toString() + " saat önce",
                      style: mycontext.textTheme.bodyText2,
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 2,
                child: SizedBox(
                  child: RaisedButton(
                    color: Colors.green,
                    child: Text(
                      "İletişim",
                      style: TextStyle(
                          fontSize: mycontext.normalValue,
                          color: mycontext.colors.onPrimary),
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(mycontext.lowValue),
                    ),
                    onPressed: () {},
                  ),
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
