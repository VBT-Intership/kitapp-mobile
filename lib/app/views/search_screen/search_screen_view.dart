import 'package:flappy_search_bar/flappy_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutterfoodapp/app/views/search_screen/search_screen_view_model.dart';
import 'package:flutterfoodapp/app/models/search_screen_model.dart';
import 'package:flutterfoodapp/app/views/search_screen/deneme_post.dart';
import 'package:flutterfoodapp/app/components/button/loginRadiusButton.dart';
import '../../../core/extensions/context_entension.dart';

class SearchScreenView extends SearchScreenViewModel {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        body: Column(
      children: [
        Expanded(
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Stack(
                children: [
                  SearchBar<Post>(
                    onSearch: search,
                    onItemFound: (Post post, int index) {
                      return ListTile(
                        title: Text(post.title),
                        subtitle: Text(post.description),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
        ButtonContainer()
      ],
    ));
  }
}

class ButtonContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 60,
      margin: new EdgeInsets.only(left: 10, right: 10, bottom: 50),
      child: OutlineIconButton(
        icon: Icon(
          Icons.center_focus_weak,
          color: Colors.white,
        ),
        text: 'TARA',
        iconPadding: 10,
        color: context.theme.primaryColor,
        onpressed: () {},
      ),
    );
  }
}
