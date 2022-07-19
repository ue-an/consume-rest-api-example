import 'package:consume_rest_api_app/controllers/profile_controller.dart';
import 'package:consume_rest_api_app/screens/profilescreen_components.dart/details_body.dart';
import 'package:consume_rest_api_app/screens/profilescreen_components.dart/top_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatelessWidget {
  // String name;
  // String email;
  // Address address;
  // Company company;
  // String phone;
  // String website;
  // String photo;
  ProfileScreen({
    Key? key,
    // required this.name,
    // required this.email,
    // required this.address,
    // required this.company,
    // required this.phone,
    // required this.website,
    // required this.photo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    ProfileController _profileController = context.watch<ProfileController>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TopCard(profileController: _profileController),
            const Divider(),
            DetailsBody(size: _size, profileController: _profileController),
          ],
        ),
      ),
    );
  }
}
