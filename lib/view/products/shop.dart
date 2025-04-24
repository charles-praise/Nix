import 'package:shoplax_by_charles/view/products/view/location.dart';

import '../../export.dart';
import '../search/search.dart';

PageController pageController = PageController(initialPage: 0);
int activeIndex = 0;
var suggestions = <String>[
  'Trending ',
  'Fashion',
  'Phones',
  'Appliances',
  'Electronics',
  'Property',
];

// Shop page starts  here
class Shop extends StatefulWidget {
  const Shop({super.key});
  static route() => MaterialPageRoute(builder: (context) => const Shop());

  @override
  State<Shop> createState() => _ShopState();
}

class _ShopState extends State<Shop> {
  get itemBuilder => null;

  @override
  void initState() {
    super.initState();
    if (mounted) {
      context.read<ShopCubit>().startTimer(pageController);
    }
  }

  @override
  void dispose() {
    super.dispose();
    // pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        return CustomScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          shrinkWrap: true,
          scrollBehavior: const ScrollBehavior(),
          controller: scrollController,
          slivers: [
            SliverAppBar(
              pinned: true,
              floating: false,
              expandedHeight: 42.h,
              centerTitle: true,
              backgroundColor: Colors.white,
              actions: [
                SizedBox(width: 10.w),
                notification(
                  () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Location(),
                      ),
                    );
                  },
                ),
              ],
              flexibleSpace: FlexibleSpaceBar(
                titlePadding:
                    EdgeInsets.only(top: 7.sp, bottom: 5.sp, right: 10.sp),
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(width: 12.w),
                    Ink(
                      height: 48.h,
                      width: 280.w,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.white, width: 2),
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10.r)),
                      child: TextField(
                        readOnly: true,
                        mouseCursor: MouseCursor.defer,
                        decoration: const InputDecoration(
                          prefixIcon: Icon(Icons.search, color: Colors.grey),
                          hintText: 'Search Products...',
                          hintStyle:
                              TextStyle(color: Colors.grey, fontSize: 14),
                          filled: true,
                          enabled: true,
                          border:
                              OutlineInputBorder(borderSide: BorderSide.none),
                        ),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Search()));
                        },
                        onSubmitted: (value) {
                          FocusScope.of(context).unfocus();
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Search()));
                        },
                        onTapOutside: (event) {
                          FocusScope.of(context).unfocus();
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // ---- options ------
                  BlocBuilder<ProductCubit, ProductState>(
                    builder: (context, state) {
                      if (state is ProductSuccess) {
                        return SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: List.generate(
                              suggestions.length,
                              (index) => Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: productFilter(
                                    context, suggestions[index], state.product),
                              ),
                            ),
                          ),
                        );
                      }
                      return const Text('No recent searches');
                    },
                  ),
                  // ----- ads --------
                  BlocBuilder<ShopCubit, ShopState>(
                    builder: (context, state) {
                      return Stack(
                        children: [
                          Ink(
                            height: MediaQuery.sizeOf(context).height * .17.h,
                            width: MediaQuery.of(context).size.width *
                                double.maxFinite.w,
                            child: PageView.builder(
                              controller: pageController,
                              onPageChanged: (value) {
                                context.read<ShopCubit>().activeIndex(value);
                              },
                              itemCount: context
                                  .read<ShopCubit>()
                                  .getBannerList()
                                  .length, // imagePath.length
                              itemBuilder: (context, index) {
                                return context
                                    .read<ShopCubit>()
                                    .getBannerList()[index];
                              },
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                  SizedBox(height: 10.h),
                  // ------ Phones ------
                  SizedBox(height: 10.h),
                  textHeader(text: 'Phones'),
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
                                  rating: 3);
                            },
                          ),
                        );
                      }
                      return const SizedBox();
                    },
                  ),

                  // ----- Fashion---
                  textHeader(text: 'Fashion'),
                  SizedBox(height: 10.h),
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
                                  rating: 5);
                            },
                          ),
                        );
                      }
                      return const SizedBox();
                    },
                  ),
                  // ------- ads------
                  //
                  //
                  // ----- Watches -----
                  SizedBox(height: 10.h),
                  textHeader(text: 'Women'),
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
                                  rating: 2);
                            },
                          ),
                        );
                      }
                      return const SizedBox();
                    },
                  ),
                  SizedBox(height: 10.h),
                  textHeader(text: 'Popular'),
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
          ],
        );
      },
    );
  }
}
