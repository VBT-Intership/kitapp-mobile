import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

extension FutureExtension on Future {
  Widget toBuild<T>(
      {Widget Function(T data) onSuccess, Widget onError, dynamic data}) {
    return FutureBuilder<T>(
        future: this,
        initialData: data,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
            case ConnectionState.active:
              return Center(child: CircularProgressIndicator());
            case ConnectionState.done:
              if (snapshot.hasData)
                return onSuccess(snapshot.data);
              else
                return onError ??
                    LottieBuilder.network(
                        "https://assets9.lottiefiles.com/temp/lf20_dzWAyu.json");
              break;
            default:
              return onError ??
                  LottieBuilder.network(
                      "https://assets9.lottiefiles.com/temp/lf20_dzWAyu.json");
          }
        });
  }
}
