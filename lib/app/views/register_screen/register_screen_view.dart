import 'package:circular_check_box/circular_check_box.dart';
import 'package:flutter/material.dart';

import '../../../core/extensions/context_entension.dart';
import '../../components/button/registerRadiusButton.dart';
import '../../components/input/text_input.dart';
import 'register_screen_view_model.dart';

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
          "Kullanıcı Sözleşmesini Kabul Etmek İçin İşaretleyiniz..",
          style: context.textTheme.bodyText2.copyWith(fontSize: 11),
        )
      ],
    );
  }

  Widget get registerHeadText {
    return Text("Kayıt Ol",
        style: context.textTheme.headline3.copyWith(fontFamily: "OpenSans"));
  }

  TextWidget get registerNameInput {
    return TextWidget(
      labelText: "Ad ve Soyad Giriniz",
      warningText: "Ad Soyad Karakter Sayısı Yetersiz",
      icon: Icons.supervised_user_circle,
      inputType: TextInputType.text,
      controller: nameController,
    );
  }

  TextWidget get registerEmailInput {
    return TextWidget(
      labelText: "Email Giriniz",
      warningText: "Email Karakter Sayısı Yetersiz",
      icon: Icons.ac_unit,
      inputType: TextInputType.emailAddress,
      minLength: 3,
      controller: emailController,
    );
  }

  TextWidget get registerPhoneInput {
    return TextWidget(
      labelText: "Telefon Giriniz",
      warningText: "Telefon Karakter Sayısı Yetersiz",
      icon: Icons.phone,
      inputType: TextInputType.phone,
      minLength: 3,
      controller: phoneController,
    );
  }

  TextWidget get registerAddressInput {
    return TextWidget(
      labelText: "Adres Giriniz (şehir/ilçe)",
      warningText: "Telefon Karakter Sayısı Yetersiz",
      icon: Icons.location_city,
      inputType: TextInputType.text,
      minLength: 3,
      controller: addressController,
    );
  }

  TextWidget get registerPasswordInput {
    return TextWidget(
      isSecret: true,
      labelText: "Şifre Giriniz",
      warningText: "Şifre Karakter Sayısı Yetersiz",
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
        text: "Kayıt Ol",
        color: Colors.green[500],
        onpressed: () {},
      ),
    );
  }
}
