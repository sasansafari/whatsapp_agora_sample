import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:whatsapp_agora_sample/component/theme.dart';
import 'package:whatsapp_agora_sample/model/message_model.dart';
import 'package:whatsapp_agora_sample/model/user_contact_list_model.dart';
import 'package:whatsapp_agora_sample/model/user_inbox_list_model.dart';
import 'package:whatsapp_agora_sample/view/main_screen.dart';

void main() async {
  await Hive.initFlutter();

  Hive
  ..registerAdapter(UserContactListModelAdapter())
  ..registerAdapter(UserInboxListModelAdapter())
  ..registerAdapter(MessageModelAdapter());

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var isDarkMode = true;
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme:/**  isDarkMode ? darkMode() :*/ lightMode(),
      home: MainScreen(),
    );
  }
}
