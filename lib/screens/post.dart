class Post {
  int id;
  String productName;
  String category;
  String type;
  String imageUrl;
  double price;
  DateTime purchaseDate;
  String productCondition;
  String caption;
  String username;
  String userProfilePic;
  int likes;
  List<String> comments;

  Post({
    required this.id,
    required this.productName,
    required this.category,
    required this.type,
    required this.imageUrl,
    required this.price,
    required this.purchaseDate,
    required this.productCondition,
    required this.caption,
    required this.username,
    required this.userProfilePic,
    required this.likes,
    required this.comments,
  });

  void likePOst() {
    likes++;
  }

  void addComment(String comment) {
    comments.add(comment);
  }

  static List<Post> getPosts() {
    return [
      Post(
        id: 1,
        productName: 'Harry Potter',
        category: 'Books',
        type: 'Donation',
        imageUrl: 'assets/Harry_Potter.jpg',
        price: 0.0,
        purchaseDate: DateTime(2023, 1, 10),
        productCondition: 'Used',
        caption: 'A well-loved copy of Harry Potter.',
        username: 'Ichiban Kasuga',
        userProfilePic: 'assets/ichiban.jpg',
        likes: 10,
        comments: ['Great book!', 'I love Harry Potter!'],
      ),
      Post(
          id: 2,
          productName: 'The Hobbit',
          category: 'Books',
          type: 'Donation',
          imageUrl: 'assets/The_Hobbit.jpg',
          price: 0.0,
          purchaseDate: DateTime(2023, 3, 15),
          productCondition: 'Used',
          caption: 'A classic fantasy novel in great condition.',
          username: 'Majima Goro',
          userProfilePic: 'assets/majima.jpg',
          likes: 7,
          comments: ['I love this book!']),
      Post(
        id: 3,
        productName: 'T-shirt',
        category: 'Clothing',
        type: 'Exchange',
        imageUrl: 'assets/T-shirt.jpg',
        price: 10.0,
        purchaseDate: DateTime(2023, 5, 20),
        productCondition: 'New',
        caption: 'A brand new T-shirt for exchange.',
        username: 'Kiryu Kazuma',
        userProfilePic: 'assets/kiryu.jpg',
        likes: 25,
        comments: ['I want to exchange this for a book.'],
      ),
      Post(
        id: 4,
        productName: 'Radahn set',
        category: 'Clothing',
        type: 'Donation',
        imageUrl: 'assets/radahn.jpg',
        price: 0.0,
        purchaseDate: DateTime(2023, 8, 25),
        productCondition: 'Used',
        caption: 'Gently used jeans in good condition.',
        username: 'General Radahn',
        userProfilePic: 'assets/radahn.jpg',
        likes: 15,
        comments: ['Great sets!I love Elden Ring.'],
      ),
    ];
  }

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      id: json['id'],
      productName: json['productName'],
      category: json['category'],
      type: json['type'],
      imageUrl: json['imageUrl'],
      price: json['price'],
      purchaseDate: DateTime.parse(json['purchaseDate']),
      productCondition: json['productCondition'],
      caption: json['caption'],
      username: json['username'],
      userProfilePic: json['userProfilePic'],
      likes: json['likes'] ?? 0,
      comments: json['comments'] ?? 0,
    );
  }
}
