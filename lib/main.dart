import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      home: const FavoriteCardScreen(),
    ));

    class FavoriteCardScreen extends StatelessWidget {
     const FavoriteCardScreen({super.key});

     @override
     Widget build(BuildContext context) {
       return Scaffold(
         backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: const Text("Favorite cards"),
        ),
        body: Column(
          children: [
            FavoriteCard(
              title: 'Sweet love',
              description: 'ohh baby i love you',
              icon: Icons.favorite,
            ),
            const SizedBox(height: 10),
            FavoriteCard(
              title: 'Another love',
              description: 'so much hurt inside',
              icon: Icons.favorite,
            ),
            const SizedBox(height: 10),
            FavoriteCard(
              title: 'Blue sky',
              description: 'look at the beautiful sky',
              icon: Icons.favorite,
            ),
          ],
        ),
       );
     }
  
  }

class FavoriteCard extends StatefulWidget {
  final String title;
  final String description;
  final IconData icon;

  const FavoriteCard({
    super.key,
    required this.title,
    required this.description,
    required this.icon,
  });

  @override
  State<FavoriteCard> createState() => _FavoriteCardState();
}

class _FavoriteCardState extends State<FavoriteCard> {
  bool isFavorited = false;

  void toggleFavorite() {
    setState(() {
      isFavorited = !isFavorited;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(width: 1, color: Colors.grey),
        ),
      ),
      padding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            flex: 7,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.title,
                  style: const TextStyle(
                      color: Colors.blue, fontWeight: FontWeight.w800),
                ),
                const SizedBox(height: 10.0),
                Text(widget.description)
              ],
            ),
          ),
          IconButton(
            onPressed: toggleFavorite,
            icon: Icon(
              widget.icon,
              color: isFavorited ? Colors.red : Colors.grey,
            ),
          )
        ],
      ),
    );
  }
}
