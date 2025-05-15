import 'package:first_project/add_item/item.dart';
import 'package:first_project/add_item/item_model.dart';
import 'package:first_project/dashboard/dashboard_screen.dart';
import 'package:first_project/details/details_screen/details_page.dart';
import 'package:first_project/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

import 'package:provider/provider.dart';

class AddItemScreen extends StatefulWidget {
  AddItemScreen({super.key});

  @override
  State<AddItemScreen> createState() => _AddItemScreenState();
}

class _AddItemScreenState extends State<AddItemScreen> {
  TextEditingController title = TextEditingController();

  TextEditingController body = TextEditingController();

  @override
  void dispose() {
    title.dispose();
    body.dispose();

    print("jksdjdfkjsdksl============================================kdf");
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/DD.png"),
            fit: BoxFit.cover,
          ),
        ),

        child: Consumer<ItemModel>(
          builder:
              (context, itemModel, child) => ListView(
                children: [
                  SizedBox(height: 30),
                  itemModel.selectedImage!.isEmpty
                      ? Container(
                        color: Colors.white38,

                        height: 150,
                        width: MediaQuery.sizeOf(context).width - 20,

                        child: IconButton(
                          onPressed: () {
                            itemModel.imageSelector();
                          },

                          icon: Icon(Icons.camera_alt),
                        ),
                      )
                      : Row(
                        children: [
                          Container(
                            color: Colors.white38,

                            height: 100,
                            width: 100,

                            child: IconButton(
                              onPressed: () {
                                itemModel.imageSelector();
                              },

                              icon: Icon(Icons.camera_alt),
                            ),
                          ),

                          SizedBox(
                            height: 100,
                            width: MediaQuery.sizeOf(context).width - 120,
                            child: ListView(
                              scrollDirection: Axis.horizontal,

                              children:
                                  itemModel.selectedImage!
                                      .map(
                                        (toElement) => Stack(
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                    horizontal: 8.0,
                                                  ),
                                              child: Image.file(
                                                toElement,
                                                height: 100,
                                                width: 100,
                                                fit: BoxFit.cover,
                                              ),
                                            ),

                                            IconButton(
                                              onPressed: () {
                                                itemModel.removeImage(
                                                  itemModel.selectedImage!
                                                      .indexOf(toElement),
                                                );
                                              },
                                              icon: Icon(Icons.cancel),
                                            ),
                                          ],
                                        ),
                                      )
                                      .toList(),
                            ),
                          ),
                        ],
                      ),

                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      controller: title,

                      decoration: InputDecoration(
                        hintText: "title",

                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      controller: body,
                      minLines: 3,
                      maxLines: 6,

                      decoration: InputDecoration(
                        hintText: "body",

                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                ],
              ),
        ),
      ),

      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.save),
        onPressed: () {
          final item = Provider.of<ItemModel>(context, listen: false);

          item.addItem(
            Item(
              images: List.from(item.selectedImage!),
              title: title.text,
              body: body.text,
              favorite: false,
            ),);

          item.selectedImage!.clear();



          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => DashboardScreen()),
          );

          // Navigator.pushReplacement(context,
          // MaterialPageRoute(
          // builder:(context)=>
          // MyHomePage(
          //
          //   title: title.text,
          //   body: body.text,
          //
          //   image : selectedImage,
          // )));
        },
      ),
    );
  }
}

// import 'package:flutter/material.dart';
//
// class FirstScreen extends StatefulWidget {
//   const FirstScreen({super.key});
//
//   @override
//   _FirstScreenState createState() => _FirstScreenState();
// }
//
// class _FirstScreenState extends State<FirstScreen> {
//   final TextEditingController title = TextEditingController();
//   final TextEditingController body = TextEditingController();
//
//   @override
//   void dispose() {
//     title.dispose();
//     body.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         centerTitle: true,
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             SizedBox(height: 150),
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: TextField(
//                 controller: title,
//                 decoration: InputDecoration(
//                   hintText: "Name",
//                   border: OutlineInputBorder(),
//                 ),
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: TextField(
//                 controller: body,
//                 minLines: 3,
//                 maxLines: 7,
//                 decoration: InputDecoration(
//                   hintText: "Description",
//                   border: OutlineInputBorder(),
//                 ),
//               ),
//             ),
//             Image.asset("assets/mm.jpg"),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
//
