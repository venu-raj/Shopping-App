import 'package:flutter/material.dart';
import 'package:shopping_app_demo/core/theme/pallete.dart';
import 'package:shopping_app_demo/features/cart/screens/cart_screen.dart';
import 'package:shopping_app_demo/features/home/widgets/brand_content.dart';
import 'package:shopping_app_demo/features/home/widgets/icon_container_widget.dart';
import 'package:shopping_app_demo/features/home/widgets/product_content.dart';
import 'package:shopping_app_demo/features/home/widgets/product_gridview_widget.dart';
import 'package:shopping_app_demo/features/product/screens/product_details_screen.dart';
import 'package:shopping_app_demo/models/product_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Padding(
          padding: EdgeInsets.all(8.0),
          child: IconContainerWidget(
            backgroungColor: Pallete.borderColor,
            imagePath: "assets/icons/appbar_icon.png",
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const CartScreen(),
                  ),
                );
              },
              child: const IconContainerWidget(
                backgroungColor: Pallete.borderColor,
                imagePath: "assets/icons/appbar_icon2.png",
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //Name and Welcome message
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Venu Raj",
                    style: Theme.of(context)
                        .textTheme
                        .headlineSmall!
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "Welcome to Shop App",
                    style: Theme.of(context).textTheme.labelSmall!.copyWith(
                          color: Pallete.greyColor,
                        ),
                  ),
                ],
              ),
              //Search Field
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: "Search",
                        hintStyle: const TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 15,
                        ),
                        prefixIcon: Image.asset("assets/icons/Search.png"),
                        iconColor: Pallete.greyColor,
                        border: const OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ),
                        filled: true,
                        fillColor: Pallete.borderColor,
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10),
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(8),
                    child: IconContainerWidget(
                      backgroungColor: Pallete.purpleColor,
                      imagePath: "assets/icons/Voice.png",
                      radius: 10,
                    ),
                  ),
                ],
              ),
              //Choose Brand row
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Choose Brand",
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "View All",
                          style:
                              Theme.of(context).textTheme.bodySmall!.copyWith(
                                    color: Pallete.greyColor,
                                  ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    SizedBox(
                      height: 50,
                      child: ListView.builder(
                        itemCount: brandcontents.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (content, index) {
                          return Padding(
                            padding: const EdgeInsets.only(right: 4),
                            child: Container(
                              decoration: const BoxDecoration(
                                color: Pallete.borderColor,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10),
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 8, vertical: 8),
                                child: Row(
                                  children: [
                                    Container(
                                      decoration: const BoxDecoration(
                                        color: Pallete.whiteColor,
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(8),
                                        ),
                                      ),
                                      child: SizedBox(
                                        height: 60,
                                        width: 40,
                                        child: Image.asset(
                                          brandcontents[index].imagePath,
                                          height: 100,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 10),
                                    Text(
                                      brandcontents[index].brandName,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodySmall!
                                          .copyWith(
                                              fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    )
                  ],
                ),
              ),
              //Products gridview section
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "New Arraival",
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge!
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "View All",
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          color: Pallete.greyColor,
                        ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 8,
                  crossAxisSpacing: 8,
                ),
                itemCount: productContents.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => ProductDetailsScreen(
                            productModel: ProductModel(
                              imagePath: productContents[index].imagePath,
                              brandName: productContents[index].brandName,
                              title: productContents[index].title,
                              price: productContents[index].price,
                            ),
                          ),
                        ),
                      );
                    },
                    child: ProductGridViewWidget(
                      imagePath: productContents[index].imagePath,
                      brandName: productContents[index].brandName,
                      title: productContents[index].title,
                      price: productContents[index].price,
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
