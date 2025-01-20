import 'package:flutter/material.dart';
import 'package:flutter_ui_designs/Dictionary%20App/dictionary_colors.dart';
import 'package:flutter_ui_designs/Dictionary%20App/dictionary_model.dart';
import 'package:flutter_ui_designs/Dictionary%20App/dictionary_services.dart';

class DictionaryHomePage extends StatefulWidget {
  const DictionaryHomePage({super.key});

  @override
  State<DictionaryHomePage> createState() => _DictionaryHomePageState();
}

class _DictionaryHomePageState extends State<DictionaryHomePage> {
  DictionaryModel? dictionaryModel;
  bool isLoading = false;
  String noDataFound = "No words found in Dictionary";
  final TextEditingController textController = TextEditingController();

  searchWord(String word) async {
    setState(() {
      isLoading = true;
    });
    try {
      dictionaryModel = await DictionaryAPIServices.fetchData(word);
      setState(() {});
    } catch (e) {
      dictionaryModel = null;
      noDataFound = "Meaning can't be found";
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Words in Dictionary"),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            SearchBar(
              hintText: "Enter Words to search",
              trailing: [
                Icon(
                  Icons.search_rounded,
                  size: 30,
                  color: buttonColor,
                ),
              ],
              onSubmitted: (value) {
                searchWord(value);
              },
            ),
            SizedBox(height: 15),
            if (isLoading)
              const LinearProgressIndicator()
            else if (dictionaryModel != null)
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 15),
                    Text(
                      dictionaryModel!.word,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                        color: buttonColor,
                      ),
                    ),
                    Text(
                      dictionaryModel!.phonetics.isNotEmpty
                          ? dictionaryModel!.phonetics[0].text ?? ""
                          : "",
                      style: TextStyle(color: descriptionColor),
                    ),
                    SizedBox(height: 15),
                    Expanded(
                      child: ListView.builder(
                        itemCount: dictionaryModel!.meanings.length,
                        itemBuilder: ((context, index) {
                          return showMeaning(
                            dictionaryModel!.meanings[index],
                          );
                        }),
                      ),
                    ),
                  ],
                ),
              )
            else
              Center(
                child: Text(
                  noDataFound,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: headingColor,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  showMeaning(Meaning meaning) {
    String wordDefinition = "";
    for (var element in meaning.definitions) {
      int index = meaning.definitions.indexOf(element);
      wordDefinition = "\n${index}:- ${element.definition}\n";
    }
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Material(
        elevation: 4,
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                meaning.partOfSpeech,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.blue,
                ),
              ),
              Text(
                "Definition:-",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: headingColor,
                  fontSize: 16,
                ),
              ),
              Text(
                wordDefinition,
                style: TextStyle(
                  color: descriptionColor,
                  fontSize: 14,
                  height: 1.5,
                ),
              ),
              wordRelation("Synonyms", meaning.synonyms),
              wordRelation("Antonyms", meaning.antonyms),
            ],
          ),
        ),
      ),
    );
  }

  wordRelation(String title, List<String>? setList) {
    if (setList?.isNotEmpty ?? false) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "$title: ",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.green,
            ),
          ),
          Text(
            setList!.toSet().toString().replaceAll("{", "").replaceAll("}", ""),
            style: const TextStyle(
              fontSize: 16,
            ),
          ),
          SizedBox(height: 10),
        ],
      );
    } else {
      return SizedBox();
    }
  }
}
