import 'package:flutter/material.dart';
import 'components.dart';
import 'workouts.dart';
import 'mealprep.dart';
import 'healthinfo.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    // Example of user cycle data (replace with actual data)
    final dynamic userCycleData = 'User Cycle Data Here';

    return Scaffold(
      //everything under appbar is body
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
                CatDefault(pageName: ""),
                SizedBox(
                  width: 326,
                  height: 226,
                  child: Text(
                    'What can I help you with today?',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFF7A5E52),
                      fontSize: 48,
                      fontFamily: 'PlayfairDisplay',
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
                SizedBox(height: 20),

                // Workouts Button
                DefaultButton(
                  text: "Workouts",
                  destinationBuilder: (context, userCycleData) => Workouts(userCycleData: userCycleData),
                  userCycleData: userCycleData,
                ),

                SizedBox(height: 20),

                // Meal Prep Button
                DefaultButton(
                  text: "Meal Prep",
                  destinationBuilder: (context, userCycleData) => Workouts(userCycleData: userCycleData),
                  userCycleData: userCycleData,
                ),

                SizedBox(height: 20),

                // Health Info Button
                DefaultButton(
                  text: "Health Info",
                  destinationBuilder: (context, userCycleData) => HealthInfo(userCycleData: userCycleData),
                  userCycleData: userCycleData,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
