import 'package:flick_video_player/flick_video_player.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:video_player/video_player.dart';

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
  FlickManager? flickManager;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      final res = await _loadLastPosition();
      _initializeVideoPlayer(res);
    });
  }

  @override
  void dispose() {
    _saveLastPosition();
    flickManager?.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(covariant KpVideoPlayer oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.videoUrl != widget.videoUrl) {
      flickManager?.dispose();
      _initializeVideoPlayer();
    }
  }

  void _initializeVideoPlayer([Duration? val]) {
    if (mounted) {
      final controller = VideoPlayerController.networkUrl(
        Uri.parse(widget.videoUrl),
        videoPlayerOptions: VideoPlayerOptions(allowBackgroundPlayback: true),
      );

      flickManager = FlickManager(
        videoPlayerController: controller,
        onVideoEnd: widget.onFinish,
        autoPlay: false,
      );

      setState(() {});

      Future.delayed(
        const Duration(seconds: 1),
        () {
          if (val != null) {
            controller.seekTo(val);
            flickManager?.flickControlManager?.seekTo(val);
            flickManager?.flickVideoManager?.videoPlayerController?.seekTo(val);
          }
        },
      );
    }
  }

  Future<Duration?> _loadLastPosition() async {
    final prefs = await SharedPreferences.getInstance();
    final savedPosition = prefs.getInt('lastPosition_${widget.videoUrl}');
    return Duration(milliseconds: savedPosition ?? 0);
  }

  Future<void> _saveLastPosition() async {
    if (flickManager?.flickVideoManager?.videoPlayerController != null) {
      final prefs = await SharedPreferences.getInstance();
      final position = flickManager?.flickVideoManager?.videoPlayerController
          ?.value.position.inMilliseconds;
      if (position != null) {
        await prefs.setInt('lastPosition_${widget.videoUrl}', position);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return flickManager != null
        ? FlickVideoPlayer(
            flickManager: flickManager!,
            flickVideoWithControls: FlickVideoWithControls(
              controls: FlickPortraitControls(
                progressBarSettings: FlickProgressBarSettings(
                  playedColor: const Color.fromRGBO(0, 122, 255, 1),
                  bufferedColor: const Color.fromRGBO(100, 100, 100, 0.5),
                  handleColor: const Color.fromRGBO(255, 215, 0, 1),
                  backgroundColor: const Color.fromRGBO(220, 220, 220, 1),
                  padding: const EdgeInsets.symmetric(
                    vertical: 8,
                  ),
                  height: 5,
                  handleRadius: 5,
                  curveRadius: 5,
                ),
              ),
            ),
          )
        : const CircularProgressIndicator.adaptive();
  }
}
