import 'package:flutter/material.dart';

class ReceptionItem extends StatelessWidget {
  final String title;
  final String img;

  const ReceptionItem({super.key, required this.title, required this.img, required calories});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/dish');
      },
      child: Padding(
        padding: const EdgeInsets.all(10.0), // Отступы по 10 со всех сторон
        child: Center(
          child: Column( // Убедились, что Column — дочерний элемент Center
            children: [
              Container(
                height: 400, // Ограничение по высоте
                child: Stack(
                  children: [
                    Column(
                      children: [
                        Container(
                          width: 250,
                          height: 250,
                          clipBehavior: Clip.antiAlias,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage(img),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 100,
                          height: 20,
                          child: Text(
                            title,
                            style: TextStyle(
                              color: Color(0xFF333333),
                              fontSize: 20,
                              fontFamily: 'Arial',
                              fontWeight: FontWeight.w400,
                              height: 1.2,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              // Можно добавить другие виджеты здесь
            ],
          ),
        ),
      ),
    );
  }
}