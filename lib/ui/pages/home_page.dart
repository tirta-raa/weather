part of 'pages.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        shape: Border(
          bottom: BorderSide(
            color: greyColor,
            width: 1,
          ),
        ),
      ),
      drawer: DrawerScreen(),
      body: Stack(
        children: [
          linierColor(),
        ],
      ),
    );
  }
}
