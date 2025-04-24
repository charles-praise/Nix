import '../export.dart';

class AuthLocalService {
  List<String> getCategoryImages() {
    return [
      Assets.bottomNavigationImage[1],
      Assets.bottomNavigationImage[2],
      Assets.bottomNavigationImage[3],
      Assets.bottomNavigationImage[4],
      Assets.bottomNavigationImage[5],
      Assets.bottomNavigationImage[6],
      Assets.bottomNavigationImage[7],
      Assets.bottomNavigationImage[8],
    ];
  }

  Future<Map<String, dynamic>> checkUserRegistrationStatus() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? email = prefs.getString('email');
      String? password = prefs.getString('password');
      if (email != null && password != null) {
        return {'email': email, 'password': password};
      }
      return {};
    } catch (e) {
      return {'error': e.toString()};
    }
  }

  Future<void> registerUser({
    required String email,
    required String password,
  }) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('email', email);
      await prefs.setString('password', password);
    } catch (e) {
      throw e.toString();
    }
  }

  Future<Map<String, dynamic>> login({
    required String email,
    required String password,
  }) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? email = prefs.getString('email');
      String? password = prefs.getString('password');
      if (email != null) {
        return {'email': email, 'password': password};
      }
      return {};
    } catch (e) {
      return {'error': e.toString()};
    }
  }

  Future<String> logout() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.remove('email');
      await prefs.remove('password');
      return 'success';
    } catch (e) {
      throw e.toString();
    }
  }

  List<String> fetchBannerImage() {
    Future.delayed(const Duration(seconds: 2));
    return [
      Assets.ads[1],
      Assets.ads[2],
      Assets.ads[3],
    ];
  }

  List<ProductModel> fetchProducts() {
    Future.delayed(const Duration(seconds: 2));
    return [
      ProductModel(
        name: 'Shirt',
        description: 'Afircan made shirts',
        price: 3000,
        image: 'https://danami.ng/wp-content/uploads/2025/02/Danami.webp',
      ),
      ProductModel(
          name: 'Trousers',
          description: 'Afircan made shirts',
          price: 3000,
          image:
              'https://danami.ng/wp-content/uploads/2024/05/Danami-3-Colour-Block-Hoodie.jpg'),
      ProductModel(
          name: 'Shoes',
          description: 'Afircan made shirts',
          price: 3000,
          image:
              'https://danami.ng/wp-content/uploads/2023/10/Danami-Crop-Hoodie-With-Brooklyn-New-York-Print-Black-1-1.jpg'),
      ProductModel(
          name: 'Jewelries',
          description: 'Afircan made shirts',
          price: 3000,
          image: 'https://danami.ng/wp-content/uploads/2023/04/77-2.jpg'),
      ProductModel(
          name: 'Phones',
          description: 'Afircan made shirts',
          price: 3000,
          image: 'https://danami.ng/wp-content/uploads/2023/04/37.jpg'),
      ProductModel(
          name: 'Machinery',
          description: 'Afircan made shirts',
          price: 3000,
          image: 'https://danami.ng/wp-content/uploads/2024/01/fuck-2.jpg'),
      ProductModel(
          name: 'Laptops',
          description: 'Afircan made shirts',
          price: 3000,
          image: 'https://danami.ng/wp-content/uploads/2023/04/84.jpg'),
      ProductModel(
          name: 'Gadgets',
          description: 'Afircan made shirts',
          price: 3000,
          image: 'https://danami.ng/wp-content/uploads/2023/04/71.jpg'),
      ProductModel(
          name: 'Joggers',
          description: 'Afircan made shirts',
          price: 3000,
          image: 'https://danami.ng/wp-content/uploads/2023/04/1.jpg'),
      ProductModel(
          name: 'Shorts',
          description: 'Afircan made shirts',
          price: 3000,
          image: 'https://danami.ng/wp-content/uploads/2024/09/Danami-9.webp'),
      ProductModel(
          name: 'Shorts',
          description: 'Afircan made shirts',
          price: 3000,
          image:
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRngz8q2cKcSB5Wt7A8LpNss-peUz1TStrC0w&s'),
    ];
  }
}
