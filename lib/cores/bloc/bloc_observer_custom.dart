import 'package:app_instagram_clone/configs/logger/log.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BlocObserverCustom extends BlocObserver {
  @override
  void onEvent(Bloc bloc, Object? event) {
    super.onEvent(bloc, event);
    Log.debug('Event: $event');
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    Log.debug('$transition');
  }

  @override
  void onClose(BlocBase bloc) {
    super.onClose(bloc);
    Log.debug('Close bloc: ${bloc.toString()}');
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    super.onError(bloc, error, stackTrace);
    Log.error('Error:: $error');
    Log.error('StackTrace: $stackTrace');
  }
}
