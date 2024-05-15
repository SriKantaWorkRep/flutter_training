import 'dart:io';
import 'package:dealdox_integrated/bloc_examples/image_picker/bloc/image_picker_bloc.dart';
import 'package:dealdox_integrated/bloc_examples/image_picker/bloc/image_picker_event.dart';
import 'package:dealdox_integrated/bloc_examples/image_picker/bloc/image_picker_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ImagePickerScreen extends StatefulWidget {
  const ImagePickerScreen({super.key});

  @override
  State<ImagePickerScreen> createState() => _ImagePickerScreenState();
}

class _ImagePickerScreenState extends State<ImagePickerScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Image picker"),
      ),
      body: Center(
        child: BlocBuilder<ImagePickerBloc, ImagePickerState>(
          builder: (BuildContext context, state) {
            if (state.file == null) {
              return Row(
                children: [
                  InkWell(
                    onTap: () {
                      context.read<ImagePickerBloc>().add(CameraCapture());
                    },
                    child: const CircleAvatar(
                      child: Icon(Icons.camera),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      context.read<ImagePickerBloc>().add(GalleryImagePicker());
                    },
                    child: const CircleAvatar(
                      child: Icon(Icons.camera),
                    ),
                  ),
                ],
              );
            } else {
              return Image.file(File(state.file!.path.toString()));
            }
          },
        ),
      ),
    );
  }
}
