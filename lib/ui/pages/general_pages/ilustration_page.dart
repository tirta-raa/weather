part of '../pages.dart';

class IlustrationPage extends StatelessWidget {
  final String title;
  final String description;
  final String image;
  final double percent;
  final Function() onTap;

  const IlustrationPage({
    Key? key,
    required this.title,
    required this.description,
    required this.image,
    required this.percent,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //
    Widget skipButton() {
      return Align(
        alignment: Alignment.topRight,
        child: TextButton(
          onPressed: () {
            Get.to(SignInPage());
          },
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
            image: AssetImage(image),
            fit: BoxFit.cover,
          ),
        ),
      );
    }

    Widget details() {
      //
      Widget titleText() {
        return Text(
          title,
          style: blackTextStyle.copyWith(fontSize: 28),
          textAlign: TextAlign.center,
        );
      }

      Widget descriptionText() {
        return Text(
          description,
          style: whiteTextStyle1.copyWith(
            fontSize: 16,
            color: const Color(0xff8B95A2),
          ),
          textAlign: TextAlign.center,
        );
      }

      Widget nextButton() {
        return GestureDetector(
          onTap: onTap,
          child: CircularPercentIndicator(
            animation: true,
            animateFromLastPercent: true,
            animationDuration: 500,
            radius: 100.0,
            lineWidth: 6.0,
            percent: percent,
            center: Container(
              margin: const EdgeInsets.all(13),
              width: 90,
              height: 90,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(
                  colors: [
                    Color(0xFF484B5B),
                    Color(0xFF2C2D35),
                  ],
                ),
              ),
              child: const Icon(
                Icons.arrow_forward,
                color: Colors.white,
                size: 50,
              ),
            ),
            backgroundWidth: 1,
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
        );
      }

      //* White Background
      return Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          margin: const EdgeInsets.only(top: 400),
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
              titleText(),
              const SizedBox(
                height: 21,
              ),
              descriptionText(),
              const SizedBox(
                height: 20,
              ),
              nextButton(),
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
            child: details(),
          ),
        ],
      ),
    );
  }
}
