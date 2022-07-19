import 'package:consume_rest_api_app/controllers/profile_controller.dart';
import 'package:consume_rest_api_app/utils/constants/color_constants.dart';
import 'package:consume_rest_api_app/utils/constants/textstyle_constants.dart';
import 'package:flutter/material.dart';

class TopCard extends StatelessWidget {
  const TopCard({
    Key? key,
    required ProfileController profileController,
  })  : _profileController = profileController,
        super(key: key);

  final ProfileController _profileController;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          decoration: BoxDecoration(
            border: Border.all(width: 2, color: kPrimaryColor),
            shape: BoxShape.circle,
          ),
          child: ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(60)),
            child: Image.network(
              _profileController.photo,
              height: 90,
              width: 90,
              fit: BoxFit.cover,
            ),
          ),
        ),
        const SizedBox(
          width: 12,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              _profileController.name,
              style: bigTitle,
            ),
            Text(
              '"' + _profileController.username + '"',
            ),
            Text(
              _profileController.email,
              style: bigSubTitle,
            ),
          ],
        ),
      ],
    );
  }
}
