import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class Product {
  final String name;
  final String subtitle;
  final String price;
  final String imagePath;
  final String rating;

  Product({
    required this.name,
    required this.subtitle,
    required this.price,
    required this.imagePath,
    required this.rating,
  });
}

class HighFidelityHomeScreen extends StatefulWidget {
  const HighFidelityHomeScreen({super.key});

  @override
  State<HighFidelityHomeScreen> createState() => _HighFidelityHomeScreenState();
}

class _HighFidelityHomeScreenState extends State<HighFidelityHomeScreen> {
  int _selectedBottomNavIndex = 0;
  String _selectedCategory = 'All Coffee';

  final List<String> _categories = [
    'All Coffee',
    'Machiato',
    'Latte',
    'Americano'
  ];

  final List<Product> _products = [
    Product(
      name: 'Caffe Mocha',
      subtitle: 'Deep Foam',
      price: '4.53',
      imagePath: 'assets/images/I216_192_417_715.png',
      rating: '4.8',
    ),
    Product(
      name: 'Flat White',
      subtitle: 'Espresso',
      price: '3.53',
      imagePath: 'assets/images/I216_208_417_717.png',
      rating: '4.8',
    ),
    Product(
      name: 'Mocha Fusi',
      subtitle: 'Ice/Hot',
      price: '7.53',
      imagePath: 'assets/images/I216_240_417_716.png',
      rating: '4.8',
    ),
    Product(
      name: 'Caffe Panna',
      subtitle: 'Ice/Hot',
      price: '5.53',
      imagePath: 'assets/images/I216_224_417_718.png',
      rating: '4.8',
    ),
  ];

  void _onBottomNavItemTapped(int index) {
    setState(() {
      _selectedBottomNavIndex = index;
    });
    switch (index) {
      case 0:
        // Already on home, do nothing or refresh
        break;
      case 1:
        context.go('/favorites');
        break;
      case 2:
        context.go('/cart');
        break;
      case 3:
        context.go('/notifications');
        break;
    }
  }

  void _onCategoryTapped(String category) {
    setState(() {
      _selectedCategory = category;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9F9F9),
      body: SafeArea(
        top: false,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildHeader(),
              const SizedBox(height: 24),
              _buildCategories(),
              const SizedBox(height: 24),
              _buildProductGrid(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: _buildBottomNavBar(),
    );
  }

  Widget _buildHeader() {
    return Stack(
      children: [
        Container(
          height: 280,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color(0xFF111111),
                Color(0xFF313131),
              ],
            ),
          ),
        ),
        SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16),
            child: Column(
              children: [
                _buildLocationAndProfile(),
                const SizedBox(height: 24),
                _buildSearchBar(),
                const SizedBox(height: 24),
                _buildPromoBanner(),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildLocationAndProfile() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Location',
              style: GoogleFonts.sora(
                fontSize: 12,
                color: const Color(0xFFA2A2A2),
              ),
            ),
            const SizedBox(height: 4),
            Row(
              children: [
                Text(
                  'Bilzen, Tanjungbalai',
                  style: GoogleFonts.sora(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: const Color(0xFFDDDDDD),
                  ),
                ),
                const SizedBox(width: 4),
                const Icon(
                  Icons.keyboard_arrow_down,
                  color: Color(0xFFDDDDDD),
                  size: 20,
                ),
              ],
            ),
          ],
        ),
        GestureDetector(
          onTap: () => context.go('/profile'),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(14.0),
            child: Image.asset(
              'assets/images/I216_106_417_719.png',
              width: 44,
              height: 44,
              fit: BoxFit.cover,
            ),
          ),
        )
      ],
    );
  }

  Widget _buildSearchBar() {
    return Row(
      children: [
        Expanded(
          child: TextField(
            decoration: InputDecoration(
              hintText: 'Search coffee',
              hintStyle: GoogleFonts.sora(color: const Color(0xFF989898)),
              prefixIcon: const Icon(Icons.search, color: Color(0xFF989898)),
              filled: true,
              fillColor: const Color(0xFF313131),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: BorderSide.none,
              ),
              contentPadding: EdgeInsets.zero,
            ),
            style: GoogleFonts.sora(color: Colors.white),
          ),
        ),
        const SizedBox(width: 16),
        Container(
          decoration: BoxDecoration(
            color: const Color(0xFFC67C4E),
            borderRadius: BorderRadius.circular(12),
          ),
          child: IconButton(
            icon: const Icon(Icons.tune, color: Colors.white),
            onPressed: () {
              // Handle filter button press
            },
          ),
        ),
      ],
    );
  }

  Widget _buildPromoBanner() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: Stack(
        children: [
          Image.asset(
            'assets/images/216_258.png',
            height: 140,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          Positioned(
            top: 16,
            left: 24,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: const Color(0xFFED5151),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                'Promo',
                style: GoogleFonts.sora(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 24,
            left: 24,
            child: Container(
              width: 200,
              padding: const EdgeInsets.symmetric(vertical: 4),
              color: const Color(0xFF111111),
              child: Text(
                'Buy one get',
                style: GoogleFonts.sora(
                  fontSize: 32,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          Positioned(
            bottom: -4,
            left: 24,
            child: Container(
              width: 200,
              padding: const EdgeInsets.symmetric(vertical: 4),
              color: const Color(0xFF111111),
              child: Text(
                'one FREE',
                style: GoogleFonts.sora(
                  fontSize: 32,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildCategories() {
    return SizedBox(
      height: 40,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: _categories.length,
        padding: const EdgeInsets.symmetric(horizontal: 24),
        itemBuilder: (context, index) {
          final category = _categories[index];
          final isSelected = category == _selectedCategory;
          return Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: GestureDetector(
              onTap: () => _onCategoryTapped(category),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                decoration: BoxDecoration(
                  color: isSelected ? const Color(0xFFC67C4E) : const Color(0xFFF2F2F2),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Center(
                  child: Text(
                    category,
                    style: GoogleFonts.sora(
                      color: isSelected ? Colors.white : const Color(0xFF2F4B4E),
                      fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
                      fontSize: 14,
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildProductGrid() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: _products.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          childAspectRatio: 0.65,
        ),
        itemBuilder: (context, index) {
          return _ProductCard(product: _products[index]);
        },
      ),
    );
  }

  Widget _buildBottomNavBar() {
    return Container(
      height: 90,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 20,
            spreadRadius: 1,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildBottomNavItem(Icons.home_filled, 0),
          _buildBottomNavItem(Icons.favorite_border, 1),
          _buildBottomNavItem(Icons.shopping_bag_outlined, 2),
          _buildBottomNavItem(Icons.notifications_none, 3),
        ],
      ),
    );
  }

  Widget _buildBottomNavItem(IconData icon, int index) {
    bool isSelected = _selectedBottomNavIndex == index;
    return GestureDetector(
      onTap: () => _onBottomNavItemTapped(index),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            color: isSelected ? const Color(0xFFC67C4E) : const Color(0xFF8D8D8D),
            size: 28,
          ),
          if (isSelected)
            Container(
              margin: const EdgeInsets.only(top: 6),
              height: 5,
              width: 10,
              decoration: BoxDecoration(
                color: const Color(0xFFC67C4E),
                borderRadius: BorderRadius.circular(18),
              ),
            ),
        ],
      ),
    );
  }
}

class _ProductCard extends StatelessWidget {
  final Product product;

  const _ProductCard({required this.product});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.go('/product_detail');
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.asset(
                      product.imagePath,
                      height: 132,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    top: 0,
                    right: 0,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                      decoration: const BoxDecoration(
                        color: Color.fromRGBO(0, 0, 0, 0.2),
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(12),
                          bottomLeft: Radius.circular(12),
                        ),
                      ),
                      child: Row(
                        children: [
                          const Icon(Icons.star, color: Color(0xFFFBBE21), size: 14),
                          const SizedBox(width: 4),
                          Text(
                            product.rating,
                            style: GoogleFonts.sora(
                              color: Colors.white,
                              fontSize: 10,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(8, 12, 8, 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      product.name,
                      style: GoogleFonts.sora(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: const Color(0xFF2F2D2C),
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      product.subtitle,
                      style: GoogleFonts.sora(
                        fontSize: 12,
                        color: const Color(0xFF9B9B9B),
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 12),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '\$ ${product.price}',
                          style: GoogleFonts.sora(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: const Color(0xFF2F4B4E),
                          ),
                        ),
                        Container(
                          height: 32,
                          width: 32,
                          decoration: BoxDecoration(
                            color: const Color(0xFFC67C4E),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: IconButton(
                            padding: EdgeInsets.zero,
                            icon: const Icon(Icons.add, color: Colors.white, size: 20),
                            onPressed: () {
                              // Add to cart
                            },
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}