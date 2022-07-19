import 'package:consume_rest_api_app/controllers/profile_controller.dart';
import 'package:consume_rest_api_app/utils/constants/textstyle_constants.dart';
import 'package:flutter/material.dart';

class DetailsBody extends StatelessWidget {
  const DetailsBody({
    Key? key,
    required Size size,
    required ProfileController profileController,
  })  : _size = size,
        _profileController = profileController,
        super(key: key);

  final Size _size;
  final ProfileController _profileController;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: _size.height * .03,
        horizontal: _size.width * .09,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Company',
            style: smallTitle,
          ),
          const SizedBox(
            height: 12,
          ),
          Row(
            // padding: EdgeInsets.only(left: _size.width * .09),
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  Text(_profileController.company.name.toUpperCase()),
                  Text(_profileController.company.bs.toTitleCase()),
                  Text('"' + _profileController.company.catchPhrase + '"',
                      style: smallQuotation),
                ],
              ),
            ],
          ),
          const SizedBox(
            height: 12,
          ),
          const Text(
            'Address',
            style: smallTitle,
          ),
          const SizedBox(
            height: 12,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(_profileController.address.suite +
                  ', ' +
                  _profileController.address.street +
                  ', ' +
                  _profileController.address.city),
            ],
          ),
          const SizedBox(
            height: 12,
          ),
          const Text(
            'Phone',
            style: smallTitle,
          ),
          const SizedBox(
            height: 12,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(_profileController.phone),
            ],
          ),
          const SizedBox(
            height: 12,
          ),
          const Text(
            'Email',
            style: smallTitle,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(_profileController.email),
            ],
          ),
          const SizedBox(
            height: 12,
          ),
          const Text(
            'Website',
            style: smallTitle,
          ),
          const SizedBox(
            height: 12,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(_profileController.website),
            ],
          ),
        ],
      ),
    );
  }
}
