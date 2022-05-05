import 'package:flutter/material.dart';

extension TextExtension on Text {
  Text setKey(Key key) => copyWith(key: key);

  Text backgroundColor(Color color) =>
      copyWith(style: TextStyle(backgroundColor: color));

  Text uppercase() => copyWith(data: data?.toUpperCase());

  Text lowercase() => copyWith(data: data?.toLowerCase());

  Text fontSize(double fontSize) =>
      copyWith(style: TextStyle(fontSize: fontSize));

  Text italic() => copyWith(style: const TextStyle(fontStyle: FontStyle.italic));

  Text normal() => copyWith(style: const TextStyle(fontStyle: FontStyle.normal));

  Text fontStyle(FontStyle fontStyle) =>
      copyWith(style: TextStyle(fontStyle: fontStyle));

  Text letterSpacing(double letterSpacing) =>
      copyWith(style: TextStyle(letterSpacing: letterSpacing));

  Text wordSpacing(double wordSpacing) =>
      copyWith(style: TextStyle(wordSpacing: wordSpacing));

  Text alphabetic() =>
      copyWith(style: const TextStyle(textBaseline: TextBaseline.alphabetic));

  Text ideographic() =>
      copyWith(style: const TextStyle(textBaseline: TextBaseline.ideographic));

  Text textBaseline(TextBaseline textBaseline) =>
      copyWith(style: TextStyle(textBaseline: textBaseline));

  /// The height of this text span, as a multiple of the font size.
  Text height(double height) => copyWith(style: TextStyle(height: height));

  Text foreground(Paint foreground) =>
      copyWith(style: TextStyle(foreground: foreground));

  Text background(Paint background) =>
      copyWith(style: TextStyle(background: background));

  Text underline() =>
      copyWith(style: const TextStyle(decoration: TextDecoration.underline));

  Text lineThrough() =>
      copyWith(style: const TextStyle(decoration: TextDecoration.lineThrough));

  Text overline() =>
      copyWith(style: const TextStyle(decoration: TextDecoration.overline));

  Text decoration(TextDecoration decoration) =>
      copyWith(style: TextStyle(decoration: decoration));

  Text decorationColor(Color decorationColor) =>
      copyWith(style: TextStyle(decorationColor: decorationColor));

  Text decorationStyle(TextDecorationStyle decorationStyle) =>
      copyWith(style: TextStyle(decorationStyle: decorationStyle));

  Text decorationThickness(double decorationThickness) =>
      copyWith(style: TextStyle(decorationThickness: decorationThickness));

  Text debugLabel(String debugLabel) =>
      copyWith(style: TextStyle(debugLabel: debugLabel));

  Text strutStyle(StrutStyle strutStyle) => copyWith(strutStyle: strutStyle);

  Text left() => copyWith(textAlign: TextAlign.left);

  Text right() => copyWith(textAlign: TextAlign.right);

  Text center() => copyWith(textAlign: TextAlign.center);

  Text justify() => copyWith(textAlign: TextAlign.justify);

  Text start() => copyWith(textAlign: TextAlign.start);

  Text end() => copyWith(textAlign: TextAlign.end);

  Text textAlign(TextAlign textAlign) => copyWith(textAlign: textAlign);

  Text rtl() => copyWith(textDirection: TextDirection.rtl);

  Text ltr() => copyWith(textDirection: TextDirection.ltr);

  Text textDirection(TextDirection textDirection) =>
      copyWith(textDirection: textDirection);

  Text locale(Locale locale) => copyWith(locale: locale);

  Text softWrap(bool softWrap) => copyWith(softWrap: softWrap);

  Text visible() => copyWith(overflow: TextOverflow.visible);

  Text clip() => copyWith(overflow: TextOverflow.clip);

  Text fade() => copyWith(overflow: TextOverflow.fade);

  Text ellipsis() => copyWith(overflow: TextOverflow.ellipsis);

  Text setOverflow(TextOverflow overflow) => copyWith(overflow: overflow);

  Text textScaleFactor(double textScaleFactor) =>
      copyWith(textScaleFactor: textScaleFactor);

  Text setMaxLines(int maxLines) => copyWith(maxLines: maxLines);

  Text semanticsLabel(String semanticsLabel) =>
      copyWith(semanticsLabel: semanticsLabel);

  Text longestLine() => copyWith(textWidthBasis: TextWidthBasis.longestLine);

  Text parent() => copyWith(textWidthBasis: TextWidthBasis.parent);

  Text textWidthBasis(TextWidthBasis textWidthBasis) =>
      copyWith(textWidthBasis: textWidthBasis);

  Text fontFamily(String fontFamily) =>
      copyWith(style: TextStyle(fontFamily: fontFamily));

  Text style(TextStyle style) => copyWith(style: style);

  Expanded expanded() => Expanded(child: copyWith());

  Opacity opacity(double opacity) =>
      Opacity(opacity: opacity, child: copyWith());

  Padding padding(EdgeInsetsGeometry padding) =>
      Padding(padding: padding, child: copyWith());

  Text copyWith(
      {Key? key,
        String? data,
        StrutStyle? strutStyle,
        TextAlign? textAlign,
        TextDirection? textDirection = TextDirection.ltr,
        Locale? locale,
        bool? softWrap,
        TextOverflow? overflow,
        double? textScaleFactor,
        int? maxLines,
        String? semanticsLabel,
        TextWidthBasis? textWidthBasis,
        TextStyle? style}) {
    return Text(data ?? this.data ?? "",
        key: key ?? this.key,
        strutStyle: strutStyle ?? this.strutStyle,
        textAlign: textAlign ?? this.textAlign,
        textDirection: textDirection ?? this.textDirection,
        locale: locale ?? this.locale,
        softWrap: softWrap ?? this.softWrap,
        overflow: overflow ?? this.overflow,
        textScaleFactor: textScaleFactor ?? this.textScaleFactor,
        maxLines: maxLines ?? this.maxLines,
        semanticsLabel: semanticsLabel ?? this.semanticsLabel,
        textWidthBasis: textWidthBasis ?? this.textWidthBasis,
        style: style != null ? this.style?.merge(style) ?? style : this.style);
  }
}

extension TextFontWeightExtension on Text {
  Text fontWeight(FontWeight fontWeight) =>
      copyWith(style: TextStyle(fontWeight: fontWeight));

  Text thin() => copyWith(style: const TextStyle(fontWeight: FontWeight.w100));

  Text extraLight() => copyWith(style: const TextStyle(fontWeight: FontWeight.w200));

  Text light() => copyWith(style: const TextStyle(fontWeight: FontWeight.w300));

  Text medium() => copyWith(style: const TextStyle(fontWeight: FontWeight.w500));

  Text semiBold() => copyWith(style: const TextStyle(fontWeight: FontWeight.w600));

  Text bold() => copyWith(style: const TextStyle(fontWeight: FontWeight.bold));

  Text extraBold() => copyWith(style: const TextStyle(fontWeight: FontWeight.w800));

  Text boldBlack() => copyWith(style: const TextStyle(fontWeight: FontWeight.w900));
}

extension TextColorExtension on Text {
  Text color(Color color) => copyWith(style: TextStyle(color: color));

  Text white() => copyWith(style: const TextStyle(color: Colors.white));

  Text black() => copyWith(style: const TextStyle(color: Colors.black));

  Text red() => copyWith(style: const TextStyle(color: Colors.red));

  Text pink() => copyWith(style: const TextStyle(color: Colors.pink));

  Text purple() => copyWith(style: const TextStyle(color: Colors.purple));

  Text deepPurple() => copyWith(style: const TextStyle(color: Colors.deepPurple));

  Text indigo() => copyWith(style: const TextStyle(color: Colors.indigo));

  Text blue() => copyWith(style: const TextStyle(color: Colors.blue));

  Text lightBlue() => copyWith(style: const TextStyle(color: Colors.lightBlue));

  Text cyan() => copyWith(style: const TextStyle(color: Colors.cyan));

  Text teal() => copyWith(style: const TextStyle(color: Colors.teal));

  Text green() => copyWith(style: const TextStyle(color: Colors.green));

  Text lightGreen() => copyWith(style: const TextStyle(color: Colors.lightGreen));

  Text lime() => copyWith(style: const TextStyle(color: Colors.lime));

  Text yellow() => copyWith(style: const TextStyle(color: Colors.yellow));

  Text amber() => copyWith(style: const TextStyle(color: Colors.amber));

  Text orange() => copyWith(style: const TextStyle(color: Colors.orange));

  Text deepOrange() => copyWith(style: const TextStyle(color: Colors.deepOrange));

  Text brown() => copyWith(style: const TextStyle(color: Colors.brown));

  Text grey() => copyWith(style: const TextStyle(color: Colors.grey));

  Text blueGrey() => copyWith(style: const TextStyle(color: Colors.blueGrey));

  Text redAccent() => copyWith(style: const TextStyle(color: Colors.redAccent));

  Text pinkAccent() => copyWith(style: const TextStyle(color: Colors.pinkAccent));

  Text purpleAccent() => copyWith(style: const TextStyle(color: Colors.purpleAccent));

  Text deepPurpleAccent() =>
      copyWith(style: const TextStyle(color: Colors.deepPurpleAccent));

  Text indigoAccent() => copyWith(style: const TextStyle(color: Colors.indigoAccent));

  Text blueAccent() => copyWith(style: const TextStyle(color: Colors.blueAccent));

  Text lightBlueAccent() =>
      copyWith(style: const TextStyle(color: Colors.lightBlueAccent));

  Text cyanAccent() => copyWith(style: const TextStyle(color: Colors.cyanAccent));

  Text tealAccent() => copyWith(style: const TextStyle(color: Colors.tealAccent));

  Text greenAccent() => copyWith(style: const TextStyle(color: Colors.greenAccent));

  Text lightGreenAccent() =>
      copyWith(style: const TextStyle(color: Colors.lightGreenAccent));

  Text limeAccent() => copyWith(style: const TextStyle(color: Colors.limeAccent));

  Text yellowAccent() => copyWith(style: const TextStyle(color: Colors.yellowAccent));

  Text amberAccent() => copyWith(style: const TextStyle(color: Colors.amberAccent));

  Text orangeAccent() => copyWith(style: const TextStyle(color: Colors.orangeAccent));

  Text deepOrangeAccent() =>
      copyWith(style: const TextStyle(color: Colors.deepOrangeAccent));

  Text bgWhite() => copyWith(style: const TextStyle(backgroundColor: Colors.white));

  Text bgBlack() => copyWith(style: const TextStyle(backgroundColor: Colors.black));

  Text bgRed() => copyWith(style: const TextStyle(backgroundColor: Colors.red));

  Text bgPink() => copyWith(style: const TextStyle(backgroundColor: Colors.pink));

  Text bgPurple() => copyWith(style: const TextStyle(backgroundColor: Colors.purple));

  Text bgDeepPurple() =>
      copyWith(style: const TextStyle(backgroundColor: Colors.deepPurple));

  Text bgIndigo() => copyWith(style: const TextStyle(backgroundColor: Colors.indigo));

  Text bgBlue() => copyWith(style: const TextStyle(backgroundColor: Colors.blue));

  Text bgLightBlue() =>
      copyWith(style: const TextStyle(backgroundColor: Colors.lightBlue));

  Text bgCyan() => copyWith(style: const TextStyle(backgroundColor: Colors.cyan));

  Text bgTeal() => copyWith(style: const TextStyle(backgroundColor: Colors.teal));

  Text bgGreen() => copyWith(style: const TextStyle(backgroundColor: Colors.green));

  Text bgLightGreen() =>
      copyWith(style: const TextStyle(backgroundColor: Colors.lightGreen));

  Text bgLime() => copyWith(style: const TextStyle(backgroundColor: Colors.lime));

  Text bgYellow() => copyWith(style: const TextStyle(backgroundColor: Colors.yellow));

  Text bgAmber() => copyWith(style: const TextStyle(backgroundColor: Colors.amber));

  Text bgOrange() => copyWith(style: const TextStyle(backgroundColor: Colors.orange));

  Text bgDeepOrange() =>
      copyWith(style: const TextStyle(backgroundColor: Colors.deepOrange));

  Text bgBrown() => copyWith(style: const TextStyle(backgroundColor: Colors.brown));

  Text bgGrey() => copyWith(style: const TextStyle(backgroundColor: Colors.grey));

  Text bgBlueGrey() =>
      copyWith(style: const TextStyle(backgroundColor: Colors.blueGrey));

  Text bgRedAccent() =>
      copyWith(style: const TextStyle(backgroundColor: Colors.redAccent));

  Text bgPinkAccent() =>
      copyWith(style: const TextStyle(backgroundColor: Colors.pinkAccent));

  Text bgPurpleAccent() =>
      copyWith(style: const TextStyle(backgroundColor: Colors.purpleAccent));

  Text bgDeepPurpleAccent() =>
      copyWith(style: const TextStyle(backgroundColor: Colors.deepPurpleAccent));

  Text bgIndigoAccent() =>
      copyWith(style: const TextStyle(backgroundColor: Colors.indigoAccent));

  Text bgBlueAccent() =>
      copyWith(style: const TextStyle(backgroundColor: Colors.blueAccent));

  Text bgLightBlueAccent() =>
      copyWith(style: const TextStyle(backgroundColor: Colors.lightBlueAccent));

  Text bgCyanAccent() =>
      copyWith(style: const TextStyle(backgroundColor: Colors.cyanAccent));

  Text bgTealAccent() =>
      copyWith(style: const TextStyle(backgroundColor: Colors.tealAccent));

  Text bgGreenAccent() =>
      copyWith(style: const TextStyle(backgroundColor: Colors.greenAccent));

  Text bgLightGreenAccent() =>
      copyWith(style: const TextStyle(backgroundColor: Colors.lightGreenAccent));

  Text bgLimeAccent() =>
      copyWith(style: const TextStyle(backgroundColor: Colors.limeAccent));

  Text bgYellowAccent() =>
      copyWith(style: const TextStyle(backgroundColor: Colors.yellowAccent));

  Text bgAmberAccent() =>
      copyWith(style: const TextStyle(backgroundColor: Colors.amberAccent));

  Text bgOrangeAccent() =>
      copyWith(style: const TextStyle(backgroundColor: Colors.orangeAccent));

  Text bgDeepOrangeAccent() =>
      copyWith(style: const TextStyle(backgroundColor: Colors.deepOrangeAccent));
}