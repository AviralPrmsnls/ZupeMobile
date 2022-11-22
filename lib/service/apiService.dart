import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

class ApiConstants {
  static String baseUrl =
      'https://boiling-taiga-83466.herokuapp.com/http://localhost:8080';
  static String userRegisterEndpoint = '/v1/about';
}

class ApiService {
  Future getOtpWhenSignIn(String phoneNumber) async {
    // final body = {
    //   "captcha":
    //       "signalcaptcha://signal-recaptcha-v2.6LfBXs0bAAAAAAjkDyyI1Lk5gBAUWfhI_bIyox5W.registration.03AEkXODC3X4UDhfLEFvH_EMZA2JxhYpQqLB64Vq85-Bc-2PNFKeikPRl494a8MCoSa6iX2GASYC5zHWB5GUuYtvjB9vwW036JeI1I1RA_oXcPQgAuLtMO5HYTQOWKtzVaQcwjmbGMXPPLwVFFVX6pvJ1ibnsCkHp0i6bGiuhnI5JUK7b5GxFQqwc5QaQ-r5FI2VLsGusgi2ukYsFRWT9OqVOWk95h26xynR082eB6nmrVNWnSbj5KbwHcHCSYQmBcIYhSpfhBCK5sdrUEtyqggGmMLET88VQsuCOSq2TTT3tWc67lxmowTGKtiSIvcxcQUJN7nxAt6y3PZUAX6RXXxw4Gh3Ul32UtRJLSEu_4Oj7R9XVcoVB7PM5q_sqkXbRskOm-07vMnPjFEd8yMO6oej4IR5SNd1agrzJBCbWUQLKVgeiFVt4Rh2FkNG_wMGyno0mdYPbZSxHglWK4HmbU10PpXGbyPacu9z2Eqxx6hNPjQPSkekvok0L0qTcSrKDUiQoVIn7Bp3ctBAbNETkXDZUjcGl-DGs3LvOT2d_bgEkhQLArQ1hi-oj-cnOkoAvT7-qiMiRVUEepz_ly47Bk_-c9d_CvOX8HnJ1KTkPPsc7gyNNJcr5vbO5qEM8uZoLOThIiwQVZDFfGOqc8DZv8HR19ULzHefCUpDYv5Olsv5IVcvfzu3f8pXsELzc58QenA88cKQo5DM4vBnmw591SV0lbZWBm8PYMJHlcRuGbxtfAmsjUDDQK--NFa5t-p8J7jRhA-y8qJCbU7SIEDvUlVoHwzJXzHEt8iisrfYkozHBgrdI2lX0uTeW8b9HmN1klJWtmLi9DkJ0iXBLNNtIiW_qXJmh_ywG92ROjypX869B4qJecumAzcQ6BiqhAYFqvZ-tqQso5NExX2c4I-kZVx0TFIYlhNsgY7LovPBh6mcSc9RoM6-8gOUszZjiZH6ujB2L9tNlTu6KTuwfQOx3KrxqCyeuUmCi6FI8afwvWgSUUjYBWQopTXH57EjYc68lu7wJAhRx3vvPx_TygH5j9tB9vFGw7OTc2_hlOG3Z4zCQ2IJJz7iGW6epJQER667rlV5Q8Tyes0O6A3YuQPUHs7fkBfcxYaJHI428HDFuNgiq0r7HLGrFn-K0oSNTdOFbrdYMF2lNLkUIOhUGxfCkBdRA1pqA8Um1DX2H2ahVexUKOR9eeRHO5vv4ZMBoS3wXvKcwJB2oP2l7TUsDO4W-NZw_7RRmPoTdDmhtD6WTQaNAue9K3gbKvhZrr0sL5GDfRGG2C1EiQiT9NKynM2SuxBRprmZAF7QYnbd_Gv6Q_CcLO4m2fC4IJpY9zTvNVp3mn85i7n8HrXhndX_KX4fQAFaPCBUVM_MJoc8NZORJRMkWMVkl0EBzDguw",
    //   "use_voice": "false"
    // };
    // final jsonString = jsonEncode(body);
    // final headers = {'Content-Type': 'application/json'};
    var headers = {
      "Access-Control-Allow-Origin": "*",
      'Content-Type': 'application/json',
      'Accept': '*/*'
    };

    try {
      // var url =
      //     Uri.parse(ApiConstants.baseUrl + ApiConstants.userRegisterEndpoint);
      // print(url);
      // var response = await http.get(url, headers: headers);
      // print(response.body);
      // if (response.statusCode == 200) {
      //   print(response.body);
      //   return response.body;
      // }
      var request =
          http.Request('GET', Uri.parse('http://localhost:8080/v1/about'));

      http.StreamedResponse response = await request.send();
      print(response.statusCode);

      if (response.statusCode == 200) {
        print(await response.stream.bytesToString());
      } else {
        print(response.reasonPhrase);
      }
    } catch (e) {
      print("error");
      print(e.toString());
    }
  }
}
