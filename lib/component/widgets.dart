import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:whatsapp_agora_sample/constants/dimens.dart';

import '../constants/whatsapp_color.dart';
import '../gen/assets.gen.dart';
import 'text_style.dart';




class SnWidgets {


static Widget userItem({
  required int index,
  required String name,
  required String imagePath,
  required String lastMaeeage,
  required String time,
}) {
  return Padding(
    padding: const EdgeInsets.all(12.0),
    child: Container(
      color: Colors.transparent,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: Image.asset(Assets.images.av.path).image
                          // ignore: unnecessary_null_comparison
                          // imagePath==null? Image.asset(Assets.images.av.path).image
                          // :Image.network(imagePath).image)),
                          ))),
              const SizedBox(
                width: 12,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style:SnTextStyles.usernameTextStyle,
                  ),
                  Text(
                    lastMaeeage,
                    style: SnTextStyles.messageTextStyle,
                  ),
                ],
              ),
            ],
          ),
          Column(
            children: [
              Text(
                time,
                style: SnTextStyles.timeTextStyle,
              ),
              Container(
                height: 18,
                width: 18,
                decoration: BoxDecoration(shape: BoxShape.circle, color: SnColors.badg),
                child: const Center(child: Text("1")),
              ),
            ],
          )
        ],
      ),
    ),
  );
}
static Widget callsItem({
  required int index,
  required String name,
  required String imagePath,
  required String lastMaeeage,
  required String time,
})

{
  return Padding(
    padding: const EdgeInsets.all(12.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            avatar(),
            const SizedBox(
              width: 12,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: SnTextStyles.usernameTextStyle,
                ),
                Row(
                  children: [
                    SvgPicture.asset(Assets.icons.incall,color: Colors.green,),
                    SizedBox(width: Dimens.small,),
                    Text(
                      lastMaeeage,
                      style: SnTextStyles.messageTextStyle,
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
       SvgPicture.asset(Assets.icons.phoneIcon)
      ],
    ),
  );
}

static Widget avatar() {
  return Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: Image.asset(Assets.images.av.path).image
                      // ignore: unnecessary_null_comparison
                      // imagePath==null? Image.asset(Assets.images.av.path).image
                      // :Image.network(imagePath).image)),
                      )));
    }

}