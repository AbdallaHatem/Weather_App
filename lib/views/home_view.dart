import 'package:flutter/material.dart';
import 'package:weather_app/views/search_view.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            'assets/images/pexels-maxavans-5065550.jpg',
            fit: BoxFit.cover,
          ),
          Container(
            color: Colors.black.withOpacity(0.5), 
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'check the weather  before heading  ',
                  style: TextStyle(fontSize: 22, color: Colors.white),
                ),
                const Text(
                  '  out to ensure your safety☺️☺️❤️      ',
                  style: TextStyle(fontSize: 22, color: Colors.white),
                ),
               // out to ensure your safety☺️☺️❤️
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => SearchView(),
                      ),
                    );
                  },
                  child: const Text('Search'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
