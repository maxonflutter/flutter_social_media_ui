class User {
  final String id;
  final String username;
  final String imagePath;
  final int followers;
  final int followings;
  final int likes;

  User({
    required this.id,
    required this.username,
    required this.imagePath,
    this.followers = 0,
    this.followings = 0,
    this.likes = 0,
  });

  static List<User> users = [
    User(
      id: '1',
      username: 'Massimo',
      imagePath: 'assets/images/image_1.jpg',
      followers: 100,
      followings: 100,
      likes: 50,
    ),
    User(
      id: '2',
      username: 'John',
      imagePath: 'assets/images/image_2.jpg',
      followers: 200,
      followings: 200,
      likes: 500,
    ),
    User(
      id: '3',
      username: 'Laura',
      imagePath: 'assets/images/image_3.jpg',
      followers: 1000,
      followings: 1000,
      likes: 5000,
    ),
    User(
      id: '4',
      username: 'Graphics10',
      imagePath: 'assets/images/image_4.jpg',
      followers: 10,
      followings: 10,
      likes: 50,
    ),
    User(
      id: '5',
      username: 'Massimo',
      imagePath: 'assets/images/image_1.jpg',
      followers: 100,
      followings: 100,
      likes: 50,
    ),
    User(
      id: '6',
      username: 'John',
      imagePath: 'assets/images/image_2.jpg',
      followers: 200,
      followings: 200,
      likes: 500,
    ),
    User(
      id: '7',
      username: 'Laura',
      imagePath: 'assets/images/image_3.jpg',
      followers: 1000,
      followings: 1000,
      likes: 5000,
    ),
    User(
      id: '8',
      username: 'Graphics10',
      imagePath: 'assets/images/image_4.jpg',
      followers: 10,
      followings: 10,
      likes: 50,
    ),
  ];
}
