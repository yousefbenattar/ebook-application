class Books {
  String rating;
  String title;
  String text;
  String img;
  String audio;

  Books(
      {required this.rating,
      required this.title,
      required this.text,
      required this.img,
      required this.audio});
}

List<Books> bookslist = [
  Books(
      rating: '4.5',
      title: 'THE WATER CURE',
      text: 'Martin Hyatt',
      img: 'assets/pic-1.png',
      audio: 'music-1.mp3'),
        Books(
      rating: '4.3',
      title: 'PEACE LIFE',
      text: 'Hazard Bin',
      img: 'assets/pic-2.png',
      audio: 'music-2.mp3'),
  Books(
      rating: '4.2',
      title: 'Day Remember',
      text: 'Nicholos',
      img: 'assets/pic-3.png',
      audio: 'music-3.mp3'),
  Books(
      rating: '4.1',
      title: 'TIME RETURN',
      text: 'alex jhones',
      img: 'assets/pic-4.png',
      audio: 'music-4.mp3'),
  Books(
      rating: '4.5',
      title: 'ONE AGAIN',
      text: 'adam better',
      img: 'assets/pic-5.png',
      audio: 'music-5.mp3'),
];

class PopularBooks {
  String rating;
  String title;
  String text;
  String img;
  String audio;
  PopularBooks(
      {required this.rating,
      required this.title,
      required this.text,
      required this.img,
      required this.audio});
}

List<Books> popularbookslist = [
  Books(
      rating: '4.5',
      title: 'THE WATER CURE',
      text: 'Martin Hyatt',
      img: 'assets/pic-6.png',
      audio: 'music-1.mp3'),
  Books(
      rating: '4.5',
      title: 'THE WATER CURE',
      text: 'Martin Hyatt',
      img: 'assets/pic-7.png',
      audio: 'music-2.mp3'),
  Books(
      rating: '4.5',
      title: 'THE WATER CURE',
      text: 'Martin Hyatt',
      img: 'assets/pic-8.png',
      audio: '/music-3.mp3'),
  Books(
      rating: '4.5',
      title: 'THE WATER CURE',
      text: 'Martin Hyatt',
      img: 'assets/pic-9.png',
      audio: 'music-4.mp3'),
  Books(
      rating: '4.5',
      title: 'THE WATER CURE',
      text: 'Martin Hyatt',
      img: 'assets/pic-10.png',
      audio: 'music-5.mp3'),
];
