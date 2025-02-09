import 'package:flutter/material.dart';
import 'package:winghacksflowfit/components.dart';
import 'workouts.dart';
import 'healthinfo.dart';

class MealPrep extends StatelessWidget {
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
                      CatTalk(pageName:'Meal Prep'),
                      AIResponse(text:
                      'Breakfast: \nAvocado toast with eggs: Healthy fats + protein to stabilize blood sugar. \nGreek yogurt with berries and chia seeds: Calcium supports hormone regulation, while chia seeds help combat bloating. \n\nLunch: \nGrain bowl with quinoa, leafy greens, roasted sweet potatoes, and chicken: High in magnesium and complex carbs to help manage mood and cravings. \nTurkey or salmon salad: Rich in omega-3s, which help reduce cramps and inflammation. \n\nDinner: \nBaked salmon with roasted vegetables and brown rice: Omega-3s and fiber to support digestion and reduce inflammation. \nStir-fry with tofu, broccoli, and bell peppers over wild rice: Balanced protein and antioxidants for hormone balance. \n\nSnacks: \nDark chocolate (70%+) and almonds: Magnesium for mood and cravings. \nHummus with veggies or rice cakes: Protein + fiber to keep you satisfied. '
                      ),

                      Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(16, 25, 16, 0),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                DefaultButton(
                                  text: "More Meal Prep",
                                  destination: MealPrep(),
                                ),

                                SizedBox(height: 20), //

                                DefaultButton(
                                  text: "Workouts",
                                  destination: Workouts(),
                                ),

                                SizedBox(height: 20), //

                                DefaultButton(
                                  text: "Health Info",
                                  destination: HealthInfo(),
                                ),
                              ]
                          ),
                        ),
                      )

                    ]
                )

            ),

          ],
        )
    );
  }
}