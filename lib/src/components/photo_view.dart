import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

class ImageView extends StatefulWidget {
  final String? image;
  const ImageView({super.key, this.image});

  @override
  State<ImageView> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<ImageView> {
  late String _image;
  @override
  void initState() {
    _image = widget.image!;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PhotoView(
        imageProvider: AssetImage(_image),
      ),
    );
  }
}
