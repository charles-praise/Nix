import '../../export.dart';
import '../search/search.dart';

int _currentIndex = 0;
TextEditingController controller = TextEditingController();
var reviewsList = [];
late List pages;

class ProductDetails extends StatelessWidget {
  final ProductModel productmodel;
  const ProductDetails({super.key, required this.productmodel});

  @override
  Widget build(BuildContext context) {
    // product image list
    // List<String> imageString = [
    //   productmodel.image,
    //   productmodel.image,
    //   productmodel.image,
    // ];
    //  multiple image pages
    List<CachedNetworkImage> imagePages = List.generate(
        productmodel.images.length,
        (index) => cachedNetworkImage(
              productmodel.images[index],
              BoxFit.fitHeight,
            ));
    // main widget
    return Scaffold(
      appBar: AppBar(
        title: Ink(
          height: 33.h,
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
              hintStyle: TextStyle(color: Colors.grey, fontSize: 14),
              filled: true,
              enabled: true,
              border: OutlineInputBorder(borderSide: BorderSide.none),
            ),
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Search()));
            },
            onSubmitted: (value) {
              FocusScope.of(context).unfocus();
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Search()));
            },
            onTapOutside: (event) {
              FocusScope.of(context).unfocus();
            },
          ),
        ),
        actions: [SizedBox(width: 10.w)],
      ),
      body: SingleChildScrollView(
        controller: scrollController,
        child: Column(
          children: [
            // ----- Product image -----
            Ink(
              height: MediaQuery.of(context).size.height * .30.h,
              width: double.maxFinite,
              child: Stack(
                children: [
                  PageView.builder(
                    controller: pageController,
                    itemCount: productmodel.images.length,
                    onPageChanged: (values) {},
                    itemBuilder: (context, index) {
                      return imagePages[index];
                    },
                  ),
                  Positioned(
                    top: 1,
                    left: 10,
                    child: Ink(
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey.shade200),
                          borderRadius: BorderRadius.circular(35)),
                      child: CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 25,
                        child: cachedNetworkImage(
                          productmodel.sellersImage,
                          BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 10,
                    left: 0,
                    right: 0,
                    child: Container(
                      color: Colors.transparent,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(
                          imagePages.length,
                          (index) => Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 3),
                            child: InkWell(
                              onTap: () {
                                pageController.animateToPage(index,
                                    duration: const Duration(milliseconds: 300),
                                    curve: Curves.easeIn);
                              },
                              child: CircleAvatar(
                                radius: 4,
                                backgroundColor: _currentIndex == index
                                    ? Colors.grey
                                    : Colors.grey.shade200,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            //---- make an offer / call --------
            SizedBox(height: 10.h),
            Padding(
              padding: const EdgeInsets.only(left: 6, right: 6),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _offer1(Icons.call, 'Call', () async {
                    // String number = '${data.phone}';
                    // bool? result =
                    //     await FlutterPhoneDirectCaller.callNumber(
                    //         number);
                    // result!
                    //     ? const LinearProgressIndicator()
                    //     : const Text('Call Failed');
                  }),
                  _offer1(Icons.chat, 'SMS', () {}),
                  _offer1(Icons.save, 'Save', () {}),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                children: [
                  // ----- message seller ---
                  SizedBox(height: 6.h),
                  Ink(
                    height: 200.h,
                    width: double.maxFinite,
                    decoration: _boxDecoration(),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 10.h),
                          Text(
                            'Message the Seller',
                            style: TextStyle(
                              fontSize: 26.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 10.h),
                          InputTextFormField(
                            controller: controller,
                            hint: 'Write a message',
                            OnTapOutside: () {
                              FocusScope.of(context).unfocus();
                            },
                          ),
                          const Spacer(),
                          SizedBox(
                            width: 350.w,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                _offer2('available?'),
                                SizedBox(width: 10.w),
                                _offer2('Last price?'),
                                SizedBox(width: 10.w),
                                _offer2('make a deal?'),
                              ],
                            ),
                          ),
                          SizedBox(height: 6.h),
                          Ink(
                            height: 37.h,
                            width: double.maxFinite,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.blue.shade200),
                              onPressed: () {},
                              child: const Text(
                                'Send Message',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 5.h),
                  const Divider(indent: 20, endIndent: 20),
                  //   ------- product Information ------
                  const Text(
                    'Product Description',
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10.h),
                  Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            productDetailsBoard('Name', productmodel.name),
                            const Spacer(),
                            productDetailsBoard(
                                'Description', productmodel.description),
                          ],
                        ),
                        SizedBox(height: 15.h),
                        Row(
                          children: [
                            productDetailsBoard('Condition', 'Fairly Used'),
                            const Spacer(),
                            productDetailsBoard(
                                'price', "\u{20A6} ${productmodel.price}"),
                          ],
                        ),
                        SizedBox(height: 10.h),
                        Row(
                          children: [
                            productDetailsBoard('Address',
                                'No 14 Agunwa street off ada george port harcourt'),
                            const Spacer(),
                            productDetailsBoard('Phone Number', '070863892673'),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: 10.h),
            const Text(
              'Similar Products',
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            BlocBuilder<ProductCubit, ProductState>(
              builder: (context, state) {
                if (state is ProductSuccess) {
                  return StaggeredGrid.count(
                    crossAxisCount: 2,
                    axisDirection: AxisDirection.down,
                    mainAxisSpacing: 6,
                    crossAxisSpacing: 6,
                    children: state.product
                        .map(
                          (item) => productWidgetTwo(
                              context: context,
                              product: item,
                              showOwnerAndName: false,
                              rating: 3),
                        )
                        .toList(),
                  );
                }
                return const SizedBox();
              },
            ),
          ],
        ),
      ),
    );
  }

  //
  BoxDecoration _boxDecoration() => BoxDecoration(
      border: Border.all(color: Colors.black, width: 1),
      borderRadius: BorderRadius.circular(20));

  // ----- product details function -------
  Column productDetailsBoard(
    String title,
    String sellersAddress,
  ) =>
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            width: 150,
            child: Text(
              sellersAddress,
              style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  overflow: TextOverflow.ellipsis),
            ),
          ),
          //    ------ Similar products ------
        ],
      );

  // --- offer 1 -----
  Padding _offer1(IconData icon, String text, VoidCallback ontap) => Padding(
        padding: const EdgeInsets.only(left: 7),
        child: GestureDetector(
          onTap: ontap,
          child: Ink(
              height: 40,
              width: 100,
              decoration: BoxDecoration(
                color: Colors.blue.shade200,
                borderRadius: BorderRadius.circular(5),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    icon,
                    size: 20,
                    color: Colors.white,
                  ),
                  const SizedBox(width: 10),
                  Text(
                    text,
                    style: const TextStyle(fontSize: 20, color: Colors.white),
                  )
                ],
              )),
        ),
      );

  // --- offer 2 ----
  _offer2(String label) => GestureDetector(
        onTap: () {},
        child: Chip(
          label: Text(
            label,
          ),
        ),
      );
}
