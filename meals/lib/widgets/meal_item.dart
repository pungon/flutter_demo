import 'package:flutter/material.dart';

import 'package:meals/models/meal.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:meals/widgets/meal_item_trait.dart';

class MealItem extends StatelessWidget {
  const MealItem({super.key, required this.meal, required this.onSelectMeal});

  final Meal meal;
  final void Function(BuildContext context, Meal meal) onSelectMeal;

  //get child => null;
  String get complexityText {
    return meal.complexity.name[0].toUpperCase() +
        meal.complexity.name.substring(1);
//      ดึงตัวอักษรแรกของชื่อความซับซ้อน (meal.complexity.name[0])
//      ทำให้ตัวอักษรแรกเป็นตัวพิมพ์ใหญ่ (meal.complexity.name[0].toUpperCase())
//      ดึงส่วนที่เหลือของชื่อความซับซ้อน (นับจากตัวอักษรที่ 1 เป็นต้นไป) (meal.complexity.name.substring(1))
  }

  String get affordabilityText {
    return meal.affordability.name[0].toUpperCase() +
        meal.affordability.name.substring(1);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        clipBehavior: Clip.hardEdge, // stack ไม่สนใจรูปร่างที่ตั้งค่าบน card,
        //ใช้การตั้งค่า clipBehavior เพื่อเนื้อหาที่ไม่อยู่ในรูปร่างถูกตัดออก
        elevation: 4,
        child: InkWell(
          onTap: () {
            onSelectMeal(context, meal);
          },
          child: Stack(
            children: [
              FadeInImage(
                placeholder: MemoryImage(kTransparentImage),
                image: NetworkImage(meal.imageUrl),
                fit: BoxFit.cover,
                height: 200,
                width: double.infinity,
              ),
              Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  // top: 100,
                  child: Container(
                    color: Colors.black54,
                    padding:
                        const EdgeInsets.symmetric(horizontal: 44, vertical: 6),
                    child: Column(
                      children: [
                        Text(
                          meal.title,
                          maxLines: 2,
                          textAlign: TextAlign.center,
                          softWrap: true,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white), // very long text...
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            MealItemTrait(
                              icon: Icons.schedule,
                              //label: '${meal.duration} min',
                              label: '${meal.duration} min',
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            MealItemTrait(
                              icon: Icons.work,
                              label: complexityText,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            MealItemTrait(
                              icon: Icons.attach_money,
                              label: affordabilityText,
                            ),
                          ],
                        )
                      ],
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
