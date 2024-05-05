

import 'dart:ui';

class Throttle{
  final Duration duration;
  DateTime? _lastRun;
  Throttle({required this.duration});

  void run(VoidCallback exeCutableFunc){
    final lastRun=_lastRun;
    final now=DateTime.now();
    if(lastRun==null){
      _lastRun=now;
      exeCutableFunc();
    }else{
      final diff=now.difference(lastRun);
      if(diff<duration){
        return;
      }
      _lastRun=now;
      exeCutableFunc();
    }
  }
}