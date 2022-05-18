import 'dart:io';

import 'package:url_launcher/url_launcher.dart';

class MapUtils {
  MapUtils._();

  static Future<void> openMap(double latitude, double longitude) async {
    String googleUrl =
        'https://www.google.com/maps/search/?api=1&query=$latitude,$longitude';
    Uri uri = Uri.parse(googleUrl);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      throw 'Could not open the map.';
    }
  }

  static Future<void> openMap1(double latitude, double longitude) async {
    String url = '';
    String urlAppleMaps = '';
    Uri uri;
    if (Platform.isAndroid) {
      url =
          'https://www.google.com/maps/search/?api=1&query=$latitude,$longitude';
      url = 'google.navigation:q=$latitude,$longitude';
      // url =
      //     'comgooglemaps://?saddr=&daddr=$latitude,$latitude&directionsmode=driving';
      uri = Uri.parse(url);
      if (await canLaunchUrl(uri)) {
        await launchUrl(uri);
      } else {
        throw 'Could not launch $url';
      }
    } else {
      urlAppleMaps = 'https://maps.apple.com/?q=$latitude,$latitude';
      // url =
      //     'comgooglemaps://?saddr=&daddr=$latitude,$latitude&directionsmode=driving';
      uri = Uri.parse(urlAppleMaps);
      if (await canLaunchUrl(uri)) {
        await launchUrl(uri);
      } else {
        throw 'Could not launch $urlAppleMaps';
      }
    }
  }
}
