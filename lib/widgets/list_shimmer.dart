import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ListShimmerWidget extends StatelessWidget {
  const ListShimmerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 4,
      itemBuilder: (context, index) => Stack(
        children: [
          Shimmer.fromColors(
            baseColor: Colors.black38,
            highlightColor: Colors.black26,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: ShapeDecoration(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0)),
                    color: Colors.white),
                // color: Colors.grey,
                height: 70,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
