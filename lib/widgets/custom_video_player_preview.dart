import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

import '../models/models.dart';
import 'widgets.dart';

class CustomVideoPlayerPreview extends StatefulWidget {
  const CustomVideoPlayerPreview({
    Key? key,
    required this.post,
  }) : super(key: key);

  final Post post;

  @override
  State<CustomVideoPlayerPreview> createState() =>
      _CustomVideoPlayerPreviewState();
}

class _CustomVideoPlayerPreviewState extends State<CustomVideoPlayerPreview> {
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
    return controller.value.isInitialized
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
            onDoubleTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CustomVideoPlayer(
                    post: widget.post,
                  ),
                ),
              );
            },
            child: AspectRatio(
              aspectRatio: controller.value.aspectRatio,
              child: Stack(
                children: [
                  VideoPlayer(controller),
                  Positioned.fill(
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Colors.transparent,
                            Colors.black.withOpacity(0.5),
                            Colors.black,
                          ],
                          begin: Alignment.center,
                          end: Alignment.bottomCenter,
                          stops: const [0.0, 0.6, 1.0],
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 10.0,
                    left: 10.0,
                    child: Row(
                      children: [
                        const Icon(
                          Icons.play_arrow,
                          color: Colors.white,
                        ),
                        const SizedBox(width: 5),
                        Text(
                          '1.4k',
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall!
                              .copyWith(color: Colors.white),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
        : Container();
  }
}
