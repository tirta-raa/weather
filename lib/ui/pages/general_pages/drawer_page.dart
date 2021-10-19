part of '../pages.dart';

class DrawerPage extends StatefulWidget {
  const DrawerPage({Key? key}) : super(key: key);

  @override
  _DrawerPageState createState() => _DrawerPageState();
}

class _DrawerPageState extends State<DrawerPage> {
  @override
  Widget build(BuildContext context) {
    //
    name() {
      return BlocBuilder<AuthCubit, AuthState>(
        builder: (context, state) {
          if (state is AuthSuccess) {
            return Container(
              margin: EdgeInsets.only(top: 22, left: defaultMargin),
              child: Column(
                children: [
                  Text(
                    'Have a good day',
                    style: whiteTextStyle2.copyWith(fontSize: 18),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Text(
                    state.user.name,
                    style: whiteTextStyle2.copyWith(fontSize: 18),
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            );
          } else {
            return const SizedBox();
          }
        },
      );
    }

    location() {
      return Padding(
        padding: EdgeInsets.only(left: defaultMargin, bottom: 30),
        child: Row(
          children: [
            Text(
              'Location',
              style: whiteTextStyle2.copyWith(fontSize: 18),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              height: 20,
              width: 2,
              color: greyColor,
            ),
            Text(
              'Edit',
              style: whiteTextStyle2.copyWith(
                fontSize: 18,
                color: Color(0xff04DDF2),
              ),
            ),
          ],
        ),
      );
    }

    city() {
      return ListTile(
        leading: Icon(
          Icons.location_on,
          color: Colors.white,
        ),
        title: Text(
          'Jakrta',
          style: whiteTextStyle2.copyWith(fontSize: 20),
        ),
        onTap: () {},
      );
    }

    tools() {
      return Padding(
        padding: EdgeInsets.only(
          left: defaultMargin,
          bottom: 14,
        ),
        child: Text(
          'Tools',
          style: whiteTextStyle3.copyWith(color: lightGreyColor, fontSize: 14),
        ),
      );
    }

    notifaction() {
      return ListTile(
        leading: const Icon(
          Icons.notifications,
          color: Colors.white,
        ),
        title: Text(
          'Notification',
          style: whiteTextStyle2.copyWith(fontSize: 14),
        ),
        onTap: () {},
      );
    }

    settings() {
      return ListTile(
        leading: const Icon(
          Icons.settings,
          color: Colors.white,
        ),
        title: Text(
          'Settings',
          style: whiteTextStyle2.copyWith(fontSize: 14),
        ),
        onTap: () {},
      );
    }

    shared() {
      return ListTile(
        leading: const Icon(
          Icons.share,
          color: Colors.white,
        ),
        title: Text(
          'Share Your Weather',
          style: whiteTextStyle2.copyWith(fontSize: 14),
        ),
        onTap: () {},
      );
    }

    rateThisApp() {
      return ListTile(
        leading: const Icon(
          Icons.stars,
          color: Colors.white,
        ),
        title: Text(
          'Rate this App',
          style: whiteTextStyle2.copyWith(fontSize: 14),
        ),
        onTap: () {},
      );
    }

    help() {
      return ListTile(
        leading: const Icon(
          Icons.help,
          color: Colors.white,
        ),
        title: Text(
          'Help',
          style: whiteTextStyle2.copyWith(fontSize: 14),
        ),
        onTap: () {},
      );
    }

    logoutButton() {
      return BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is AuthFailed) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                backgroundColor: redColor,
                content: Text(state.error),
              ),
            );
          } else if (state is AuthInitial) {
            Get.offAll(SignUpPage());
          }
        },
        builder: (context, state) {
          if (state is AuthLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          return Align(
            alignment: Alignment.bottomCenter,
            child: ListTile(
              leading: Icon(
                Icons.logout,
                color: Colors.white,
              ),
              onTap: () {
                context.read<AuthCubit>().signOut();
              },
              title: Text(
                'Logout',
                style: whiteTextStyle2,
              ),
            ),
          );
        },
      );
    }

    return Drawer(
      backgroundColor: blackColor,
      child: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                name(),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 24),
                  child: Divider(
                    color: greyColor,
                  ),
                ),
                location(),
                city(),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 24),
                  child: Divider(
                    color: greyColor,
                  ),
                ),
                tools(),
                notifaction(),
                settings(),
                shared(),
                rateThisApp(),
                help(),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 24),
                  child: Divider(
                    color: greyColor,
                  ),
                ),
              ],
            ),
          ),
          logoutButton(),
        ],
      ),
    );
  }
}
