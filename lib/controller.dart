import 'package:flutter/material.dart';

import './songPage.dart';

class Controller extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (BuildContext context) => SongPage()));
      },
      child: Container(
        decoration:
            BoxDecoration(color: Colors.deepOrange[400], boxShadow: <BoxShadow>[
          BoxShadow(
            offset: Offset.zero,
            color: Colors.grey[600],
            blurRadius: 3,
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
    );
  }
}
