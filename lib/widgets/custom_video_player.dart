import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:visibility_detector/visibility_detector.dart';

import '../models/models.dart';
import '../screens/screens.dart';

class CustomVideoPlayer extends StatefulWidget {
  const CustomVideoPlayer({
    Key? key,
    required this.post,
  }) : super(key: key);

  final Post post;

  @override
  State<CustomVideoPlayer> createState() => _CustomVideoPlayerState();
}

class _CustomVideoPlayerState extends State<CustomVideoPlayer> {
  late VideoPlayerController controller;

  @override
  void initState() {
    controller = VideoPlayerController.asset(widget.post.assetPath);
    controller.initialize().then((_) {
      setState(() {});
    });

    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
      key: Key(controller.dataSource),
      onVisibilityChanged: (visibilityInfo) {
        if (visibilityInfo.visibleFraction > 0.50) {
          controller.play();
        } else {
          if (mounted) {
            controller.pause();
          }
        }
      },
      child: controller.value.isInitialized
          ? GestureDetector(
              onTap: () {
                setState(() {
                  if (controller.value.isPlaying) {
                    controller.pause();
                  } else {
                    controller.play();
                  }
                });
              },
              child: AspectRatio(
                aspectRatio: controller.value.aspectRatio,
                child: Stack(
                  children: [
                    VideoPlayer(controller),
                    const Positioned.fill(
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Colors.black,
                              Colors.transparent,
                              Colors.transparent,
                              Colors.black,
                            ],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            stops: [0.0, 0.2, 0.8, 1.0],
                          ),
                        ),
                      ),
                    ),
                    _buildVideoCaption(context),
                    _buildVideoActions(context),
                  ],
                ),
              ),
            )
          : Container(),
    );
  }

  Align _buildVideoActions(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        height: controller.value.size.height,
        width: MediaQuery.of(context).size.width * 0.2,
        padding: const EdgeInsets.only(bottom: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: const [
            _VideoAction(
              icon: Icons.favorite,
              value: '11.4k',
            ),
            SizedBox(height: 10),
            _VideoAction(
              icon: Icons.comment,
              value: '1.4k',
            ),
            SizedBox(height: 10),
            _VideoAction(
              icon: Icons.forward_rounded,
              value: '500',
            ),
            SizedBox(height: 50),
          ],
        ),
      ),
    );
  }

  GestureDetector _buildVideoCaption(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          ProfileScreen.routeName,
          arguments: widget.post.user,
        );
      },
      child: Align(
        alignment: Alignment.bottomLeft,
        child: Container(
          height: 125,
          width: MediaQuery.of(context).size.width * 0.75,
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '@${widget.post.user.username}',
                style: Theme.of(context)
                    .textTheme
                    .titleSmall!
                    .copyWith(color: Colors.white, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 5),
              Text(
                widget.post.caption,
                maxLines: 3,
                style: Theme.of(context)
                    .textTheme
                    .bodySmall!
                    .copyWith(color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _VideoAction extends StatelessWidget {
  const _VideoAction({
    Key? key,
    required this.icon,
    required this.value,
  }) : super(key: key);

  final IconData icon;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Material(
          color: Colors.transparent,
          child: Center(
            child: Ink(
              decoration: const ShapeDecoration(
                color: Colors.black,
                shape: CircleBorder(),
              ),
              child: IconButton(
                icon: Icon(icon),
                color: Colors.white,
                onPressed: () {},
              ),
            ),
          ),
        ),
        const SizedBox(height: 5),
        Text(
          value,
          style: Theme.of(context)
              .textTheme
              .titleSmall!
              .copyWith(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
