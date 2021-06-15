import 'package:flutter/material.dart';
import 'package:prova_animais/Pages/AnimalsPage.dart';
import '../mockdata/mockdata.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Color(0xFF303030),
      appBar: AppBar(
        title: Text('Classes de Animais'),
        backgroundColor: Color(0xFF212121)
      ),
      body: Container(
        padding: EdgeInsets.all(24),
        child: ListView.builder(
          itemCount: animalsClassList.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => AnimalsPage(animalClass: animalsClassList[index]),
                  )
                );
              },

              child: Card(
                elevation: 3,
                color: Color(0xFF616161),
                clipBehavior: Clip.antiAlias,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                child: Container(
                  height: 200,
                  child: Column(children: [
                    Image.network(
                      animalsClassList[index].image,
                      fit: BoxFit.cover,
                      width: 400,
                      height: 150,
                    ),
                    Padding(padding: const EdgeInsets.all(6)),
                    Expanded(child: Text(
                      animalsClassList[index].nameSpecie,
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: 20,
                        letterSpacing: 2
                      ),
                    ))
                  ],),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

}