class Article {
  final int id;
  final String category;
  final String name;
  final int price;
  final int productLeftovers;

  @override
  String toString() {
    return 'Article{$id, $category, $name, $price, $productLeftovers}';
  }

  Article({
    required this.id,
    required this.category,
    required this.name,
    required this.price,
    required this.productLeftovers,
  });
}

abstract class Filter {
  bool apply(Article article);

  void printFilterCategory() {
    print('\nfiltered for:\n');
  }
}

class CategoryFilter implements Filter {
  final String category;

  CategoryFilter(this.category);

  @override
  bool apply(Article article) {
    return article.category == category;
  }

  @override
  void printFilterCategory() {
    print('\nfiltered for category: $category\n');
  }
}

class PriceFilter implements Filter {
  final int requiredMaxPrice;

  PriceFilter(this.requiredMaxPrice);

  @override
  bool apply(Article article) {
    return article.price <= requiredMaxPrice;
  }

  @override
  void printFilterCategory() {
    print('\nfiltered for price: $requiredMaxPrice\n');
  }
}

class LeftoversFilter implements Filter {
  final int requiredMaxLeftovers;

  LeftoversFilter(this.requiredMaxLeftovers);

  @override
  bool apply(Article article) {
    return article.productLeftovers < requiredMaxLeftovers;
  }

  @override
  void printFilterCategory() {
    print('\nfiltered for product leftovers: $requiredMaxLeftovers\n');
  }
}

void applyFilter(List<Article> articles, Filter filter) {
  filter.printFilterCategory();
  for (int articleIndex = 0; articleIndex < articles.length; articleIndex += 1) {
    var product = articles[articleIndex];
    if (filter.apply(product) == false) {
      continue;
    }
    print('${product.id}, ${product.category}, ${product.name}, '
        '${product.price}, ${product.productLeftovers}');
  }
}

void main() {
  final articles = [
    // 1,хлеб,Бородинский,500,5
    // 2,хлеб,Белый,200,15
    // 3,молоко,Полосатый кот,50,53
    // 4,молоко,Коровка,50,53
    // 5,вода,Апельсин,25,100
    // 6,вода,Бородинский,500,5

    Article(
        id: 1,
        category: 'хлеб',
        name: 'Бородинский',
        price: 500,
        productLeftovers: 5),
    Article(
        id: 2,
        category: 'хлеб',
        name: 'Белый',
        price: 200,
        productLeftovers: 15),
    Article(
        id: 3,
        category: 'молоко',
        name: 'Полосатый кот',
        price: 50,
        productLeftovers: 53),
    Article(
        id: 4,
        category: 'молоко',
        name: 'Коровка',
        price: 50,
        productLeftovers: 53),
    Article(
        id: 5,
        category: 'вода',
        name: 'Апельсин',
        price: 25,
        productLeftovers: 100),
    Article(
        id: 6,
        category: 'вода',
        name: 'Бородинский',
        price: 500,
        productLeftovers: 5)
  ];

  final categoryFilter = CategoryFilter('хлеб');
  applyFilter(articles, categoryFilter);

  final priceFilter = PriceFilter(500);
  applyFilter(articles, priceFilter);

  final quantityFilter = LeftoversFilter(100);
  applyFilter(articles, quantityFilter);
}
