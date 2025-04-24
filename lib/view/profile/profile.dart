import '../../export.dart';

// ignore: must_be_immutable
class Profile extends StatelessWidget {
  Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        if (state is AuthRegistered) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.grey.shade200,
              title: Text(
                'Profile',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              iconTheme: const IconThemeData(color: Colors.black),
              elevation: 0,
              actions: const [Icon(Icons.verified_outlined)],
            ),
            body: ListView(
              scrollDirection: Axis.vertical,
              children: [
                //--- notification ------
                const SizedBox(height: 20.0),
                ListTile(
                  title: Text(
                    "notifications",
                    style: itemHeader,
                  ),
                  leading: const Icon(Icons.notifications),
                ),
                SwitchListTile(
                  value: true,
                  title: const Text("email notifications"),
                  onChanged: (value) {},
                  secondary: const SizedBox(
                    width: 10,
                  ),
                ),
                SwitchListTile(
                  value: true,
                  title: const Text("push notifications"),
                  onChanged: (value) {},
                  secondary: const SizedBox(
                    width: 10,
                  ),
                ),

                // ----- personal details ----
                _buildDivider(),
                ListTile(
                  title: Text(
                    "personal details",
                    style: itemHeader,
                  ),
                  leading: const Icon(Icons.person),
                ),
                SwitchListTile(
                  value: true,
                  title: const Text("make profile public"),
                  onChanged: (value) {},
                  secondary: const SizedBox(
                    width: 10,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 45),
                  child: ListTile(
                    title: const Text('address'),
                    trailing: const Icon(Icons.location_history),
                    onTap: () {},
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 45),
                  child: ListTile(
                    title: const Text('phone number'),
                    trailing: const Icon(Icons.phone),
                    onTap: () {},
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 45),
                  child: ListTile(
                    title: const Text('profile picture'),
                    trailing: const Icon(Icons.supervised_user_circle_outlined),
                    onTap: () {},
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 45),
                  child: ListTile(
                    title: const Text('company details'),
                    trailing: const Icon(Icons.energy_savings_leaf_outlined),
                    onTap: () {},
                  ),
                ),
                // --- feedback---
                _buildDivider(),
                const ListTile(
                  title: Text("feedback"),
                  subtitle: Text("we would love to hear your experience"),
                  leading: Icon(Icons.feedback),
                ),
                const ListTile(
                  title: Text("terms and conditions"),
                  subtitle: Text("legal, terms and conditions"),
                  leading: Icon(Icons.handshake_outlined),
                ),
                ListTile(
                  title: const Text("logout"),
                  subtitle: const Text("you can logout from here"),
                  leading: const Icon(Icons.exit_to_app),
                  onTap: () {
                    context.read<AuthCubit>().logoutUser();
                  },
                ),
              ],
            ),
          );
        } else if (state is AuthNotRegistered) {
          // Not registered user Screen
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.grey.shade200,
              title: Text(
                'Shoplax',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              iconTheme: const IconThemeData(color: Colors.black),
              elevation: 0,
              actions: [
                const Icon(Icons.person, size: 30),
                SizedBox(width: 12.w)
              ],
            ),
            body: SingleChildScrollView(
              controller: scrollController,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const SizedBox(height: 10),
                  BlocBuilder<ProductCubit, ProductState>(
                    builder: (context, state) {
                      if (state is ProductLoading) {
                        return const CircularProgressIndicator.adaptive();
                      } else if (state is ProductSuccess) {
                        return SizedBox(
                          height: 220.h,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: state.product.length,
                            itemBuilder: (context, index) {
                              return productWidgetTwo(
                                  context: context,
                                  product: state.product[index],
                                  showOwnerAndName: false,
                                  rating: 4);
                            },
                          ),
                        );
                      }
                      return const SizedBox();
                    },
                  ),
                  SizedBox(height: 15.h),
                  Center(
                    child: SizedBox(
                      width: 200.w,
                      child: inputFormButton(
                          context: context,
                          onClick: () {
                            AuthSignIn.route(context);
                          },
                          titleText: 'Login',
                          color: Colors.green),
                    ),
                  ),
                  SizedBox(height: 10.h),
                  const ListTile(
                      leading: Icon(Icons.history),
                      title: Text('About Us'),
                      trailing: Icon(Icons.arrow_forward_ios_rounded)),
                  const ListTile(
                      leading: Icon(Icons.engineering),
                      title: Text('Profile Details'),
                      trailing: Icon(Icons.arrow_forward_ios_rounded)),
                  const ListTile(
                      leading: Icon(Icons.verified),
                      title: Text('how to sell'),
                      trailing: Icon(Icons.arrow_forward_ios_rounded)),
                  // Other products
                  BlocBuilder<ProductCubit, ProductState>(
                    builder: (context, state) {
                      if (state is ProductSuccess) {
                        return StaggeredGrid.count(
                            crossAxisCount: 2,
                            axisDirection: AxisDirection.down,
                            mainAxisSpacing: 8,
                            crossAxisSpacing: 8,
                            children: state.product
                                .map((item) => productWidgetTwo(
                                    context: context,
                                    product: item,
                                    showOwnerAndName: false,
                                    rating: 3))
                                .toList());
                      }
                      return const SizedBox();
                    },
                  ),
                ],
              ),
            ),
          );
        }
        return const Text('No data');
      },
    );
  }

  var itemHeader = TextStyle(
    color: Colors.grey.shade600,
    fontSize: 16.0,
  );
  // Notification Function
  InkWell notification(VoidCallback onpress) => InkWell(
        onTap: onpress,
        child: const CircleAvatar(
          backgroundColor: Colors.transparent,
          radius: 25,
          child: Icon(
            Icons.notifications_none_outlined,
            size: 35,
          ),
        ),
      );

  Padding _buildDivider() {
    return const Padding(
      padding: EdgeInsets.only(left: 70),
      child: Divider(
        color: Colors.black,
      ),
    );
  }
}




// import '../../export.dart';



// class Profile extends StatefulWidget {
//   const Profile({super.key});

//   @override
//   State<Profile> createState() => _ProfileState();
// }

// class _ProfileState extends State<Profile> {
//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<AuthCubit, AuthState>(
//       builder: (context, state) {
//         if (state is AuthRegistered) {
          
//         else if (state is AuthError) {
//           return Text(state.message);
//         }
//         
//       },
//     );
//   }
// }
