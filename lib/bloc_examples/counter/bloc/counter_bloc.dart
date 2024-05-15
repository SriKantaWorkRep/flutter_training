import 'dart:async';

import 'package:bloc/bloc.dart';

import 'counter_event.dart';
import 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(const CounterState()){
  on<IncrementEvent>(_incrementEvent);
  on<DecrementEvent>(_decrementEvent);
  }

  void _incrementEvent(IncrementEvent event, Emitter<CounterState> emit) {
    int number=state.number;
    emit(state.copyWith(number: number+1));
  }
  void _decrementEvent(DecrementEvent event, Emitter<CounterState> emit) {
    int number=state.number;
    emit(state.copyWith(number: number-1));
  }
}

