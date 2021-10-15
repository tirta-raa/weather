part of 'pages.dart';

class IlustrationPage extends StatelessWidget {
  const IlustrationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //
    Widget linierColor() {
      return Container(
          decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xFF484B5B),
            Color(0xFF2C2D35),
          ],
        ),
      ));
    }

    Widget skipButton() {
      return Align(
        alignment: Alignment.topRight,
        child: TextButton(
          onPressed: () {},
          child: Padding(
            padding: const EdgeInsets.only(top: 43, right: 30),
            child: Text(
              'Skip',
              style: whiteTextStyle3.copyWith(fontSize: 14),
            ),
          ),
        ),
      );
    }

    Widget ilustrationImage() {
      return Container(
        margin: const EdgeInsets.only(top: 118),
        width: 300,
        height: 300,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/moon.png'),
            fit: BoxFit.cover,
          ),
        ),
      );
    }

    Widget whiteBackGroud() {
      return Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          margin: EdgeInsets.only(top: 400),
          padding: const EdgeInsets.symmetric(vertical: 81),
          width: double.infinity,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(500),
            ),
          ),
          child: Column(
            children: [
              Text(
                'Detailed Hourly\nForecast',
                style: blackTextStyle.copyWith(fontSize: 28),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 21,
              ),
              Text(
                'Get in - depth weather information.',
                style: whiteTextStyle1.copyWith(
                  fontSize: 16,
                  color: Color(0xff8B95A2),
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              CircularPercentIndicator(
                radius: 100.0,
                lineWidth: 6.0,
                percent: 0.25,
                center: Container(
                  margin: const EdgeInsets.all(13),
                  width: 90,
                  height: 90,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: LinearGradient(colors: [
                      Color(0xFF484B5B),
                      Color(0xFF2C2D35),
                    ]),
                  ),
                  child: const Icon(
                    Icons.arrow_forward,
                    color: Colors.white,
                    size: 50,
                  ),
                ),
                backgroundColor: const Color(0xffBBC5D4),
                linearGradient: const LinearGradient(
                  colors: [
                    Color(0xffFF4F80),
                    Color(0xffC23ACC),
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
            ],
          ),
        ),
      );
    }

    return Scaffold(
      body: Stack(
        children: [
          linierColor(),
          SafeArea(
            child: skipButton(),
          ),
          Center(
            child: Column(
              children: [
                ilustrationImage(),
              ],
            ),
          ),
          SingleChildScrollView(
            child: whiteBackGroud(),
          ),
        ],
      ),
    );
  }
}
