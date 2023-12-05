import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Threads App Clone',
      theme: ThemeData(
        primaryColor: Colors.black,
        textTheme: const TextTheme(
          bodyLarge: TextStyle(color: Colors.black),
          bodyMedium: TextStyle(color: Colors.black),
        ),
        appBarTheme: const AppBarTheme(
          color: Colors.white,
          iconTheme: IconThemeData(color: Colors.black),
          elevation: 0,
        ),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          selectedItemColor: Colors.black,
          unselectedItemColor: Colors.grey, // 선택되지 않은 아이템의 색상을 설정합니다.
        ),
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Image.asset(
            'assets/threads.png',
            height: 112, // 로고의 크기를 설정합니다.
          ),
        ),
        centerTitle: true, // 로고 이미지를 중앙에 배치합니다.
        elevation: 0,
      ),
      backgroundColor: Colors.white,
      body: Column(
        children: [
          const SizedBox(height: 8), // AppBar와 본문 사이에 공간을 추가합니다.
          Expanded(
            child: ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) {
                return PostItem(index: index);
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        type: BottomNavigationBarType.fixed, // 애니메이션을 제거합니다.
        iconSize: 32,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_box), // 포스트 추가 버튼
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: '',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedFontSize: 0,
        unselectedFontSize: 0,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
      ),
    );
  }
}

class PostItem extends StatelessWidget {
  final int index;

  const PostItem({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0, // Card의 그림자를 제거합니다.
      color: Colors.white, // Card의 배경색을 흰색으로 설정합니다.
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            const Row(
              children: <Widget>[
                CircleAvatar(
                  backgroundImage:
                      AssetImage('assets/bee.png'), // 프로필 이미지 경로를 설정하세요.
                ),
                SizedBox(width: 8.0),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'bee',
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 4.0),
                    Text(
                        'Lorem ipsum dolor sit amet, consectetur \nadipiscing elit. Vestibulum tempus lectur\nvitae imperdiet viverra.'),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 20.0),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: <Widget>[
                  Image.asset(
                    'assets/linux.png',
                    width: 200.0,
                    height: 200.0,
                  ),
                  const SizedBox(width: 8.0),
                  Image.asset(
                    'assets/terminal.png',
                    width: 200.0,
                    height: 200.0,
                  ),
                  // 추가 이미지를 계속 추가할 수 있습니다.
                ],
              ),
            ),
            const SizedBox(height: 4.0),
          ],
        ),
      ),
    );
  }
}
