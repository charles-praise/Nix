import '../../export.dart';

class Splashscreen extends StatelessWidget {
  const Splashscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BlocListener<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is AuthRegistered) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const ShopLax()),
            );
          } else if (state is AuthNotRegistered) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const ShopLax()),
            );
          } else if (state is AuthError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.message)),
            );
          }
        },
        child: const Scaffold(
          body: Column(
            children: [
              Expanded(child: Center(child: Text('Initializing....'))),
              Text(
                'Built By Seller, For Sellers....',
                style: TextStyle(fontStyle: FontStyle.italic),
              ),
              LinearProgressIndicator(),
            ],
          ),
        ),
      ),
    );
  }
}


//  builder: (context, state) {
//             return Column(
//               children: [
//                 Expanded(
//                   child: Center(
//                     child: Ink(
//                       width: 200,
//                       height: 200,
//                       decoration: const BoxDecoration(
//                         image: DecorationImage(
//                             image: AssetImage(Assets.logo), fit: BoxFit.cover),
//                       ),
//                     ),
//                   ),
//                 ),
//                 const LinearProgressIndicator(),
//               ],
//             );
//           },