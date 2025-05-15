import 'dart:io';

import 'package:first_project/add_item/item_model.dart';
import 'package:first_project/details/details_widget/details_widget.dart';
import 'package:first_project/profile/profile_page/profile_page.dart';
import 'package:first_project/profile/user_model.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import '../../add_item/add_item_screen.dart';

class MyHomePage extends StatelessWidget {
  // final String? body;
  // final String? title;
  // final List<File>? image;

  const MyHomePage({
    //this.image, this.title, this.body,
    super.key});

  @override
  Widget build(BuildContext context) {

    final profileImage = Provider.of<UserModel>(context,) .user?.image ;

    final items = Provider.of<ItemModel>(context);

    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ProfilePage()),
              );
            },
            icon: profileImage == null ? Icon(Icons.account_box) : CircleAvatar(child: ClipOval(child: Image.file(profileImage, fit: BoxFit.cover,height: 50, width: 50,),),)
          ),
        ],
        centerTitle: true,
        title: Text("The  ${items.selectedItem!.title }"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // image == null || image!.isEmpty
            //     ? Image.asset("assets/DD.png"):
                Image.file(
                  items.selectedItem!.images.first,
                  height: 300,
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),

            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                FavoriteWidget(index: items.items.indexOf(items.selectedItem!),),
                IconButton(onPressed: () {}, icon: Icon(Icons.share)),
              ],
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                textAlign: TextAlign.justify,
                  items.selectedItem!.body
                    // ??
                    // "DDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDD",
              ),
            ),
            // image == null || image!.isEmpty
            //     ? Row(
            //       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //       children: [MyPet(), MyPet()],
            //     )
            //     :

            SizedBox(
                  height: 500,
                  child: GridView.builder(
                    itemCount:  items.selectedItem!.images.length,
                    itemBuilder:
                        (context, index) => Image.file(
                          items.selectedItem!.images[index],
                          fit: BoxFit.cover,
                          height: 200,
                          width: 200,
                        ),

                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                    ),
                  ),
                ),
          ],
        ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.next_plan),
      ),
    );
  }
}
