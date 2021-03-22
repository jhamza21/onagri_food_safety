import 'package:http/http.dart' as http;
import 'package:onagri/models/article.dart';
import 'dart:convert';

import 'package:onagri/secret.dart';

class News {
  List<Article> news = [];

//   Future<void> getNews() async {
//     String url =
//         "https://newsapi.org/v2/top-headlines?country=in&excludeDomains=stackoverflow.com&sortBy=publishedAt&language=en&apiKey=$apiKey";

//     var response = await http.get(url);

//     var jsonData = jsonDecode(response.body);

//     if (jsonData['status'] == "ok") {
//       jsonData["articles"].forEach((element) {
//         if (element['urlToImage'] != null && element['description'] != null) {
//           Article article = Article(
//             title: element['title'],
//             author: element['author'],
//             description: element['description'],
//             urlToImage: element['urlToImage'],
//             publshedAt: DateTime.parse(element['publishedAt']),
//             content: element["content"],
//             articleUrl: element["url"],
//           );
//           news.add(article);
//         }
//       });
//     }
//   }
// }

  Future<void> getNews() async {
    //article 1
    Article article = Article(
      title: 'FLASH SUR LA FILIÈRE AVICOLE (JANVIER 2021)',
      author: 'Mme Yosra DOUIREL',
      description:
          'Après une hausse continue durant le mois dernier, les prix à la production de poulets de chairs continuent à s’élever durant la deuxième quinzaine du mois de septembre',
      urlToImage: 'article_1.png',
      publshedAt: DateTime.parse('2020-02-03'),
      content: "content",
      articleUrl: "url",
    );
    news.add(article);

    //article 2
    Article article2 = Article(
      title: 'Oléiculture',
      author: 'Mme Yosra DOUIREL',
      description:
          "Exportations de l'huile d'olive tunisienne (1509) au cours du mois de novembre 2020",
      urlToImage: 'article_2.png',
      publshedAt: DateTime.parse('2020-02-03'),
      content: "content",
      articleUrl: "url",
    );
    news.add(article2);

    //article 3
    Article article3 = Article(
      title: 'PRODUITS AGRICOLES DE TERROIR',
      author: 'Mme Yosra DOUIREL',
      description:
          "Les Figues de Djebba AOC, patrimoine culturel vecteur de valorisation de l’activité agricole des Djebbaois",
      urlToImage: 'article_3.png',
      publshedAt: DateTime.parse('2020-02-03'),
      content: "content",
      articleUrl: "url",
    );
    news.add(article3);

    //article 4
    Article article4 = Article(
      title: '4 لمحة حول تطور صادرات التمور في تونس',
      author: 'Mme Yosra DOUIREL',
      description:
          "يحتل قطاع التمور المركز الثاني في سلم صادرات المنتجات الفالحية في تونس بعد زيت الزيتون حيث ساهم سنة 2019 بنسبة 3,18 %من القيمة الجملية للصادرات الفالحية والغذائية.",
      urlToImage: 'article_4.jpg',
      publshedAt: DateTime.parse('2020-02-03'),
      content: "content",
      articleUrl: "url",
    );
    news.add(article4);
  }
}

class NewsForCategorie {
  List<Article> news = [];

  Future<void> getNewsForCategory(String category) async {
    /*String url = "http://newsapi.org/v2/everything?q=$category&apiKey=${apiKey}";*/
    String url =
        "https://newsapi.org/v2/top-headlines?country=in&category=$category&apiKey=$apiKey";

    var response = await http.get(url);

    var jsonData = jsonDecode(response.body);

    if (jsonData['status'] == "ok") {
      jsonData["articles"].forEach((element) {
        if (element['urlToImage'] != null && element['description'] != null) {
          Article article = Article(
            title: element['title'],
            author: element['author'],
            description: element['description'],
            urlToImage: element['urlToImage'],
            publshedAt: DateTime.parse(element['publishedAt']),
            content: element["content"],
            articleUrl: element["url"],
          );
          news.add(article);
        }
      });
    }
  }
}
