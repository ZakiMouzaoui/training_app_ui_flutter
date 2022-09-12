import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trqining_app/constants.dart';
import 'package:trqining_app/controllers/detail_controller.dart';
import 'package:video_player/video_player.dart';

class DetailPage extends StatelessWidget {
  DetailPage({Key? key}) : super(key: key);

  final detailController = Get.put(DetailController());

  @override
  Widget build(BuildContext context) {
    //detailController.updateSeeker();
    return Scaffold(
      body: GetBuilder<DetailController>(
        builder: (_) => Container(
          decoration: detailController.playArea == false
              ? BoxDecoration(
                  gradient: LinearGradient(colors: [
                  mainColor.toColor(),
                  mainColor.toColor().withOpacity(0.3),
                ]))
              : BoxDecoration(color: mainColor.toColor()),
          child: Column(
            children: [
              if (detailController.playArea == false)
                Container(
                  height: 300,
                  padding: const EdgeInsets.only(top:40, left: 20, right: 20, bottom: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          InkWell(
                              onTap: () {
                                Get.back();
                              },
                              child: const Icon(
                                Icons.arrow_back_ios,
                                color: Colors.white,
                              )),
                          const Expanded(child: SizedBox()),
                          const Icon(
                            Icons.error_outline,
                            color: Colors.white,
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      const Text(
                        "Legs toning",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text(
                        "and Glutes Workout",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w500),
                      ),
                      Expanded(child: Container()),
                      Row(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.purple.withOpacity(0.8)),
                            padding: const EdgeInsets.all(5),
                            child: Row(
                              children: const [
                                Icon(
                                  Icons.timer_outlined,
                                  color: Colors.white,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  "68 min",
                                  style: TextStyle(color: Colors.white),
                                )
                              ],
                            ),
                          ),
                          const Expanded(child: SizedBox()),
                          Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.purple.withOpacity(0.8)),
                            padding: const EdgeInsets.all(5),
                            child: Row(
                              children: const [
                                Icon(
                                  Icons.gps_fixed,
                                  color: Colors.white,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  "Resistent bend, kettlebell",
                                  style: TextStyle(color: Colors.white),
                                )
                              ],
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                )
              else
                Container(
                  padding: const EdgeInsets.only(top:40, left: 20, right: 20, bottom: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          InkWell(
                              onTap: () async {
                                detailController.changePlayArea(false);
                                //detailController.disposePlayer();
                                detailController.changePosition(0);
                                detailController.disposePlayer();

                              },
                              child: const Icon(
                                Icons.close,
                                color: Colors.white,
                              )),
                          const Expanded(child: SizedBox()),
                          const Icon(
                            Icons.error_outline,
                            color: Colors.white,
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      if (detailController.isLoading) const Center(
                              child: CircularProgressIndicator(),
                            ) else Column(
                              children: [
                                AspectRatio(
                                    aspectRatio: detailController
                                        .videoController!.value.aspectRatio,
                                    child: VideoPlayer(
                                        detailController.videoController!)),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      detailController.position
                                          .toString()
                                          .substring(2, 7),
                                      style: const TextStyle(color: Colors.white),
                                    ),
                                    Expanded(
                                      child: Slider(
                                          thumbColor: Colors.redAccent,
                                          activeColor: Colors.red,
                                          inactiveColor: Colors.white,
                                          min: 0,
                                          max: detailController.videoController!
                                              .value.duration.inSeconds
                                              .toDouble(),
                                          value: detailController
                                              .position.inSeconds
                                              .toDouble(),
                                          onChanged: (value) {
                                            detailController
                                                .changePosition(value);
                                            //detailController.seekToPosition();
                                          }),
                                    ),
                                    Text(
                                      detailController
                                          .videoController!.value.duration
                                          .toString()
                                          .substring(2, 7),
                                      style: const TextStyle(color: Colors.white),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    InkWell(
                                      onTap: (){
                                        detailController.setVolume();
                                      },
                                      child: const Icon(
                                        Icons.volume_up,
                                        color: Colors.white,
                                      ),
                                    ),
                                    InkWell(
                                      onTap: (){
                                        detailController.rewind();
                                      },
                                      child: const Icon(
                                        Icons.fast_rewind,
                                        color: Colors.white,
                                      ),
                                    ),
                                    InkWell(
                                      onTap: () {
                                        detailController.changePlayerStatus();
                                      },
                                      child: Icon(
                                        detailController.videoController!.value
                                                .isPlaying
                                            ? Icons.pause
                                            : Icons.play_arrow,
                                        color: Colors.white,
                                      ),
                                    ),
                                    InkWell(
                                      onTap: (){
                                        detailController.forward();
                                      },
                                      child: const Icon(
                                        Icons.fast_forward,
                                        color: Colors.white,
                                      ),
                                    ),
                                    InkWell(
                                      onTap: (){
                                        detailController.changeLooping();
                                      },
                                      child: Icon(
                                        Icons.loop_outlined,
                                        color:detailController.videoController!.value.isLooping ? Colors.redAccent : Colors.white
                                      ),
                                    )
                                  ],
                                )
                              ],
                            )
                    ],
                  ),
                ),
              Expanded(
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  padding: const EdgeInsets.all(20),
                  decoration: const BoxDecoration(
                      borderRadius:
                          BorderRadius.only(topRight: Radius.circular(70)),
                      color: Colors.white),
                  child: SingleChildScrollView(
                    child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 20),
                            child: Row(
                              children: [
                                const Text(
                                  "Circuit 1: Legs Toning",
                                  style: TextStyle(
                                      fontSize: 20, fontWeight: FontWeight.bold),
                                ),
                                const Expanded(
                                  child: SizedBox(),
                                ),
                                Icon(
                                  Icons.loop,
                                  color: mainColor.toColor(),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                const Text(
                                  "3 Sets",
                                  style: TextStyle(color: Colors.grey),
                                )
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          GetBuilder<DetailController>(
                            builder: (_) => ListView.separated(
                              physics: const ScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: detailController.info.length,
                              itemBuilder: (_, index) => Container(
                                margin: index != detailController.info.length - 1
                                    ? const EdgeInsets.only(bottom: 20)
                                    : null,
                                child: Row(
                                  children: [
                                    Container(
                                      width: 80,
                                      height: 80,
                                      decoration: BoxDecoration(
                                          color: Colors.redAccent,
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: Stack(
                                        children: [
                                          Container(
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              image: DecorationImage(
                                                  image: AssetImage(
                                                      detailController.info[index]
                                                          ["thumbnail"]),
                                                  fit: BoxFit.cover,
                                                  filterQuality:
                                                      FilterQuality.high),
                                            ),
                                          ),
                                          Positioned(
                                            child: Align(
                                              alignment: Alignment.center,
                                              child: InkWell(
                                                onTap: ()async {
                                                  await detailController
                                                      .initializeVideoController(
                                                          detailController
                                                                  .info[index]
                                                              ["videoUrl"]);
                                                  detailController
                                                      .changePlayArea(true);
                                                },
                                                child: Container(
                                                    padding:
                                                        const EdgeInsets.all(3),
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius.circular(
                                                                50),
                                                        color: Colors.white),
                                                    child: const Icon(
                                                        Icons.play_arrow)),
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Flexible(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            detailController.info[index]["title"],
                                            style: const TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 20,
                                                overflow: TextOverflow.ellipsis),
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          Text(
                                            detailController.info[index]["time"],
                                            style: const TextStyle(
                                                color: Colors.grey),
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              separatorBuilder: (_, int index) {
                                return Container(
                                  margin: const EdgeInsets.only(bottom: 20),
                                  width: double.infinity,
                                  child: Row(
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            color: Colors.purple[200]
                                                ?.withOpacity(0.2)),
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 15, vertical: 10),
                                        child: Text(
                                          "15s rest",
                                          style: TextStyle(
                                              color: mainColor.toColor()),
                                        ),
                                      ),
                                      DottedLine(
                                        direction: Axis.horizontal,
                                        dashLength: 4,
                                        lineLength:
                                            MediaQuery.of(context).size.width -
                                                159,
                                      )
                                    ],
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                  ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
