import '../../export.dart';

final TextEditingController name = TextEditingController();
final TextEditingController description = TextEditingController();

List<String> negotiate = ['Yes', 'No', 'Uncertain'];

class Advertise extends StatefulWidget {
  const Advertise({super.key});

  @override
  State<Advertise> createState() => _AdvertiseState();
}

class _AdvertiseState extends State<Advertise> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        if (state is AuthRegistered) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.grey.shade200,
              title: const Text(
                'Advertise your product',
                style: TextStyle(fontSize: 23, color: Colors.black),
              ),
            ),
            body: SingleChildScrollView(
              controller: scrollController,
              child: Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    /// ------ Form fields ----
                    const SizedBox(height: 20),
                    _textField(context, name, 'Name*'),
                    const SizedBox(height: 20),
                    DropDownMenuWithBorder(
                      items: negotiate,
                      hint: 'Category*',
                    ),
                    const SizedBox(height: 20),
                    _textField(context, name, 'Description*'),
                    const SizedBox(height: 20),
                    _textField(context, name, 'Location*'),
                    const SizedBox(height: 20),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          for (int index = 0; index < 5; index++)
                            Padding(
                              padding: const EdgeInsets.only(right: 10),
                              child: Ink(
                                height: 100,
                                width: 100,
                                decoration: BoxDecoration(
                                  color: Colors.transparent,
                                  border: Border.all(color: Colors.black),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: const Center(
                                    child: Icon(Icons.add_a_photo_outlined)),
                              ),
                            ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    _textField(context, name, 'Model'),
                    const SizedBox(height: 20),
                    _textField(context, name,
                        'Link to your Youtube or Facebook video'),
                    const SizedBox(height: 20),
                    _textField(context, name, 'Gender*'),
                    const SizedBox(height: 20),
                    _textField(context, name, 'Type'),
                    const SizedBox(height: 20),
                    _textField(context, name, 'Brands*'),
                    const SizedBox(height: 20),
                    _textField(context, name, 'Condition*'),
                    const SizedBox(height: 20),
                    _textField(context, name, 'Color*'),
                    const SizedBox(height: 20),
                    _textField(context, name, 'Price*'),
                    const SizedBox(height: 20),
                    DropDownMenuWithBorder(
                      items: negotiate,
                      hint: 'Negotiable',
                    ),
                    const SizedBox(height: 20),
                    _textField(context, name, 'Delivery'),
                    const Divider(indent: 20, endIndent: 20),
                  ],
                ),
              ),
            ),
          );
        } else if (state is AuthNotRegistered) {
          // Not Regisered user
          return Scaffold(
            body: Column(
              children: [
                const Expanded(child: SizedBox()),
                Center(
                  child: SizedBox(
                    width: 200.w,
                    child: Ink(
                      height: 100.h,
                      child: Column(
                        children: [
                          inputFormButton(
                            context: context,
                            onClick: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const AuthSignIn()),
                            ),
                            titleText: 'Login with Email',
                            color: Colors.blue,
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          SizedBox(
                            width: 300.w,
                            child: inputFormButton(
                              context: context,
                              onClick: () {
                                scaffoldKey.currentState!.showBottomSheet(
                                  (value) {
                                    return const AuthSignUp();
                                  },
                                );
                              },
                              titleText: 'Login wih Google',
                              color: Colors.green,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          );
        }
        return const Text('No data');
      },
    );
  }

  login(BuildContext context) {
    WidgetsFlutterBinding.ensureInitialized();
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const AuthSignIn()));
  }

  TextFormField _textField(BuildContext context,
          TextEditingController controller, String name) =>
      TextFormField(
        controller: controller,
        enabled: true,
        onTapOutside: (_) {
          FocusScope.of(context).unfocus();
        },
        validator: (String? validate) {
          return null;
        },
        decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: const BorderSide(
                color: Colors.black,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: const BorderSide(width: 1, color: Colors.grey),
            ),
            labelText: name),
      );
}

// ignore: must_be_immutable
class DropDownMenuWithBorder extends StatefulWidget {
  final String hint;
  final List<String> items;

  String? selectedValue;
  DropDownMenuWithBorder({
    super.key,
    required this.hint,
    required this.items,
  });

  @override
  State<DropDownMenuWithBorder> createState() => _DropDownMenuWithBorderState();
}

class _DropDownMenuWithBorderState extends State<DropDownMenuWithBorder> {
  String? currentValue;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InputDecorator(
          decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: const BorderSide(
                width: 1,
                color: Colors.black,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: const BorderSide(width: 1, color: Colors.black),
            ),
            border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10))),
            contentPadding: const EdgeInsets.all(16),
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton(
              hint: Text(widget.hint),
              value: currentValue,
              elevation: 16,
              isDense: true,
              isExpanded: true,
              items: widget.items.map<DropdownMenuItem>((String? value) {
                return DropdownMenuItem(
                  value: value,
                  child: Text(value!),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  currentValue = value;
                });
              },
            ),
          ),
        ),
      ],
    );
  }
}
