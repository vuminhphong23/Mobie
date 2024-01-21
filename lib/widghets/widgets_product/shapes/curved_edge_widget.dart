import 'package:flutter/material.dart';

import 'curved_edge.dart';



class CurvedEdge extends StatelessWidget {
  const CurvedEdge({
    super.key,this.child,
  });

  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return ClipPath(
        clipper: CurvedEdgeCustom(),
        child: child
    );
  }
}
