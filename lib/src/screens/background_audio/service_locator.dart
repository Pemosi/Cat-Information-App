import 'package:get_it/get_it.dart';
import 'package:nyan_cat_war/src/screens/background_audio/audio_handler.dart';

GetIt getIt = GetIt.instance;

Future<void> initServiceLocator() async {
  getIt.registerSingleton<AudioServiceHandler>(await initeAudioService());
}