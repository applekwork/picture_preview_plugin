import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PictureImageView extends StatefulWidget {
    final String url;
  final double width;
  final double height;
  const PictureImageView({ Key? key, required this.url, required this.width, required this.height }) : super(key: key);

  @override
  _PictureImageViewState createState() => _PictureImageViewState();
}

class _PictureImageViewState extends State<PictureImageView> {
  Uint8List? _data;
  static const MethodChannel _channel =
      MethodChannel("com.qidian.image/picture_preview_view");

  @override
  void initState() {
    super.initState();
    loadImageData();
  }

  loadImageData() async {
    _data = await _channel.invokeMethod('getImage', {'url': widget.url});
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return _data == null
        ? Container(
            color: Colors.green,
            width: widget.width,
            height: widget.height,
          )
        : Image.memory(
            _data!,
            width: widget.width,
            height: widget.height,
            fit: BoxFit.fitHeight,
          );
  }
}