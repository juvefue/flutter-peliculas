import 'package:flutter/material.dart';
import 'package:peliculas/src/widgets/card_swiper_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Peliculas en cines'),
        backgroundColor: Colors.indigoAccent,
        actions: <Widget>[
          IconButton(icon: Icon(Icons.search), onPressed: null)
        ],
      ),
      body: Container(
        child: Column(
          children: <Widget>[_swipperTarjetas()],
        ),
      ),
    );
  }

  Widget _swipperTarjetas() {
    return CardSwiper(
      peliculas: [1, 2, 3, 4, 5],
    );
    //return Container();
  }
}
