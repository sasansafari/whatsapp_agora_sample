import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:whatsapp_agora_sample/constants/whatsapp_color.dart';


class SnTextStyles{

    static TextStyle  usernameTextStyle = GoogleFonts.redHatText(
      fontSize: 17,
      fontWeight: FontWeight.w500,
      fontStyle: FontStyle.normal,
    );

    static TextStyle  messageTextStyle = GoogleFonts.redHatText(
      fontSize: 15,
      fontWeight: FontWeight.w300,
      fontStyle: FontStyle.normal,
    );

    static TextStyle  timeTextStyle = GoogleFonts.redHatText(
      fontSize: 12,
      fontWeight: FontWeight.w300,
      fontStyle: FontStyle.normal,
    );

    static TextStyle  unselectedTabBarTextStyle = GoogleFonts.inter(
        fontSize: 11,
        fontWeight: FontWeight.w300,
        fontStyle: FontStyle.normal,
        color: SnColors.unselectedTabBarColor);
        
    static TextStyle  selectedTabBarTextStyle = GoogleFonts.inter(
        fontSize: 11,
        fontWeight: FontWeight.w300,
        fontStyle: FontStyle.normal,
        color: Colors.white);


    static TextStyle  bigTitle = GoogleFonts.inter(
        fontSize: 17,
        fontWeight: FontWeight.w400,
        fontStyle: FontStyle.normal,
        color: Colors.black);

    static TextStyle  cation = GoogleFonts.inter(
        fontSize: 15,
        fontWeight: FontWeight.w300,
        fontStyle: FontStyle.normal,
        color: Colors.black);

    static TextStyle  lightTextButton = GoogleFonts.inter(
        fontSize: 15,
        fontWeight: FontWeight.w700,
        fontStyle: FontStyle.normal,
        color: const Color.fromARGB(255, 255, 255, 255));

          static TextStyle todayText   = GoogleFonts.inter(
        fontSize: 10,
        fontWeight: FontWeight.w400,
        fontStyle: FontStyle.normal,
        color:SnColors.todayColor);
        
         static TextStyle messageText   = GoogleFonts.inter(
        fontSize: 18,
        fontWeight: FontWeight.w400,
        fontStyle: FontStyle.normal,
        color:SnColors.todayColor);


}