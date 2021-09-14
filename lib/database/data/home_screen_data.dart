// import 'package:eve_and_co/models/ex_list_model.dart';
// import 'package:eve_and_co/models/history.dart';
// import 'package:eve_and_co/models/product_slider_card.dart';
// import 'package:eve_and_co/models/tv_slider_card.dart';

import 'package:prediction_app/database/data/sports_class.dart';

import 'leauge_class.dart';

List<SuperLeauge> superLeauge = [
  SuperLeauge(
      title: "UEFA Champions League",
      time: DateTime.now(),
      image: "assets/images/league0.png"),
  SuperLeauge(
      title: "Premier League",
      time: DateTime.now(),
      image: "assets/images/league1.png"),
  SuperLeauge(
      title: "La Liga Santander",
      time: DateTime.now(),
      image: "assets/images/league2.png"),
  SuperLeauge(
      title: "UEFA Champions League",
      time: DateTime.now(),
      image: "assets/images/league0.png"),
  SuperLeauge(
      title: "Premier League",
      time: DateTime.now(),
      image: "assets/images/league1.png"),
  SuperLeauge(
      title: "La Liga Santander",
      time: DateTime.now(),
      image: "assets/images/league2.png"),
];

List<Sports> sports = [
  Sports(
      title: "Football",
      games: "3",
      image: "assets/images/football.png"),
  Sports(
      title: "Golf",
      games: "4",
      image: "assets/images/golf.png"),
  Sports(
      title: "Basketball",
      games: "3",
      image: "assets/images/basketball.png"),
  Sports(
      title: "Football",
      games: "3",
      image: "assets/images/football.png"),
  Sports(
      title: "Golf",
      games: "3",
      image: "assets/images/golf.png"),
  Sports(
      title: "Basketball",
      games: "3",
      image: "assets/images/basketball.png"),
  
];

List<SuperLeauge> notifications = [
  SuperLeauge(
      title: "UEFA Champions League",
      time: DateTime.now(),
      image: "assets/images/league0.png"),
  SuperLeauge(
      title: "Premier League",
      time: DateTime.now(),
      image: "assets/images/league1.png",),
  SuperLeauge(
      title: "La Liga Santander",
      time: DateTime.now(),
      image: "assets/images/league2.png"),
  SuperLeauge(
      title: "UEFA Champions League",
      time: DateTime.now(),
      image: "assets/images/league0.png"),
  SuperLeauge(
      title: "Premier League",
      time: DateTime.now(),
      image: "assets/images/league1.png"),
  SuperLeauge(
      title: "La Liga Santander",
      time: DateTime.now(),
      image: "assets/images/league2.png"),
];

// List<ProdSliderCardModel> newArrivals = [
//   ProdSliderCardModel(
//       prodName: "Al Mamlaka Perfeum",
//       prodDesc: "Gentle Fragnance 50ML",
//       prodPrice: 125.0,
//       prodImage: "assets/images/almamlakaperfuem.jpg"),
//   ProdSliderCardModel(
//       prodName: "Al Clausaz Abaya",
//       prodDesc: "Void Abaya-Black",
//       prodPrice: 250.0,
//       isFreeGift: true,
//       prodImage: "assets/images/newArrival2.jpg"),
//   ProdSliderCardModel(
//       prodName: "Al Mamlaka Perfeum",
//       prodDesc: "Gentle Fragnance 50ML",
//       prodPrice: 125.0,
//       prodImage: "assets/images/almamlakaperfuem.jpg"),
//   ProdSliderCardModel(
//       prodName: "Al Clausaz Abaya",
//       prodDesc: "Void Abaya-Black",
//       prodPrice: 250.0,
//       isOutOfStock: true,
//       prodImage: "assets/images/newArrival2.jpg"),
// ];
// List<ProdSliderCardModel> awani = [
//   ProdSliderCardModel(
//       prodName: "White milk frother",
//       prodDesc: "including Taxes",
//       prodPrice: 125.0,
//       prodImage: "assets/icons/jug.png"),
//   ProdSliderCardModel(
//       prodName: "White milk frother",
//       prodDesc: "including Taxes",
//       prodPrice: 125.0,
//       prodImage: "assets/icons/jug1.png"),
//   ProdSliderCardModel(
//       prodName: "White milk frother",
//       prodDesc: "including Taxes",
//       prodPrice: 125.0,
//       prodImage: "assets/icons/jug.png"),
//   ProdSliderCardModel(
//       prodName: "White milk frother",
//       prodDesc: "including Taxes",
//       prodPrice: 125.0,
//       prodImage: "assets/icons/jug.png"),
//   ProdSliderCardModel(
//       prodName: "White milk frother",
//       prodDesc: "including Taxes",
//       prodPrice: 125.0,
//       prodImage: "assets/images/RECIPE.jpeg"),
// ];
// List<ProdSliderCardModel> newRecipe = [
//   ProdSliderCardModel(
//       prodName: "Urben summer",
//       prodDesc: "Salad",
//       prodPrice: 125,
//       prodImage: "assets/images/RECIPE.jpeg"),
//   ProdSliderCardModel(
//       prodName: "Urben summer",
//       prodDesc: "Salad",
//       prodPrice: 125,
//       prodImage: "assets/images/RECIPE.jpeg"),
//   ProdSliderCardModel(
//       prodName: "Urben summer",
//       prodDesc: "Salad",
//       prodPrice: 125,
//       prodImage: "assets/images/RECIPE.jpeg"),
//   ProdSliderCardModel(
//       prodName: "Urben summer",
//       prodDesc: "Salad",
//       prodPrice: 125,
//       prodImage: "assets/images/RECIPE.jpeg"),
//   ProdSliderCardModel(
//       prodName: "Urben summer",
//       prodDesc: "Salad",
//       prodPrice: 125,
//       prodImage: "assets/images/RECIPE.jpeg"),
// ];
// List<ProdSliderCardModel> fav = [
//   ProdSliderCardModel(
//       prodName: "Perlona",
//       prodDesc: "Jasmain body Mist",
//       prodPrice: 100.0,
//       isFreeGift: true,
//       prodImage: "assets/images/bestSellers1.jpg"),
//   ProdSliderCardModel(
//       prodName: "FK Collection",
//       prodDesc: "FK Collection Candles Pack of",
//       prodPrice: 270.0,
//       isOutOfStock: true,
//       prodImage: "assets/images/bestSellers2.jpg"),
// ];
// List<ProdSliderCardModel> fav1 = [
//   ProdSliderCardModel(
//       prodName: "Al Mamlaka Perfeum",
//       prodDesc: "Gentle Fragnance 50ML",
//       prodPrice: 125.0,
//       prodImage: "assets/images/almamlakaperfuem.jpg"),
//   ProdSliderCardModel(
//       prodName: "Al Clausaz Abaya",
//       prodDesc: "Void Abaya-Black",
//       prodPrice: 250.0,
//       isOutOfStock: true,
//       prodImage: "assets/images/newArrival2.jpg"),
// ];

// List<ExList> exlist = [
//   ExList(
//       name: "Core Exercise",
//       image: "assets/images/ex1.png",
//       des: "Descriotion"),
//   ExList(
//       name: "Body fit Workout",
//       image: "assets/images/ex1.png",
//       des: "Descriotion"),
//   ExList(
//       name: "Intensive Workout",
//       image: "assets/images/ex1.png",
//       des: "Descriotion"),
//   ExList(
//       name: "Anaeribic Fitness",
//       image: "assets/images/ex1.png",
//       des: "Descriotion"),
//   ExList(
//       name: "Joint Flexibility",
//       image: "assets/images/ex1.png",
//       des: "Descriotion"),
//   ExList(
//       name: "Cardiovascular",
//       image: "assets/images/ex1.png",
//       des: "Descriotion"),
// ];

// List<ProdSliderCardModel> bestSellers = [
//   ProdSliderCardModel(
//       prodName: "Perlona",
//       prodDesc: "Jasmain body Mist",
//       prodPrice: 100.0,
//       isOutOfStock: true,
//       isFreeGift: true,
//       prodImage: "assets/images/bestSellers1.jpg"),
//   ProdSliderCardModel(
//       prodName: "FK Collection",
//       prodDesc: "FK Collection Candles Pack of",
//       prodPrice: 270.0,
//       isFreeGift: false,
//       prodImage: "assets/images/bestSellers2.jpg"),
//   ProdSliderCardModel(
//       prodName: "Perlona",
//       prodDesc: "Jasmain body Mist",
//       prodPrice: 100.0,
//       prodImage: "assets/images/bestSellers1.jpg"),
//   ProdSliderCardModel(
//       prodName: "FK Collection",
//       prodDesc: "FK Collection Candles Pack of",
//       prodPrice: 17.0,
//       isFreeGift: true,
//       prodImage: "assets/images/bestSellers2.jpg"),
// ];

// List<ProdSliderCardModel> evePics = [
//   ProdSliderCardModel(
//       prodName: "Dohty",
//       prodDesc: "Moon Shape Lights",
//       prodPrice: 125.0,
//       prodImage: "assets/images/evePics1.jpg"),
//   ProdSliderCardModel(
//       prodName: "Bioderma",
//       prodDesc: "Aquafluide Pocket Tres",
//       prodPrice: 125.0,
//       isOutOfStock: true,
//       prodImage: "assets/images/evePics2.jpg"),
//   ProdSliderCardModel(
//       prodName: "Perlona",
//       prodDesc: "Jasmain body Mist",
//       prodPrice: 100.0,
//       prodImage: "assets/images/bestSellers1.jpg"),
//   ProdSliderCardModel(
//       prodName: "Dohty",
//       prodDesc: "Moon Shape Lights",
//       prodPrice: 125.0,
//       prodImage: "assets/images/evePics1.jpg"),
// ];
// List<ProdSliderCardModel> recipies = [
//   ProdSliderCardModel(
//       prodName: "Dohty",
//       prodDesc: "Moon Shape Lights",
//       prodPrice: 125.0,
//       prodImage: "assets/images/evePics1.jpg"),
//   ProdSliderCardModel(
//       prodName: "Bioderma",
//       prodDesc: "Aquafluide Pocket Tres",
//       prodPrice: 125.0,
//       isOutOfStock: true,
//       prodImage: "assets/images/evePics2.jpg"),
//   ProdSliderCardModel(
//       prodName: "Perlona",
//       prodDesc: "Jasmain body Mist",
//       prodPrice: 100.0,
//       prodImage: "assets/images/bestSellers1.jpg"),
//   ProdSliderCardModel(
//       prodName: "Dohty",
//       prodDesc: "Moon Shape Lights",
//       prodPrice: 125.0,
//       prodImage: "assets/images/evePics1.jpg"),
// ];

// List<TvSliderCardModel> eyeTvChannel = [
//   TvSliderCardModel(
//       fname: "Boutique", lname: "Shoque", image: "assets/images/tv1.jpg"),
//   TvSliderCardModel(
//       fname: "Boutique", lname: "Houda", image: "assets/images/tv2.jpg"),
//   TvSliderCardModel(
//       fname: "Boutique", lname: "Rehana", image: "assets/images/tv3.jpg"),
//   TvSliderCardModel(
//       fname: "Boutique", lname: "Shoque", image: "assets/images/tv1.jpg"),
//   TvSliderCardModel(
//       fname: "Boutique", lname: "Houda", image: "assets/images/tv2.jpg"),
//   TvSliderCardModel(
//       fname: "Boutique", lname: "Rehana", image: "assets/images/tv3.jpg")
// ];

// List<TvSliderCardModel> eyeWorld = [
//   TvSliderCardModel(
//       fname: "Jood", lname: "Aziz", image: "assets/images/cat8.jpg"),
//   TvSliderCardModel(
//       fname: "Aya", lname: "Faisal", image: "assets/images/eyeWorld1.jpg"),
//   TvSliderCardModel(
//       fname: "Christian", lname: "Rehana", image: "assets/images/tv2.jpg"),
//   TvSliderCardModel(
//       fname: "Jood", lname: "Aziz", image: "assets/images/cat6.jpg"),
//   TvSliderCardModel(
//       fname: "Aya", lname: "Faisal", image: "assets/images/proddesc.jpg"),
//   TvSliderCardModel(
//       fname: "Christian", lname: "Rehana", image: "assets/images/tv2.jpg")
// ];

// List<String> allBrandsImages = [
//   "assets/images/popularBrand1.jpg",
//   "assets/images/popularBrand2.jpg",
//   "assets/images/popularBrand3.jpg",
//   "assets/images/popularBrand1.jpg",
//   "assets/images/popularBrand2.jpg"
// ];

// List categoriesList = [
//   {
//     "name": "MakeUp",
//     "image": "assets/images/cat1.jpg",
//   },
//   {
//     "name": "Haircare",
//     "image": "assets/images/cat2.jpg",
//   },
//   {
//     "name": "Skincare",
//     "image": "assets/images/cat3.jpg",
//   },
//   {
//     "name": "Koren Beauty",
//     "image": "assets/images/cat4.jpg",
//   },
//   {
//     "name": "Bath & Body",
//     "image": "assets/images/cat5.jpg",
//   },
//   {
//     "name": "Fragnances",
//     "image": "assets/images/cat6.jpg",
//   },
//   {
//     "name": "Arabic Fragnances",
//     "image": "assets/images/cat7.jpg",
//   },
//   {
//     "name": "Apparel",
//     "image": "assets/images/cat8.jpg",
//   },
//   {
//     "name": "Sports",
//     "image": "assets/images/cat9.jpg",
//   },
//   {
//     "name": "Trendy Touch",
//     "image": "assets/images/cat10.jpg",
//   },
//   {
//     "name": "MakeUp",
//     "image": "assets/images/cat11.jpg",
//   },
//   {
//     "name": "MakeUp",
//     "image": "assets/images/cat12.jpg",
//   },
// ];
