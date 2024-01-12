import 'package:example/utils/index.dart';
import 'package:example/widgets/index.dart';
import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart';

class MediaManagement extends StatefulWidget {
  const MediaManagement({super.key});

  

  @override
  State<MediaManagement> createState() => _MediaManagementState();
}

class _MediaManagementState extends State<MediaManagement> {
  List<String> images = [];
  List<String> records = [];

  @override
  void initState() {
    super.initState();
    _fetchImages();
    _fetchRecords();
  }

  void _fetchImages() async {
    try {
      final ListResult result =
          await FirebaseUtils.instance.readStorage("test/images");
      print(result.items);
      setState(() {
        images = result.items.map((item) => item.fullPath).toList();
      });
    } catch (e) {
      print(e);
    }
  }

  void _fetchRecords() async {
    try {
      final ListResult result =
          await FirebaseUtils.instance.readStorage("test/records");
      print(result.items);
      setState(() {
        records = result.items.map((item) => item.fullPath).toList();
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Media Management'),
      ),
      body: Column(
        //mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Ảnh đã lưu trên server',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Container(
            height: 200, // Set a fixed height for the horizontal list
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: images.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10.0),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ImageView(imagePath: 'https://firebasestorage.googleapis.com/v0/b/flutter-demo-991ec.appspot.com/o/${images[index].replaceAll("/", "%2F")}?alt=media'),
                          ),
                        );
                      },
                      child: Image.network(
                        'https://firebasestorage.googleapis.com/v0/b/flutter-demo-991ec.appspot.com/o/${images[index].replaceAll("/", "%2F")}?alt=media',
                        width: 200,
                        height: 200,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          // Add more widgets here as needed
        ],
      ),
    );
  }
}
