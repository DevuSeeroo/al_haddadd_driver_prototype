class AppConstants {
  static const String BaseUrl = "https://www.alhaddadb2b.com";
  static const String testToken =
      "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJuYmYiOiIxNjU0MjcyNTk1IiwiZXhwIjoiMTY1NDg3NzM5NSIsIkN1c3RvbWVySWQiOiI2MjkxOSIsImh0dHA6Ly9zY2hlbWFzLnhtbHNvYXAub3JnL3dzLzIwMDUvMDUvaWRlbnRpdHkvY2xhaW1zL25hbWVpZGVudGlmaWVyIjoiNjU2ZTJhMjYtYjFjOC00NzlmLWJiYTUtN2ZlYzQ3Mzg0OGE3IiwiaHR0cDovL3NjaGVtYXMueG1sc29hcC5vcmcvd3MvMjAwNS8wNS9pZGVudGl0eS9jbGFpbXMvbmFtZSI6InRlc3Rkcml2ZXJAZ21haWwuY29tIn0.6UELAknTGvhIc-r6mdRuwkdL7jzdBRWkExv9HA1vzXI";
  static const int testID = 62919;

  static int homeIndex = 1;
  static int profileIndex = 2;
  static int historyIndex = 3; //not using
  static int jobAssignedIndex = 1;
  static int jobPickedIndex = 2;
  static int jobHistoryIndex = 3;

  static int jobNotStarted = 0;
  static int jobPickedUp = 1;
  static int jobOnGoing = 2;
  static int jobReached = 3;
  final List<String> countryCodeList = ["+966"];
  static int aboutUs = 1;
  static int termsOfService = 12;
  static int shippingReturns = 10;
  static int privacyNotice = 8;
  static int contactUs = 4;
  static int filterPriceParentId = 0;
  static int filterSubCategoryParentId = 1;
  static int filterManufacturerParentId = 2;
  static int filterSpecificationParentId = 3;
  static String tempFilter = "TempFilter";
  static String tempSubCategoryFilter = "TempSubCategoryFilter";

  //Pending = 10, Processing = 20, Shipped = 50, Complete = 30, Cancelled = 40
  static int pendingStatusId = 10;
  static int processingStatusId = 20;
  static int shippedStatusId = 50;
  static int completedStatusId = 30;
  static int cancelledStatusId = 40;
  static int deliveryFailedStatusId = 60;

  //This is from shipping status sections
  // and all the above are from order status section
  static int inTransitStatusId = 50;
  static int shippingShippedStatusId = 40;
  static int shippingFailedStatusId = 70;
  static int shippingPackageReturnedStatusId = 80;
  static int shippingCompletedStatusId = 60;
}
