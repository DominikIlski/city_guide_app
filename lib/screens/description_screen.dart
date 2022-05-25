import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:city_guide_app/models/base_info.dart';
import 'package:city_guide_app/providers/provider.dart';
import 'package:city_guide_app/screens/error_screen.dart';
import 'package:city_guide_app/screens/loading_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DescriptionScreen extends ConsumerStatefulWidget {
  final BaseInfo object;
  const DescriptionScreen(this.object, {Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _DescriptionScreenState();
}

class _DescriptionScreenState extends ConsumerState<DescriptionScreen> {
  Completer<GoogleMapController> _controller = Completer();
  var _opinion = '';
  var _rating = 2.5;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                color: Colors.green[300],
                child: CarouselSlider(
                  options:
                      CarouselOptions(height: 250.0, viewportFraction: 0.9),
                  items: widget.object.images.map((url) {
                    return Builder(
                      builder: (BuildContext context) {
                        return Container(
                          width: MediaQuery.of(context).size.width,
                          margin: EdgeInsets.symmetric(horizontal: 5.0),
                          child: CachedNetworkImage(
                            imageUrl: url,
                            placeholder: (context, url) =>
                                Center(child: CircularProgressIndicator()),
                            errorWidget: (context, url, error) =>
                                Icon(Icons.error),
                          ),
                        );
                      },
                    );
                  }).toList(),
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.8,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: FittedBox(
                    fit: BoxFit.fitWidth,
                    child: Text(
                      widget.object.name,
                      style: TextStyle(fontSize: 400.0),
                    ),
                  ),
                ),
              ),
              const Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Divider(
                  color: Colors.black,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Wrap(
                  children: [Text(widget.object.description)],
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.5,
                width: double.infinity,
                child: GoogleMap(
                  markers: <Marker>{
                    Marker(
                        markerId: MarkerId('0'), position: widget.object.place)
                  },
                  myLocationEnabled: true,
                  myLocationButtonEnabled: false,
                  zoomGesturesEnabled: false,
                  scrollGesturesEnabled: false,
                  tiltGesturesEnabled: false,
                  rotateGesturesEnabled: false,
                  mapType: MapType.terrain,
                  initialCameraPosition:
                      CameraPosition(zoom: 15, target: widget.object.place),
                  onMapCreated: (controller) {
                    _controller.complete(controller);
                  },
                ),
              ),
              ref.watch(authStateProv).when(
                  data: (user) => FutureBuilder<bool>(future: (() async {
                        final prefs = await SharedPreferences.getInstance();
                        final List<String> items =
                            prefs.getStringList(user?.uid ?? '') ?? [];
                        return items.contains(widget.object.id);
                      })(), builder: (context, snapshot) {
                        if (snapshot.hasData && snapshot.data == true) {
                          return SizedBox(
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height * 0.1,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: FittedBox(
                                fit: BoxFit.fitWidth,
                                child: Text(
                                  'Opinię można zostawić tylko raz :>',
                                  style: TextStyle(fontSize: 400.0),
                                ),
                              ),
                            ),
                          );
                        }

                        return Column(children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.7,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: FittedBox(
                                fit: BoxFit.fitWidth,
                                child: Text(
                                  'Leave your opinion!',
                                  style: TextStyle(fontSize: 400.0),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: Center(
                              child: RatingBar.builder(
                                initialRating: 3,
                                minRating: 1,
                                direction: Axis.horizontal,
                                allowHalfRating: true,
                                itemCount: 5,
                                itemPadding:
                                    EdgeInsets.symmetric(horizontal: 4.0),
                                itemBuilder: (context, _) => Icon(
                                  Icons.star,
                                  color: Colors.amber,
                                ),
                                onRatingUpdate: (rating) {
                                  _rating = rating;
                                },
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextField(
                              onChanged: (val) => _opinion = val,
                              maxLines: 5,
                              decoration: const InputDecoration(
                                border: UnderlineInputBorder(),
                                hintText: 'Enter your opinion',
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                ElevatedButton(
                                    onPressed: () {
                                      SharedPreferences.getInstance()
                                          .then((prefs) {
                                        var uid = ref
                                            .read(authStateProv)
                                            .asData
                                            ?.value
                                            ?.uid;
                                        if (uid != null) {
                                          var list =
                                              prefs.getStringList(uid) ?? [];
                                          list.add(widget.object.id);
                                          prefs.setStringList(uid, list);
                                        }
                                      });

                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(SnackBar(
                                        content: Text(
                                            'Thanks for comment your opinion :)'),
                                      ));
                                    },
                                    child: Text('Submit opinion'))
                              ],
                            ),
                          )
                        ]);
                      }),
                  error: (e, stack) => ErrorScreen(e, stack),
                  loading: () => LoadingScreen())
            ],
          ),
        ),
      ),
    );
  }
}
