import 'package:flutter/material.dart';
import 'package:to_do/view/widgets/pop_up_container.dart';
import 'package:to_do/view/widgets/small_container.dart';

class ChooseCategory extends StatelessWidget {
  const ChooseCategory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PopUpContainer(
        height: 450.0,
        title: 'Choose Category',
        body: SizedBox(
          height: 250,
          child: GridView.count(
            padding: const EdgeInsets.only(left: 10.0, right: 10.0),
            crossAxisCount: 4,
            crossAxisSpacing: 20.0,
            mainAxisSpacing: 20.0,
            children: chooseCategories,
          ),
        ),
        showDivider: true,
        setTodefault: false);
  }
}

List<Widget> chooseCategories = <Widget>[
  Column(
    children: [
      SmallContainer(
        body: Image.asset('assets/Images/grocery.png'),
      ),
      const Text(
        'Grocery',
        style: TextStyle(color: Colors.white),
      ),
    ],
  ),
  Column(
    children: [
      SmallContainer(
        body: Image.asset('assets/Images/work.png'),
      ),
      const Text('Work', style: TextStyle(color: Colors.white)),
    ],
  ),
  Column(
    children: [
      SmallContainer(
        body: Image.asset('assets/Images/sport.png'),
      ),
      const Text('Sport', style: TextStyle(color: Colors.white)),
    ],
  ),
  Column(
    children: [
      SmallContainer(
        body: Image.asset('assets/Images/design.png'),
      ),
      const Text('Design', style: TextStyle(color: Colors.white)),
    ],
  ),
  Column(
    children: [
      SmallContainer(
        body: Image.asset('assets/Images/education.png'),
      ),
      const Text('Education', style: TextStyle(color: Colors.white)),
    ],
  ),
  Column(
    children: [
      SmallContainer(
        body: Image.asset('assets/Images/social.png'),
      ),
      const Text('Social', style: const TextStyle(color: Colors.white)),
    ],
  ),
  Column(
    children: [
      SmallContainer(
        body: Image.asset('assets/Images/music.png'),
      ),
      const Text('Music', style: const TextStyle(color: Colors.white)),
    ],
  ),
  Column(
    children: [
      SmallContainer(
        body: Image.asset('assets/Images/health.png'),
      ),
      const Text('Health', style: TextStyle(color: Colors.white)),
    ],
  ),
  Column(
    children: [
      SmallContainer(
        body: Image.asset('assets/Images/movie.png'),
      ),
      const Text('Movie', style: TextStyle(color: Colors.white)),
    ],
  ),
  Column(
    children: [
      SmallContainer(
        body: Image.asset('assets/Images/home.png'),
      ),
      const Text('Home', style: const TextStyle(color: Colors.white)),
    ],
  ),
];
