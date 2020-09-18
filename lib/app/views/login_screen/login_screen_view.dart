import 'package:circular_check_box/circular_check_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_beautiful_popup/main.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutterfoodapp/app/views/register_screen/register_screen.dart';
import 'package:flutterfoodapp/core/constants/enums/app_theme_enum.dart';
import 'package:flutterfoodapp/core/constants/navigation/navigation_constants.dart';
import 'package:flutterfoodapp/core/init/notifier/theme_notifer.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:provider/provider.dart';

import '../../../core/extensions/context_entension.dart';
import '../../components/button/loginRadiusButton.dart';
import '../../components/input/text_input.dart';
import 'login_screen_view_model.dart';
import '../../../core/extensions/string_extension.dart';

BuildContext mycontext;

class LoginScreenView extends LoginScreenViewModel {
  bool rememberMe = false;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    mycontext = context;
    var themeProvider = Provider.of<ThemeNotifier>(context);
    Widget headerView = themeProvider.currentThemeEnum() == AppThemes.LIGHT
        ? loginHeadTextLight
        : loginHeadTextDark;
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              Container(
                  width: context.width,
                  height: context.height,
                  padding: context.paddingMedium,
                  color: context.theme.bottomAppBarColor,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Spacer(flex: 3),
                      Expanded(flex: 22, child: headerView),
                      Spacer(flex: 5),
                      Expanded(flex: 10, child: loginEmailInput),
                      Spacer(flex: 1),
                      Expanded(flex: 10, child: loginPasswordInput),
                      Spacer(flex: 3),
                      Expanded(flex: 5, child: loginChoices),
                      Spacer(flex: 2),
                      Expanded(flex: 12, child: loginButtons),
                      Spacer(flex: 3),
                      Expanded(flex: 10, child: loginButtonDivider),
                      Spacer(flex: 1),
                      Expanded(flex: 12, child: loginRegisterButton),
                      Expanded(flex: 12, child: loginGuestButton),
                    ],
                  )),
            ],
          ),
        ),
      ),
    );
  }

  Widget get loginHeadTextLight {
    return SvgPicture.asset("assets/images/login_cat.svg");
  }

  Widget get loginHeadTextDark {
    return Container(
        height: double.infinity,
        width: double.infinity,
        child: Image(
            image: AssetImage("assets/images/login_cat_dark.png"),
            fit: BoxFit.scaleDown));
  }

  TextWidget get loginPasswordInput {
    return TextWidget(
      labelText: "Enter Password".locale,
      warningText: "Password Insufficient Number of Characters".locale,
      icon: Icons.vpn_key,
      inputType: TextInputType.emailAddress,
      minLength: 3,
      controller: passwordController,
    );
  }

  TextWidget get loginEmailInput {
    return TextWidget(
      labelText: "Enter E-mail".locale,
      warningText: "Insufficient Number of Email Characters".locale,
      icon: Icons.email,
      inputType: TextInputType.visiblePassword,
      controller: emailController,
    );
  }

  Row get loginChoices {
    return Row(
      children: [
        Spacer(),
        Text(
          "Forgotten Password ?".locale,
          style: mycontext.textTheme.bodyText2,
        )
      ],
    );
  }

  CircularCheckBox get loginChoicesCheckBox {
    return CircularCheckBox(
        value: rememberMe,
        materialTapTargetSize: MaterialTapTargetSize.padded,
        onChanged: (bool x) {
          setState(() {
            rememberMe = !rememberMe;
          });
        });
  }

  Row get loginButtons {
    return Row(
      children: [
        Expanded(
            child: OutlineIconButton(
          icon: Icon(
            Icons.input,
            color: Colors.white,
          ),
          text: "Sing in".locale,
          color: mycontext.theme.primaryColor,
          onpressed: () {
            navigation.navigateToPage(
                path: NavigationConstants.HOME_SCREEN_VIEW);
          },
        )),
        Expanded(
          child: OutlineIconButton(
            icon: Image.asset('assets/images/google.ico'),
            text: "oogle",
            iconPadding: 0,
            color: mycontext.theme.primaryColor,
            onpressed: () {
              final popup = BeautifulPopup(
                context: mycontext,
                template: TemplateGift,
              );
              popup.show(
                title: "Google auth forwarding".locale,
                content: 'Hellloo',
                actions: [
                  popup.button(
                    label: 'close'.locale,
                    onPressed: Navigator.of(mycontext).pop,
                  ),
                ],
                // bool barrierDismissible = false,
                // Widget close,
              );
            },
          ),
        )
      ],
    );
  }

  Row get loginButtonDivider {
    return Row(
      children: [
        Expanded(
          child: Divider(
            color: mycontext.colors.primaryVariant,
            height: mycontext.height * 0.01,
            thickness: 1,
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32) ,
            child:Text(
            "OR".locale,
            style: mycontext.textTheme.headline5,
          ), 
            ) 
        ),
        Expanded(
          child: Divider(
            color: mycontext.colors.primaryVariant,
            height: mycontext.height * 0.01,
            thickness: 1,
          ),
        ),
      ],
    );
  }

  Container get loginGuestButton {
    return Container(
      width: double.infinity,
      child: OutlineIconButton(
        text: "Visit".locale,
        color: mycontext.theme.primaryColor,
        onpressed: () {
          navigation.navigateToPage(path: NavigationConstants.HOME_SCREEN_VIEW);
        },
      ),
    );
  }

  Container get loginRegisterButton {
    return Container(
      width: double.infinity,
      child: OutlineIconButton(
        text: "Sing up".locale,
        color: mycontext.theme.primaryColor,
        onpressed: () {
          navigation.navigateToPage(path: NavigationConstants.REGISTER_VIEW);
        },
      ),
    );
  }
}
