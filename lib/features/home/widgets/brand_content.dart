class BrandContent {
  final String imagePath;
  final String brandName;

  BrandContent({
    required this.imagePath,
    required this.brandName,
  });
}

List<BrandContent> brandcontents = [
  BrandContent(
    imagePath: "assets/brand_icons/Adidas.png",
    brandName: "Adidas",
  ),
  BrandContent(
    imagePath: "assets/brand_icons/fila-9 1.png",
    brandName: "Fila",
  ),
  BrandContent(
    imagePath: "assets/brand_icons/puma-logo 1.png",
    brandName: "Puma",
  ),
  BrandContent(
    imagePath: "assets/brand_icons/Vector.png",
    brandName: "Nike",
  ),
];
