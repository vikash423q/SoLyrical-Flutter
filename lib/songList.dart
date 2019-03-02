import 'package:flutter/material.dart';

import './controller.dart';

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
        Controller(),
      ],
    );
  }
}
