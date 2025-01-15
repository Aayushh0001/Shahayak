import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

class CreatePostScreen extends StatefulWidget {
  const CreatePostScreen({super.key});

  @override
  State<CreatePostScreen> createState() => _CreatePostScreenState();
}

class _CreatePostScreenState extends State<CreatePostScreen> {
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _captionController = TextEditingController();
  final TextEditingController _purchaseDateController = TextEditingController();

  File? _image;
  double _price = 0.0;
  bool _isDonation = false;
  bool _isExchange = false;
  String _condition = 'New'; // Default condition
  DateTime? _purchaseDate;

  // Function to pick an image from the gallery
  Future<void> _pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        _image = File(image.path);
      });
    }
  }

  // Function to handle post submission
  void _submitPost() {
    if (_descriptionController.text.isNotEmpty &&
        _image != null &&
        _purchaseDate != null) {
      // Pass the post data back to the previous screen or handle it here
      Navigator.pop(context, {
        'description': _descriptionController.text,
        'image': _image,
        'price': _price,
        'isDonation': _isDonation,
        'purchaseDate': _purchaseDate,
        'condition': _condition,
        'caption': _captionController.text,
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please complete all fields')),
      );
    }
  }

  // Function to show the date picker
  Future<void> _selectPurchaseDate() async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (pickedDate != null && pickedDate != _purchaseDate) {
      setState(() {
        _purchaseDate = pickedDate;
        _purchaseDateController.text =
            DateFormat('yyyy-MM-dd').format(pickedDate);
      });
    }
  }

  @override
  void dispose() {
    _descriptionController.dispose();
    _captionController.dispose();
    _purchaseDateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Create Post"),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Add Description",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _descriptionController,
              maxLines: 2, // Reduced lines for a more compact description field
              decoration: InputDecoration(
                hintText: "Write something...",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              "Add Image",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            GestureDetector(
              onTap: _pickImage,
              child: Container(
                height: 100, // Reduced height for the image container
                width: double.infinity,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: _image == null
                    ? const Center(
                        child: Text("Tap to select an image"),
                      )
                    : Image.file(
                        _image!,
                        fit: BoxFit.cover,
                      ),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              "Price",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Slider(
              value: _price,
              min: 0,
              max: 10000,
              divisions: 10,
              label: 'RS ${_price.toStringAsFixed(2)}',
              onChanged: (value) {
                setState(() {
                  _price = value;
                });
              },
            ),
            const SizedBox(height: 20),
            const Text(
              "Item Type",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            CheckboxListTile(
              title: const Text("Donation"),
              value: _isDonation,
              onChanged: (bool? value) {
                setState(() {
                  _isDonation = value ?? false;
                });
              },
            ),
            CheckboxListTile(
              title: const Text("Exchange"),
              value: _isExchange,
              onChanged: (bool? value) {
                setState(() {
                  _isExchange = value ?? false;
                });
              },
            ),
            const SizedBox(height: 20),
            const Text(
              "Purchase Date",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            TextField(
              controller: _purchaseDateController,
              readOnly: true,
              decoration: InputDecoration(
                hintText: 'Select purchase date',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                suffixIcon: IconButton(
                  icon: const Icon(Icons.calendar_today),
                  onPressed: _selectPurchaseDate,
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              "Condition of Product",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            DropdownButton<String>(
              value: _condition,
              onChanged: (String? newValue) {
                setState(() {
                  _condition = newValue!;
                });
              },
              items: <String>['New', 'Like New', 'Used', 'Damaged']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            const SizedBox(height: 20),
            const Text(
              "Caption",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _captionController,
              maxLines: 2,
              decoration: InputDecoration(
                hintText: "Write a caption...",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: _submitPost,
                child: const Text("Post"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
