import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whatsapp_agora_sample/component/input_decoration.dart';
import 'package:whatsapp_agora_sample/component/text_style.dart';
import 'package:whatsapp_agora_sample/component/widgets.dart';
import 'package:whatsapp_agora_sample/constants/whatsapp_color.dart';
import 'package:whatsapp_agora_sample/controller/user_contact_controller.dart';
import 'package:whatsapp_agora_sample/controller/user_inbox_list_controller.dart';

// ignore: must_be_immutable
class ContactListScreen extends StatelessWidget {
  ContactListScreen({Key? key}) : super(key: key);

  UserContactController userContactController =
      Get.put(UserContactController());
  UserInboxListController userInboxListController =
      Get.put(UserInboxListController());
  int editIndex = -1;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(

        leading: const Icon(Icons.supervised_user_circle,size: 48),
        actions:   [
          Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Center(child: Text("Contacts",style: SnTextStyles.lightTextButton,)),
        )],

      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              onChanged: ((value) => userContactController.search(value)),
              decoration: SnInputDecotration.searchForms(hintText: "Type To Search"),
             ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              decoration: SnInputDecotration.normalForms(
                hintText: "Name and Last Name",
                icon: Icons.edit),
              controller: userContactController.usernameTextEditingController,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              decoration: SnInputDecotration.normalForms(hintText: "Phone Number",
                icon: Icons.phone),
              controller: userContactController.phoneTextEditingController,
            ),
          ),
          //TODO file picker for profile picture

          SizedBox(
            child: Obx(
              () => ListView.builder(
                  shrinkWrap: true,
                  itemCount: userContactController.contactList.length,
                  itemBuilder: ((context, index) => GestureDetector(
                        onTap: (() {
                          userContactController
                                  .phoneTextEditingController.text =
                              userContactController.contactList[index].phone;

                          userContactController
                                  .usernameTextEditingController.text =
                              userContactController.contactList[index].name;

                          editIndex = index;
                        }),
                        //TODO imagePath is empty an hard code
                        child: GestureDetector(
                          onTap: (() {
                            userInboxListController.addToInbox(
                                name: userContactController
                                    .contactList[index].name,
                                phone: userContactController
                                    .contactList[index].phone);
                            Get.back();
                          }),
                          child:SnWidgets.userItem(
                              index: index,
                              name:
                                  userContactController.contactList[index].name,
                              imagePath: "",
                              lastMaeeage: "lastMaeeage",
                              time: "22:00"),
                        ),
                      ))),
            ),
          )
        ]),
      ),
      bottomNavigationBar: Container(
        color: SnColors.whatsappColor,
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              TextButton(
                  onPressed: (() {
                    userContactController.addToContact();
                  }),
                  child:   Text('Add to Contact',style: SnTextStyles.lightTextButton,)),
              TextButton(
                  onPressed: (() {
                    userContactController.editContact(editIndex);
                  }),
                  child:   Text('Update Contact',style: SnTextStyles.lightTextButton,)),
            ],
          )
           ),
    ));
  }
}
