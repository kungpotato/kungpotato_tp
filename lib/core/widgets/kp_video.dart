import 'package:flick_video_player/flick_video_player.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:video_player/video_player.dart';

class KpVideoPlayer extends StatefulWidget {
  const KpVideoPlayer({
    required this.videoUrl,
    this.onFinish,
    this.thumbnail,
    this.startAt,
    super.key,
  });

  final String videoUrl;
  final String? thumbnail;
  final Function()? onFinish;
  final Duration? startAt;

  @override
  KpVideoPlayerState createState() => KpVideoPlayerState();
}

class KpVideoPlayerState extends State<KpVideoPlayer> {
  FlickManager? flickManager;
  Duration? _lastPosition;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await _loadLastPosition();
      _initializeVideoPlayer();
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

  void _initializeVideoPlayer() {
    if (mounted) {
      flickManager = FlickManager(
        videoPlayerController: VideoPlayerController.networkUrl(
          Uri.parse(widget.videoUrl),
        ),
        onVideoEnd: widget.onFinish,
      );

      if (_lastPosition != null) {
        flickManager?.flickVideoManager?.videoPlayerController
            ?.seekTo(_lastPosition!);
      } else if (widget.startAt != null) {
        flickManager?.flickVideoManager?.videoPlayerController
            ?.seekTo(widget.startAt!);
      }
    }
  }

  Future<void> _loadLastPosition() async {
    final prefs = await SharedPreferences.getInstance();
    final savedPosition = prefs.getInt('lastPosition_${widget.videoUrl}');
    if (savedPosition != null) {
      setState(() {
        _lastPosition = Duration(milliseconds: savedPosition);
      });
    }
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
    return flickManager != null
        ? FlickVideoPlayer(
            flickManager: flickManager!,
          )
        : const CircularProgressIndicator.adaptive();
  }
}
