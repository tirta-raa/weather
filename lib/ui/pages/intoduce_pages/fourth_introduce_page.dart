part of '../pages.dart';

class FourthIntroducePage extends StatelessWidget {
  const FourthIntroducePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IlustrationPage(
      title: 'Detailed Hourly \nForecast',
      description: 'Get in - depth weather \ninformation.',
      image: 'assets/suncloud.png',
      percent: 1.00,
      onTap: () {
        Get.to(const SignInPage());
      },
    );
  }
}
