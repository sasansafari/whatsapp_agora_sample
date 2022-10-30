

import 'package:flutter/material.dart';
import 'package:whatsapp_agora_sample/constants/dimens.dart';
import 'package:whatsapp_agora_sample/constants/whatsapp_color.dart';

 class SnInputDecotration{
 
    static InputDecoration normalForms({required String hintText,IconData? icon}){
       return InputDecoration(
          hintText: hintText,
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(Dimens.small),
              borderSide: BorderSide(color: SnColors.whatsappColor)),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(Dimens.small),
            borderSide: BorderSide(color: SnColors.whatsappColor),
          ),
          filled: true,
          prefixIcon:Icon(icon) ,
          fillColor: SnColors.lightScaffoldBackgraoundColor);
    }
 
    static InputDecoration sendMessage({required String hintText,IconData? icon}){
       return InputDecoration(
          hintText: hintText,
          enabledBorder: OutlineInputBorder(
               borderSide: BorderSide.none),
          border: OutlineInputBorder(
             borderSide: BorderSide.none,
          ),
          filled: true,
          prefixIcon:Icon(icon) ,
          fillColor: SnColors.lightScaffoldBackgraoundColor);
    }



    static InputDecoration searchForms({required String hintText}){
       return InputDecoration(
          hintText: hintText,
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(Dimens.small),
              borderSide: BorderSide(color: SnColors.whatsappColor)),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(Dimens.small),
            borderSide: BorderSide(color: SnColors.whatsappColor),
          ),
          filled: true,
          prefixIcon: const Icon(Icons.search),
          fillColor: SnColors.lightScaffoldBackgraoundColor);
    }



}