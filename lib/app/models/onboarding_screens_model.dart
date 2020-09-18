import 'package:flutterfoodapp/app/views/onboarding_screens/sk_onboarding_model.dart';
import 'package:flutter/material.dart';
import '../../core/extensions/string_extension.dart';

final pages = [
    SkOnboardingModel(
        title: 'Available and Easily'.locale,
        description:
            'Use new secondhand books at great prices and find them near you.'.locale,
        titleColor: Colors.black,
        descripColor: const Color(0xFF929794),
        imagePath: 'assets/images/onBoarding1.png'),
    SkOnboardingModel(
        title: 'Near and Cheap'.locale,
        description:
            'Easily find the recipient of your secondhand book.'.locale,
        titleColor: Colors.black,
        descripColor: const Color(0xFF929794),
        imagePath: 'assets/images/onBoarding2.png'),
    SkOnboardingModel(
        title: 'Enjoy..'.locale,
        description: 'Enjoy your new and cheap book.'.locale,
        titleColor: Colors.black,
        descripColor: const Color(0xFF929794),
        imagePath: 'assets/images/onBoarding3.png'),
  ];
