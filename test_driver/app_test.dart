import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

void main(){
  group('renew buy app test', (){
    FlutterDriver? driver;

    setUpAll(()async{
      driver = await FlutterDriver.connect();
    });

    tearDownAll((){
      if(driver != null){
        driver!.close();
      }
    });

    var loadingState = find.byType('CustomLoadingWidget');
    // var successState = find.byType('FeedWidget');

    test("App Loading State", () async{
      await driver?.waitForAbsent(loadingState);
    });
    test("App Success State", () async{
      var textField = find.byType('TextField');
      await driver?.tap(textField);
      await driver?.enterText('Transportation');
      await Future.delayed(const Duration(seconds: 2));
      await driver?.enterText('Space Program');
      await Future.delayed(const Duration(seconds: 2));
    });
  });
}