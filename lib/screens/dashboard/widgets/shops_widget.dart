import '/widgets/widgets.dart';

import '/models/shop.dart';
import 'package:flutter/material.dart';

const List<Shop> _shops = [
  Shop(
    name: 'Shop -1',
    logo:
        'https://img-premium.flaticon.com/png/512/869/premium/869432.png?token=exp=1632062890~hmac=d7d593c43c8b5676483236bcc368e6b4',
  ),
  Shop(
    name: 'Shop - 2',
    logo: 'https://cdn-icons-png.flaticon.com/512/273/273177.png',
  ),
  Shop(
    name: 'Shop - 3',
    logo: 'https://cdn-icons-png.flaticon.com/512/1198/1198361.png',
  ),
  Shop(
    name: 'Shop - 4',
    logo: 'https://cdn-icons-png.flaticon.com/512/610/610365.png',
  ),
  Shop(
    name: 'Shop - 3',
    logo: 'https://cdn-icons-png.flaticon.com/512/1198/1198361.png',
  ),
  Shop(
    name: 'Shop - 4',
    logo: 'https://cdn-icons-png.flaticon.com/512/610/610365.png',
  ),
];

class ShopsWidgets extends StatelessWidget {
  const ShopsWidgets({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
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
                      'Shops Near You',
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

                Expanded(
                  child: GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 1.3,
                      ),
                      itemCount: _shops.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(
                            right: 17.0,
                            top: 8.0,
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
                                // child: Image.network(_shops[index].logo!),
                                child: DisplayImage(
                                  imageUrl: _shops[index].logo,
                                ),
                                height: 80.0,
                                width: 100.0,
                              ),
                              const SizedBox(height: 10.0),
                              Text(
                                _shops[index].name ?? 'N/A',
                                style: const TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14.5,
                                  letterSpacing: 1.0,
                                ),
                              ),
                            ],
                          ),
                        );
                      }),
                ),

                // Container(
                //   decoration:
                //       BoxDecoration(borderRadius: BorderRadius.circular(20.0)),
                //   height: 140.0,
                //   child: ListView.builder(
                //     padding: EdgeInsets.zero,
                //     //scrollDirection: Axis.horizontal,
                //     itemCount: _shops.length,
                //     itemBuilder: (context, index) {
                //       return Padding(
                //         padding: const EdgeInsets.only(
                //           right: 17.0,
                //           top: 15.0,
                //         ),
                //         child: Column(
                //           children: [
                //             Container(
                //               padding: const EdgeInsets.symmetric(
                //                 horizontal: 20.0,
                //                 vertical: 10.0,
                //               ),
                //               decoration: BoxDecoration(
                //                 color: const Color(0xffe6f9ee),
                //                 borderRadius: BorderRadius.circular(
                //                   12.0,
                //                 ),
                //               ),
                //               // child: Image.network(_shops[index].logo!),
                //               child: DisplayImage(
                //                 imageUrl: _shops[index].logo,
                //               ),
                //               height: 80.0,
                //               width: 100.0,
                //             ),
                //             const SizedBox(height: 10.0),
                //             Text(
                //               _shops[index].name ?? 'N/A',
                //               style: const TextStyle(
                //                 fontWeight: FontWeight.w600,
                //                 fontSize: 14.5,
                //                 letterSpacing: 1.0,
                //               ),
                //             ),
                //           ],
                //         ),
                //       );
                //     },
                //   ),
                // )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
