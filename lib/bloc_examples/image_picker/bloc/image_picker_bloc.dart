import 'package:bloc/bloc.dart';
import 'package:image_picker/image_picker.dart';
import '../utils/image_picker_utils.dart';
import 'image_picker_event.dart';
import 'image_picker_state.dart';

class ImagePickerBloc extends Bloc<ImagePickerEvent, ImagePickerState> {
  final ImagePickerUtils imagePickerUtils;
  ImagePickerBloc(this.imagePickerUtils) : super(const ImagePickerState()){
    on<GalleryImagePicker>(_galleryImagePicker);
    on<CameraCapture>(_cameraCapture);
  }

  void _galleryImagePicker(GalleryImagePicker event, Emitter<ImagePickerState> emit) async{
      XFile? file=await imagePickerUtils.galleryPicker();
      emit(state.copyWith(file: file));
  }
  void _cameraCapture(CameraCapture event, Emitter<ImagePickerState> emit) async{
    XFile? file=await imagePickerUtils.cameraCapture();
    emit(state.copyWith(file: file));
  }
}
