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

class _VideoPageState extends State<VideoPage> {
  late VideoPlayerController _controller;
  bool isFullscreen = false;
  bool isFitScreen = false;
  
  @override
  void initState() {
    super.initState();
    
    _controller = VideoPlayerController.network(
        'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4')
      ..initialize().then((_) {
        //影片載入後顯示第一針
        setState(() {});
      });
  }
  
  @override
  dispose(){
    isFullscreen = false;
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MediaQuery.of(context).orientation == Orientation.landscape ? Colors.black : Colors.white,
      appBar:  MediaQuery.of(context).orientation == Orientation.landscape ? null : GradientAppBar(
        gradientColors: const [Color.fromARGB(255, 106, 131, 176),Color.fromRGBO(199, 136, 157, 1)],
        text: widget.title,
      ),
      body: Center(
        child: Stack(
          children: [
            //影片
            Container(
              width:isFitScreen ? MediaQuery.of(context).size.width : null,
              child: _controller.value.isInitialized
                ? AspectRatio(
                    aspectRatio: _controller.value.aspectRatio,
                    child: VideoPlayer(_controller),
                  )
                : Container(),
            ),
            //控制列
            Positioned(
              child: _controller.value.isInitialized ? SizedBox(
                height: 50,
                width: MediaQuery.of(context).size.width,
                child:Container(
                  color: Colors.transparent,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      IconButton(
                        icon: Icon(_controller.value.isPlaying ? Icons.pause : Icons.play_arrow,),
                        onPressed: () {
                          setState(() {
                            _controller.value.isPlaying
                                ? _controller.pause()
                                : _controller.play();
                          });
                        },
                      ),
                      (MediaQuery.of(context).orientation == Orientation.landscape ? 
                      IconButton(
                        icon: Icon(Icons.fit_screen),
                        onPressed: () {
                          setState(() {
                            isFitScreen = !isFitScreen;
                          });
                        },
                      ) : Container()),
                      IconButton(
                        icon: Icon(Icons.fullscreen),
                        onPressed: () {
                          if (isFullscreen){
                            SystemChrome.setPreferredOrientations([
                              DeviceOrientation.portraitDown,
                              DeviceOrientation.portraitUp,
                            ]);
                          } else {
                            SystemChrome.setPreferredOrientations([
                              DeviceOrientation.landscapeRight,
                              DeviceOrientation.landscapeLeft,
                            ]);
                          }
                          setState(() {
                            isFullscreen = !isFullscreen;
                          });
                        },
                      ),
                    ],
                  ),
                )
              ) : Container(),
              bottom: 0,
            )
          ],
        ),
      )
    );
  }
}