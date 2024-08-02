// import 'package:flutter/material.dart';
// import 'package:video_player/video_player.dart';
// import 'package:flutter/services.dart';

// class VideoPlayerWidget extends StatefulWidget {
//   final String url;
//   final bool isFullScreen;

//   const VideoPlayerWidget({
//     Key? key,
//     required this.url,
//     this.isFullScreen = false,
//   }) : super(key: key);

//   @override
//   _VideoPlayerWidgetState createState() => _VideoPlayerWidgetState();
// }

// class _VideoPlayerWidgetState extends State<VideoPlayerWidget> {
//   late VideoPlayerController _controller;
//   late Future<void> _initializeVideoPlayerFuture;
//   bool _isPlaying = false;
//   bool _isMuted = false;

//   @override
//   void initState() {
//     super.initState();
//     _controller = VideoPlayerController.network(widget.url);
//     _initializeVideoPlayerFuture = _controller.initialize().then((_) {
//       setState(() {});
//     });
//     _controller.setLooping(true);
//   }

//   @override
//   void dispose() {
//     _controller.dispose();
//     if (widget.isFullScreen) {
//       SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
//           overlays: SystemUiOverlay.values);
//       SystemChrome.setPreferredOrientations([
//         DeviceOrientation.portraitUp,
//         DeviceOrientation.portraitDown,
//       ]);
//     }
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     if (widget.isFullScreen) {
//       SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
//       SystemChrome.setPreferredOrientations([
//         DeviceOrientation.landscapeRight,
//         DeviceOrientation.landscapeLeft,
//       ]);
//     }

//     return FutureBuilder(
//       future: _initializeVideoPlayerFuture,
//       builder: (context, snapshot) {
//         if (snapshot.connectionState == ConnectionState.done) {
//           return Stack(
//             children: [
//               Center(
//                 child: AspectRatio(
//                   aspectRatio: _controller.value.aspectRatio,
//                   child: VideoPlayer(_controller),
//                 ),
//               ),
//               Positioned(
//                   top: 20,
//                   left: 0,
//                   child: IconButton(
//                     icon: const Icon(Icons.arrow_back),
//                     onPressed: () {
//                       Navigator.pop(context);
//                     },
//                     color: Colors.white,
//                   )),
//               _buildControls(context),
//             ],
//           );
//         } else {
//           return Center(child: CircularProgressIndicator());
//         }
//       },
//     );
//   }

//   Widget _buildControls(BuildContext context) {
//     return Align(
//       alignment: Alignment.bottomCenter,
//       child: Container(
//         color: Colors.black54,
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             VideoProgressIndicator(
//               _controller,
//               allowScrubbing: true,
//               colors: const VideoProgressColors(
//                 playedColor: Color(0XFF7E1FFF),
//               ),
//             ),
//             Row(
//               children: [
//                 IconButton(
//                   icon: Icon(_controller.value.isPlaying
//                       ? Icons.pause
//                       : Icons.play_arrow),
//                   color: Colors.white,
//                   onPressed: () {
//                     setState(() {
//                       _isPlaying = !_isPlaying;
//                       _isPlaying ? _controller.play() : _controller.pause();
//                     });
//                   },
//                 ),
//                 IconButton(
//                   icon: Icon(Icons.replay_10),
//                   color: Colors.white,
//                   onPressed: () {
//                     _controller.seekTo(
//                         _controller.value.position - Duration(seconds: 10));
//                   },
//                 ),
//                 IconButton(
//                   icon: Icon(Icons.forward_10),
//                   color: Colors.white,
//                   onPressed: () {
//                     _controller.seekTo(
//                         _controller.value.position + Duration(seconds: 10));
//                   },
//                 ),
//                 IconButton(
//                   icon: Icon(_isMuted ? Icons.volume_off : Icons.volume_up),
//                   color: Colors.white,
//                   onPressed: () {
//                     setState(() {
//                       _isMuted = !_isMuted;
//                       _isMuted
//                           ? _controller.setVolume(0)
//                           : _controller.setVolume(1);
//                     });
//                   },
//                 ),
//                 Spacer(),
//                 IconButton(
//                   icon: Icon(Icons.settings),
//                   color: Colors.white,
//                   onPressed: () {
//                     // Settings action
//                   },
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class FullScreenVideoPlayer extends StatelessWidget {
//   final String url;

//   const FullScreenVideoPlayer({Key? key, required this.url}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.black,
//       body: Center(
//         child: VideoPlayerWidget(url: url, isFullScreen: true),
//       ),
//     );
//   }
// }
