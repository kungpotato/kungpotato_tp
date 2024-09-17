import 'package:appinio_video_player/appinio_video_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kungpotato/core/widgets/kp_image.dart';

class KpVideoPlayer extends StatefulWidget {
  const KpVideoPlayer({
    required this.videoUrl,
    this.onFinish,
    this.thumbnail,
    super.key,
  });

  final String videoUrl;
  final String? thumbnail;
  final Function()? onFinish;

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
    _initializeVideoPlayer();
  }

  @override
  void dispose() {
    _videoPlayerController.removeListener(_videoPlayerListener);
    _videoPlayerController.dispose();
    _customVideoPlayerController.dispose();
    super.dispose();
  }

  void _initializeVideoPlayer() {
    _customVideoPlayerSettings = CustomVideoPlayerSettings(
      showSeekButtons: true,
      exitFullscreenOnEnd: true,
      deviceOrientationsAfterFullscreen: [
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
      ],
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

    if (mounted) {
      _videoPlayerController =
          CachedVideoPlayerController.network(widget.videoUrl);

      _videoPlayerController.initialize().then(
        (_) {
          if (mounted) {
            setState(() {});
          }
        },
      );

      _videoPlayerController.addListener(_videoPlayerListener);

      _customVideoPlayerController = CustomVideoPlayerController(
        context: context,
        videoPlayerController: _videoPlayerController,
        customVideoPlayerSettings: _customVideoPlayerSettings,
      );
    }
  }

  void _videoPlayerListener() {
    if (_videoPlayerController.value.position ==
        _videoPlayerController.value.duration) {
      if (widget.onFinish != null) {
        widget.onFinish!.call();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return (_videoPlayerController.value.isInitialized)
        ? CustomVideoPlayer(
            customVideoPlayerController: _customVideoPlayerController,
          )
        : const Center(child: CircularProgressIndicator.adaptive());
  }
}
