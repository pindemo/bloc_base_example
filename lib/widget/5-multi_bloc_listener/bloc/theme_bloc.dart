import 'package:flutter_bloc/flutter_bloc.dart';

enum ThemeEvent { toggle }

class ThemeBloc extends Bloc<ThemeEvent, bool> {
  ThemeBloc() : super(false) {
    on<ThemeEvent>((event, emit) {
      switch (event) {
        case ThemeEvent.toggle:
          emit(!state);
      }
    });
  }
} 