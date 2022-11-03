import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whatsapp_agora_sample/component/input_decoration.dart';
import 'package:whatsapp_agora_sample/component/text_style.dart';
import 'package:whatsapp_agora_sample/constants/dimens.dart';
import 'package:whatsapp_agora_sample/constants/whatsapp_color.dart';
import 'package:whatsapp_agora_sample/gen/assets.gen.dart';

class ChatScreen extends StatelessWidget {
  ChatScreen({Key? key}) : super(key: key);

//TODO test and later get from hive
  var myPhone = 1234;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        actions: const [
          SizedBox(
            width: Dimens.normal,
          ),
          Icon(Icons.video_call),
          SizedBox(
            width: Dimens.normal,
          ),
          Icon(CupertinoIcons.phone),
          SizedBox(
            width: Dimens.normal,
          ),
          Icon(Icons.menu),
          SizedBox(
            width: Dimens.normal,
          ),
        ],
        title: Row(
          children: [
            Image.asset(
              Assets.images.av.path,
              height: 33,
            ),
            const SizedBox(
              width: Dimens.normal,
            ),
            const Expanded(
              child: Text(
                "ali sadeghi irancell",
                softWrap: false,
                overflow: TextOverflow.fade,
              ),
            ),

            // Expanded(
            //   child: FittedBox(
            //         child: Text(
            //           "amir hossein safari ",

            //           ),
            //       ),
            // )
          ],
        ),
      ),
      body: Stack(
        children: [
        //backgroad
        Positioned(
            child: Container(
          child: Image.asset(Assets.images.wall.path),
        )),

        //messages
        SizedBox(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 9,
              ),
              
              //today / date
              Container(
                width: 55,
                height: 16,
                decoration: BoxDecoration(
                  color: SnColors.lightScaffoldBackgraoundColor,
                  borderRadius: BorderRadius.circular(7),
                ),
                child: Center(
                    child: Text(
                  "Today",
                  style: SnTextStyles.todayText,
                )),
              ),
             
              //message list
              Expanded(
                child: SizedBox(
                  width: Get.width,
                  child: ListView.builder(
                    physics: BouncingScrollPhysics(),
                      itemCount: messages.length,
                      itemBuilder: ((context, index) {
                        return messages[index]['userId'] == myPhone
                            ? outputMessage(messages[index]['content'])
                            : inputMessage(messages[index]['content']);
                      })),
                ),
              ),
              
              //edit text box
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                   
                  Expanded(
                    flex: 8,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 1.2, right: 4),
                      child: Container(
                          height: 58,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: SnColors.lightScaffoldBackgraoundColor,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(Dimens.small),
                            child: Row(
                              children: [
                                const SizedBox(
                                  width: 13,
                                ),
                                Image(
                                    image: Image.asset(Assets.icons.emoji.path)
                                        .image),
                                const SizedBox(
                                  width: Dimens.small,
                                ),
                                Expanded(
                                  child: TextField(
                                      decoration: SnInputDecotration.sendMessage(
                                          hintText: "send message")),
                                ),
                                const SizedBox(
                                  width: Dimens.small,
                                ),
                                Image(
                                    image:
                                        Image.asset(Assets.icons.attachment.path)
                                            .image),
                                const SizedBox(
                                  width: Dimens.small,
                                ),
                                Image(
                                    image: Image.asset(Assets.icons.subtract.path)
                                        .image),
                                const SizedBox(
                                  width: Dimens.small,
                                ),
                                Image(
                                    image:
                                        Image.asset(Assets.icons.groupcamera.path)
                                            .image),
                              ],
                            ),
                          )),
                    ),
                  ),

                  Expanded(
                    flex: 2,
                    child: Container(
                      height: 58,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: SnColors.badg,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Image(
                            image:
                                Image.asset(Assets.icons.microphone.path).image),
                      ),
                    ),
                  ),
                ]),
              ),
            ],
          ),
        ),
      ]),
    ));
  }

  Widget outputMessage(String msg) {
    return Padding(
      padding: EdgeInsets.fromLTRB(
          Dimens.xlarge * 2, Dimens.normal, Dimens.normal, 0),
      child: Container(
        decoration: BoxDecoration(
            color: SnColors.messageColor,
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(Dimens.normal),
              bottomRight: Radius.circular(Dimens.normal),
              topLeft: Radius.circular(Dimens.normal),
              topRight: Radius.circular(0),
            )),
        width: double.infinity,
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(msg),
        ),
      ),
    );
  }
}

Widget inputMessage(String msg) {
  return Padding(
    padding:
        EdgeInsets.fromLTRB(Dimens.normal, Dimens.normal, Dimens.xlarge * 2, 0),
    child: Container(
      decoration: BoxDecoration(
          color: SnColors.messageColor,
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(Dimens.normal),
            bottomRight: Radius.circular(Dimens.normal),
            topLeft: Radius.circular(0),
            topRight: Radius.circular(Dimens.normal),
          )),
      width: double.infinity,
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Text(msg),
      ),
    ),
  );
}

enum MessageStatus {
  deliveredUserOffline,
  deliveredUserOnline,
  read,
}

enum MessageContentType {
  image,
  video,
  text,
  voice,
}

List messages = [
  {
    'content': "Hyy Gloriay!",
    'time': "05:00",
    'messageStatus': MessageStatus.read.name,
    'userId': 1234,
    'messageContentType': MessageContentType.text.name
  },
  {
    'content': "How do you know Utsav Gandhi",
    'time': "05:00",
    'messageStatus': MessageStatus.read.name,
    'userId': 5678,
    'messageContentType': MessageContentType.text.name
  },
  {
    'content': "How do you know Utsav GandhiHow do you know Utsav Gandhi",
    'time': "05:00",
    'messageStatus': MessageStatus.read.name,
    'userId': 1234,
    'messageContentType': MessageContentType.text.name
  },
  {
    'content': " Gloriay!",
    'time': "05:00",
    'messageStatus': MessageStatus.read.name,
    'userId': 5678,
    'messageContentType': MessageContentType.text.name
  },
  {
    'content': "How do you know Utsav GandhiHow do you know Utsav Gandhi",
    'time': "05:00",
    'messageStatus': MessageStatus.read.name,
    'userId': 1234,
    'messageContentType': MessageContentType.text.name
  },
  {
    'content': "How do you know Utsav Gandhi Gloriay!",
    'time': "05:00",
    'messageStatus': MessageStatus.read.name,
    'userId': 1234,
    'messageContentType': MessageContentType.text.name
  },
  {
    'content': "Hyy How do you know Utsav Gandhi!",
    'time': "05:00",
    'messageStatus': MessageStatus.read.name,
    'userId': 5678,
    'messageContentType': MessageContentType.text.name
  },
  {
    'content': "How do you",
    'time': "05:00",
    'messageStatus': MessageStatus.read.name,
    'userId': 5678,
    'messageContentType': MessageContentType.text.name
  },
  {
    'content': "Hyy Gloriay!",
    'time': "05:00",
    'messageStatus': MessageStatus.read.name,
    'userId': 1234,
    'messageContentType': MessageContentType.text.name
  },
  {
    'content': "How do you know Utsav Gandhi",
    'time': "05:00",
    'messageStatus': MessageStatus.read.name,
    'userId': 5678,
    'messageContentType': MessageContentType.text.name
  },
  {
    'content': "How do you know Utsav GandhiHow do you know Utsav Gandhi",
    'time': "05:00",
    'messageStatus': MessageStatus.read.name,
    'userId': 1234,
    'messageContentType': MessageContentType.text.name
  },
  {
    'content': " Gloriay!",
    'time': "05:00",
    'messageStatus': MessageStatus.read.name,
    'userId': 5678,
    'messageContentType': MessageContentType.text.name
  },
  {
    'content': "How do you know Utsav GandhiHow do you know Utsav Gandhi",
    'time': "05:00",
    'messageStatus': MessageStatus.read.name,
    'userId': 1234,
    'messageContentType': MessageContentType.text.name
  },
  {
    'content': "How do you know Utsav Gandhi Gloriay!",
    'time': "05:00",
    'messageStatus': MessageStatus.read.name,
    'userId': 1234,
    'messageContentType': MessageContentType.text.name
  },
  {
    'content': "Hyy How do you know Utsav Gandhi!",
    'time': "05:00",
    'messageStatus': MessageStatus.read.name,
    'userId': 5678,
    'messageContentType': MessageContentType.text.name
  },
  {
    'content': "How do you",
    'time': "05:00",
    'messageStatus': MessageStatus.read.name,
    'userId': 5678,
    'messageContentType': MessageContentType.text.name
  },
];








//1: loging 1234 => hive/app
//2: check i/o  myNumInHive == userId?messageIo=o : messageIo=i
