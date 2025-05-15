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

class taskScreen extends StatelessWidget {
  const taskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("United UI"),
      ),

      body: Column(
        children: [
          Center(child: Text("Mohamed Islam Mohamed Hashem ",style: TextStyle(fontSize: 25, fontFamily: "Arial"),),),
          Text("Our mission is to ensure flsesfljkdfljdsjljj"),
          Divider(color: Colors.grey,),

          Center(child: Text ("Meet Our Team",style: TextStyle(fontSize: 25, fontFamily: "Arial"),),), 
          
          Row(children: [
            Stack(
              children: [
                Image.asset("assets/DD.png", width: 150, height: 150,fit: BoxFit.cover,),
                Text("DADOOOO", style:TextStyle(color: Colors.white),)
              ],
            ),
            // Stack(
            //   children: [
            //     Image.asset("assets/mm.png", width: 90, height: 90,fit: BoxFit.cover,),
            //     Text("DADOOOO", style:TextStyle(color: Colors.white),)
            //   ],
            // )
            
            
            
          ],)


        ],





      ),














    );
  }
}
