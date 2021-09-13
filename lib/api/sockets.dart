// import 'dart:async';

// import 'package:girafee/api/giraffe_apis.dart';
// import 'package:girafee/model/hive/utils.dart';
// import 'package:girafee/model/response_model/getMymsg.dart';
// import 'package:girafee/model/job.dart';
// import 'package:girafee/model/location_data.dart';
// import 'package:socket_io_client/socket_io_client.dart' as IO;

// /// TODO: make this class less ugly. Maybe split it into multiple classes?
// class APISocketsClient {
//   static IO.Socket? _chatSocket;
//   static IO.Socket? _locationSocket;
//   static IO.Socket? _jobSocket;

//   static IO.Socket? get chatSocket {
//     if (_chatSocket == null) _chatSocket = _buildChatSocket();
//     return _chatSocket;
//   }

//   static IO.Socket? get locationSocket {
//     if (_locationSocket == null) _locationSocket = _buildLocationSocket();
//     return _locationSocket;
//   }

//   static IO.Socket? get jobSocket {
//     if (_jobSocket == null) _jobSocket = _buildJobSocket();
//     return _jobSocket;
//   }

//   static IO.Socket _buildChatSocket() {
//     return IO.io(
//       API_URLS.CHAT_SOCKET,
//       IO.OptionBuilder()
//           .setPath('/lilac')
//           .setTransports(['websocket'])
//           .setExtraHeaders(Utils.getAuthorizationHeader())
//           .build(),
//     );
//   }

//   static IO.Socket _buildLocationSocket() {
//     return IO.io(
//       API_URLS.LOCATION_SOCKET,
//       IO.OptionBuilder()
//           .setPath('/lilac')
//           .setTransports(['websocket'])
//           .setExtraHeaders(Utils.getAuthorizationHeader())
//           .setQuery({
//             "city": selectedCity ?? "not-a-city",
//             "category": selectedCategory ?? "not-a-category"
//           })
//           .build(),
//     );
//   }

//   static IO.Socket _buildJobSocket() {
//     return IO.io(
//       API_URLS.JOB_SOCKET,
//       IO.OptionBuilder()
//           .setPath('/lilac')
//           .setTransports(['websocket'])
//           .setExtraHeaders(Utils.getAuthorizationHeader())
//           .build(),
//     );
//   }

//   static String? selectedCity;
//   static String? selectedCategory;

//   static updateLilacParams({String? city, String? category}) {
//     selectedCity = city ?? selectedCity;
//     selectedCategory = category ?? selectedCategory;

//     if (selectedCategory != null && selectedCity != null) {
//       _locationSocket?.dispose();
//       _locationSocket = _buildLocationSocket();
//       startListeningToLocationEvents();
//     }

//     print("locationSocket.query: ${locationSocket!.query}");
//   }

//   static Stream<AdLocationData> get locationDataStream =>
//       _locationStream.stream;

//   static get liveLocationStream => locationDataStream
//       .where((event) => (event.city == null && event.category == null));

//   static Stream<Message> get messageStream => _messageStream.stream;
//   static Stream<Job> get jobRequestStream => _jobRequestStream.stream;
//   static Stream<Job> get jobUpdateStream => _jobUpdateStream.stream;

//   static Stream<Job> jobUpdateStreamForID(jobID) =>
//       _jobUpdateStream.stream.where((job) => job.id == jobID);

//   // ignore: close_sinks
//   static final StreamController<Message> _messageStream =
//       StreamController.broadcast();

//   // ignore: close_sinks
//   static final StreamController<AdLocationData> _locationStream =
//       StreamController.broadcast();

//   // ignore: close_sinks
//   static final StreamController<Job> _jobRequestStream =
//       StreamController.broadcast();

//   // ignore: close_sinks
//   static final StreamController<Job> _jobUpdateStream =
//       StreamController.broadcast();

//   static startListeningToMessageEvents() async {
//     APISocketsClient.chatSocket!.on("message", (data) {
//       if (data == null) {
//         throw "Error, expected message to not be null";
//       }
//       Message message = Message(
//         text: data['text'],
//         senderID: data['senderID'],
//         senderName: data['senderName'],
//         receiverName: data['receiverName'],
//         senderDisplayPictureURL: data['senderDisplayPictureURL'],
//         receiverDisplayPictureURL: data['receiverDisplayPictureURL'],
//         receiverID: data['receiverID'],
//         timestamp: DateTime.parse(data['timestamp'] as String),
//       );
//       _messageStream.sink.add(message);
//     });

//     chatSocket!.on("connect", (data) => print('Chat socket connected'));
//     chatSocket!.on("disconnect",
//         (data) => print('Chat Socket has disconected from advertiser side'));
//   }

//   static startListeningToLocationEvents() async {
//     locationSocket!.on('connect', (_) => print("locationsocket connected"));
//     locationSocket!.on('broadcastLocation', (data) {
//       print("received broadcastLocation: $data");
//       AdLocationData locationData = AdLocationData.fromJson(data);
//       _locationStream.sink.add(locationData);
//     });
//   }

//   static startListeningToJobEvents() async {
//     jobSocket!.on("connect", (data) => print('connected on lilac'));
//     jobSocket!.on("request", (data) {
//       _jobRequestStream.sink.add(Job.fromJson(data));
//     });

//     var updateEvents = ['accept', 'reject', 'cancel', 'complete'];

//     for (var event in updateEvents) {
//       jobSocket!.on(event, (data) {
//         if (event == 'cancel') {
//           print("received job cancel update: ");
//           print(data);
//         }
//         _jobUpdateStream.sink.add(Job.fromJson(data));
//       });
//     }
//   }

//   static startListeningToEvents() async {
//     await startListeningToMessageEvents();
//     await startListeningToJobEvents();
//     await startListeningToLocationEvents();
//   }

//   static emitLocation(AdLocationData locationData) {
//     print("{locationSocket.query}: ${locationSocket!.query}");
//     print("selectedCity: $selectedCity");
//     print("selectedCategory: $selectedCategory");
//     locationSocket!.emit('broadcastLocation', locationData.toJson());
//   }

//   static emitMessage(Message message) {
//     chatSocket!.emit('message', message.toJson());
//   }

//   static emitJobUpdate(JobStatus? updateStatus, Job updatedJob) {
//     print('emitJobUpdate: $updateStatus, job: ');
//     print(updatedJob.toJson());
//     print(updatedJob.status);
//     jobSocket!.emit(updateStatus.toAPIString(), updatedJob.toJson());
//   }
// }
