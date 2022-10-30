import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whatsapp_agora_sample/component/text_style.dart';
import 'package:whatsapp_agora_sample/constants/dimens.dart';
import 'package:whatsapp_agora_sample/constants/whatsapp_color.dart';
import 'package:whatsapp_agora_sample/gen/assets.gen.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({Key? key}) : super(key: key);

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

          Image.asset(Assets.images.av.path,height: 33,),
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
      body: Stack(children: [
        Positioned(child: Container(color: Colors.blue,)),
        SizedBox(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 9,),
              Container(     
                width: 55,     
                height: 16,
                decoration: BoxDecoration(
                  color: SnColors.lightScaffoldBackgraoundColor,
                  borderRadius: BorderRadius.circular(7),
                  
                ),child: Center(
                  child: Text("Today",style:SnTextStyles.todayText,)),
                ),
              SizedBox(
                height: Get.height/2,
                width: Get.width,
                child: ListView.builder(
                  itemCount: 5,
                  itemBuilder: ((context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 26,
                      width: double.infinity,
                      color: Colors.black,),
                  );
                })),
              )
            ],
          ),
        ),
        
      ]),

      bottomNavigationBar:
        Container(
          color: Colors.blue,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
             
               Padding(
                 padding: const EdgeInsets.only(left:1.2,right: 4),
                 child: Container(
              width: 359,
              height: 50,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),   
                  color: SnColors.lightScaffoldBackgraoundColor,
              ),
             child: 
            Row(
              children: [
                const SizedBox(width: 13,),
                 Image(image: Image.asset(Assets.icons.emoji.path).image),
                 const SizedBox(width: 11,height: 11,),
                 Text("Messages",style: SnTextStyles.messageText,),
                 const SizedBox(width: 150,),
                 Image(image: Image.asset(Assets.icons.attachment.path).image),
                 const SizedBox(width: 6,),
                  Image(image: Image.asset(Assets.icons.subtract.path).image),
                   const SizedBox(width: 6,),
                   Image(image: Image.asset(Assets.icons.groupcamera.path).image),

              ],
            )
              ),
               ),
            
              Container(
              height: 46,
              width: 46,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: SnColors.badg,
              ),  
              child: 
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Image(image: Image.asset(Assets.icons.microphone.path).image),
                ),
              
              ),
           
            ]
            
          ),
        ),

       
    ));
    
  }
}
