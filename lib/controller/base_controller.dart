
import 'package:ecommerce/enums/view_state.dart';
import 'package:get/get.dart';

class BaseController extends GetxController{
  final _state = ViewState.idle.obs;

  ViewState get state => _state.value;

  setState(ViewState state){
  _state.value = state;
  }
}