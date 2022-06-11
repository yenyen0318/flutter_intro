import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:video_player/video_player.dart';
import '../widgets/custom_gradient_item.dart';

class VideoPage extends StatefulWidget {
  const VideoPage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<VideoPage> createState() => _VideoPageState();
}

class _VideoPageState extends State<VideoPage>
    with SingleTickerProviderStateMixin {
  late Future<void> _initializeVideoPlayerFuture;
  late VideoPlayerController _videoPlayerController;
  late AnimationController _fadeInFadeOutAnimationController;
  late Animation<double> _fadeInFadeOutAnimation;
  bool _isFullscreen = false;
  bool _isFitScreen = false;
  bool _isMuted = false;
  double _speed = 1.0;

  @override
  void initState() {
    super.initState();
    _fadeInFadeOutAnimationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 500));
    _fadeInFadeOutAnimation = Tween<double>(begin: 0.0, end: 1)
        .animate(_fadeInFadeOutAnimationController);

    _videoPlayerController = VideoPlayerController.network(
        'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4');

    _initializeVideoPlayerFuture = _videoPlayerController.initialize();
    _videoPlayerController.setLooping(true);
  }

  @override
  dispose() {
    _isFullscreen = false;
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    _videoPlayerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          MediaQuery.of(context).orientation == Orientation.landscape
              ? Colors.black
              : Colors.white,
      appBar: MediaQuery.of(context).orientation == Orientation.landscape
          ? null
          : GradientAppBar(
              gradientColors: const [
                Color.fromARGB(255, 106, 131, 176),
                Color.fromRGBO(199, 136, 157, 1)
              ],
              text: widget.title,
            ),
      body: FutureBuilder(
        future: _initializeVideoPlayerFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return Center(
              child: Stack(
                children: [
                  //影片
                  GestureDetector(
                    onTap: () {
                      switch (_fadeInFadeOutAnimationController.status) {
                        case AnimationStatus.completed:
                          _fadeInFadeOutAnimationController.reverse();
                          break;
                        case AnimationStatus.dismissed:
                          _fadeInFadeOutAnimationController.forward();
                          break;
                        default:
                      }
                    },
                    child: Container(
                        width: _isFitScreen
                            ? MediaQuery.of(context).size.width
                            : null,
                        child: AspectRatio(
                          aspectRatio: _videoPlayerController.value.aspectRatio,
                          child: VideoPlayer(_videoPlayerController),
                        )),
                  ),
                  //上方控制列
                  Positioned(
                    top: 0,
                    right: 10,
                    child: FadeTransition(
                        opacity: _fadeInFadeOutAnimation,
                        child: SizedBox(
                          height: 50,
                          //播放速度
                          child: DropdownButtonHideUnderline(
                            child: ButtonTheme(
                              alignedDropdown: true,
                              child: DropdownButton(
                                style: const TextStyle(color: Colors.black),
                                value: _speed,
                                items: <double>[0.25, 0.5, 1.0, 2.0, 5.0]
                                    .map((value) => DropdownMenuItem(
                                          child: SizedBox(
                                            child: Text(value.toString(),
                                                textAlign: TextAlign.center),
                                          ),
                                          value: value,
                                        ))
                                    .toList(),
                                onChanged: (double? newValue) {
                                  _speed = newValue!;
                                  _videoPlayerController
                                      .setPlaybackSpeed(_speed);
                                  setState(() {});
                                },
                              ),
                            ),
                          ),
                        )),
                  ),
                  //下方控制列
                  Positioned(
                    bottom: 0,
                    child: FadeTransition(
                      opacity: _fadeInFadeOutAnimation,
                      child: SizedBox(
                          height: 50,
                          width: MediaQuery.of(context).size.width,
                          child: Container(
                            color: Colors.transparent,
                            child: Row(
                             crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: <Widget>[
                                //暫停/播放
                                IconButton(
                                  icon: Icon(
                                    _videoPlayerController.value.isPlaying
                                        ? Icons.pause
                                        : Icons.play_arrow,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      _videoPlayerController.value.isPlaying
                                          ? _videoPlayerController.pause()
                                          : _videoPlayerController.play();
                                    });
                                  },
                                ),
                                //重複播放
                                IconButton(
                                  icon: _videoPlayerController.value.isLooping
                                      ? Icon(Icons.repeat)
                                      : Icon(Icons.lock),
                                  onPressed: () {
                                    setState(() {
                                      _videoPlayerController.setLooping(
                                          !_videoPlayerController
                                              .value.isLooping);
                                    });
                                  },
                                ),
                                //時間軸
                                ValueListenableBuilder(
                                  valueListenable: _videoPlayerController,
                                  builder:
                                      (context, VideoPlayerValue value, child) {
                                    return Align(
                                      alignment: Alignment.center,
                                      child: AbsorbPointer(
                                          child: SliderTheme(
                                              child: Slider(
                                                activeColor: Colors.black54,
                                                inactiveColor: Colors.black26,
                                                min: 0.0,
                                                max: _videoPlayerController
                                                    .value
                                                    .duration
                                                    .inMilliseconds
                                                    .toDouble(),
                                                value: value
                                                    .position.inMilliseconds
                                                    .toDouble(),
                                                onChanged: (value) {},
                                              ),
                                              data: SliderTheme.of(context)
                                                  .copyWith(
                                                thumbShape: SliderComponentShape
                                                    .noOverlay,
                                              ))),
                                    );
                                  },
                                ),
                                //靜音
                                IconButton(
                                  icon: _isMuted
                                      ? Icon(Icons.volume_off)
                                      : Icon(Icons.volume_up),
                                  onPressed: () {
                                    _isMuted = !_isMuted;
                                    if (_isMuted) {
                                      _videoPlayerController.setVolume(0.0);
                                    } else {
                                      _videoPlayerController.setVolume(1.0);
                                    }

                                    setState(() {});
                                  },
                                ),
                                //影片大小
                                (MediaQuery.of(context).orientation ==
                                        Orientation.landscape
                                    ? IconButton(
                                        icon: Icon(Icons.fit_screen),
                                        onPressed: () {
                                          setState(() {
                                            _isFitScreen = !_isFitScreen;
                                          });
                                        },
                                      )
                                    : Container()),
                                //全螢幕
                                IconButton(
                                  icon: Icon(Icons.fullscreen),
                                  onPressed: () {
                                    _isFullscreen = !_isFullscreen;
                                    if (_isFullscreen) {
                                      SystemChrome.setPreferredOrientations([
                                        DeviceOrientation.landscapeRight,
                                        DeviceOrientation.landscapeLeft,
                                      ]);
                                    } else {
                                      SystemChrome.setPreferredOrientations([
                                        DeviceOrientation.portraitDown,
                                        DeviceOrientation.portraitUp,
                                      ]);
                                    }
                                    setState(() {});
                                  },
                                ),
                              ],
                            ),
                          )),
                    ),
                  ),
                ],
              ),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
