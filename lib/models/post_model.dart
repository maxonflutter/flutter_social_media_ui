import 'user_model.dart';

enum PostType { image, video, audio }

class Post {
  final String id;
  final User user;
  final PostType type;
  final String caption;
  final String assetPath;

  const Post({
    required this.id,
    required this.user,
    required this.type,
    required this.caption,
    required this.assetPath,
  });

  static List<Post> posts = [
    Post(
      id: '1',
      user: User.users[0],
      type: PostType.video,
      caption:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus dui dolor, pulvinar ut odio a, facilisis dignissim risus.',
      assetPath: 'assets/videos/video_1.mp4',
    ),
    Post(
      id: '2',
      user: User.users[2],
      type: PostType.video,
      caption:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus dui dolor, pulvinar ut odio a, facilisis dignissim risus.',
      assetPath: 'assets/videos/video_2.mp4',
    ),
    Post(
      id: '3',
      user: User.users[1],
      type: PostType.video,
      caption:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus dui dolor, pulvinar ut odio a, facilisis dignissim risus.',
      assetPath: 'assets/videos/video_3.mp4',
    ),
    Post(
      id: '4',
      user: User.users[0],
      type: PostType.video,
      caption:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus dui dolor, pulvinar ut odio a, facilisis dignissim risus.',
      assetPath: 'assets/videos/video_4.mp4',
    ),
    Post(
      id: '5',
      user: User.users[3],
      type: PostType.video,
      caption:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus dui dolor, pulvinar ut odio a, facilisis dignissim risus.',
      assetPath: 'assets/videos/video_5.mp4',
    ),
    Post(
      id: '6',
      user: User.users[0],
      type: PostType.video,
      caption:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus dui dolor, pulvinar ut odio a, facilisis dignissim risus.',
      assetPath: 'assets/videos/video_6.mp4',
    ),
    Post(
      id: '7',
      user: User.users[0],
      type: PostType.video,
      caption:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus dui dolor, pulvinar ut odio a, facilisis dignissim risus.',
      assetPath: 'assets/videos/video_7.mp4',
    ),
    Post(
      id: '8',
      user: User.users[0],
      type: PostType.video,
      caption:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus dui dolor, pulvinar ut odio a, facilisis dignissim risus.',
      assetPath: 'assets/videos/video_8.mp4',
    ),
    Post(
      id: '9',
      user: User.users[3],
      type: PostType.video,
      caption:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus dui dolor, pulvinar ut odio a, facilisis dignissim risus.',
      assetPath: 'assets/videos/video_9.mp4',
    ),
    Post(
      id: '10',
      user: User.users[1],
      type: PostType.video,
      caption:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus dui dolor, pulvinar ut odio a, facilisis dignissim risus.',
      assetPath: 'assets/videos/video_10.mp4',
    ),
  ];
}
