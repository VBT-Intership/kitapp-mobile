import 'package:circular_check_box/circular_check_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/extensions/context_entension.dart';
import '../../components/button/loginRadiusButton.dart';
import '../../components/input/text_input.dart';
import 'login_screen_view_model.dart';

class LoginScreenView extends LoginScreenViewModel {
  bool rememberMe = false;
  TextEditingController emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
              width: context.width,
              height: context.height,
              padding: context.paddingMedium,
              color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Spacer(flex: 3),
                  Expanded(flex: 22, child: loginHeadText),
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
    );
  }

  Widget get loginHeadText {
    return SvgPicture.asset("assets/images/login_cat.svg");
  }

  TextWidget get loginPasswordInput {
    return TextWidget(
      labelText: "Şifre Giriniz",
      warningText: "Şifre Karakter Sayısı Yetersiz",
      icon: Icons.security,
      inputType: TextInputType.emailAddress,
      minLength: 3,
      controller: emailController,
    );
  }

  TextWidget get loginEmailInput {
    return TextWidget(
      labelText: "Email Giriniz",
      warningText: "Email Karakter Sayısı Yetersiz",
      icon: Icons.email_outlined,
      inputType: TextInputType.visiblePassword,
      controller: emailController,
    );
  }

  Row get loginChoices {
    return Row(
      children: [
        Spacer(),
        Text(
          "Forgotten Password?",
          style: context.textTheme.bodyText2,
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
            Icons.login_outlined,
            color: Colors.white,
          ),
          text: "Giriş Yap",
          color: Colors.green[500],
          onpressed: () {},
        )),
        Expanded(
          child: OutlineIconButton(
            icon: Image.asset('assets/images/google.ico'),
            text: "oogle",
            iconPadding: 0,
            color: Colors.green[500],
            onpressed: () {},
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
            color: Colors.black,
            height: context.height * 0.01,
            thickness: 1,
          ),
        ),
        Expanded(
          child: Text(
            "     ya da",
            style: context.textTheme.headline5,
          ),
        ),
        Expanded(
          child: Divider(
            color: Colors.black,
            height: context.height * 0.01,
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
        text: "Ziyaret Et",
        color: Colors.green[500],
        onpressed: () {},
      ),
    );
  }

  Container get loginRegisterButton {
    return Container(
      width: double.infinity,
      child: OutlineIconButton(
        text: "Kayıt Ol",
        color: Colors.green[500],
        onpressed: () {},
      ),
    );
  }
}
