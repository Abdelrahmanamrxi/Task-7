import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../../first_screen.dart';
import '../../profile/profile_page/profile_page.dart';
import '../home_widget/home_widget.dart';

class MyHomePage extends StatelessWidget {
  final List <XFile>? image;
  final String? name;
  final  String? field;
  const MyHomePage({ this.name, this.image ,this.field, super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          actions: [IconButton(onPressed: (){

            Navigator.push(context, MaterialPageRoute(builder: (context)=>ProfilePage()));
          }, icon: Icon(Icons.access_time))],
          centerTitle: true,title: Text("The ${name??"Life"}")),
      body: SingleChildScrollView(
        child:Column(
          children: [
            image==null || image!.isEmpty ? Image.asset("full.jpg"):Image.network(image![0].path,height: 300,width:double.infinity ,fit:BoxFit.cover,),

            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                IconButton(onPressed: () {}, icon: Icon(Icons.share)),
                Favourite(),
              ],
            ),

            Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                field ?? "life is amazing",
                textAlign: TextAlign.justify,
                style: TextStyle(fontSize: 13),
              ),
            ),
         image==null || image!.isEmpty? Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Logo(url:"PRISM_logo.jpg",text:"PRISM"),
                Logo(url:"pegasus.png",text:"Logo 2")
              ],
            ): SizedBox(
              height:500,
              child: GridView.builder(
               itemCount: image!.length,
               itemBuilder: (context,index)=>Image.network(image![index].path,fit: BoxFit.cover,height:200,width:200),
               gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount:2,mainAxisSpacing:10,crossAxisSpacing:10,)),
            ),
          ],
        ),),
      floatingActionButton: FloatingActionButton(onPressed: (){
        Navigator.push(context,
        MaterialPageRoute(builder: (context)=>FirstScreen()));

      },child:Icon(Icons.next_plan)),
    );
  }
}

