import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:io';

import 'package:image_picker/image_picker.dart';

class DiaryNoteNew extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const MyCustomForm(),
    );
  }
}

// Create a Form widget.
class MyCustomForm extends StatefulWidget {
  const MyCustomForm({Key? key}) : super(key: key);

  @override
  MyCustomFormState createState() {
    return MyCustomFormState();
  }
}

// Create a corresponding State class.
// This class holds data related to the form.
class MyCustomFormState extends State<MyCustomForm> {
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  //
  // Note: This is a GlobalKey<FormState>,
  // not a GlobalKey<MyCustomFormState>.
  final _formKey = GlobalKey<FormState>();
  String _myNote = '';
  String _myDesc = '';
  XFile? _imageFile;
  List<XFile>? _imageFileList;

  final ImagePicker _picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 40,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              // The validator receives the text that the user has entered.
              decoration: InputDecoration(
                labelText: 'Суть',
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
              onSaved: (input) => _myNote = input!,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              // The validator receives the text that the user has entered.
              decoration: InputDecoration(
                labelText: 'Подробный текст',
              ),
              maxLines: 6,
              onSaved: (input) => _myDesc = input!,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
            ),
          ),
          Expanded(child: _showSelectedImages(_imageFileList)),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: () {
                // Validate returns true if the form is valid, or false otherwise.
                if (_formKey.currentState!.validate()) {
                  _formKey.currentState!.save();
                  Navigator.of(context).pop();
                }
              },
              child: const Text('Добавить'),
            ),
          ),
        ],
      ),
    );
  }

  void _getImage() async {
    _imageFileList = await _picker.pickMultiImage();

    setState(() {});
  }

  _showSelectedImages(List<XFile>? imageFileList) {
    if (_imageFileList == null) {
      return GestureDetector(
          onTap: () => {_getImage()},
          child: Image.asset('images/noimage.png', height: 80));
    } else {
      return GridView.builder(
          gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
          itemCount: imageFileList!.length,
          itemBuilder: (context, index) {
            // return  Image.file(File(imageFileList[index].path!),width: 50);

            return GestureDetector(
                onTap: () => {_getImage()},
                child: Container(
                  margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  decoration: BoxDecoration(
                    color: const Color(0xff7c94b6),
                    image: DecorationImage(
                      image: FileImage(File(imageFileList[index].path)),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15),
                        bottomRight: Radius.circular(15)),
                  ),
                ));
          } // item builder
          ); // GridView
    }
  }
}
