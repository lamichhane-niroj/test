// import 'package:appinio_video_player/appinio_video_player.dart';
// import 'package:flutter/material.dart';

// class HomePage extends StatefulWidget {
//   const HomePage({super.key});

//   @override
//   State<HomePage> createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   late CustomVideoPlayerController _customVideoPlayerController;

//   String assetVideoPath = "assets/videos/video.mp4";

//   @override
//   void initState() {
//     initializeVideoPlayer();
//     super.initState();
//   }

//   void initializeVideoPlayer() {
//     var _videoPlayerController = CachedVideoPlayerController.asset(assetVideoPath)..initialize().then((value){
//       setState(() {});
//     });
//     _customVideoPlayerController = CustomVideoPlayerController(context: context, videoPlayerController: _videoPlayerController);

//   }
  
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         body: CustomVideoPlayer(customVideoPlayerController: _customVideoPlayerController),
//       ),
//     );
//   }
// }