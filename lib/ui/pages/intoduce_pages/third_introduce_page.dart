part of '../pages.dart';

class ThirdIntroducePage extends StatelessWidget {
  const ThirdIntroducePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IlustrationPage(
      title: 'Weather Around \nthe World',
      description: 'Add any location you want \nand swipe easily to chnage.',
      image: 'assets/rain.png',
      percent: 0.75,
      onTap: () {
        Get.to(const FourthIntroducePage());
      },
    );
  }
}
