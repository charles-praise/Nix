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
        name: 'Joggers',
        category: 'Joggers',
        description: 'Afircan made shirts',
        rating: 3,
        price: 10000,
        images: [
          'https://danami.ng/wp-content/uploads/2025/02/Danami.webp',
          'https://danami.ng/wp-content/uploads/2025/02/Danami.webp',
        ],
        sellersName: 'Charles Praise Diepriye',
        sellersAddress: 'No 16 Royal Close port Harcourt',
        sellersImage: Assets.avatars[0],
      ),
      ProductModel(
        name: 'Sweater',
        description: 'Afircan made shirts',
        category: 'Sweaters',
        rating: 4,
        price: 5000,
        images: [
          'https://danami.ng/wp-content/uploads/2024/05/Danami-3-Colour-Block-Hoodie.jpg',
          'https://danami.ng/wp-content/uploads/2024/05/Danami-3-Colour-Block-Hoodie.jpg'
        ],
        sellersName: 'Charles Praise Diepriye',
        sellersAddress: 'No 16 Royal Close port Harcourt',
        sellersImage: Assets.avatars[0],
      ),
      ProductModel(
        name: 'Brooklyn Sweater',
        description: 'Brooklyn sweaters Xl, XXl, X',
        category: 'Sweater',
        rating: 3,
        price: 7000,
        images: [
          'https://danami.ng/wp-content/uploads/2023/10/Danami-Crop-Hoodie-With-Brooklyn-New-York-Print-Black-1-1.jpg',
          'https://danami.ng/wp-content/uploads/2023/10/Danami-Crop-Hoodie-With-Brooklyn-New-York-Print-Black-1-1.jpg',
        ],
        sellersName: 'Charles Praise Diepriye',
        sellersAddress: 'No 16 Royal Close port Harcourt',
        sellersImage: Assets.avatars[0],
      ),
      ProductModel(
        name: 'Single Hand Bags',
        description: 'Starndard single hand bags for outing',
        category: 'Bags',
        price: 2000,
        rating: 2,
        images: [
          'https://danami.ng/wp-content/uploads/2023/04/77-2.jpg',
          'https://danami.ng/wp-content/uploads/2023/04/77-2.jpg',
        ],
        sellersName: 'Charles Praise Diepriye',
        sellersAddress: 'No 16 Royal Close port Harcourt',
        sellersImage: Assets.avatars[0],
      ),
      ProductModel(
        name: 'Kitto Bag',
        description: 'Afircan made shirts',
        category: 'Bags',
        price: 5000,
        rating: 5,
        images: [
          'https://danami.ng/wp-content/uploads/2023/04/37.jpg',
          'https://danami.ng/wp-content/uploads/2023/04/37.jpg',
        ],
        sellersName: 'Charles Praise Diepriye',
        sellersAddress: 'No 16 Royal Close port Harcourt',
        sellersImage: Assets.avatars[0],
      ),
      ProductModel(
        name: 'Haters Caps',
        category: 'Cap',
        description: 'Branded Haters portable head Cap',
        price: 6000,
        rating: 6,
        images: [
          'https://danami.ng/wp-content/uploads/2024/01/fuck-2.jpg',
          'https://danami.ng/wp-content/uploads/2024/01/fuck-2.jpg',
        ],
        sellersName: 'Charles Praise Diepriye',
        sellersAddress: 'No 16 Royal Close port Harcourt',
        sellersImage: Assets.avatars[0],
      ),
      ProductModel(
        name: 'King and Queens Caps',
        description: 'King and queens Pair Head Cap',
        category: 'Cap',
        rating: 4,
        price: 6000,
        images: [
          'https://danami.ng/wp-content/uploads/2023/04/84.jpg',
          'https://danami.ng/wp-content/uploads/2023/04/84.jpg',
        ],
        sellersName: 'Charles Praise Diepriye',
        sellersAddress: 'No 16 Royal Close port Harcourt',
        sellersImage: Assets.avatars[0],
      ),
      ProductModel(
        name: 'Soul Mate Pair Cap',
        category: 'Cap',
        rating: 4,
        description: 'Afircan made shirts',
        price: 3000,
        images: [
          'https://danami.ng/wp-content/uploads/2023/04/71.jpg',
          'https://danami.ng/wp-content/uploads/2023/04/71.jpg',
        ],
        sellersName: 'Charles Praise Diepriye',
        sellersAddress: 'No 16 Royal Close port Harcourt',
        sellersImage: Assets.avatars[0],
      ),
      ProductModel(
        name: 'Cotton Pants',
        rating: 5,
        tier: 'diamond',
        category: 'Joggers',
        description: 'Afircan made shirts',
        price: 3000,
        images: [
          'https://danami.ng/wp-content/uploads/2023/04/1.jpg',
          'https://danami.ng/wp-content/uploads/2023/04/1.jpg',
        ],
        sellersName: 'Charles Praise Diepriye',
        sellersAddress: 'No 16 Royal Close port Harcourt',
        sellersImage: Assets.avatars[0],
      ),
      ProductModel(
        name: 'Short Pants',
        category: 'Fashion',
        description: 'Afircan made shirts',
        rating: 2,
        price: 3000,
        images: [
          'https://danami.ng/wp-content/uploads/2024/09/Danami-9.webp',
          'https://danami.ng/wp-content/uploads/2024/09/Danami-9.webp',
        ],
        sellersName: 'Charles Praise Diepriye',
        sellersAddress: 'No 16 Royal Close port Harcourt',
        sellersImage: Assets.avatars[0],
      ),
      ProductModel(
        name: '3 bedroom Duplex',
        description: 'Off Ada George by Mouka foam Starndard duplex for lease.',
        category: 'house',
        rating: 0,
        price: 1500000,
        images: [
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRngz8q2cKcSB5Wt7A8LpNss-peUz1TStrC0w&s',
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRngz8q2cKcSB5Wt7A8LpNss-peUz1TStrC0w&s',
        ],
        sellersName: 'Charles Praise Diepriye',
        sellersAddress: 'No 16 Royal Close port Harcourt',
        sellersImage: Assets.avatars[0],
      ),
    ];
  }
}
