import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trqining_app/constants.dart';
import 'package:trqining_app/controllers/home_controller.dart';
import 'package:trqining_app/pages/detail_page.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(20),
          child: ListView(
              children: [
                Row(
                  children: const [
                    Text(
                      "Training",
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                    Expanded(child: SizedBox(),),
                    Icon(
                      Icons.arrow_back_ios
                    ),
                    SizedBox(width: 3,),
                    Icon(
                      Icons.calendar_today_outlined
                    ),
                    SizedBox(width: 5,),
                    Icon(
                      Icons.arrow_forward_ios
                    )
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    const Text(
                        "Your program",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700
                      ),
                    ),
                    const Expanded(child: SizedBox(),),
                    InkWell(
                      onTap: (){
                        Get.to(()=>DetailPage(), transition: Transition.leftToRight);
                      },
                      child: Text(
                        "Details",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                          color: mainColor.toColor()
                        ),
                      ),
                    ),
                    const SizedBox(width: 5,),
                    Icon(Icons.arrow_forward,color: mainColor.toColor(),)
                  ],
                ),
                const SizedBox(height: 20,),
                Container(
                  padding: const EdgeInsets.all(20),
                  height: 220,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        mainColor.toColor(),
                        mainColor.toColor().withOpacity(0.5)
                      ]
                    ),
                    //color: mainColor.toColor(),
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(20),
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                      topRight: Radius.circular(80)
                    )
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Next workout",
                        style: TextStyle(
                          color: Colors.white
                        ),
                      ),
                      SizedBox(height: 5,),
                      Text(
                        "Legs Toning",
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white
                        ),
                      ),
                      SizedBox(height: 5,),
                      Text(
                        "and Glutes Workout",
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.white
                        ),
                      ),
                      Expanded(child: SizedBox()),
                      Row(
                        children: [
                          Icon(
                            Icons.timer_outlined,
                            color: Colors.white,
                          ),
                          SizedBox(width: 5,),
                          Text(
                              "60 min",
                            style: TextStyle(
                              color: Colors.white
                            ),
                          ),
                          Expanded(child: const SizedBox()),
                          Container(
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: mainColor.toColor(),
                                  offset: const Offset(5, 8)
                                )
                              ],
                              borderRadius: BorderRadius.circular(50),
                              color: Colors.white
                            ),
                            child: const Icon(
                              Icons.play_arrow
                            ),
                          )
                        ],
                      ),

                    ],
                  ),
                ),
                const SizedBox(height: 20,),
                const Text(
                  "Area of focus",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600
                  ),
                ),
                const SizedBox(height: 10,),
                GetBuilder<HomeController>(
                    builder: (_) => GridView.builder(
                        physics: BouncingScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: homeController.icons.length,
                          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisSpacing: 20,
                            mainAxisSpacing: 20,
                            crossAxisCount: 2
                          ), itemBuilder: (context,index) =>
                          Container(
                            height: 100,
                            width: 100,
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  offset: Offset(4,4),
                                  color: mainColor.toColor().withOpacity(0.3),
                                  blurRadius: 7
                                ),
                              ],
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white,
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                CircleAvatar(
                                  radius: 50,
                                  backgroundImage: AssetImage(homeController.icons[index]["image"]),
                                ),
                                SizedBox(height: 15,),
                                Text(
                                  homeController.icons[index]["title"],
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: mainColor.toColor()
                                  ),
                                )
                              ],
                            ),
                          )
                      ),
                    ),

              ],
            ),
          ),
        ),
    );
  }
}
