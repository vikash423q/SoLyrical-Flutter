import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      title: 'So Lyrical',
      home: Home(),
      theme: ThemeData(primaryColor: Colors.red[400]),
    ));

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeState();
  }
}

class _HomeState extends State<Home> {
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
        // bottom: TabBar(
        //   tabs: <Widget>[
        //     SongListTab(),
        //     LyricsTab(),
        //   ],
        //   controller: TabController(
        //     initialIndex: 0,
        //     length: 2,
        //     vsync: this,
        //   ),
        // ),
      ),
      body: SongListTab(),
    );
  }
}

class LyricsTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: Text('Lyrics Page'),
      ),
    );
  }
}

class SongListTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
          child: ListView(
            children: <Widget>[
              ListTile(
                leading: Image.network(
                  'https://source.unsplash.com/50x50/random/?music',
                  height: 50,
                  width: 50,
                ),
                isThreeLine: false,
                title: Text('Red'),
                subtitle: Text('Taylor Swift'),
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 8.0, vertical: 0.0),
              ),
              Divider(
                height: 0.0,
              ),
              ListTile(
                leading: Image.network(
                  'https://source.unsplash.com/50x50/random/?music',
                  height: 50,
                  width: 50,
                ),
                isThreeLine: false,
                title: Text('Call It What You Want'),
                subtitle: Text('Taylor Swift'),
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 8.0, vertical: 0.0),
              ),
              Divider(
                height: 0.0,
              ),
              ListTile(
                leading: Image.network(
                  'https://source.unsplash.com/50x50/random/?music',
                  height: 50,
                  width: 50,
                ),
                isThreeLine: false,
                title: Text('Red'),
                subtitle: Text('Taylor Swift'),
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 8.0, vertical: 0.0),
              ),
              Divider(
                height: 0.0,
              ),
              ListTile(
                leading: Image.network(
                  'https://source.unsplash.com/50x50/random/?music',
                  height: 50,
                  width: 50,
                ),
                isThreeLine: false,
                title: Text('New Year\'s Day'),
                subtitle: Text('Taylor Swift'),
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 8.0, vertical: 0.0),
              ),
              Divider(
                height: 0.0,
              ),
              ListTile(
                leading: Image.network(
                  'https://source.unsplash.com/50x50/random/?music',
                  height: 50,
                  width: 50,
                ),
                title: Text('All Too Well'),
                subtitle: Text('Taylor Swift'),
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 8.0, vertical: 0.0),
              ),
              Divider(
                height: 0.0,
              ),
              ListTile(
                leading: Image.network(
                  'https://source.unsplash.com/50x50/random/?music',
                  height: 50,
                  width: 50,
                ),
                title: Text('Red'),
                subtitle: Text('Taylor Swift'),
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 8.0, vertical: 0.0),
              ),
              Divider(
                height: 0.0,
              ),
              ListTile(
                leading: Image.network(
                  'https://source.unsplash.com/50x50/random/?music',
                  height: 50,
                  width: 50,
                ),
                title: Text('Call It What You Want'),
                subtitle: Text('Taylor Swift'),
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 8.0, vertical: 0.0),
              ),
              Divider(
                height: 0.0,
              ),
              ListTile(
                leading: Image.network(
                  'https://source.unsplash.com/50x50/random/?music',
                  height: 50,
                  width: 50,
                ),
                title: Text('Red'),
                subtitle: Text('Taylor Swift'),
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 8.0, vertical: 0.0),
              ),
              Divider(
                height: 0.0,
              ),
              ListTile(
                leading: Image.network(
                  'https://source.unsplash.com/50x50/random/?music',
                  height: 50,
                  width: 50,
                ),
                title: Text('New Year\'s Day'),
                subtitle: Text('Taylor Swift'),
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 8.0, vertical: 0.0),
              ),
              Divider(
                height: 0.0,
              ),
              ListTile(
                leading: Image.network(
                  'https://source.unsplash.com/50x50/random/?music',
                  height: 50,
                  width: 50,
                ),
                title: Text('All Too Well'),
                subtitle: Text('Taylor Swift'),
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 8.0, vertical: 0.0),
              ),
              Divider(
                height: 0.0,
              ),
              ListTile(
                leading: Image.network(
                  'https://source.unsplash.com/50x50/random/?music',
                  height: 50,
                  width: 50,
                ),
                title: Text('Red'),
                subtitle: Text('Taylor Swift'),
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 8.0, vertical: 0.0),
              ),
              Divider(
                height: 0.0,
              ),
              ListTile(
                leading: Image.network(
                  'https://source.unsplash.com/50x50/random/?music',
                  height: 50,
                  width: 50,
                ),
                title: Text('Call It What You Want'),
                subtitle: Text('Taylor Swift'),
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 8.0, vertical: 0.0),
              ),
              Divider(
                height: 0.0,
              ),
              ListTile(
                leading: Image.network(
                  'https://source.unsplash.com/50x50/random/?music',
                  height: 50,
                  width: 50,
                ),
                title: Text('Red'),
                subtitle: Text('Taylor Swift'),
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 8.0, vertical: 0.0),
              ),
              Divider(
                height: 0.0,
              ),
              ListTile(
                leading: Image.network(
                  'https://source.unsplash.com/50x50/random/?music',
                  height: 50,
                  width: 50,
                ),
                title: Text('New Year\'s Day'),
                subtitle: Text('Taylor Swift'),
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 8.0, vertical: 0.0),
              ),
              Divider(
                height: 0.0,
              ),
              ListTile(
                leading: Image.network(
                  'https://source.unsplash.com/50x50/random/?music',
                  height: 50,
                  width: 50,
                ),
                title: Text('All Too Well'),
                subtitle: Text('Taylor Swift'),
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 8.0, vertical: 0.0),
              ),
            ],
          ),
        ),
        Container(
          decoration:
              BoxDecoration(color: Colors.red[400], boxShadow: <BoxShadow>[
            BoxShadow(
              offset: Offset.zero,
              blurRadius: 2,
            ),
          ]),
          margin: EdgeInsets.all(0.0),
          child: Container(
            child: Column(
              children: <Widget>[
                Slider(
                  activeColor: Colors.white,
                  inactiveColor: Colors.grey,
                  value: 20.0,
                  onChanged: (val) {
                    print('slider value changed ${val}');
                  },
                  min: 0.0,
                  max: 100.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    SizedBox(
                      width: 8.0,
                    ),
                    Image.network(
                      'https://source.unsplash.com/50x50/random/?music',
                      height: 60,
                      width: 60,
                    ),
                    SizedBox(
                      width: 8.0,
                    ),
                    Text(
                      'Call It What You Want',
                      style: TextStyle(
                          fontSize: 18.0, fontWeight: FontWeight.w300),
                    ),
                    SizedBox(
                      width: 8.0,
                    ),
                    Row(
                      children: <Widget>[
                        IconButton(
                          icon: Icon(Icons.play_arrow, size: 40.0),
                          onPressed: () {
                            print('play button pressed');
                          },
                        ),
                        IconButton(
                          icon: Icon(Icons.skip_next, size: 40.0),
                          onPressed: () {
                            print('next button pressed');
                          },
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 8.0,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
