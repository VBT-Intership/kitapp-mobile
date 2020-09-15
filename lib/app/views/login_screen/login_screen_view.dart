import 'package:circular_check_box/circular_check_box.dart';
import 'package:flutter/material.dart';

import '../../../core/extensions/context_entension.dart';
import '../../components/text_input.dart';
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
                  Spacer(
                    flex: 10,
                  ),
                  Expanded(
                    flex: 10,
                    child: Text(
                      "Sign In",
                      style: context.textTheme.headline4
                          .copyWith(color: context.colors.onSurface),
                    ),
                  ),
                  Spacer(
                    flex: 5,
                  ),
                  Expanded(
                    flex: 10,
                    child: TextWidget(
                      labelText: "Email Giriniz",
                      warningText: "Email Karakter Sayısı Yetersiz",
                      icon: Icons.email_outlined,
                      inputType: TextInputType.emailAddress,
                      controller: emailController,
                    ),
                  ),
                  Spacer(flex: 1),
                  Expanded(
                    flex: 10,
                    child: TextWidget(
                      labelText: "Şifre Giriniz",
                      warningText: "Şifre Karakter Sayısı Yetersiz",
                      icon: Icons.email_outlined,
                      inputType: TextInputType.emailAddress,
                      minLength: 3,
                      controller: emailController,
                    ),
                  ),
                  Spacer(
                    flex: 3,
                  ),
                  Expanded(
                      flex: 5,
                      child: Row(
                        children: [
                          Expanded(
                            flex: 1,
                            child: CircularCheckBox(
                                value: rememberMe,
                                materialTapTargetSize:
                                    MaterialTapTargetSize.padded,
                                onChanged: (bool x) {
                                  setState(() {
                                    rememberMe = !rememberMe;
                                  });
                                }),
                          ),
                          Expanded(
                              flex: 3,
                              child: Text(
                                "Stay Logged in",
                                style: context.textTheme.bodyText2,
                              )),
                          Spacer(flex: 1),
                          Expanded(
                            flex: 3,
                            child: Text(
                              "Forgotten Password?",
                              style: context.textTheme.bodyText2,
                            ),
                          )
                        ],
                      )),
                  Spacer(
                    flex: 2,
                  ),
                  Expanded(
                      flex: 10,
                      child: Row(
                        children: [
                          Expanded(
                            child: OutlineIconButton(
                              icon: Icons.login_outlined,
                              text: "Giriş Yap",
                            ),
                          ),
                          Expanded(
                            child: OutlineIconButton(
                              icon: Icons.alarm,
                              text: "Google",
                            ),
                          )
                        ],
                      )),
                  Spacer(
                    flex: 3,
                  ),
                  Expanded(
                      flex: 6,
                      child: Column(
                        children: [
                          Divider(
                            color: Colors.black,
                            height: 5,
                            thickness: 1,
                          ),
                          Text(
                            "ya da",
                            style: context.textTheme.headline5,
                          )
                        ],
                      )),
                  Expanded(flex: 27, child: Container())
                ],
              )),
        ],
      ),
    );
  }
}

class OutlineIconButton extends StatelessWidget {
  final IconData icon;
  final String text;
  const OutlineIconButton({
    Key key,
    this.icon,
    this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
          height: double.infinity,
          child: RaisedButton.icon(
              color: Colors.green[500],
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(40.0)),
              onPressed: () {},
              icon: Icon(
                icon,
                color: context.colors.onSecondary,
              ),
              label: Text(
                text,
                style: context.textTheme.bodyText2
                    .copyWith(color: context.colors.onSecondary),
              ))),
    );
  }
}
