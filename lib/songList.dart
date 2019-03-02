import 'package:flutter/material.dart';

import './songPage.dart';

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
                  'https://source.unsplash.com/random/50x50/?music',
                  height: 50,
                  width: 50,
                ),
                isThreeLine: false,
                dense: true,
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
                dense: true,
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
                dense: true,
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
                dense: true,
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
                dense: true,
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
                dense: true,
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
                dense: true,
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
                dense: true,
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
                dense: true,
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
                dense: true,
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
                dense: true,
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
                dense: true,
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
                dense: true,
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
                dense: true,
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
                dense: true,
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 8.0, vertical: 0.0),
              ),
            ],
          ),
        ),
        GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) => SongPage()));
          },
          child: Container(
            decoration:
                BoxDecoration(color: Colors.red[400], boxShadow: <BoxShadow>[
              BoxShadow(
                offset: Offset.zero,
                blurRadius: 2,
              ),
            ]),
            margin: EdgeInsets.all(0.0),
            child: Container(
              margin: EdgeInsets.all(0.0),
              padding: EdgeInsets.all(0.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Hero(
                    tag: 'song',
                    child: Image.network(
                      'https://source.unsplash.com/random/50x50/?music',
                      height: 60,
                      width: 60,
                    ),
                  ),
                  SizedBox(
                    width: 8.0,
                  ),
                  Text(
                    'Call It What You Want',
                    style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.w400,
                        color: Colors.white),
                  ),
                  SizedBox(
                    width: 8.0,
                  ),
                  Row(
                    children: <Widget>[
                      IconButton(
                        icon: Icon(
                          Icons.play_arrow,
                          size: 40.0,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          print('play button pressed');
                        },
                      ),
                      IconButton(
                        icon: Icon(
                          Icons.skip_next,
                          size: 40.0,
                          color: Colors.white,
                        ),
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
            ),
          ),
        ),
      ],
    );
  }
}
