import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
class ProfilePage extends StatefulWidget {
   ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  ImagePicker imagePicker=ImagePicker();

   XFile ? selectedImage;

  Future <void> imageSelector (ImageSource source) async{
    XFile ? image= await imagePicker.pickImage(source:source);
    if(image!=null && mounted) {

      setState(() {
        selectedImage=image;
      });

    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: AppBar(title:Text("Profile"),),
      body:Column(children: [
        Center(child: Stack(
          alignment: Alignment.bottomRight,
          children: [
            CircleAvatar(radius: 110,child:
            selectedImage== null ?Icon(Icons.person,size:200,color:Colors.white38):ClipOval(child: Image.network(
                height: 200,
                width: 200,
                fit: BoxFit.cover,
                selectedImage!.path)),),
            CircleAvatar(backgroundColor: Colors.black,radius:25,child: IconButton(onPressed: (){
            showModalBottomSheet(context: context, builder: (context)=>SizedBox(
              height:150,
              child: Column(
                children: [
                  Text("Profile",style: TextStyle(fontSize: 25),),
                   Divider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                    Options(
                      onPressed: (){
                        imageSelector(ImageSource.camera);

                      },title:"Camera",icon:Icons.camera_alt
                    ),Options(onPressed: (){

                      Navigator.pop(context);
                      imageSelector(ImageSource.gallery);

                      },title:"Gallery",icon:Icons.image),
                      if(selectedImage!=null) // no photo delete so would be useless to call this fn
                      Options(
                          selectedImage: selectedImage,
                          onPressed: (){
                        if(mounted) {
                          setState(() {
                            selectedImage = null;
                          });
                        }
                      },title:"Delete",icon:Icons.delete)
                  ],)
                ],
              ),
            ));
            }, icon: Icon(
            color:Colors.grey
            ,Icons.camera_alt,size:25)))
          ],
        ))
      ],)
    );
  }
}
class Options extends StatelessWidget {
 final String title;
 final IconData icon;
  Colors? color;
  VoidCallback  onPressed;
  XFile? selectedImage;
    Options({required this.onPressed,this.selectedImage,this.color,required this.title, required this.icon, super.key});

  @override
  Widget build(BuildContext context) {
    return  Column(children: [
      IconButton(
          color:selectedImage== null? Colors.grey.shade800 : Colors.red,
          onPressed: onPressed, icon: Icon(icon))
      , Text(title,style:TextStyle(color:selectedImage==null?Colors.grey.shade800:Colors.red))

    ],
    );

  }
}
