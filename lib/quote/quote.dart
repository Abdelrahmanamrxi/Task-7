




class Quote {
  String quote ;
  String author;
  String category;

  Quote ({
    required this.quote,
    required this.author,
    required this.category,
  });


  // Translate from Mao to Object

factory Quote.fromJeson(Map <String, dynamic> jeson){

  return Quote(
      quote: jeson["quote"],
      author: jeson["author"],
      category: jeson["category"]);

}

}