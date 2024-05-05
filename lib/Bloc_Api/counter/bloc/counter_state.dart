import 'package:equatable/equatable.dart';

class CounterState extends Equatable{
  final int number;
  const CounterState({this.number=0});
  @override
  List<Object?> get props => [number];

   CounterState  copyWith({int? number}){
     return CounterState(
       number: number?? this.number,
     );
   }
}
