import 'package:consume_rest_api_app/controllers/profile_controller.dart';
import 'package:consume_rest_api_app/models/album_model.dart';
import 'package:consume_rest_api_app/models/user_model.dart';
import 'package:consume_rest_api_app/models/waifu_model.dart';
import 'package:consume_rest_api_app/screens/home2_components/user_card.dart';
import 'package:consume_rest_api_app/utils/routes.dart';
import 'package:consume_rest_api_app/utils/services/api_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Home2 extends StatefulWidget {
  const Home2({Key? key}) : super(key: key);

  @override
  State<Home2> createState() => _Home2State();
}

class _Home2State extends State<Home2> {
  late List<UserModel>? _userModel = [];
  String sampleText = 'data';
  late List waifuUrls = [];
  final TextEditingController _controller = TextEditingController();
  // late Future<Album> _futureAlbum;
  late SingleWaifu _singleWaifu;
  late Future<ManyWaifus> _futureManyWaifus;
  @override
  void initState() {
    super.initState();
    _getData();
    // _futureAlbum = ApiService().createAlbum(_controller.text);
    _getWaifuPic();
    _futureManyWaifus = ApiService().createUnlistWaifu();
  }

  void _getData() async {
    _userModel = (await ApiService().getUsers())!;
    Future.delayed(const Duration(seconds: 1)).then((value) => setState(() {}));
  }

  void _getWaifuPic() async {
    _singleWaifu = (await ApiService().getSingleWaifu())!;
    Future.delayed(const Duration(seconds: 1)).then((value) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    final ProfileController _profileController =
        context.read<ProfileController>();
    return Scaffold(
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     showModalBottomSheet(
      //         isScrollControlled: true,
      //         context: context,
      //         builder: (context) {
      //           return AnimatedPadding(
      //             padding: EdgeInsets.only(
      //                 bottom: MediaQuery.of(context).viewInsets.bottom),
      //             duration: const Duration(milliseconds: 150),
      //             child: SingleChildScrollView(
      //               child: Container(
      //                 height: MediaQuery.of(context).size.height / 3,
      //                 padding: const EdgeInsets.only(
      //                   top: 12,
      //                   right: 12,
      //                   left: 12,
      //                 ),
      //                 child: Column(
      //                   crossAxisAlignment: CrossAxisAlignment.start,
      //                   children: [
      //                     TextField(
      //                       controller: _controller,
      //                       decoration:
      //                           const InputDecoration(hintText: 'Enter Title'),
      //                     ),
      //                     ElevatedButton(
      //                       child: const Text('Create Data'),
      //                       onPressed: () {
      //                         setState(() {
      //                           // _futureAlbum =
      //                           //     ApiService().createAlbum(_controller.text);
      //                         });
      //                       },
      //                     ),
      //                   ],
      //                 ),
      //               ),
      //             ),
      //           );
      //         });
      //   },
      //   child: const Icon(Icons.add),
      // ),
      appBar: AppBar(
        title: const Text('REST API Examples Playground'),
      ),
      body: _userModel == null || _userModel!.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : Column(
              children: [
                // FutureBuilder<Album?>(
                //   future: _futureAlbum,
                //   builder: (context, snapshot) {
                //     if (snapshot.hasData) {
                //       return Column(
                //         children: [
                //           Text(snapshot.data!.title),
                //           Text(snapshot.data!.id.toString()),
                //         ],
                //       );
                //     } else if (snapshot.hasError) {
                //       return Text("${snapshot.error}");
                //     } else if (!(snapshot.hasData)) {
                //       return const Text('no data');
                //     }
                //     if (snapshot.connectionState == ConnectionState.waiting) {
                //       return const LinearProgressIndicator();
                //     }
                //     return const LinearProgressIndicator();
                //   },
                // ),
                // Text(_singleWaifu.url),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: FutureBuilder<ManyWaifus>(
                      future: _futureManyWaifus,
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          waifuUrls = snapshot.data!.files;
                          return GridView.builder(
                              gridDelegate:
                                  const SliverGridDelegateWithMaxCrossAxisExtent(
                                      maxCrossAxisExtent: 200,
                                      childAspectRatio: 2 / 3,
                                      crossAxisSpacing: 20,
                                      mainAxisSpacing: 20),
                              itemCount: _userModel!.length,
                              itemBuilder: (BuildContext ctx, index) {
                                String username = _userModel![index].username;
                                String id = _userModel![index]
                                    .email
                                    .toLowerCase()
                                    .toString();
                                return GestureDetector(
                                  onTap: () async {
                                    _profileController.changeName =
                                        _userModel![index].name;
                                    _profileController.changeEmail =
                                        _userModel![index].email;
                                    _profileController.changeAddress =
                                        _userModel![index].address;
                                    _profileController.changeCompany =
                                        _userModel![index].company;
                                    _profileController.changePhone =
                                        _userModel![index].phone;
                                    _profileController.changeWebsite =
                                        _userModel![index].website;
                                    _profileController.changePhoto =
                                        waifuUrls[index];
                                    _profileController.changeUsername =
                                        _userModel![index].username;

                                    Navigator.of(context)
                                        .pushNamed(Routes.profile);
                                  },
                                  child: UserCard(
                                    name: username,
                                    id: id,
                                    height: _userModel!.length,
                                    imgUrl: waifuUrls[index],
                                  ),
                                );
                              });
                        } else if (snapshot.hasError) {
                          return Text("${snapshot.error}");
                        } else if (!(snapshot.hasData)) {
                          return const Text('no data');
                        }
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const LinearProgressIndicator();
                        }

                        return const LinearProgressIndicator();
                      },
                    ),
                  ),
                ),
              ],
            ),
    );
  }
}
