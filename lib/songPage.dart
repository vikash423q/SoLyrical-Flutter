import 'package:flutter/material.dart';

class SongPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('So Lyrical'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              print('search button pressed');
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(boxShadow: [
                BoxShadow(color: Colors.grey[500], blurRadius: 16.0),
              ]),
              margin: EdgeInsets.symmetric(vertical: 40.0, horizontal: 24.0),
              padding: EdgeInsets.all(0.0),
              child: Hero(
                tag: 'song',
                child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(4.0)),
                  child: Image.network(
                    'https://source.unsplash.com/random/280x280/?music',
                    height: 280.0,
                    width: 280.0,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Slider(
              inactiveColor: Colors.grey[400],
              activeColor: Colors.grey[600],
              min: 0,
              max: 100,
              value: 30,
              onChanged: (val) {
                print('Slider moved to ${val}');
              },
            ),
            SizedBox(
              height: 20.0,
            ),
            Text(
              'Call It What You Want',
              style: TextStyle(
                color: Colors.deepOrange,
                fontSize: 24,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Text(
              'Reputation',
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                IconButton(
                  icon: Icon(
                    Icons.fast_rewind,
                    size: 40.0,
                  ),
                  onPressed: () {
                    print('prev pressed');
                  },
                ),
                SizedBox(
                  width: 10.0,
                ),
                IconButton(
                  icon: Icon(
                    Icons.play_arrow,
                    size: 40.0,
                  ),
                  onPressed: () {
                    print('play pressed');
                  },
                ),
                SizedBox(
                  width: 10.0,
                ),
                IconButton(
                  icon: Icon(
                    Icons.fast_forward,
                    size: 40.0,
                  ),
                  onPressed: () {
                    print('next pressed');
                  },
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
