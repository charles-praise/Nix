import '../../export.dart';

class AuthSignUp extends StatelessWidget {
  static route() => MaterialPageRoute(builder: (context) => const AuthSignUp());
  const AuthSignUp({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    final formKey = GlobalKey<FormState>();
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Scaffold(
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
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  InputFormButton(
                    color: Colors.blue,
                    onClick: () {
                      register(context, formKey, emailController.text.trim(),
                          passwordController.text.trim());
                    },
                    titleText: 'Sign Up',
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
                          'Already have an account! ',
                          style: TextStyle(
                            fontSize: 14,
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            AuthSignIn.route(context);
                          },
                          child: const Text(
                            'Login',
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
      ),
    );
  }
}

register(BuildContext context, GlobalKey<FormState> formKey, String email,
    String password) {
  if (formKey.currentState!.validate()) {
    context.read<AuthCubit>().registerUser(email, password);
  }
}
// InputFormField

class InputFormButton extends StatelessWidget {
  final Function() onClick;
  final String? titleText;
  final Icon? icon;
  final Color? color;
  final double? cornerRadius;
  final EdgeInsets padding;

  const InputFormButton(
      {super.key,
      required this.onClick,
      this.titleText,
      this.icon,
      this.color,
      this.cornerRadius,
      this.padding = const EdgeInsets.symmetric(horizontal: 16)});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onClick,
      style: ButtonStyle(
        padding: WidgetStateProperty.all<EdgeInsets>(padding),
        maximumSize:
            WidgetStateProperty.all<Size>(const Size(double.maxFinite, 50)),
        minimumSize:
            WidgetStateProperty.all<Size>(const Size(double.maxFinite, 50)),
        backgroundColor: WidgetStateProperty.all<Color>(
            color ?? Theme.of(context).primaryColor),
        shape: WidgetStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(cornerRadius ?? 12.0)),
        ),
      ),
      child: titleText != null
          ? Text(
              titleText!,
              style: const TextStyle(color: Colors.white),
            )
          : Image.asset(
              Assets.avatars[1],
              color: Colors.white,
            ),
    );
  }
}

//  Input TextFormField

class InputTextFormField extends StatefulWidget {
  final TextEditingController controller;
  final bool isSecureField;
  final bool autoCorrect;
  final String? hint;
  final EdgeInsets? contentPadding;
  final String? Function(String?)? validation;
  final double hintTextSize;
  final bool enable;
  final TextInputAction? textInputAction;
  final Function(String)? onFieldSubmitted;
  final Function? OnTapOutside;

  const InputTextFormField({
    super.key,
    required this.controller,
    this.isSecureField = false,
    this.autoCorrect = false,
    this.enable = true,
    this.hint,
    this.validation,
    this.contentPadding,
    this.textInputAction,
    this.hintTextSize = 14,
    this.onFieldSubmitted,
    this.OnTapOutside,
  });

  @override
  State<InputTextFormField> createState() => _InputTextFormFieldState();
}

class _InputTextFormFieldState extends State<InputTextFormField> {
  bool _passwordVisible = false;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      obscureText: widget.isSecureField && !_passwordVisible,
      enableSuggestions: !widget.isSecureField,
      autocorrect: widget.autoCorrect,
      validator: widget.validation,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      enabled: widget.enable,
      textInputAction: widget.textInputAction,
      onFieldSubmitted: widget.onFieldSubmitted,
      onTapOutside: (event) {
        widget.OnTapOutside;
      },
      decoration: InputDecoration(
        filled: true,
        hintText: widget.hint,
        hintStyle: TextStyle(
          fontSize: widget.hintTextSize,
        ),
        contentPadding: widget.contentPadding,
        suffixIcon: widget.isSecureField
            ? IconButton(
                icon: Icon(
                  _passwordVisible ? Icons.visibility : Icons.visibility_off,
                  color: Colors.black87,
                ),
                onPressed: () {
                  setState(() {
                    _passwordVisible = !_passwordVisible;
                  });
                },
              )
            : null,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: const BorderSide(
            color: Colors.transparent,
            width: 0.0,
          ),
        ),
      ),
    );
  }
}
