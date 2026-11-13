import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:opinions/router/router_config.dart";

void main(){
  runApp(
    ProviderScope(
      child: MaterialApp.router(
        routerConfig: appRouter,
      ),
    ),
  );
}

