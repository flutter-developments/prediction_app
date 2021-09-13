// import 'dart:async';

// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:girafee/model/location_data.dart';
// import 'package:girafee/provider/locations_provider.dart';
// import 'package:girafee/utils/app_colors.dart';
// import 'package:girafee/utils/distance.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:provider/provider.dart';

// class SimpleMapWithCurrentLocation extends StatefulWidget {
//   @override
//   _SimpleMapWithCurrentLocationState createState() =>
//       _SimpleMapWithCurrentLocationState();
// }

// class _SimpleMapWithCurrentLocationState
//     extends State<SimpleMapWithCurrentLocation> {
//   Marker? currentLocationMarker;

//   final Completer<GoogleMapController> _controller = Completer();

//   LatLng? currentLocation;

//   int count = 0;
//   Set<Marker> _markers = Set();

//   bool cameraAnimatedToLocation = false;
//   bool centeringEnabled = true;

//   @override
//   void initState() {
//     super.initState();
//     var locationsProvider =
//         Provider.of<LocationsProvider>(context, listen: false);

//     locationsProvider.getCurrentUserLocation().then((value) {
//       setState(() => currentLocation = value);
//       animateCameraToLocation(value);
//     });

//     locationsProvider.startTrackingLiveLocation();
//   }

//   @override
//   Widget build(BuildContext context) {
//     currentLocation = Provider.of<LocationsProvider>(context).currentLocation;
//     // print(count += 1);
//     // print(currentLocation);
//     var shouldReCenter = centeringEnabled ||
//         (currentLocation != null && !cameraAnimatedToLocation);

//     if (shouldReCenter && currentLocation != null) {
//       animateCameraToLocation(currentLocation!);
//       setState(() {
//         cameraAnimatedToLocation = true;
//       });
//     }

//     updateCurrentLocationMarker();

//     return Stack(
//       children: [
//         Listener(
//           onPointerMove: (_) => setState(() => centeringEnabled = false),
//           child: GoogleMap(
//             zoomControlsEnabled: false,
//             markers: _markers,
//             initialCameraPosition:
//                 CameraPosition(target: LatLng(30, 31), zoom: 15),
//             compassEnabled: false,
//             onMapCreated: (GoogleMapController controller) async {
//               _controller.complete(controller);
//               await setMapStyle();
//             },
//           ),
//         ),
//         Container(
//           margin: EdgeInsets.only(bottom: 20, right: 10),
//           alignment: Alignment.bottomRight,
//           child: FloatingActionButton(
//             tooltip: "Track current Location",
//             backgroundColor: AppColors.white,
//             child: Icon(
//               Icons.gps_fixed,
//               color: centeringEnabled ? Colors.blue : Colors.grey,
//             ),
//             onPressed: () => setState(() => centeringEnabled = true),
//           ),
//         ),
//       ],
//     );
//   }

//   updateCurrentLocationMarker() async {
//     // currentLocation is updated via LocationsProvider
//     if (currentLocation != null) {
//       _markers = Set.from(
//         [
//           await getCurrentLocationMarker(),
//         ],
//       );
//     }
//   }

//   getCurrentLocationMarker() async {
//     // setState is not required here, because we're using the currentLocation provider
//     // using provider rebuilds it on every update, so setstate isn't required.
//     return Marker(
//       onTap: () {},
//       markerId: MarkerId("Me"),
//       position: currentLocation!,
//       icon: await (LocationIcons.currentLocation),
//       infoWindow: InfoWindow(title: "My Location"),
//     );
//   }

//   animateCameraToLocation(LatLng location) async {
//     CameraUpdate camera = CameraUpdate.newLatLngZoom(location, 15);
//     (await _controller.future)
//         .animateCamera(camera)
//         .catchError((e) => print("Error to camera animate"));
//   }

//   Future setMapStyle() async {
//     (await _controller.future).setMapStyle(await getMapStyleFromAssets());
//   }
// }

// class LiveAdsMapWidget extends StatefulWidget {
//   // final LatLng myLocation;

//   LiveAdsMapWidget({
//     required this.adLocations,
//     required this.onAdClick,
//     required this.onTap,
//     // @required this.myLocation,
//     // this.gotoCurrentLocationOnInit = true,
//   });

//   final List<AdLocationData> adLocations;
//   final void Function(AdLocationData) onAdClick;
//   final void Function(LatLng argument) onTap;
//   // final bool gotoCurrentLocationOnInit;

//   @override
//   _LiveAdsMapWidgetState createState() => _LiveAdsMapWidgetState();
// }

// class _LiveAdsMapWidgetState extends State<LiveAdsMapWidget> {
//   final Completer<GoogleMapController> _controller = Completer();
//   bool cameraAnimatedToLocation = false;

//   @override
//   void initState() {
//     super.initState();
//     print("LiveAdsMapWidget.initstate called");
//   }

//   LatLng? myLocation;

//   var previousLocation;

//   @override
//   Widget build(BuildContext context) {
//     print("LiveAdsMapWidget.build called");
//     print("LiveAdsMapWidget: adLocations: ${widget.adLocations}");
//     myLocation = Provider.of<LocationsProvider>(context).customMyLocation;
//     print("LiveAdsMapWidget: myLocation: $myLocation");

//     // This will always recenter map when myLocation changes, and update the marker too.
//     if (myLocation != null && myLocation != previousLocation) {
//       print("animating camera to location");
//       animateCameraToLocation(myLocation!);
//       // setState(() {
//       //   cameraAnimatedToLocation = true;
//       // });
//     }

//     previousLocation = myLocation;

//     return FutureBuilder<Set<Marker>>(
//       future: getAllMarkers(),
//       builder: (context, snapshot) {
//         Set<Marker>? markers = snapshot.data;

//         return GoogleMap(
//           zoomControlsEnabled: false,
//           markers: markers ?? Set(),
//           onTap: widget.onTap,
//           initialCameraPosition: CameraPosition(
//             target: LatLng(30, 31),
//             zoom: 15,
//           ),
//           compassEnabled: false,
//           onMapCreated: (GoogleMapController controller) async {
//             print("onMapCreated called");
//             print(controller);
//             if (!_controller.isCompleted) {
//               _controller.complete(controller);
//               await setMapStyle();
//             }
//           },
//         );
//       },
//     );
//   }

//   Future<Set<Marker>> getAllMarkers() async {
//     Set<Marker> markers = Set();

//     // Ad Markers
//     for (var adLocationData in widget.adLocations) {
//       markers.add(
//         Marker(
//           onTap: () {
//             this.widget.onAdClick(adLocationData);
//           },
//           markerId: MarkerId(adLocationData.adID!),
//           position: LatLng(adLocationData.latitude!, adLocationData.longitude!),
//           icon: await getAdMarkerIcon(adLocationData),
//           // infoWindow: InfoWindow(title: "ad title not implemented"),
//         ),
//       );
//     }

//     Marker? currentLocationMarker = await getMyLocationMarker();

//     if (currentLocationMarker != null) {
//       markers.add(currentLocationMarker);
//     }

//     return markers;
//   }

//   Future<Marker?> getMyLocationMarker() async {
//     if (myLocation == null) {
//       return null;
//     }
//     return Marker(
//       onTap: () {},
//       markerId: MarkerId("Me"),
//       position: myLocation!,
//       icon: await (LocationIcons.currentLocation as FutureOr<BitmapDescriptor>),
//       infoWindow: InfoWindow(title: "My Location"),
//     );
//   }

//   animateCameraToLocation(LatLng location) async {
//     CameraUpdate camera = CameraUpdate.newLatLngZoom(location, 15);
//     (await _controller.future)
//         .animateCamera(camera)
//         .catchError((e) => print("Error to camera animate"));
//   }

//   Future setMapStyle() async {
//     (await _controller.future).setMapStyle(await getMapStyleFromAssets());
//   }

//   getAdMarkerIcon(AdLocationData adLocationData) async {
//     if (adLocationData.availableAt == null) {
//       return await LocationIcons.green;
//     }
//     bool isAvailableAfter3Hours =
//         adLocationData.availableAt!.difference(DateTime.now()) >
//             Duration(hours: 3);
//     bool isAvailableAfter1Hour =
//         adLocationData.availableAt!.difference(DateTime.now()) >
//             Duration(hours: 1);

//     if (isAvailableAfter3Hours) {
//       return await LocationIcons.red;
//     } else if (isAvailableAfter1Hour) {
//       return await LocationIcons.yellow;
//     } else {
//       return await LocationIcons.green;
//     }
//   }
// }

// class PolyLinesMapWidget extends StatefulWidget {
//   final LatLng? fromLocation;
//   final LatLng? toLocation;

//   final void Function() onArrived;

//   /// this widget is placed in a Stack, so feel free to wrap it with an Align
//   final Widget widgetToShowWhenNearBy100Meters;

//   // final LatLng initialCameraPosition = locationA;

//   // final Marker locationAMarker;
//   // final Marker locationBMarker;

//   PolyLinesMapWidget({
//     required this.fromLocation,
//     required this.toLocation,
//     required this.onArrived,
//     required this.widgetToShowWhenNearBy100Meters,
//   });

//   @override
//   _PolyLinesMapWidgetState createState() => _PolyLinesMapWidgetState();
// }

// class _PolyLinesMapWidgetState extends State<PolyLinesMapWidget> {
//   Marker? currentLocationMarker;
//   Marker? destinationMarker;
//   bool hasArrived = false;

//   final Completer<GoogleMapController> _controller = Completer();

//   Set<Marker> _markers = Set();
//   Set<Polyline> polylines = Set();
//   double distanceInKM = double.infinity;
//   double etaInMinutes = double.infinity;

//   @override
//   Widget build(BuildContext context) {
//     updateMarkersAndPolylines();
//     calculateAndUpdateDistanceUsingPolyLines();
//     checkIfWeHaveArrivedAndInvokeOnArrivedCallback();

//     print("PolyLinesMapWidget: ${widget.fromLocation}");
//     print("PolyLinesMapWidget: ${widget.toLocation}");

//     print("distanceInKM: ${distanceInKM.toStringAsFixed(2)}");
//     print("etaInMinutes: ${etaInMinutes.toStringAsFixed(2)}");

//     return Stack(
//       children: [
//         GoogleMap(
//           zoomControlsEnabled: false,
//           markers: _markers,
//           initialCameraPosition:
//               CameraPosition(target: widget.fromLocation!, zoom: 15),
//           compassEnabled: false,
//           polylines: polylines,
//           onMapCreated: (GoogleMapController controller) async {
//             _controller.complete(controller);
//             await setMapStyle();
//           },
//         ),
//         Visibility(
//           visible: hasArrived,
//           child: widget.widgetToShowWhenNearBy100Meters,
//         ),
//         Align(
//           alignment: Alignment.bottomLeft,
//           child: DistanceTimeEstimateBox(
//             etaInMinutes: etaInMinutes,
//             distanceInKM: distanceInKM,
//           ),
//         )
//       ],
//     );
//   }

//   Future setMapStyle() async {
//     (await _controller.future).setMapStyle(await getMapStyleFromAssets());
//   }

//   calculateAndUpdateDistanceUsingPolyLines() {
//     if (polylines == null || polylines.isEmpty) return;

//     setState(
//       () => distanceInKM = calculateRouteLengthInKM(polylines.first.points),
//     );

//     // TODO: calculate current speed.
//     setState(() => etaInMinutes = calculateETAInMinutes(distanceInKM, 30));
//   }

//   Future updateMarkersAndPolylines() async {
//     // currentLocation is updated via LocationsProvider
//     if (widget.fromLocation != null && widget.toLocation != null) {
//       _markers = Set.from(
//         [
//           await getCurrentLocationMarker(),
//           await getDestinationLocationMarker(),
//         ],
//       );

//       getPolyLineCoordinates(widget.fromLocation!, widget.toLocation!).then(
//         (polylinePoints) {
//           polylines = new Set.from([
//             buildPolyline(polylinePoints),
//           ]);
//         },
//       );
//     }
//   }

//   Polyline buildPolyline(polylinePoints) {
//     return Polyline(
//       polylineId: PolylineId('uh...what is this id for?'),
//       color: Colors.lightGreen,
//       points: polylinePoints,
//       width: 3,
//     );
//   }

//   getCurrentLocationMarker() async {
//     // setState is not required here, because we're using the currentLocation provider
//     // using provider rebuilds it on every update, so setstate isn't required.
//     return Marker(
//       onTap: () {},
//       markerId: MarkerId("Me"),
//       position: widget.fromLocation!,
//       icon: await (LocationIcons.currentLocation as FutureOr<BitmapDescriptor>),
//       infoWindow: InfoWindow(title: "My Location"),
//     );
//   }

//   getDestinationLocationMarker() async {
//     return Marker(
//       onTap: () {},
//       markerId: MarkerId("dest"),
//       position: widget.toLocation!,
//       icon: await (LocationIcons.green as FutureOr<BitmapDescriptor>),
//       infoWindow: InfoWindow(title: "Destination"),
//     );
//   }

//   animateCameraToLocation(LatLng location) async {
//     CameraUpdate camera = CameraUpdate.newLatLngZoom(location, 15);
//     (await _controller.future)
//         .animateCamera(camera)
//         .catchError((e) => print("Error to camera animate"));
//   }

//   void checkIfWeHaveArrivedAndInvokeOnArrivedCallback() {
//     if (hasArrived) {
//       return;
//     }

//     if (distanceInKM == null) return;

//     if (distanceInKM < 0.1) {
//       widget.onArrived();
//       setState(() => hasArrived = true);
//     }
//   }
// }

// class DistanceTimeEstimateBox extends StatelessWidget {
//   const DistanceTimeEstimateBox({
//     required this.etaInMinutes,
//     required this.distanceInKM,
//   });

//   final double etaInMinutes;
//   final double distanceInKM;

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: EdgeInsets.symmetric(horizontal: 10, vertical: 40),
//       padding: EdgeInsets.all(20),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(20),
//       ),
//       child: Column(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           Row(
//             mainAxisSize: MainAxisSize.min,
//             mainAxisAlignment: MainAxisAlignment.start,
//             children: [
//               Text(
//                 "ETA: ",
//                 style: TextStyle(
//                   color: AppColors.greyTextColor,
//                   fontSize: 18,
//                 ),
//               ),
//               Text(
//                 etaInMinutes == double.infinity
//                     ? "Calculating"
//                     : "${etaInMinutes.toStringAsFixed(2)} minutes",
//                 style: TextStyle(
//                   color: AppColors.greenColor,
//                   fontSize: 18,
//                 ),
//               )
//             ],
//           ),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.start,
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               Text(
//                 "Distance: ",
//                 style: TextStyle(
//                   color: AppColors.greyTextColor,
//                   fontSize: 18,
//                 ),
//               ),
//               Text(
//                 distanceInKM == double.infinity
//                     ? "Calculating"
//                     : "${distanceInKM.toStringAsFixed(2)} km",
//                 style: TextStyle(
//                   color: Colors.blue,
//                   fontSize: 18,
//                 ),
//               )
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }

// Future<String> getMapStyleFromAssets() async {
//   return await rootBundle.loadString('assets/MapDesign/mapDesign.json');
// }

// class LocationIcons {
//   static BitmapDescriptor? _currentLocation;
//   static BitmapDescriptor? _green;
//   static BitmapDescriptor? _yellow;
//   static BitmapDescriptor? _red;

//   static Future<BitmapDescriptor> get currentLocation async =>
//       _currentLocation ?? await LocationIcons.getCurrentLocationIcon();

//   static Future<BitmapDescriptor?> get green async =>
//       _green ?? await LocationIcons.getGreenMarkerIcon();

//   static Future<BitmapDescriptor?> get yellow async =>
//       _yellow ?? await LocationIcons.getYellowMarkerIcon();

//   static Future<BitmapDescriptor?> get red async =>
//       _red ?? await LocationIcons.getRedMarkerIcon();

//   static Future<BitmapDescriptor> getCurrentLocationIcon() async {
//     LocationIcons._currentLocation = await BitmapDescriptor.fromAssetImage(
//       ImageConfiguration(devicePixelRatio: 2.5),
//       'assets/MapDesign/icon_mylocation.png',
//     );
//     return _currentLocation!;
//   }

//   static Future<BitmapDescriptor?> getGreenMarkerIcon() async {
//     LocationIcons._green = await BitmapDescriptor.fromAssetImage(
//       ImageConfiguration(devicePixelRatio: 2.5),
//       'assets/MapDesign/icon_location_green.png',
//     );
//     return _green;
//   }

//   static Future<BitmapDescriptor?> getYellowMarkerIcon() async {
//     LocationIcons._yellow = await BitmapDescriptor.fromAssetImage(
//       ImageConfiguration(devicePixelRatio: 2.5),
//       'assets/MapDesign/icon_location_orange.png',
//     );
//     return _yellow;
//   }

//   static Future<BitmapDescriptor?> getRedMarkerIcon() async {
//     LocationIcons._yellow = await BitmapDescriptor.fromAssetImage(
//       ImageConfiguration(devicePixelRatio: 2.5),
//       'assets/MapDesign/icon_location_red.png',
//     );

//     return _red;
//   }
// }
