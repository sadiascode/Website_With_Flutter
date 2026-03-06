import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ActionInputBarWidget extends StatefulWidget {
  final Function(File)? onImageCaptured;

  const ActionInputBarWidget({
    super.key,
    this.onImageCaptured,
  });

  @override
  State<ActionInputBarWidget> createState() => _ActionInputBarWidgetState();
}

class _ActionInputBarWidgetState extends State<ActionInputBarWidget> {
  bool _isRecording = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: const Color(0xffFFFAF7),
        border: Border.all(
          color: _isRecording
              ? Colors.red
              : const Color(0xFFE67E22).withOpacity(0.4),
          width: _isRecording ? 2 : 1,
        ),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        children: [
          InkWell(
            onTap: () async {
              final ImagePicker picker = ImagePicker();
              final XFile? image =
              await picker.pickImage(source: ImageSource.camera);

              if (image != null && widget.onImageCaptured != null) {
                widget.onImageCaptured!(File(image.path));
              }
            },
            child: const Icon(
              Icons.camera_alt,
              size: 28,
              color: Color(0xFFE67E22),
            ),
          ),

          const Spacer(),
          Material(
            color: Colors.transparent,
            child: InkWell(
              borderRadius: BorderRadius.circular(50),
              onTap: () {
                setState(() {
                  _isRecording = !_isRecording;
                });
              },
              child: AnimatedScale(
                scale: _isRecording ? 1.1 : 1.0,
                duration: const Duration(milliseconds: 200),
                child: Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: _isRecording
                        ? Colors.red
                        : const Color(0xFFE67E22),
                    shape: BoxShape.circle,
                    boxShadow: _isRecording
                        ? [
                      BoxShadow(
                        color: Colors.red.withOpacity(0.3),
                        blurRadius: 8,
                        spreadRadius: 2,
                      )
                    ]
                        : null,
                  ),
                  child: Icon(
                    _isRecording ? Icons.stop : Icons.mic,
                    color: Colors.white,
                    size: 28,
                  ),
                ),
              ),
            ),
          ),

          const Spacer(),

          InkWell(
            child: const Icon(
              Icons.photo_library,
              size: 28,
              color: Color(0xFFE67E22),
            ),
            onTap: () async {
              final ImagePicker picker = ImagePicker();
              final XFile? image =
              await picker.pickImage(source: ImageSource.gallery);

              if (image != null && widget.onImageCaptured != null) {
                widget.onImageCaptured!(File(image.path));
              }
            },
          ),
        ],
      ),
    );
  }
}