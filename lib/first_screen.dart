import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'main.dart';
import './home/home_screen/home_page.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({super.key});

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  final ImagePicker imagePicker = ImagePicker();
  List<XFile>? selectedImage = [];
  final TextEditingController name = TextEditingController();
  final TextEditingController field = TextEditingController();

  Future<void> imageSelector() async {
    // Ensure we're using the correct method based on the platform
    List<XFile>? images = await imagePicker.pickMultiImage();

    if (images != null && mounted) {
      setState(() {
        selectedImage!.addAll(images);
      });
    }
  }

  @override
  void dispose() {
    name.dispose();
    field.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: MergeSemantics(
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('PRISM_logo.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          child: ListView(
            children: [
              Row(
                children: [
                  Container(
                    color: Colors.white30,
                    height: 100,
                    width: 100,
                    child: IconButton(
                      onPressed: imageSelector,
                      icon: const Icon(Icons.camera_alt),
                    ),
                  ),
                  const SizedBox(height: 30),
                ],
              ),
              selectedImage!.isEmpty
                  ? Container(
                color: Colors.white30,
                height: 150,
                width: MediaQuery.of(context).size.width - 20,
                child: IconButton(
                  onPressed: imageSelector,
                  icon: const Icon(Icons.camera_alt),
                ),
              )
                  : SizedBox(
                width:MediaQuery.of(context).size.width - 120 ,
                height: 100,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: selectedImage!.map((image) {
                    return Stack(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Image.network(image!.path),
                        ),
                        IconButton(onPressed: (){

                           setState(() {
                             selectedImage!.remove(image);
                           });
                        }, icon: Icon(Icons.cancel))
                      ],
                    );
                  }).toList(),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8),
                child: TextField(
                  controller: name,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Name",
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8),
                child: TextField(
                  controller: field,
                  minLines: 3,
                  maxLines: 7,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Field Text",
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.delete),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => MyHomePage(
                name: name.text,
                field: field.text,
                image:selectedImage,
              ),
            ),
          );
        },
      ),
    );
  }
}
