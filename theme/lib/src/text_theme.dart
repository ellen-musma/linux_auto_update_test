import 'package:dandi_theme/gen/fonts.gen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DandiTextTheme {

  TextStyle configureDefaultTextStyle({
    required double size,
    required double height,
    double? letterSpacing = 0,
  }) {
    return TextStyle(
      fontFamily: FontFamily.pretendard,
      fontSize: size,
      color: Colors.white,
      height: height,
      letterSpacing: letterSpacing,
    );
  }

  //Heading
  TextStyle get h1Heading => configureDefaultTextStyle(size: 40.0, height: 1.4, letterSpacing: -0.6).toBold();
  TextStyle get h2Heading => configureDefaultTextStyle(size: 32.0, height: 1.5, letterSpacing: -0.6).toBold();
  TextStyle get h3Heading => configureDefaultTextStyle(size: 24.0, height: 1.33, letterSpacing: -0.6).toSemiBold();
  TextStyle get h4Heading => configureDefaultTextStyle(size: 20.0, height: 1.5, letterSpacing: -0.2).toSemiBold();
  TextStyle get h5Heading => configureDefaultTextStyle(size: 18.0, height: 1.33, letterSpacing: -0.2).toSemiBold();
  TextStyle get h6Heading => configureDefaultTextStyle(size: 16.0, height: 1.5, letterSpacing: -0.2).toSemiBold();

  //Subheading
  TextStyle get s1SubTitle => configureDefaultTextStyle(size: 20.0, height: 1.0, letterSpacing: -0.2).toRegular();
  TextStyle get s2SubTitle => configureDefaultTextStyle(size: 14.0, height: 1.428).toSemiBold();
  TextStyle get s3SubTitle => configureDefaultTextStyle(size: 12.0, height: 1.5).  toSemiBold();

  //Body
  TextStyle get b0Body => configureDefaultTextStyle(size: 24.0, height: 1.0, letterSpacing: -0.2).toRegular();
  TextStyle get b1Body => configureDefaultTextStyle(size: 18.0, height: 1.33, letterSpacing: -0.2).toRegular();
  TextStyle get b2Body => configureDefaultTextStyle(size: 16.0, height: 1.375, letterSpacing: -0.2).toRegular();
  TextStyle get b3Body => configureDefaultTextStyle(size: 14.0, height: 1.428).toRegular();

  //Caption
  TextStyle get c1Caption => configureDefaultTextStyle(size: 12.0, height: 1.33).toRegular();
  TextStyle get c2Caption => configureDefaultTextStyle(size: 10.0, height: 1.4).toRegular();
}

extension on TextStyle {
  TextStyle toBold() => copyWith(fontWeight: FontWeight.w700);

  TextStyle toSemiBold() => copyWith(fontWeight: FontWeight.w600);

  TextStyle toRegular() => copyWith(fontWeight: FontWeight.w400);
}