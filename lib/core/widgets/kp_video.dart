import 'package:appinio_video_player/appinio_video_player.dart';
import 'package:flutter/material.dart';
import 'package:kungpotato/core/widgets/kp_image.dart';

class KpVideoPlayer extends StatefulWidget {
  const KpVideoPlayer({required this.videoUrl, this.thumbnail, super.key});

  final String videoUrl;
  final String? thumbnail;

  @override
  KpVideoPlayerState createState() => KpVideoPlayerState();
}

class KpVideoPlayerState extends State<KpVideoPlayer> {
  late CachedVideoPlayerController _videoPlayerController;
  late CustomVideoPlayerController _customVideoPlayerController;
  late CustomVideoPlayerSettings _customVideoPlayerSettings;

  @override
  void initState() {
    super.initState();

    _customVideoPlayerSettings = CustomVideoPlayerSettings(
      showSeekButtons: true,
      enterFullscreenButton: const Icon(Icons.fullscreen),
      exitFullscreenButton: const Icon(Icons.fullscreen_exit),
      playButton: const Icon(Icons.play_arrow),
      pauseButton: const Icon(Icons.pause),
      settingsButton: const Icon(Icons.settings),
      thumbnailWidget: widget.thumbnail != null
          ? SizedBox(
              width: double.maxFinite,
              child: KpImage.network(widget.thumbnail!),
            )
          : null,
      placeholderWidget: const Icon(Icons.ac_unit),
    );

    _videoPlayerController =
        CachedVideoPlayerController.network(widget.videoUrl)
          ..initialize().then(
            (_) {
              setState(() {});
            },
          );

    _customVideoPlayerController = CustomVideoPlayerController(
      context: context,
      videoPlayerController: _videoPlayerController,
      customVideoPlayerSettings: _customVideoPlayerSettings,
    );
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    _customVideoPlayerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _videoPlayerController.value.isInitialized
        ? CustomVideoPlayer(
            customVideoPlayerController: _customVideoPlayerController,
          )
        : const Center(child: CircularProgressIndicator.adaptive());
  }
}
