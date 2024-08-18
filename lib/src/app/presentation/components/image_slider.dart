// import 'package:app/src/app/presentation/theme/color_theme.dart';
// import 'package:carousel_slider/carousel_slider.dart';

// import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// class ActiveDot extends StatelessWidget {
//   const ActiveDot({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: const EdgeInsets.only(left: 3, right: 3),
//       height: 7,
//       width: 7,
//       decoration: BoxDecoration(
//         color: kGreyColor,
//         borderRadius: BorderRadius.circular(50),
//       ),
//     );
//   }
// }

// class InactiveDot extends StatelessWidget {
//   const InactiveDot({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: const EdgeInsets.only(left: 3, right: 3),
//       height: 7,
//       width: 7,
//       decoration: BoxDecoration(
//         color: Colors.grey.withOpacity(0.3),
//         borderRadius: BorderRadius.circular(50),
//       ),
//     );
//   }
// }

// class ImageSlider extends StatefulWidget {
//   final List images;
//   final String productId;
//   const ImageSlider({
//     Key? key,
//     required this.images,
//     required this.productId,
//   }) : super(key: key);

//   @override
//   _ImageSliderState createState() => _ImageSliderState();
// }

// class _ImageSliderState extends State<ImageSlider> {
//   int activeIndex = 0;

//   setActiveDot(index) {
//     setState(() {
//       activeIndex = index;
//     });
//   }

//   void favoriteselect(bool index) {
//     setState(() {
//       selectedindex = index;
//     });
//   }

//   bool? selectedindex;
//   bool isFavorite = false;

//   @override
//   void initState() {
//     getCurrentUserUid();
//     super.initState();
//   }

//   String? customerId;
//   getCurrentUserUid() async {
//     final SharedPreferences prefs = await SharedPreferences.getInstance();
//     customerId = prefs.getString('customerId');
//   }

//   @override
//   Widget build(BuildContext context) {
//     final size = MediaQuery.of(context).size;
//     return Stack(
//       children: <Widget>[
//         CarouselSlider(
//           options: CarouselOptions(
//             enableInfiniteScroll: false,
//             autoPlayInterval: const Duration(seconds: 5),
//             autoPlay: false,
//             height: size.height / 100 * 45,
//             autoPlayCurve: Curves.fastLinearToSlowEaseIn,
//             autoPlayAnimationDuration: const Duration(seconds: 2),
//             viewportFraction: 1,
//             onPageChanged: (index, reason) {
//               setActiveDot(index);
//             },
//           ),
//           items: List.generate(
//             widget.images.length,
//             (index) {
//               return InkWell(
//                 onTap: () {
//                   // RouteNavigator.route(context,
//                   //     Image.network(uploadsApi + widget.images[index]));
                     
//                 },
//                 child: Image.network(
//                  "https://s3-alpha-sig.figma.com/img/b64e/3dc9/d31236af76f9545ca2f97295846d7356?Expires=1719187200&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=hFczkIwDC8Tjzt8D5jTJefn9jt5FpwtH5FDhP9lwqsdPtZ78nWFEBW9Lvq~6p1dHeCI6MGoaj42v~l-IaWREtxLhZ3oRB~86bKS2IKGcVlEaC9Fb6RyBtQW~WtVzMUCvLmd-sqmVTwAhF0S70fW2m0~Ohd2~BhHGFzvp6umgEDjO5kWWCryoaZVaxRMFMg-1cTs3UULH7LZJFCPwIb2KzcV3KQz1qo2OiF~pTOLPc1c1PsTyx~ohSA6ZvrsusPTrkA3S3FZoeIZ2JAV0cRGFAr0os-UXTcAmJgpNbxyUsdSoDDdCU0ArHhuFcZH4y8erjlgatsE3gyHfg1EzU0zF9Q__",
//                   // uploadsApi + widget.images[index],
//                   colorBlendMode: BlendMode.modulate,
//                   // color: kGreyColor,
//                   fit: BoxFit.cover,
//                   width: double.infinity,
//                 ),
//               );
//             },
//           ),
//         ),
       
    
//         Positioned(
//           top: 20,
        
//           right: 20,
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Container(
//                 padding: const EdgeInsets.symmetric(
//                   vertical: 5,
//                   horizontal: 12,
//                 ),
//                 decoration: BoxDecoration(
//                   color: kBlackColor.withOpacity(0.5),
//                   borderRadius: BorderRadius.circular(8),
//                 ),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     const Icon(
//                       Icons.photo_size_select_actual,
//                       color: kWhiteColor,
//                       size: 20,
//                     ),
//                     const SizedBox(
//                       width: 5,
//                     ),
//                     Text(
//                       '${activeIndex + 1} of ${widget.images.length}',
//                       style: const TextStyle(
//                         color: kWhiteColor,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         )
//       ],
//     );
//   }
// }
