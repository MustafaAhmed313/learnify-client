import 'package:bloc/bloc.dart';
import 'package:carousel_slider/carousel_controller.dart';
import 'package:meta/meta.dart';

part 'carousel_state.dart';

class CarouselCubit extends Cubit<CarouselState> {
  CarouselCubit() : super(CarouselInitial());
  int currentIndex = 0;
   final CarouselSliderController carouselController =
      CarouselSliderController();
  void onPageChange(int index) {
    currentIndex = index;
    emit(CarouselOnPageChange());
  }

  
}
