import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:whatsapp_agora_sample/component/text_style.dart';
import 'package:whatsapp_agora_sample/constants/whatsapp_color.dart';
import 'package:whatsapp_agora_sample/controller/user_inbox_list_controller.dart';
import 'package:whatsapp_agora_sample/gen/assets.gen.dart';

import '../component/widgets.dart';
import 'chat_screen.dart';
import 'contact_list.dart';

// ignore: must_be_immutable
 

class MainScreen extends StatelessWidget {
  RxInt selectedTabIndex = 0.obs;

  UserInboxListController userInboxListController =
      Get.put(UserInboxListController());
  var tabSize = Get.width / 4;

 

  @override
  Widget build(BuildContext context) {

    return SafeArea(
        child: Scaffold(
      body:DefaultTabController(
        length: 1,
        child: mainAppBar(tabSize),
      ),
    
      floatingActionButton: addNewChat(),
    )
    );
  }

  FloatingActionButton addNewChat() {
    return FloatingActionButton(
        onPressed: (() {
          Get.to(ContactListScreen());
        }),
        child: const Icon(Icons.chat));
  }

  NestedScrollView mainAppBar(double tabSize) {
    return NestedScrollView(     
                headerSliverBuilder: (context, innerBoxIsScrolled) {
                  return [
                    SliverAppBar(
                      title: const Text("WhatsApp"),
                      backgroundColor: SnColors.whatsappColor,
                      expandedHeight: 100,    
                      pinned: true,
                      floating: true,
                      bottom: TabBar(
                        tabs: [
                          Container(
                            height: 35,
                            color:  SnColors.whatsappColor,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                //camnera
                                SizedBox(
                                  width: Get.width / 13,
                                  child: const Icon(
                                    Icons.camera,
                                    color: Colors.white,
                                  ),
                                ),
                                //tabs
                                Expanded(
                                  child: SizedBox(
                                    height: 34,
                                    child: Center(
                                        child: ListView.builder(
                                            scrollDirection: Axis.horizontal,
                                            itemCount: tabTitleList.length,
                                            shrinkWrap: true,
                                            itemBuilder:
                                                ((context, index) =>
                                                    GestureDetector(
                                                      onTap: (() {
                                                        selectedTabIndex.value =
                                                            index;
                                                      }),
                                                      child: Obx(
                                                        () => SizedBox(
                                                            width: tabSize,
                                                            child: Center(
                                                                child: Column(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceAround,
                                                              children: [
                                                                Text(
                                                                  tabTitleList[
                                                                      index],
                                                                  style: index ==
                                                                          selectedTabIndex
                                                                              .value
                                                                      ? SnTextStyles.selectedTabBarTextStyle
                                                                      : SnTextStyles.unselectedTabBarTextStyle,
                                                                ),
                                                                Padding(
                                                                  padding: const EdgeInsets
                                                                          .symmetric(
                                                                      horizontal:
                                                                          4),
                                                                  child:
                                                                      AnimatedOpacity(
                                                                          duration: const Duration(
                                                                              milliseconds:
                                                                                  500),
                                                                          opacity: index == selectedTabIndex.value
                                                                              ? 1
                                                                              : 0,
                                                                          child:
                                                                              Container(
                                                                            height:
                                                                                2,
                                                                            color:
                                                                                Colors.white,
                                                                          )),
                                                                )
                                                              ],
                                                            ))),
                                                      ),
                                                    )))),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    )
                  ];
                  
                },
    
           body: SingleChildScrollView(
        child: Column(children: [
      
          Obx(
            () => IndexedStack(
              index: selectedTabIndex.value,
              children: [
                chatScreen(),
                //status
                Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //Tap to add status update
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Stack(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(1000),
                                child: Image.asset(
                                  Assets.images.flix.path,
                                  height: 60,
                                  width: 60,
                                ),
                              ),
                              Positioned(
                                  bottom: 0,
                                  right: 0,
                                  child:
                                      SvgPicture.asset(Assets.icons.addStatus))
                            ],
                          ),
                          const SizedBox(
                            width: 16,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "My status",
                                style: SnTextStyles.bigTitle,
                              ),
                              Text(
                                "Tap to add status update",
                                style: SnTextStyles.cation,
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    //recent update
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text("Recent updates"),
                    ),
    
                    //recent updates
                    ListView.builder(
                        physics: const ClampingScrollPhysics(),
                        itemCount: 5,
                        shrinkWrap: true,
                        itemBuilder: ((context, index) {
                          return statusItem(
                              image: Assets.images.flix.path,
                              name: "FelAngel",
                              date: "Today, 19:06");
                        })),
                    //Viewed updates
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text("Viewed updates"),
                    ),
    
                    //recent updates
                    ListView.builder(
                        physics: const ClampingScrollPhysics(),
                        itemCount: 2,
                        shrinkWrap: true,
                        itemBuilder: ((context, index) {
                          return statusItem(
                              image: Assets.images.av.path,
                              name: 'sasan',
                              date: "Today, 19:06");
                        }))
                  ],
                ),
                callsScreen()
              ],
            ),
          )
        ]),
      ),
        );
  }

  Widget statusItem({
    required image,
    required name,
    required date,
  }) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(1000),
            child: Image.asset(
              image,
              height: 60,
              width: 60,
            ),
          ),
          const SizedBox(
            width: 16,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: SnTextStyles.bigTitle,
              ),
              Text(
                date,
                style: SnTextStyles.cation,
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget chatScreen() {
    return SizedBox(
      child: Obx(
        () => ListView.builder(
            shrinkWrap: true,
            itemCount: userInboxListController.inboxList.length,
            itemBuilder: ((context, index) => GestureDetector(
                  onTap: (() {
                    //TODO Go to Chat Screen
                    Get.to(  ChatScreen());
                  }),

                  //TODO imagePath is empty an hard code
                  child:SnWidgets.userItem(
                      index: index,
                      name: userInboxListController.inboxList[index].name,
                      imagePath: "",
                      lastMaeeage: "lastMaeeage",
                      time: "22:00"),
                ))),
      ),
    );
  }
  Widget callsScreen() {
    return SizedBox(
      child:   ListView.builder(
            shrinkWrap: true,
            itemCount: 6,
            itemBuilder: ((context, index) => GestureDetector(
                  onTap: (() {
                    //TODO Go to Chat Screen
                    Get.to(  ChatScreen());
                  }),

                  //TODO imagePath is empty an hard code
                  child: SnWidgets.callsItem(index: index, name: "name", imagePath: "imagePath", lastMaeeage: "22:00", time: "time"),
                ))),
      );
     
  }
}

List<String> tabTitleList = ['CHATS', 'STATUS', 'CALLS'];
