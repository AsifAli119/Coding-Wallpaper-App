class CategoryModel {
  String? id;
  String? img;

  CategoryModel({this.id, this.img});
}

  List<CategoryModel> getCategory() {
    List<CategoryModel> categoryTile = [];

    CategoryModel categoryModel = CategoryModel();
    categoryModel.id = "Nature";
    categoryModel.img =
    "https://images.pexels.com/photos/775201/pexels-photo-775201.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500";
    categoryTile.add(categoryModel);

    categoryModel = CategoryModel();
    categoryModel.id = "Coding";
    categoryModel.img =
        "https://images.pexels.com/photos/1921326/pexels-photo-1921326.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500";
    categoryTile.add(categoryModel);

    categoryModel = CategoryModel();
    categoryModel.id = "Graffiti";
    categoryModel.img =
    "https://images.pexels.com/photos/1570264/pexels-photo-1570264.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500";
    categoryTile.add(categoryModel);

    categoryModel = CategoryModel();
    categoryModel.id = "Urban";
    categoryModel.img =
    "https://images.pexels.com/photos/1236701/pexels-photo-1236701.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500";
    categoryTile.add(categoryModel);

    categoryModel = CategoryModel();
    categoryModel.id = "Animal";
    categoryModel.img =
    "https://images.pexels.com/photos/617278/pexels-photo-617278.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500";
    categoryTile.add(categoryModel);

    categoryModel = CategoryModel();
    categoryModel.id = "Fashion";
    categoryModel.img =
    "https://images.pexels.com/photos/322207/pexels-photo-322207.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500";
    categoryTile.add(categoryModel);

    categoryModel = CategoryModel();
    categoryModel.id = "Black & White";
    categoryModel.img =
    "https://images.pexels.com/photos/3780365/pexels-photo-3780365.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500";
    categoryTile.add(categoryModel);
    return categoryTile;

}