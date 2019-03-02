import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import './songList.dart';
import './lyricstab.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeState();
  }
}

class _HomeState extends State<Home> {
  void _launchURL(url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.deepOrange,
                ),
                child: Column(
                  children: <Widget>[
                    Icon(
                      Icons.music_video,
                      size: 56,
                      color: Colors.yellow[700],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'So Lyrical',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 28,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'v1.0.0',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                        'An app that shows the lyrics of the songs you play from your internal storage.'),
                    SizedBox(
                      height: 12.0,
                    ),
                    Text(
                      'Developed by Vikash Kr. Gaurav',
                      textAlign: TextAlign.start,
                    ),
                  ],
                ),
              ),
              Divider(),
              ListTile(
                leading: Icon(Icons.code, color: Colors.grey),
                title: Text('Source code on GitHub'),
                onTap: () =>
                    this._launchURL('https://github.com/vikash423q/solyrical/'),
              ),
              ListTile(
                leading: Icon(Icons.open_in_new, color: Colors.grey),
                title: Text('Visit my Website'),
                onTap: () => this._launchURL('http://vikashgaurav.com/'),
              ),
            ],
          ),
        ),
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
          bottom: TabBar(
            tabs: [
              Tab(
                icon: Icon(Icons.library_music),
                text: 'Music',
              ),
              Tab(icon: Icon(Icons.music_note), text: 'Lyrics'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            SongListTab(),
            LyricsTab(),
          ],
        ),
      ),
    );
  }
}
