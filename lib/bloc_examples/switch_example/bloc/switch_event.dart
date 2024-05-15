import 'package:equatable/equatable.dart';

abstract class SwitchEvent extends Equatable{
  SwitchEvent();

  @override
  List<Object> get props => [];
}

class EnableOrDisableNotification extends SwitchEvent{

}
class SliderEvent extends SwitchEvent{
  double val;
  SliderEvent({required  this.val});
  @override
  List<Object> get props => [val];
}

