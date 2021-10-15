part of '../pages.dart';

class SecondIntroducePage extends StatelessWidget {
  const SecondIntroducePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IlustrationPage(
      title: 'Real-Time\nWeather Map',
      image: 'assets/sun.png',
      description: 'Watch the progress of the \nprecipitation to stay informed',
      percent: 0.50,
      onTap: () {
        Get.to(const ThirdIntroducePage());
      },
    );
  }
}
