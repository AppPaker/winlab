
import 'package:flutter/material.dart';
import 'package:winlab/src/app/presentation/components/custom_button.dart';
import 'package:winlab/src/app/presentation/components/global_text_field.dart';
import 'package:winlab/src/app/presentation/routes/routes_navigator.dart';
import 'package:winlab/src/app/presentation/theme/color_theme.dart';
import 'package:winlab/src/app/presentation/utils/consts.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  bool? selectedindex;
  final TextEditingController quantityController = TextEditingController();
List newArrival = [
    {
      "title": "Wooden Chair",
      "image":
          "https://s3-alpha-sig.figma.com/img/71d3/b23c/e49d76a85e959f6657c178ae93956cf1?Expires=1719187200&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=fws8BfPhZkYvVoMVTWHHNFAYxw7bqFWoUwsxivYbpwhGQDrr4nG5-qWh0PKc58vVI0~jodwpbL2yYwTJR~2EPhkjr8cY1h237HDSBrO4lTq~RyASuox3eRWU5oG4kIMThVDOSu23NIjcFmaMOPAGw21kFzyUBchQlvcPUVRAd-lfsy5gZKxp37wASLcE8PIr-H7AZm1p8vu0C5w5e57WNiUkKBrSkRLCPc5QNsxHhR5GAGvBxe-wKy-HCax9ACs6zyO7NInbTOoCcAT9774O5jSwYdFCYZqzLIILUqexvDcrdYKFXSeVKkMx2OyoBS2KO3qs7NvwmYcRI0XnpFd7sw__",
      "rating": "4.5 (Rating)",
      "price": "2.200.000đ",
    },
    {
      "title": "Black Chair",
      "image":
          "https://www.figma.com/file/CGylJZPtafCq47WcU4Vdla/image/d6e2136dfa7ab7da5cadfa187151c1a4ccb1a4d3",
      "rating": "4.2 (Rating)",
      "price": "3.200.000đ",
    },
    {
      "title": "Wooden Chair",
      "image":
          "https://s3-alpha-sig.figma.com/img/71d3/b23c/e49d76a85e959f6657c178ae93956cf1?Expires=1719187200&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=fws8BfPhZkYvVoMVTWHHNFAYxw7bqFWoUwsxivYbpwhGQDrr4nG5-qWh0PKc58vVI0~jodwpbL2yYwTJR~2EPhkjr8cY1h237HDSBrO4lTq~RyASuox3eRWU5oG4kIMThVDOSu23NIjcFmaMOPAGw21kFzyUBchQlvcPUVRAd-lfsy5gZKxp37wASLcE8PIr-H7AZm1p8vu0C5w5e57WNiUkKBrSkRLCPc5QNsxHhR5GAGvBxe-wKy-HCax9ACs6zyO7NInbTOoCcAT9774O5jSwYdFCYZqzLIILUqexvDcrdYKFXSeVKkMx2OyoBS2KO3qs7NvwmYcRI0XnpFd7sw__",
      "rating": "4.5 (Rating)",
      "price": "2.200.000đ",
    },
    {
      "title": "Black Chair",
      "image":
          "https://www.figma.com/file/CGylJZPtafCq47WcU4Vdla/image/d6e2136dfa7ab7da5cadfa187151c1a4ccb1a4d3",
      "rating": "4.2 (Rating)",
      "price": "3.200.000đ",
    },
  ];
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size(double.infinity, 70),
        child: AppBar(
          backgroundColor: kWhiteColor,
          elevation: 0,
          automaticallyImplyLeading: false,
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(40),
            child: Column(
              children: [
               const SizedBox(height: kPadding * 2),
              ],
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et.",
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: kPadding * 2),
                    const Text(
                      "100.890.000đ",
                      style: TextStyle(
                        fontSize: 15,
                        color: kBlackColor,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: kPadding),
                    const Row(
                      children: [
                        Text(
                          "Designs: ",
                          style: TextStyle(
                            fontSize: 12,
                            color: kBlackColor,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        Text(
                          "modern",
                          style: TextStyle(
                            fontSize: 12,
                            color: kBlackColor,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: kPadding * 2),

                    // <------------------------  QUANTITY ------------------------>
                    GlobalTextField(
                      autofillHints: const [
                        AutofillHints.name,
                      ],
                      controller: quantityController,
                      hintText: "Quantity: 1",
                      maxLine: 1,
                      suffixIcon: const Icon(
                        Icons.arrow_drop_down,
                        color: kBlackColor,
                        size: 22.0,
                      ),
                    ),
                    const SizedBox(height: kPadding * 3),

                    // ---------------  BUTTONS ---------------
                    SizedBox(
                      height: size.height / 100 * 6,
                      child: CustomButton(
                          onPressed: () {
                          },
                          showLoadingIndicator: true,
                          text: "Buy now"),
                    ),
                    const SizedBox(height: kPadding * 2),
                    SizedBox(
                      height: size.height / 100 * 6,
                      child: CustomButton(
                          isOutlineButton: true,
                          onPressed: () {
                
                          },
                          showLoadingIndicator: true,
                          text: "Add to cart"),
                    ),
                    const SizedBox(height: kPadding * 2),
                    SizedBox(
                      height: size.height / 100 * 6,
                      child: CustomButton(
                          icon: const Icon(
                            Icons.favorite_border,
                            color: kPrimaryColor,
                          ),
                          isOutlineButton: true,
                          onPressed: () {},
                          showLoadingIndicator: true,
                          text: "Add to favorites"),
                    ),
                    const SizedBox(height: kPadding * 2),

                    const Text(
                      "Product information",
                      style: TextStyle(
                        fontSize: 15,
                        color: kBlackColor,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: kPadding),

                    const Text(
                      "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.  Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, Quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. ",
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        fontSize: 14,
                        color: kBlackColor,
                        fontWeight: FontWeight.w400,
                      ),
                    ),

                    const SizedBox(height: kPadding),
                    Image.network(
                      "https://s3-alpha-sig.figma.com/img/dfb3/b3c6/43b2d038aef12a8ffc09c287cf5b2376?Expires=1719187200&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=isnteuTPoc83wHzouVsceQFbWC7g-Ktqw0cUrF8eeFduzVUq~lLR2CnDu74fNs5agcqLGx99ELI8I0ow~BDCDnXxasI0fdLINtZAAXFXdNm5XRXtSDc6KKgcIZlGOo0xuTfcRvZ8DE6kDXfSX7Ifp1UKKyAwLTFHpHzfPBlPn3RfWFKv93foobvn1ITGpDycj4t0wnv4Oj5ywmxcyZuyHZ5tuTCc8clrMj71~cg88AO~XhkG2CJyvvhjmjHesg6~cAviZ~mdhAycjpvXxbupGcCCSSMNaWIoRa~utH1Lems2aLqZ2l8jsS5Ltw9F0~~Cdp5xq2JfUeOX1R7QRzXyiA__",
                      height: size.height * 0.3,
                      width: size.width,
                      fit: BoxFit.cover,
                    ),
                    const Text(
                      "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.  Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, Quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. ",
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        fontSize: 14,
                        color: kBlackColor,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const SizedBox(height: kPadding * 2),

                    const Text(
                      "Suggestions for you",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: kPadding),
                      SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                        children: List.generate(newArrival.length, (index) {
                      return Padding(
                        padding: const EdgeInsets.only(right: kPadding * 2),
                        child: GestureDetector(
                          onTap: () {
                            RouteNavigator.route(
                                context, const ProductDetailsScreen());
                          },
                          child: Container(
                            width: size.width * 0.45,
                            height: size.height * 0.38,
                            decoration: BoxDecoration(
                              color: kWhiteColor,
                              borderRadius: BorderRadius.circular(16.0),
                            ),
                            child: Stack(
                              children: [
                                Positioned(
                                  bottom: 0,
                                  child: Container(
                                    width: size.width * 0.45,
                                    height: size.height * 0.33,
                                    decoration: BoxDecoration(
                                      color: kContainerColor,
                                      borderRadius: BorderRadius.circular(16.0),
                                    ),
                                  ),
                                ),
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(kRadius),
                                  child: Image.network(
                                    newArrival[index]["image"],
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: kPadding,
                                      vertical: kPadding * 2),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Text(
                                        newArrival[index]["title"],
                                        style: const TextStyle(
                                            fontSize: 15,
                                            color: kBlackColor,
                                            fontWeight: FontWeight.w600),
                                      ),
                                      const SizedBox(height: kPadding),
                                      Text(
                                        newArrival[index]["rating"],
                                        style: const TextStyle(
                                            fontSize: 12,
                                            color: kGreyColor,
                                            fontWeight: FontWeight.w400),
                                      ),
                                      const SizedBox(height: kPadding),
                                      Text(
                                        newArrival[index]["price"],
                                        style: const TextStyle(
                                            fontSize: 12,
                                            color: kOrangeColor,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    })),
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
