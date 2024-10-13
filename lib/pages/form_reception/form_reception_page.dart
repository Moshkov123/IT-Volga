import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:itvolga/widgets/oval_button.dart';
import 'dart:io';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart';
import '../../database/database_meal.dart';
import '../../model/model_meal.dart';

class FormReceptionPage extends StatefulWidget {
  final int dayId;

  const FormReceptionPage({super.key, required this.dayId});

  @override
  _FormReceptionPageState createState() => _FormReceptionPageState();
}

class _FormReceptionPageState extends State<FormReceptionPage> {
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  File? _image;

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    } else {
      print('No image selected.');
    }
  }

  Future<String> _saveImageToAssets(File image) async {
    final directory = await getApplicationDocumentsDirectory();
    final imageDirectory = Directory('${directory.path}/assets/img_user');

    if (!await imageDirectory.exists()) {
      await imageDirectory.create(recursive: true);
    }

    final imageName = path.basename(image.path);
    final savedImage = await image.copy('${imageDirectory.path}/$imageName');

    return savedImage.path;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Добавить прием пищи'),
        centerTitle: true,
        backgroundColor: const Color(0xFF28A745),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        controller: _titleController,
                        decoration: const InputDecoration(labelText: 'Название'),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Пожалуйста, введите название';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 20),
                      GestureDetector(
                        onTap: _pickImage,
                        child: Container(
                          width: 100,
                          height: 100,
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: _image == null
                              ? const Icon(Icons.add_a_photo, size: 50)
                              : Image.file(_image!, fit: BoxFit.cover),
                        ),
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
            ),
            OvalButton(
              text: 'Добавить',
              onPressed: () async {
                if (_formKey.currentState!.validate()) {
                  String imagePath;

                  if (_image != null) {
                    imagePath = await _saveImageToAssets(_image!);
                  } else {
                    imagePath = 'assets/img_user/breakfast.jpg';
                  }

                  // Создаем новый прием пищи
                  Meal newMeal = Meal(
                    title: _titleController.text,
                    urlImg: imagePath,
                    dayId: widget.dayId,
                  );

                  // Добавляем прием пищи в базу данных
                  MealDatabaseHelper().insertMeal(newMeal).then((_) {
                    // Возвращаемся на предыдущую страницу
                    Navigator.pop(context);
                  });
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}