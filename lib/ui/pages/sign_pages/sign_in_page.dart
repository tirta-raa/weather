part of '../pages.dart';

class SignInPage extends StatelessWidget {
  SignInPage({Key? key}) : super(key: key);

  final TextEditingController emailController = TextEditingController(text: '');
  final TextEditingController passwordController =
      TextEditingController(text: '');

  @override
  Widget build(BuildContext context) {
    //
    Widget title() {
      return Container(
        margin: EdgeInsets.only(top: 20, left: defaultMargin, bottom: 30),
        child: Text(
          'Sign',
          style: whiteTextStyle2.copyWith(fontSize: 24),
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
        return BlocConsumer<AuthCubit, AuthState>(
          listener: (context, state) {
            if (state is AuthSuccess) {
              Get.offAll(const HomePage());
            } else if (state is AuthFailed) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  backgroundColor: redColor,
                  content: Text(state.error),
                ),
              );
            }
          },
          builder: (context, state) {
            if (state is AuthLoading) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }

            return CustomButton(
              margin: EdgeInsets.only(top: 20),
              title: 'Get Started',
              onPressed: () {
                context.read<AuthCubit>().signIn(
                      email: emailController.text,
                      password: passwordController.text,
                    );
              },
              width: 255,
            );
          },
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
          margin: const EdgeInsets.only(top: 50),
          child: TextButton(
            onPressed: () {
              Get.to(SignUpPage());
            },
            child: Text(
              'Dont Have Account? sign Up',
              style: whiteTextStyle3.copyWith(
                  decoration: TextDecoration.underline),
            ),
          ),
        ),
      );
    }

    return Scaffold(
      body: Stack(
        children: [
          linierColor(),
          SafeArea(
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
        ],
      ),
    );
  }
}
