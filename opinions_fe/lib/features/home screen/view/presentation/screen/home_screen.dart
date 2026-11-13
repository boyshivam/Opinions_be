import "package:flutter/material.dart";
import "package:opinions/features/home%20screen/data/dummy_posts.dart";
import "package:opinions/features/home%20screen/enums/bottom_navbar_enums.dart";
import "package:opinions/features/home%20screen/view/presentation/widgets/bottom_nav_bar.dart";
import "package:opinions/features/home%20screen/view/presentation/widgets/posts_viewer.dart";

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      extendBody: true,
      body: Container(
        constraints: BoxConstraints.expand(),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFFf5f6f7),
              Color(0xFFe8d8f2),
              Color(0xFFf5f6f7),],
            begin: Alignment.topLeft, end: Alignment.bottomRight
          ),
        ),
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.fromLTRB(
                  25,
                  MediaQuery.of(context).padding.top + 12,
                  25,
                  20,
                ),
                child: Column(
                  children: [
                    // header section
                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                      decoration: BoxDecoration(
                        color: Colors.white.withValues(alpha: 0.4),
                        borderRadius: BorderRadius.circular(16),

                      ),
                      child: Row(
                        children: [
                          Icon(Icons.menu),
                          Align(
                            alignment: Alignment.center,
                            child: Text(
                              "Opinions",
                              style: TextStyle(color: Colors.deepPurple,         decoration: TextDecoration.none,
                                fontSize: 22
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    // posts 
                    PostsViewer(posts: dummyPosts, parentHeight: constraints.maxHeight,)
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
