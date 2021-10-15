part of 'pages.dart';

class SplashScreenPage extends StatelessWidget {
  const SplashScreenPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Timer(const Duration(seconds: 3), () {
      Get.offAll(const FirstIntroPage());
    });
    linierColor() {
      return Container(
          decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [
            Color(0xFFF2F5F7),
            Color(0xFFBCC8D6),
          ],
        ),
      ));
    }

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        alignment: Alignment.center,
        children: [
          linierColor(),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 200,
                  height: 148,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/cloud.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Text(
                  'Weather ',
                  style: blackTextStyle.copyWith(fontSize: 40),
                  textAlign: TextAlign.center,
                ),
                Text(
                  'Forecast',
                  style: whiteTextStyle1.copyWith(
                    fontSize: 24,
                    color: const Color(0xff8B95A2),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
