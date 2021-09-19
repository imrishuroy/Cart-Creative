import '/models/category.dart';

import '/widgets/widgets.dart';
import 'package:flutter/material.dart';

const List<Category> _categories = [
  Category(
      name: 'Music',
      logo: 'https://cdn-icons-png.flaticon.com/512/3655/3655252.png'),
  Category(
      name: 'Clothes',
      logo: 'https://cdn-icons-png.flaticon.com/512/3081/3081966.png'),
  Category(
      name: 'Electronics',
      logo:
          'https://firebasestorage.googleapis.com/v0/b/cart-creative.appspot.com/o/electronics.png?alt=media&token=e6fac4bf-ed04-45cc-b347-ccc037efd2db'),
  Category(
      name: 'Kids',
      logo: 'https://cdn-icons-png.flaticon.com/512/3885/3885025.png'),
  Category(
      name: 'Beauty',
      logo:
          'https://firebasestorage.googleapis.com/v0/b/cart-creative.appspot.com/o/beauty.png?alt=media&token=72150b3a-e673-48ef-b87a-45e839e7b62d'),
];

class Categories extends StatelessWidget {
  const Categories({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(24.0)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            children: [
              const SizedBox(height: 10.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    'Categories',
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 16.0,
                      letterSpacing: 1.1,
                    ),
                  ),
                  Text(
                    'See all',
                    style: TextStyle(
                      color: Colors.green,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 1.0,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 5.0),
              const Divider(),
              Container(
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(20.0)),
                height: 140.0,
                child: ListView.builder(
                  padding: EdgeInsets.zero,
                  scrollDirection: Axis.horizontal,
                  itemCount: _categories.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(
                        right: 17.0,
                        top: 15.0,
                      ),
                      child: Column(
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 20.0,
                              vertical: 10.0,
                            ),
                            decoration: BoxDecoration(
                              color: const Color(0xffe6f9ee),
                              borderRadius: BorderRadius.circular(
                                12.0,
                              ),
                            ),
                            // child: Image.network(_categories[index].logo),
                            child: DisplayImage(
                              imageUrl: _categories[index].logo,
                            ),
                            height: 80.0,
                            width: 100.0,
                          ),
                          const SizedBox(height: 10.0),
                          Text(
                            _categories[index].name,
                            style: const TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 14.5,
                              letterSpacing: 1.0,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
