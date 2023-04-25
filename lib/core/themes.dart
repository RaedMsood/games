import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hexcolor/hexcolor.dart';

 Color? containerColor;

ThemeData darkTheme=ThemeData(
  primarySwatch: Colors.purple,
  scaffoldBackgroundColor: Colors.grey[900],

  appBarTheme:  AppBarTheme(
    backwardsCompatibility: false,
    backgroundColor: Colors.grey[900],
    elevation: 0.0,
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: HexColor('333739 '),
      statusBarIconBrightness: Brightness.light,
    ),
    titleTextStyle: TextStyle(
      color: Colors.white,
      fontSize: 20.0, fontWeight: FontWeight.w500,
    ),
    iconTheme: IconThemeData(
      color: Colors.white,
    ),
  ),
  bottomNavigationBarTheme:  BottomNavigationBarThemeData(
    type: BottomNavigationBarType.fixed,
    selectedItemColor: Colors.purple,
    elevation: 0,
    backgroundColor: Colors.grey[800],
    unselectedItemColor: Colors.white,
  ),

  textTheme: TextTheme(
    bodyText2: TextStyle(
      fontSize: 15.0,fontWeight: FontWeight.w500,
      color: Colors.grey[400],
    ),
  ),

  fontFamily: 'CeraProMedium',
);
ThemeData lightTheme=ThemeData(
  primarySwatch: Colors.purple,
  scaffoldBackgroundColor: Colors.grey[100],
  appBarTheme:  AppBarTheme(
    backwardsCompatibility: false,
    backgroundColor: Colors.grey[100],
    elevation: 0.0,
    systemOverlayStyle: SystemUiOverlayStyle(
       statusBarColor: HexColor('333739 '),
      statusBarIconBrightness: Brightness.dark,


    ),
    titleTextStyle: TextStyle(
      color: Colors.black,
      fontSize: 20.0,
    ),
    iconTheme: IconThemeData(
      color: Colors.black,
    ),
  ),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    type: BottomNavigationBarType.fixed,
    selectedItemColor: Colors.purple,
    unselectedItemColor: Colors.black,


    elevation: 0.0,
  ),
  textTheme: TextTheme(
    bodyText2: TextStyle(
      fontSize: 15.0,fontWeight: FontWeight.w500,
      color: Colors.grey[600],
    ),
  ),
  fontFamily:'CeraProMedium',

);