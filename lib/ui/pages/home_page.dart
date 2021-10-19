part of 'pages.dart';

class HomePage extends StatefulWidget {
  final WeatherData? weatherData;

  const HomePage({Key? key, this.weatherData}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late int temperature;
  late AssetImage iconImage;

  void updateDisplayInfo(WeatherData weatherData) {
    setState(() {
      temperature = weatherData.currentTemperature.round();
      WeatherDisplayData weatherDisplayData =
          weatherData.getWeatherDisplayData();
      iconImage = weatherDisplayData.weatherImage;
    });
  }

  @override
  void initState() {
    super.initState();
    updateDisplayInfo(widget.weatherData!);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      drawer: const DrawerPage(),
      body: Stack(
        children: [
          linierColor(),
          ListView(
            children: [
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 25),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: double.infinity,
                      margin: const EdgeInsets.symmetric(horizontal: 30),
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 20),
                      decoration: BoxDecoration(
                        color: greyColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(
                            Icons.search,
                            color: Colors.white,
                          ),
                          SizedBox(width: 10),
                          Text(
                            'Jakarta',
                            style: whiteTextStyle2.copyWith(fontSize: 24),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: iconImage,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 20),
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      width: double.infinity,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            '$temperature°',
                            style: GoogleFonts.overpass().copyWith(
                              fontSize: 80,
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            'Partly cloudy',
                            style: whiteTextStyle1.copyWith(
                              fontSize: 15,
                              color: lightGreyColor,
                            ),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Image.asset(
                                'assets/windy.png',
                                width: 24,
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              Text(
                                'Wind',
                                style: whiteTextStyle2,
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              Container(
                                width: 2,
                                height: 20,
                                color: Colors.white,
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              Text(
                                '10 KM/H',
                                style: whiteTextStyle2,
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Image.asset(
                                'assets/hum.png',
                                width: 24,
                                fit: BoxFit.cover,
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              Text(
                                'Hum',
                                style: whiteTextStyle2,
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              Container(
                                width: 2,
                                height: 20,
                                color: Colors.white,
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              Text(
                                '54 %      ',
                                style: whiteTextStyle2,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
