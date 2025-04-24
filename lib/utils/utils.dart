import '../export.dart';

productFilter(BuildContext context, String query, List<ProductModel> item) =>
    InkWell(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Search()));
        context.read<SearchCubit>().search(query, item);
      },
      child: Chip(
        label: Text(query),
      ),
    );

recentSearch(BuildContext context, String query, List<ProductModel> item) =>
    InkWell(
      onTap: () {
        context.read<SearchCubit>().search(query, item);
      },
      child: Chip(
        label: Text(query),
      ),
    );

Padding textHeader({required String text}) => Padding(
      padding: const EdgeInsets.only(left: 10),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 20.sp,
          fontWeight: FontWeight.bold,
        ),
      ),
    );

CachedNetworkImage cachedNetworkImage(
  final String url,
  final BoxFit? fit,
) =>
    CachedNetworkImage(
      fit: fit,
      imageUrl: url,
      placeholder: (context, url) {
        return Image.asset(Assets.logo);
      },
      errorWidget: (context, url, error) {
        return Image.asset(Assets.bottomNavigationImage[6]);
      },
    );

circleAvatar({
  final String? data,
  final BoxFit? fit,
}) =>
    GestureDetector(
      onTap: () {},
      child: Ink(
        height: 40.h,
        width: 40.w,
        decoration: BoxDecoration(
            border: Border.all(color: Colors.grey.shade200, width: 1),
            borderRadius: BorderRadius.circular(50.r)),
        child: cachedNetworkImage(data!, BoxFit.cover),
      ),
    );

RatingBar ratingBar({double? ratingValue}) => RatingBar.builder(
      initialRating: ratingValue!,
      ignoreGestures: true,
      minRating: 1,
      direction: Axis.horizontal,
      allowHalfRating: true,
      itemCount: 5,
      itemSize: 13,
      itemBuilder: (context, _) => const Icon(
        Icons.star,
        color: Colors.amber,
      ),
      onRatingUpdate: (rating) {
        ratingValue = rating;
      },
    );

Padding productWidgetOne(
        {required BuildContext context,
        required ProductModel product,
        required bool showOwnerAndName}) =>
    Padding(
      padding: const EdgeInsets.only(left: 10),
      child: SizedBox(
        width: MediaQuery.of(context).size.width * .24.w,
        child: InkWell(
          onTap: () {},
          child: Ink(
            color: Colors.grey.shade100,
            child: Column(
              children: [
                Stack(
                  fit: StackFit.passthrough,
                  clipBehavior: Clip.none,
                  children: [
                    cachedNetworkImage(product.images[0], BoxFit.cover),

                    // if (showOwnerAndName)  `1
                    Positioned(
                        bottom: 1,
                        left: 0,
                        child: circleAvatar(data: product.images[0])),
                  ],
                ),
                SizedBox(height: 3.h),
                if (showOwnerAndName)
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        product.name,
                        style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.bold,
                            overflow: TextOverflow.ellipsis),
                      ),
                      // Ratingbar(ratingValue: 3),
                      Text(
                        product.description,
                        style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.bold,
                            overflow: TextOverflow.ellipsis),
                      ),
                      Text(
                        "\u{20A6}${product.price}",
                        style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.bold,
                            overflow: TextOverflow.ellipsis),
                      ),
                      ratingBar(ratingValue: 3),
                    ],
                  ),
              ],
            ),
          ),
        ),
      ),
    );

Padding displayCategoryImageWidget(String image) => Padding(
      padding: EdgeInsets.only(left: 10.sp),
      child: Ink(
        height: 90.h,
        width: 90.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.sp),
          color: Colors.white,
          image: DecorationImage(
            image: AssetImage(image),
          ),
        ),
      ),
    );
InkWell notification(VoidCallback onpress) => InkWell(
      onTap: onpress,
      child: Column(
        children: [
          SizedBox(height: 5.h),
          CircleAvatar(
            backgroundColor: Colors.transparent,
            radius: 13.r,
            child: ImageIcon(
              AssetImage(Assets.bottomNavigationImage[11]),
              size: 30.sp,
            ),
          ),
          SizedBox(
            width: 55.w,
            child: Text(
              'Port-Harcourt, River State',
              style:
                  TextStyle(fontSize: 10.sp, overflow: TextOverflow.ellipsis),
            ),
          )
        ],
      ),
    );
// productWidgetTwo
InkWell productWidgetTwo({
  required BuildContext context,
  required ProductModel product,
  required bool showOwnerAndName,
  required double rating,
}) =>
    InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProductDetails(productmodel: product),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.only(left: 10),
        padding: const EdgeInsets.all(3.0),
        decoration: BoxDecoration(
          // color: Colors.grey.shade100,
          borderRadius: BorderRadius.circular(10),
        ),
        width: 160.w,
        height: 230.h,
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                    child: cachedNetworkImage(product.images[0], BoxFit.cover)),
                SizedBox(height: 5.h),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ratingBar(ratingValue: rating),
                    Text(
                      product.name,
                      style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          overflow: TextOverflow.ellipsis),
                    ),
                    Text(
                      product.description,
                      style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          overflow: TextOverflow.ellipsis),
                    ),
                    Text(
                      "\u{20A6}${product.price}",
                      style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          overflow: TextOverflow.ellipsis),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                  ],
                ),
              ],
            ),
            const Positioned(
              top: 1,
              left: 0,
              child: Icon(
                Icons.diamond_outlined,
                color: Colors.blue,
                size: 20,
              ),
            ),
            Positioned(
              top: 1,
              right: 0,
              child: Chip(
                label: const Text('-20', style: TextStyle(color: Colors.black)),
                side: const BorderSide(width: .1),
                autofocus: true,
                backgroundColor: Colors.red.shade100,
              ),
            ),
          ],
        ),
      ),
    );

ElevatedButton inputFormButton(
        {Key? key,
        required BuildContext context,
        required onClick,
        titleText,
        icon,
        color,
        cornerRadius,
        padding = const EdgeInsets.symmetric(horizontal: 16)}) =>
    ElevatedButton(
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

TextFormField customTextFormField({
  required TextEditingController controller,
  final VoidCallback? onPress,
  final bool? isSecureField,
  final bool? autoCorrect,
  final String? hint,
  final EdgeInsets? contentPadding,
  final String? Function(String?)? validation,
  final bool? enable,
  final TextInputAction? textInputAction,
  final Function(String)? onFieldSubmitted,
  final double? hintTextSize = 14,
  final bool? passwordVisible = false,
}) =>
    TextFormField(
      controller: controller,
      obscureText: isSecureField! && !passwordVisible!,
      enableSuggestions: isSecureField,
      autocorrect: autoCorrect!,
      validator: validation,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      enabled: enable,
      textInputAction: textInputAction,
      onFieldSubmitted: onFieldSubmitted,
      decoration: InputDecoration(
        filled: true,
        hintText: hint,
        hintStyle: TextStyle(
          fontSize: hintTextSize,
        ),
        contentPadding: contentPadding,
        suffixIcon: isSecureField
            ? IconButton(
                icon: Icon(
                  passwordVisible! ? Icons.visibility : Icons.visibility_off,
                  color: Colors.black87,
                ),
                onPressed: onPress,
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
