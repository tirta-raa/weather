part of 'pages.dart';

class SignInPage extends StatelessWidget {
  SignInPage({Key? key}) : super(key: key);

  final TextEditingController emailController = TextEditingController(text: '');
  final TextEditingController passwordController =
      TextEditingController(text: '');

  @override
  Widget build(BuildContext context) {
    Widget title() {
      return Container(
        margin: const EdgeInsets.only(top: 20, left: defaultMargin, bottom: 30),
        child: Text(
          'Sign',
          style: blackTextStyle.copyWith(fontSize: 24),
        ),
      );
    }

    Widget inputArea() {
      Widget emailAdress() {
        return CustomInputText(
          title: 'Email Addres',
          hintText: 'Input your addres',
          controller: emailController,
        );
      }

      Widget password() {
        return CustomInputText(
          obsecureText: true,
          title: 'Password',
          hintText: 'Input your password',
          controller: passwordController,
        );
      }

      Widget button() {
        return CustomButton(
          margin: EdgeInsets.only(top: 20),
          title: 'Get Started',
          onPressed: () {
            Get.to(MainPage());
          },
          width: 255,
        );
      }

      return Container(
        margin: EdgeInsets.symmetric(horizontal: defaultMargin),
        width: double.infinity,
        height: 533,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(18),
        ),
        child: Column(
          children: [
            emailAdress(),
            password(),
            button(),
          ],
        ),
      );
    }

    Widget buttonTermsAndCondition() {
      return Center(
        child: Container(
          margin: EdgeInsets.only(top: 50),
          child: TextButton(
            onPressed: () {
              Get.back();
            },
            child: Text(
              'Dont Have Account? sign Up',
              style:
                  greyFontStyle.copyWith(decoration: TextDecoration.underline),
            ),
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        child: ListView(
          children: [
            title(),
            Column(
              children: [
                inputArea(),
                buttonTermsAndCondition(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
