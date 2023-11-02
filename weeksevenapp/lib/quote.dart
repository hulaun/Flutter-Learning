
class Quote {
  String? quoteStatement;
  String? author;
  Quote({this.quoteStatement, this.author});
  Quote.fromJson(Map<String, dynamic> json){
    quoteStatement=json['quoteStatement'];
    author = json['author'];
  }
}