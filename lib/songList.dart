import 'package:flutter/material.dart';

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
            margin: EdgeInsets.all(0.0),
            child: Column(
              children: <Widget>[
                Slider(
                  activeColor: Colors.white,
                  inactiveColor: Color.fromRGBO(224, 224, 224, 0.7),
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
