import 'package:flutterfoodapp/app/views/onboarding_screens/sk_onboarding_model.dart';
import 'package:flutter/material.dart';

final pages = [
    SkOnboardingModel(
        title: 'Secondhand Books',
        description:
            'Use and near new secondhand books at great prices.',
        titleColor: Colors.black,
        descripColor: const Color(0xFF929794),
        imagePath: 'assets/images/onBoarding1.png'),
    SkOnboardingModel(
        title: '20 Book Grocers Nationally',
        description:
            'We`ve successfully opened 20 stores across Australia.',
        titleColor: Colors.black,
        descripColor: const Color(0xFF929794),
        imagePath: 'assets/images/onBoarding2.png'),
    SkOnboardingModel(
        title: 'Sell or Recycle Your Old Books With Us',
        description: 'If you`re looking to downsize',
        titleColor: Colors.black,
        descripColor: const Color(0xFF929794),
        imagePath: 'assets/images/onBoarding3.png'),
  ];
