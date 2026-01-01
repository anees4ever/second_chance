import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:second_chance/src/controller/game_controller.dart';
import 'package:second_chance/src/core/localization/strings.dart';
import 'package:second_chance/src/core/theme/colors.dart';
import 'package:second_chance/src/core/theme/styles.dart';
import 'package:second_chance/src/pages/custom_widgets/app_scaffold.dart';
import 'package:second_chance/src/pages/custom_widgets/card_seconds_random.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: Strings.appName,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            //Create a round rectange shadowed container with two vertical text widget separated by a divider.
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: GetX<GameController>(builder: (controller) {
                    return ItemTile(
                      line1: Strings.currentSecond,
                      line2: controller.currentSecond.value.toString(),
                      color: boxBg1,
                    );
                  }),
                ),
                Expanded(
                  child: GetX<GameController>(builder: (controller) {
                    return ItemTile(
                      line1: Strings.randomNumber,
                      line2: controller.randomNumber.value.toString(),
                      color: boxBg2,
                    );
                  }),
                ),
              ],
            ),

            GetX<GameController>(builder: (controller) {
              if (controller.gameState.value != GameState.playingSuccess) {
                return const SizedBox();
              }
              return ItemTile(
                line1: '${Strings.success} ${Strings.smileySymbolSuccess}',
                line2:
                    '${Strings.score}: ${controller.success.value} / ${controller.attempts.value}',
                color: boxBgSuccess,
                crossAxisAlignment: CrossAxisAlignment.start,
                textStyleLine1: textStyle20.copyWith(
                  color: textColorSecondary,
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                ),
                textStyleLine2: textStyle20.copyWith(
                  color: textColorSecondary,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              );
            }),
            GetX<GameController>(builder: (controller) {
              if (controller.gameState.value == GameState.playingSuccess) {
                return const SizedBox();
              }
              return ItemTile(
                line1: controller.gameState.value == GameState.playingTimeout
                    ? Strings.sorryTimeout
                    : Strings.sorryTryAgain,
                line2:
                    '${Strings.attempts}: ${controller.failures.value} / ${controller.attempts.value}',
                color: boxBgFailure,
                crossAxisAlignment: CrossAxisAlignment.start,
                textStyleLine1: textStyle20.copyWith(
                  color: textColorSecondary,
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                ),
                textStyleLine2: textStyle20.copyWith(
                  color: textColorSecondary,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              );
            }),

            SizedBox(
              height: 144,
              width: 144,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: SizedBox(
                      width: 144,
                      height: 144,
                      child: GetX<GameController>(builder: (controller) {
                        return CircularProgressIndicator(
                          value: controller.currentAnswerSecond.value / 5,
                          strokeWidth: 16,
                          backgroundColor: appBarColor,
                          valueColor:
                              const AlwaysStoppedAnimation<Color>(boxBgSuccess),
                        );
                      }),
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: GetX<GameController>(builder: (controller) {
                      return Text(
                        '0:0${controller.currentAnswerSecond.value}',
                        textAlign: TextAlign.center,
                        style: textStyle20.copyWith(
                          color: textColorPrimary,
                          fontWeight: FontWeight.bold,
                        ),
                      );
                    }),
                  ),
                ],
              ),
            ),

            ElevatedButton(
              onPressed: () {
                Get.find<GameController>().startGame();
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(buttonColor),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                        10), // Change the corner radius value here
                  ),
                ),
              ),
              child: Text(
                Strings.click,
                style: textStyle20.copyWith(
                  color: textColorSecondary,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
