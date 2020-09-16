import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutterfoodapp/notification_screen/model/notification_offers_model.dart';
import 'package:flutterfoodapp/core/extensions/future_builder.dart';
import 'package:flutterfoodapp/core/extensions/context_entension.dart';
import 'package:flutterfoodapp/notification_screen/view/tab_general_page_view.dart';

BuildContext mycontext;
Container tab_offers_view_page(BuildContext context) {
  mycontext = context;
  List<NotificationOffers> offerslist = [
    new NotificationOffers("book1", 12, 2),
    new NotificationOffers("book2", 12, 2),
    new NotificationOffers("book3", 12, 2),
    new NotificationOffers("book4", 12, 2),
    new NotificationOffers("book5", 12, 2)
  ];

  return Container(
      child: Future.value(offerslist).toBuild<List<NotificationOffers>>(
    onSuccess: (data) {
      return ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: data.length,
          itemBuilder: (context, index) =>
              notification_offers_page_card(data[index]));
    },
  ));
}

Container notification_offers_page_card(NotificationOffers offer) => Container(
      padding: mycontext.paddingNormal,
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                flex: 3,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      offer.price.toString() + " ₺",
                      style: mycontext.textTheme.headline6,
                    ),
                    SizedBox(
                      height: mycontext.lowValue,
                    ),
                    AutoSizeText(
                      offer.book + " adlı kitaba teklifin var.",
                      style: mycontext.textTheme.bodyText1,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                    )
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        SizedBox(
                          width: mycontext.mediumValue,
                          height: mycontext.mediumValue,
                          child: FloatingActionButton(
                            onPressed: () {},
                            backgroundColor: mycontext.colors.primary,
                            child: Icon(Icons.delete),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        SizedBox(
                          width: mycontext.mediumValue,
                          height: mycontext.mediumValue,
                          child: FloatingActionButton(
                            onPressed: () {},
                            backgroundColor: mycontext.colors.onSurface,
                            child: Icon(Icons.done),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: mycontext.lowValue,
                    ),
                    Text(
                      offer.time.toString() + " saat önce",
                      style: mycontext.textTheme.bodyText2,
                    )
                  ],
                ),
              )
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
