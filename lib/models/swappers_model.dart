class Swap {
  final String name;
  final String imageUrl;
  final int id;
  final String price;

  const Swap({
    required this.price,
    required this.id,
    required this.imageUrl,
    required this.name,
  });
}

const allSwappers = [
  Swap(
      id: 1,
      imageUrl: 'assets/images/p1.jpeg',
      name: 'Andy Rusell',
      price: '500.00'),
  Swap(
      id: 2,
      imageUrl: 'assets/images/p2.jpeg',
      name: 'Jack Vowel',
      price: '733.00'),
  Swap(
      id: 3,
      imageUrl: 'assets/images/p3.jpeg',
      name: 'Val Bouten',
      price: '608.00'),
  Swap(
      id: 4,
      imageUrl: 'assets/images/p4.jpeg',
      name: 'Leo Mandara',
      price: '534.00'),
  Swap(
      id: 5,
      imageUrl: 'assets/images/p5s.jpeg',
      name: 'Nine Tail',
      price: '934.00'),
  Swap(
      id: 6,
      imageUrl: 'assets/images/p6.jpeg',
      name: 'Jeff Jet',
      price: '400.00'),
  Swap(
      id: 7,
      imageUrl: 'assets/images/p7.png',
      name: 'Wonder Hero',
      price: '760.00'),
  Swap(
      id: 8,
      imageUrl: 'assets/images/p8.jpeg',
      name: 'Vin Hock',
      price: '830.00')
];
