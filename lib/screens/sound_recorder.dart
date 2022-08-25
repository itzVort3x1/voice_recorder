import 'package:flutter_sound_lite/flutter_sound.dart';
import 'package:flutter_sound_lite/public/flutter_sound_player.dart';
import 'package:flutter_sound_lite/public/flutter_sound_recorder.dart';
import 'package:flutter_sound_lite/public/tau.dart';
import 'package:flutter_sound_lite/public/ui/recorder_playback_controller.dart';
import 'package:flutter_sound_lite/public/ui/sound_player_ui.dart';
import 'package:flutter_sound_lite/public/ui/sound_recorder_ui.dart';
import 'package:flutter_sound_lite/public/util/enum_helper.dart';
import 'package:flutter_sound_lite/public/util/flutter_sound_ffmpeg.dart';
import 'package:flutter_sound_lite/public/util/flutter_sound_helper.dart';
import 'package:flutter_sound_lite/public/util/temp_file_system.dart';
import 'package:flutter_sound_lite/public/util/wave_header.dart';

final pathToSaveAudio = 'audio_example.aac';

class SoundRecorder {
  FlutterSoundRecorder? _audioRecorder;
  bool _isRecorderInitialised = false;

  bool get isRecording => _audioRecorder!.isRecording;

  String get audioPath => pathToSaveAudio;

  Future init() async {
    _audioRecorder = FlutterSoundRecorder();

    await _audioRecorder!.openAudioSession();
    _isRecorderInitialised = true;
  }

  void dispose() {
    if(!_isRecorderInitialised) return;

    _audioRecorder!.closeAudioSession();
    _audioRecorder = null;
    _isRecorderInitialised = false;
  }

  Future _record() async {
    if(!_isRecorderInitialised) return;
    await _audioRecorder!.startRecorder(toFile: pathToSaveAudio);
  }

  Future _stop() async {
    if(!_isRecorderInitialised) return;
    await _audioRecorder!.stopRecorder();
  }

  Future toggleRecording() async {
    if(_audioRecorder!.isStopped){
      await _record();
    }else {
      await _stop();
    }
  }

}