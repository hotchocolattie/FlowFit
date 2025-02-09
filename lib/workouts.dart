import 'package:flutter/material.dart';
import 'package:winghacksflowfit/components.dart';
import 'mealprep.dart';
import 'healthinfo.dart';

class Workouts extends StatelessWidget {
  final dynamic userCycleData;

  // Accept userCycleData in the constructor
  const Workouts({Key? key, required this.userCycleData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          BackgroundRectangle(),
          Align(
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 56),
                CatTalk(pageName: 'Workouts'),
                AIResponse(),

                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(16, 25, 16, 0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        DefaultButton(
                          text: "More Workouts",
                          destinationBuilder: (context, userCycleData) => Workouts(userCycleData: userCycleData),
                          userCycleData: userCycleData,
                        ),

                        SizedBox(height: 20),

                        DefaultButton(
                          text: "Meal Prep",
                          destinationBuilder: (context, userCycleData) => MealPrep(userCycleData: userCycleData),
                          userCycleData: userCycleData,
                        ),

                        SizedBox(height: 20),

                        DefaultButton(
                          text: "Health Info",
                          destinationBuilder: (context, userCycleData) => HealthInfo(userCycleData: userCycleData),
                          userCycleData: userCycleData,
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
