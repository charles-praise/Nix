import '../../export.dart';

class AuthSignIn extends StatelessWidget {
  static route(BuildContext context) => Navigator.push(
      context, MaterialPageRoute(builder: (context) => const AuthSignIn()));
  const AuthSignIn({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    final formKey = GlobalKey<FormState>();
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Form(
            key: formKey,
            child: ListView(
              children: [
                const SizedBox(
                  height: 50,
                ),
                SizedBox(
                    height: 200,
                    width: 200,
                    child: Image.asset(
                      Assets.logo,
                      color: Colors.orange.shade300,
                    )),
                const SizedBox(
                  height: 100,
                ),
                const Spacer(
                  flex: 2,
                ),
                const SizedBox(
                  height: 24,
                ),
                InputTextFormField(
                  controller: emailController,
                  textInputAction: TextInputAction.next,
                  hint: 'Email',
                  validation: (String? val) {
                    if (val == null || val.isEmpty) {
                      return 'This field can\'t be empty';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 12,
                ),
                InputTextFormField(
                  controller: passwordController,
                  textInputAction: TextInputAction.go,
                  hint: 'Password',
                  isSecureField: true,
                  validation: (String? val) {
                    if (val == null || val.isEmpty) {
                      return 'This field can\'t be empty';
                    }
                    return null;
                  },
                  onFieldSubmitted: (_) {},
                  // onFieldSubmitted: (_) {
                  //   if (_formKey.currentState!.validate()) {
                  //     context.read<UserBloc>().add(SignInUser(SignInParams(
                  //           username: emailController.text,
                  //           password: passwordController.text,
                  //         )));
                  //   }
                  // },
                ),
                const SizedBox(
                  height: 10,
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: InkWell(
                    onTap: () {},
                    child: const Text(
                      'Forgot Password?',
                      style: TextStyle(
                        fontSize: 14,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 24,
                ),
                InputFormButton(
                  color: Colors.blue,
                  onClick: () {},
                  titleText: 'Sign In',
                ),
                const SizedBox(
                  height: 10,
                ),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Don\'t have an account! ',
                        style: TextStyle(
                          fontSize: 14,
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          AuthSignUp.route();
                        },
                        child: const Text(
                          'Register',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.blue,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
