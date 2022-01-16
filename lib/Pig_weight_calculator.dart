// ignore_for_file: avoid_print
import 'dart:math';

class Game {
  double calWeight(double girth, double length) {
    var weight;
    weight = (girth / 100) * (girth / 100) * (length / 100) * 69.3;
    return weight;
  }

  double calPrice(double weight) {
    var price;
    price = weight*112.50;
    return price;
  }
}