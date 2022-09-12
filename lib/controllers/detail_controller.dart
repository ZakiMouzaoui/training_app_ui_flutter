import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:trqining_app/utils.dart';
import 'package:video_player/video_player.dart';

class DetailController extends GetxController{
  var info = [];
  bool playArea = false;
  var position = const Duration(minutes: 0, seconds: 0);
  VideoPlayerController? videoController;
  bool isLoading = false;

  @override
  void onInit() {
    getInfo();

    super.onInit();
  }

  void getInfo() async{
    final data = await readJson();
    info = data;
    update();
  }

  Future<dynamic> readJson() async {
    final String response = await rootBundle.loadString('assets/data/video_info.json');
    final data = jsonDecode(response);
    return data;
  }

  void changePlayArea(bool value){
    playArea = value;
    update();
  }

  void changePosition(value)async{
    position = parseDurationFromDouble(value);
    videoController!.seekTo(position);
    update();
  }

  Future initializeVideoController(String videoUrl) async{
    isLoading = true;
    update();
    videoController = VideoPlayerController.asset(videoUrl);

    await videoController?.initialize().then((_){
      videoController?.play();
      changePosition(0);
      isLoading = false;
      videoController!.addListener(updateSeeker);

      update();
    });
  }

  void changePlayerStatus(){
    if(videoController!.value.isPlaying){
      videoController!.pause();
    }
    else{
      videoController!.play();
    }
    update();
  }

  void disposePlayer(){
    videoController!.dispose();
    update();
  }

  Future<void> updateSeeker() async {
    position = videoController!.value.position;
    update();
  }

  void changeLooping(){
    if(videoController!.value.isLooping){
      videoController!.setLooping(false);
    }
    else{
      videoController!.setLooping(true);
      if(position == videoController!.value.duration){
        videoController!.play();
      }
    }
    update();
  }

  void setVolume()async{
    await videoController!.setVolume(2);
  }

  void rewind(){
    if(position > Duration.zero) {
      changePosition(position.inSeconds.toDouble()-2);
    }
    else{
      changePosition(Duration.zero);
    }
  }

  void forward(){
    if(position < videoController!.value.duration) {
      changePosition(position.inSeconds.toDouble()+2);
    }
    else{
      changePosition(videoController!.value.duration);
    }
  }

  @override
  void dispose() {
    videoController!.removeListener(updateSeeker);
    videoController!.dispose();

    super.dispose();
  }
}

