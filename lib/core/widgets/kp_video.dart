import 'package:flick_video_player/flick_video_player.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class KpVideoPlayer extends StatefulWidget {
  const KpVideoPlayer({required this.videoUrl, super.key});

  final String videoUrl;

  @override
  KpVideoPlayerState createState() => KpVideoPlayerState();
}

class KpVideoPlayerState extends State<KpVideoPlayer> {
  late FlickManager _flickManager;

  @override
  void initState() {
    super.initState();
    _flickManager = FlickManager(
      videoPlayerController:
          VideoPlayerController.networkUrl(Uri.parse(widget.videoUrl)),
    );
  }

  @override
  void dispose() {
    _flickManager.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 16 / 9,
      child: FlickVideoPlayer(
        flickManager: _flickManager,
        flickVideoWithControls: FlickVideoWithControls(
          controls: CustomFlickControls(manager: _flickManager),
        ),
        flickVideoWithControlsFullscreen: FlickVideoWithControls(
          controls: CustomFlickControls(manager: _flickManager),
        ),
      ),
    );
  }
}

class CustomFlickControls extends StatefulWidget {
  const CustomFlickControls({required this.manager, super.key});

  final FlickManager manager;

  @override
  State<CustomFlickControls> createState() => _CustomFlickControlsState();
}

class _CustomFlickControlsState extends State<CustomFlickControls> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              icon: const Icon(Icons.replay_10),
              onPressed: () {
                widget.manager.flickControlManager!
                    .seekBackward(const Duration(seconds: 10));
              },
            ),
            IconButton(
              icon: widget.manager.flickVideoManager!.isPlaying
                  ? const Icon(Icons.pause)
                  : const Icon(Icons.play_arrow),
              onPressed: () {
                widget.manager.flickVideoManager!.isPlaying
                    ? widget.manager.flickControlManager!.pause()
                    : widget.manager.flickControlManager!.play();
                setState(() {});
              },
            ),
            IconButton(
              icon: const Icon(Icons.forward_10),
              onPressed: () {
                widget.manager.flickControlManager!
                    .seekForward(const Duration(seconds: 10));
              },
            ),
            IconButton(
              icon: const Icon(Icons.replay),
              onPressed: () {
                widget.manager.flickControlManager!.seekTo(Duration.zero);
                widget.manager.flickControlManager!.play();
              },
            ),
            IconButton(
              icon: const Icon(Icons.fullscreen),
              onPressed: widget.manager.flickControlManager!.toggleFullscreen,
            ),
          ],
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}
