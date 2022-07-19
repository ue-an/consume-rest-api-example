import 'package:flutter/material.dart';

class UserCard extends StatelessWidget {
  const UserCard({
    Key? key,
    required this.name,
    required this.id,
    required this.height,
    required this.imgUrl,
  }) : super(key: key);

  final String name;
  final String id;
  final int height;
  final String imgUrl;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Card(
      shape: RoundedRectangleBorder(
        side: const BorderSide(
          color: Colors.teal,
          width: 2,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: ListView.builder(
        itemCount: 1,
        itemBuilder: (_, index) => Column(
          children: [
            Image.network(
              imgUrl,
              height: 200,
              width: 120,
            ),
            ListTile(
              title: Text(
                name,
              ),
              subtitle: Text(
                id,
                style: const TextStyle(
                  fontSize: 12,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
