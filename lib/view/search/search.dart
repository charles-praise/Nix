import '../../export.dart';

class Search extends StatelessWidget {
  Search({super.key});
  static route(BuildContext context) => Navigator.push(
      context, MaterialPageRoute(builder: (context) => Search()));
  final FocusScopeNode focusNode = FocusScopeNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Ink(
          height: 40,
          width: 330,
          decoration: BoxDecoration(
              border: Border.all(color: Colors.white, width: 2),
              color: Colors.white,
              borderRadius: BorderRadius.circular(10)),
          child: BlocBuilder<ProductCubit, ProductState>(
            builder: (context, state) {
              if (state is ProductSuccess) {
                return TextField(
                  autocorrect: true,
                  autofocus: true,
                  mouseCursor: MouseCursor.defer,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.search, color: Colors.grey),
                    hintText: 'Search ...',
                    hintStyle: TextStyle(color: Colors.grey, fontSize: 13),
                    filled: true,
                    enabled: true,
                    border: OutlineInputBorder(borderSide: BorderSide.none),
                  ),
                  onChanged: (query) {
                    context.read<SearchCubit>().search(query, state.product);
                  },
                  onSubmitted: (value) {
                    context.read<SearchCubit>().search(value, state.product);
                  },
                  onTapOutside: (_) {
                    FocusScope.of(context).unfocus();
                  },
                );
              }
              return const SizedBox();
            },
          ),
        ),
        actions: const [SizedBox(width: 20)],
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            SizedBox(height: 5.h),
            Expanded(
              child: BlocBuilder<SearchCubit, SearchState>(
                builder: (context, state) {
                  if (state is SearchInitial) {
                    return SingleChildScrollView(
                      controller: scrollController,
                      child: Column(
                        children: [
                          BlocBuilder<ProductCubit, ProductState>(
                            builder: (context, state) {
                              if (state is ProductSuccess) {
                                return Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        recentSearch(
                                            context, 'Shirt', state.product),
                                        recentSearch(
                                            context, 'Trousers', state.product),
                                        recentSearch(
                                            context, 'Shoes', state.product),
                                        recentSearch(context, 'Jewelries',
                                            state.product),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        recentSearch(
                                            context, 'Phones', state.product),
                                        recentSearch(context, 'Machinery',
                                            state.product),
                                        recentSearch(
                                            context, 'Laptops', state.product),
                                        recentSearch(
                                            context, 'Gadgets', state.product),
                                      ],
                                    ),
                                  ],
                                );
                              }
                              return const Text('No recent searches');
                            },
                          ),
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
                    );
                  } else if (state is SearchLoading) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state is SearchResults) {
                    return SingleChildScrollView(
                      controller: scrollController,
                      child: Column(
                        children: [
                          BlocBuilder<ProductCubit, ProductState>(
                            builder: (context, state) {
                              if (state is ProductSuccess) {
                                return Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        recentSearch(
                                            context, 'Shirt', state.product),
                                        recentSearch(
                                            context, 'Trousers', state.product),
                                        recentSearch(
                                            context, 'Shoes', state.product),
                                        recentSearch(context, 'Jewelries',
                                            state.product),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        recentSearch(
                                            context, 'Phones', state.product),
                                        recentSearch(context, 'Machinery',
                                            state.product),
                                        recentSearch(
                                            context, 'Laptops', state.product),
                                        recentSearch(
                                            context, 'Gadgets', state.product),
                                      ],
                                    ),
                                  ],
                                );
                              }
                              return const Text('No recent searches');
                            },
                          ),
                          MasonryView(
                            listOfItem: state.results,
                            numberOfColumn: 2,
                            itemBuilder: (item) {
                              for (int index = 0;
                                  index < state.results.length;) {
                                return SizedBox(
                                  height: 220.h,
                                  child: productWidgetTwo(
                                      context: context,
                                      product: state.results[index],
                                      showOwnerAndName: false,
                                      rating: 5),
                                );
                              }
                              return const SizedBox();
                            },
                          ),
                        ],
                      ),
                    );
                  } else if (state is SearchError) {
                    return Expanded(
                      child: SingleChildScrollView(
                        controller: scrollController,
                        child: Column(
                          children: [
                            const Center(
                                child: Text(
                              "No results found ",
                              style: TextStyle(fontSize: 30),
                            )),
                            SizedBox(height: 10.h),
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
                  return const SizedBox();
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
