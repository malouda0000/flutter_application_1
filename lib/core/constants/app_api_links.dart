class AppApiLinks {
//  ####  //
//"https://emergingideas.ae/test_apis/read.php?email=mike.hsch@gmail.com"
//"https://emergingideas.ae/test_apis/read.php?email=<mike.hsch@gmail.com>"

//  #####  //
  static const String userEmail = 'mike.hsch@gmail.com';

//  #####  //
  static const String mainTestApi = 'https://emergingideas.ae/test_apis';
  static const String readEndPoint = '/read.php';
  static const String deleteEndPoint = '/delete.php';
  static const String editEndPoint = '/edit.php';

//  #####  //
  static const String createEndPoint = '/create.php';

//  #####  //
  static const String getEmerItemsListApi =
      "${AppApiLinks.mainTestApi}${AppApiLinks.readEndPoint}?email=${AppApiLinks.userEmail}";
}
