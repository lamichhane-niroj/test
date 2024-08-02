class Video {
  final String name;
  final String url;
  final String thumbnail;

  const Video({required this.name, required this.url, required this.thumbnail});
}

const videos = [
  Video(
      name: "Course 1",
      url:
          "https://videos.pexels.com/video-files/3761544/3761544-uhd_2560_1440_25fps.mp4",
      thumbnail:
          "https://images.pexels.com/photos/716276/pexels-photo-716276.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1"),
  Video(
      name: "Course 2",
      url:
          "https://videos.pexels.com/video-files/3943334/3943334-uhd_2732_1440_25fps.mp4",
      thumbnail:
          "https://images.pexels.com/photos/716276/pexels-photo-716276.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1"),
  Video(
      name: "Course 3",
      url:
          "https://videos.pexels.com/video-files/856006/856006-hd_1920_1080_25fps.mp4",
      thumbnail:
          "https://images.pexels.com/photos/716276/pexels-photo-716276.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1")
];
