part of '../pages.dart';

class FirstIntroPage extends StatelessWidget {
  const FirstIntroPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IlustrationPage(
      image: 'assets/moon.png',
      title: 'Detailed Hourly\nForecast',
      description: 'Get in - depth weather \ninformation.',
      percent: 0.25,
      onTap: () {
        Get.to(const SecondIntroducePage());
      },
    );
  }
}
