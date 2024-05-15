
import 'package:bloc/bloc.dart';
import 'switch_event.dart';
import 'switch_state.dart';

class SwitchBloc extends Bloc<SwitchEvent, SwitchState> {
  SwitchBloc() : super(SwitchState()){
    on<EnableOrDisableNotification>(_enableOrDisableNotification);
    on<SliderEvent>(_sliderEvent);
  }

  void _enableOrDisableNotification(EnableOrDisableNotification event, Emitter<SwitchState> emit) {
    if(state.isSwitch){
      emit(state.copyWith(isSwitch: false));
    }else{
      emit(state.copyWith(isSwitch: true));
    }
  }
  void _sliderEvent(SliderEvent event, Emitter<SwitchState> emit) {
      emit(state.copyWith(slider:event.val ));
  }
}
