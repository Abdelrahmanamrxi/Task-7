import 'package:first_project/add_item/add_item_screen.dart';
import 'package:first_project/add_item/item.dart';
import 'package:first_project/add_item/item_model.dart';
import 'package:first_project/details/details_screen/details_page.dart';
import 'package:first_project/details/details_widget/fav.dart';
import 'package:first_project/favorite/favorite_model.dart';
import 'package:first_project/profile/profile_page/profile_page.dart';
import 'package:first_project/profile/user_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final profileImage = Provider.of<UserModel>(context).user?.image;
    final items = Provider.of<ItemModel>(context);

    return Scaffold(

      appBar: AppBar(title: Text("Dashboard"),
        actions: [
          IconButton(onPressed:(){

            Navigator.push(context, MaterialPageRoute(builder: (context)=>ProfilePage()));



          },
            icon:
                profileImage == null
                    ? Icon(Icons.account_box)
                    : CircleAvatar(
                      child: ClipOval(
                        child: Image.file(
                          profileImage,
                          fit: BoxFit.cover,
                          height: 50,
                          width: 50,
                        ),
                      ),
                    ),
          ),
        ],
      ),

      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
        ),

        itemCount: items.items.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              items.selectItem(Item(images: items.items[index].images, title: items.items[index].title, body: items.items[index].body, favorite: items.items[index].favorite));


              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MyHomePage()),
              );
            },

            child: SizedBox(
              child: Column(
                children: [
                  Image.file(items.items[index].images.first, height: 125, width: 200,fit: BoxFit.cover,),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(items.items[index].title),
                      FavoriteWidget(index: items.items.indexOf(items.items[index]),),

                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddItemScreen()),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
