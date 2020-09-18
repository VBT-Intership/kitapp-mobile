import 'package:circular_check_box/circular_check_box.dart';
import 'package:flutter/material.dart';
import 'package:flutterfoodapp/core/constants/navigation/navigation_constants.dart';

import '../../../core/extensions/context_entension.dart';
import '../../components/button/registerRadiusButton.dart';
import '../../components/input/text_input.dart';
import 'register_screen_view_model.dart';
import '../../../core/extensions/string_extension.dart';

class RegisterScreenView extends RegisterScreenViewModel {
  bool agreement = false;
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(
              Icons.keyboard_arrow_left,
              color: Colors.green[500],
              size: 30,
            ),
            onPressed: () {
              Navigator.pop(context);
            }),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
                width: context.width,
                height: context.height,
                padding: EdgeInsets.fromLTRB(
                    context.mediumValue, 0, context.mediumValue, 0),
                color: Colors.white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(flex: 5, child: registerHeadText),
                    Spacer(flex: 1),
                    Expanded(flex: 5, child: registerNameInput),
                    Spacer(flex: 1),
                    Expanded(flex: 5, child: registerEmailInput),
                    Spacer(flex: 1),
                    Expanded(flex: 5, child: registerPhoneInput),
                    Spacer(flex: 1),
                    Expanded(flex: 5, child: registerAddressInput),
                    Spacer(flex: 1),
                    Expanded(flex: 5, child: registerPasswordInput),
                    Spacer(flex: 1),
                    Expanded(flex: 5, child: registerCheckBox),
                    Spacer(flex: 1),
                    Expanded(flex: 5, child: registerButton),
                    Spacer(flex: 8),
                  ],
                )),
          ],
        ),
      ),
    );
  }

  Widget get registerCheckBox {
    return Row(
      children: [
        CircularCheckBox(
            activeColor: Colors.green,
            value: agreement,
            onChanged: (bool value) {
              setState(() {
                agreement = !agreement;
              });
            }),
        Text(
          "Check to Accept User Agreement ...".locale,
          style: context.textTheme.bodyText2
              .copyWith(fontSize: context.width * 0.025),
        )
      ],
    );
  }

  Widget get registerHeadText {
    return Text("Sing up".locale,
        style: context.textTheme.headline3.copyWith(fontFamily: "OpenSans"));
  }

  TextWidget get registerNameInput {
    return TextWidget(
      labelText: "First & Last Name".locale,
      warningText: "Name Surname Number of Characters Insufficient".locale,
      icon: Icons.supervised_user_circle,
      inputType: TextInputType.text,
      controller: nameController,
    );
  }

  TextWidget get registerEmailInput {
    return TextWidget(
      labelText: "Enter E-mail".locale,
      warningText: "Insufficient Number of Email Characters".locale,
      icon: Icons.mail,
      inputType: TextInputType.emailAddress,
      minLength: 3,
      controller: emailController,
    );
  }

  TextWidget get registerPhoneInput {
    return TextWidget(
      labelText: "Mobile Phone".locale,
      warningText: "Insufficient Phone Character Count".locale,
      icon: Icons.phone,
      inputType: TextInputType.phone,
      minLength: 3,
      controller: phoneController,
    );
  }

  TextWidget get registerAddressInput {
    return TextWidget(
      labelText: "Enter Address (city / town)".locale,
      warningText:"Address Information is Insufficient".locale,
      icon: Icons.location_city,
      inputType: TextInputType.text,
      minLength: 3,
      controller: addressController,
    );
  }

  TextWidget get registerPasswordInput {
    return TextWidget(
      isSecret: true,
      labelText: "Enter Password".locale,
      warningText: "Password Insufficient Number of Characters".locale,
      icon: Icons.security,
      inputType: TextInputType.text,
      minLength: 3,
      controller: passwordController,
    );
  }

  Container get registerButton {
    return Container(
      width: double.infinity,
      child: RegisterOutlineIconButton(
        text: "Sing up".locale,
        color: Colors.green[500],
        onpressed: () {
          navigation.navigateToPage(
              path: NavigationConstants.CATEGORY_CHOOSE_VIEW);
        },
      ),
    );
  }
}
