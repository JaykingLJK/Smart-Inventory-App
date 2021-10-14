import 'package:flutter/material.dart';
import 'package:myapp/page/listings.dart';

class Homepage extends StatelessWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Smart Home Home Screen'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const Text('Welcome To Smart Home Home Page',
                  style: TextStyle(
                    fontSize: 18.0,
                  )),
              Container(
                padding: EdgeInsets.all(40.0),
                color: Colors.grey[100],
                child: ElevatedButton.icon(
                  onPressed: () {
                    // Add onPressed Effect here

                  },
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(200, 50),
                    maximumSize: const Size(200, 50),
                  ),
                  icon: const Icon(
                    Icons.add_circle,
                    size: 25.0,
                  ),
                  label: const Text(
                    'Check In Items',
                    style: TextStyle(fontSize: 18.0),
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(40.0),
                color: Colors.grey[100],
                child: ElevatedButton.icon(
                  onPressed: () {

                    // Add onPressed Effect here
                  },
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(200, 50),
                    maximumSize: const Size(200, 50),
                  ),
                  icon: const Icon(
                    Icons.add_to_home_screen,
                    size: 25.0,
                  ),
                  label: const Text(
                    'Check Out Items',
                    style: TextStyle(fontSize: 18.0),
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(40.0),
                color: Colors.grey[100],
                child: ElevatedButton.icon(
                  onPressed: () => Navigator.of(context).push(
                      MaterialPageRoute(
                          builder: (context) => ListingsPage()
                      )
                  ),
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(200, 50),
                    maximumSize: const Size(200, 50),
                  ),
                  icon: const Icon(
                    Icons.article_outlined,
                    size: 25.0,
                  ),
                  label: const Text(
                    'Item List',
                    style: TextStyle(fontSize: 18.0),
                  ),
                ),
              ),
            ]),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {

          // Add onPressed Effect here
        },
        child: const Text('Click'),
      ),
    );
  }
}