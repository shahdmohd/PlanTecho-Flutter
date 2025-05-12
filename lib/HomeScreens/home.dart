import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreen();
}

class _HomeScreen extends State<HomeScreen> {
  late TextEditingController _searchTextController;
  late FocusNode _searchFocusNode;

  @override
  void initState() {
    super.initState();
    _searchTextController = TextEditingController();
    _searchFocusNode = FocusNode();
  }

  @override
  void dispose() {
    _searchTextController.dispose();
    _searchFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          automaticallyImplyLeading: false,
          leading: Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(10, 0, 0, 10),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(22),
              child: Image.network(
                'https://images.unsplash.com/photo-1545830790-68595959c491?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0NTYyMDF8MHwxfHNlYXJjaHwxNXx8ZmFybWVyfGVufDB8fHx8MTc0MzgwNjYzMHww&ixlib=rb-4.0.3&q=80&w=1080',
                width: 284.8,
                height: 200,
                fit: BoxFit.cover,
              ),
            ),
          ),
          title: Align(
            alignment: AlignmentDirectional(-1, 0),
            child: Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
              child: Text(
                'Hello Shahd !',
                style: GoogleFonts.enriqueta(
                  color: const Color(0xFF026500),
                  fontSize: 20,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 20, 10),
              child: Icon(
                Icons.notifications_rounded,
                color: const Color(0xFF0AAD0A),
                size: 30,
              ),
            ),
          ],
          centerTitle: false,
          elevation: 0,
        ),
        body: SafeArea(
          top: true,
          child: Align(
            alignment: const AlignmentDirectional(5, 0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                    child: SizedBox(
                      width: 350,
                      child: TextFormField(
                        controller: _searchTextController,
                        focusNode: _searchFocusNode,
                        autofocus: false,
                        obscureText: false,
                        decoration: InputDecoration(
                          isDense: true,
                          labelStyle: GoogleFonts.inter(),
                          hintText: 'Search...',
                          hintStyle: GoogleFonts.inter(),
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Color(0x00000000),
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Color(0x00000000),
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Theme.of(context).colorScheme.error,
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Theme.of(context).colorScheme.error,
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          filled: true,
                          fillColor: const Color(0xFFCCF1CC),
                        ),
                        style: GoogleFonts.inter(),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(14),
                    child: Container(
                      width: 350,
                      height: 54.8,
                      decoration: BoxDecoration(
                        color: const Color(0xFFCCF1CC),
                        borderRadius: BorderRadius.circular(14),
                      ),
                      child: Align(
                        alignment: AlignmentDirectional(0, -1),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container(
                              width: 175,
                              height: 60,
                              decoration: BoxDecoration(
                                color: const Color(0xFF0AAD0A),
                                borderRadius: BorderRadius.circular(14),
                              ),
                              child: Align(
                                alignment: AlignmentDirectional(0, 0),
                                child: Text(
                                  'Crop Care',
                                  style: GoogleFonts.enriqueta(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              width: 170.8,
                              height: 60,
                              decoration: BoxDecoration(
                                color: const Color(0xFFCCF1CC),
                                borderRadius: BorderRadius.circular(24),
                              ),
                              child: Align(
                                alignment: AlignmentDirectional(0, 0),
                                child: Text(
                                  'AI Tools',
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.enriqueta(
                                    color: const Color(0xFF026500),
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  ListView(
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(14),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container(
                              width: 150,
                              height: 150,
                              decoration: BoxDecoration(
                                color: const Color(0xFF0AAD0A),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(8),
                                    child: Image.network(
                                      'https://images.unsplash.com/photo-1582284540020-8acbe03f4924?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0NTYyMDF8MHwxfHNlYXJjaHwyfHx0b21hdG98ZW58MHx8fHwxNzQzNzc5ODUxfDA&ixlib=rb-4.0.3&q=80&w=1080',
                                      width: 160,
                                      height: 113.4,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      print('Button pressed ...');
                                    },
                                    child: Text(
                                      'Tomato',
                                      style: GoogleFonts.interTight(
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              width: 150,
                              height: 150,
                              decoration: BoxDecoration(
                                color: const Color(0xFF0AAD0A),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(8),
                                    child: Image.network(
                                      'https://images.unsplash.com/photo-1518977676601-b53f82aba655?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0NTYyMDF8MHwxfHNlYXJjaHwxfHxwb3RhdG98ZW58MHx8fHwxNzQzNzc5OTQzfDA&ixlib=rb-4.0.3&q=80&w=1080',
                                      width: 160,
                                      height: 113.4,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      print('Button pressed ...');
                                    },
                                    child: Text(
                                      'Potato',
                                      style: GoogleFonts.interTight(
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(14),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container(
                              width: 150,
                              height: 150,
                              decoration: BoxDecoration(
                                color: const Color(0xFF0AAD0A),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(8),
                                    child: Image.network(
                                      'https://images.unsplash.com/photo-1449300079323-02e209d9d3a6?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0NTYyMDF8MHwxfHNlYXJjaHwxfHxDdWN1bWJlcnxlbnwwfHx8fDE3NDM3ODA1MzF8MA&ixlib=rb-4.0.3&q=80&w=1080',
                                      width: 160,
                                      height: 113.4,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      print('Button pressed ...');
                                    },
                                    child: Text(
                                      'Cucumber',
                                      style: GoogleFonts.interTight(
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              width: 150,
                              height: 150,
                              decoration: BoxDecoration(
                                color: const Color(0xFF0AAD0A),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(8),
                                    child: Image.network(
                                      'https://images.unsplash.com/photo-1590868309235-ea34bed7bd7f?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0NTYyMDF8MHwxfHNlYXJjaHwyMXx8VmVnZXRhYmxlcyUyMHxlbnwwfHx8fDE3NDM3ODA1Njh8MA&ixlib=rb-4.0.3&q=80&w=1080',
                                      width: 160,
                                      height: 113.4,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      print('Button pressed ...');
                                    },
                                    child: Text(
                                      'Carrot',
                                      style: GoogleFonts.interTight(
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(14),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container(
                              width: 150,
                              height: 150,
                              decoration: BoxDecoration(
                                color: const Color(0xFF0AAD0A),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(8),
                                    child: Image.network(
                                      'https://images.unsplash.com/photo-1560252030-9fc63cb78dac?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0NTYyMDF8MHwxfHNlYXJjaHw4fHxiZWFuc3xlbnwwfHx8fDE3NDM4OTgzODB8MA&ixlib=rb-4.0.3&q=80&w=1080',
                                      width: 160,
                                      height: 113.4,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      print('Button pressed ...');
                                    },
                                    child: Text(
                                      'Fassolia',
                                      style: GoogleFonts.interTight(
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              width: 150,
                              height: 150,
                              decoration: BoxDecoration(
                                color: const Color(0xFF0AAD0A),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(8),
                                    child: Image.network(
                                      'https://images.unsplash.com/photo-1608737637507-9aaeb9f4bf30?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0NTYyMDF8MHwxfHNlYXJjaHwxMHx8cGVwcGVyfGVufDB8fHx8MTc0Mzg5ODQ2NXww&ixlib=rb-4.0.3&q=80&w=1080',
                                      width: 160,
                                      height: 113.4,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      print('Button pressed ...');
                                    },
                                    child: Text(
                                      'Pepper',
                                      style: GoogleFonts.interTight(
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(14),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container(
                              width: 150,
                              height: 150,
                              decoration: BoxDecoration(
                                color: const Color(0xFF0AAD0A),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(8),
                                    child: Image.network(
                                      'https://images.unsplash.com/photo-1560806887-1e4cd0b6cbd6?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0NTYyMDF8MHwxfHNlYXJjaHw2fHxBcHBsZXxlbnwwfHx8fDE3NDM4OTg1NTl8MA&ixlib=rb-4.0.3&q=80&w=1080',
                                      width: 160,
                                      height: 113.4,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      print('Button pressed ...');
                                    },
                                    child: Text(
                                      'Apple',
                                      style: GoogleFonts.interTight(
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              width: 150,
                              height: 150,
                              decoration: BoxDecoration(
                                color: const Color(0xFF0AAD0A),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(8),
                                    child: Image.network(
                                      'https://images.unsplash.com/photo-1611080626919-7cf5a9dbab5b?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0NTYyMDF8MHwxfHNlYXJjaHw2fHxvcmFuZ2V8ZW58MHx8fHwxNzQzODk4NTg5fDA&ixlib=rb-4.0.3&q=80&w=1080',
                                      width: 160,
                                      height: 113.4,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      print('Button pressed ...');
                                    },
                                    child: Text(
                                      'Orange',
                                      style: GoogleFonts.interTight(
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
// import 'package:flutter/material.dart';

// class HomeScreen extends StatelessWidget {
//   const HomeScreen({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: SafeArea(
//         child: Column(
//           children: [
//             // Top section with profile and leaf icon
//             Padding(
//               padding: const EdgeInsets.all(20.0),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Row(
//                     children: [
//                       CircleAvatar(
//                         radius: 26,
//                         backgroundImage: NetworkImage('https://dashboard.codeparrot.ai/api/image/Z8kxQ7wkNXOiaV99/image-4.png'),
//                       ),
//                       const SizedBox(width: 10),
//                       const Text(
//                         'Hello,\nShahd!',
//                         style: TextStyle(
//                           color: Color(0xFF0AAD0A),
//                           fontSize: 16,
//                           fontFamily: 'Enriqueta',
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                     ],
//                   ),
//                   Image.network(
//                     'https://dashboard.codeparrot.ai/api/image/Z8kxQ7wkNXOiaV99/leaves-o.png',
//                     width: 32,
//                     height: 32,
//                   ),
//                 ],
//               ),
//             ),

//             // Search bar
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 13.0),
//               child: Container(
//                 height: 32,
//                 decoration: BoxDecoration(
//                   color: const Color(0x339EEF9E),
//                   borderRadius: BorderRadius.circular(30),
//                 ),
//                 child: const TextField(
//                   decoration: InputDecoration(
//                     hintText: 'Search...',
//                     hintStyle: TextStyle(
//                       color: Color(0x70000000),
//                       fontSize: 10,
//                       fontFamily: 'Enriqueta',
//                     ),
//                     contentPadding: EdgeInsets.symmetric(horizontal: 20),
//                     border: InputBorder.none,
//                   ),
//                 ),
//               ),
//             ),

//             const SizedBox(height: 20),

//             // Crop Care and AI Tools buttons
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 20.0),
//               child: Row(
//                 children: [
//                   Expanded(
//                     child: ElevatedButton(
//                       onPressed: () {},
//                       style: ElevatedButton.styleFrom(
//                         backgroundColor: const Color(0xFF0AAD0A),
//                         padding: const EdgeInsets.symmetric(vertical: 15),
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(10),
//                         ),
//                       ),
//                       child: const Text(
//                         'Crop Care',
//                         style: TextStyle(
//                           fontSize: 16,
//                           fontFamily: 'Enriqueta',
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                     ),
//                   ),
//                   const SizedBox(width: 10),
//                   Expanded(
//                     child: TextButton(
//                       onPressed: () {},
//                       style: TextButton.styleFrom(
//                         backgroundColor: const Color(0x2EF7F7F7),
//                         padding: const EdgeInsets.symmetric(vertical: 15),
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(10),
//                         ),
//                       ),
//                       child: const Text(
//                         'AI Tools',
//                         style: TextStyle(
//                           color: Colors.black,
//                           fontSize: 16,
//                           fontFamily: 'Enriqueta',
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),

//             const SizedBox(height: 20),

//             // Grid of crops
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 20.0),
//               child: Column(
//                 children: [
//                   Row(
//                     children: [
//                       _buildCropCard(
//                         'Tomato',
//                         'https://dashboard.codeparrot.ai/api/image/Z8kxQ7wkNXOiaV99/image.png',
//                       ),
//                       const SizedBox(width: 10),
//                       _buildCropCard(
//                         'Potato',
//                         'https://dashboard.codeparrot.ai/api/image/Z8kxQ7wkNXOiaV99/image-3.png',
//                       ),
//                     ],
//                   ),
//                   const SizedBox(height: 10),
//                   Row(
//                     children: [
//                       _buildCropCard(
//                         'Cucumber',
//                         'https://dashboard.codeparrot.ai/api/image/Z8kxQ7wkNXOiaV99/image-2.png',
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ),

//             const Spacer(),

//             // Bottom navigation
//             Container(
//               padding: const EdgeInsets.symmetric(vertical: 10),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 children: [
//                   Image.network('https://dashboard.codeparrot.ai/api/image/Z8kxQ7wkNXOiaV99/home-26-d.png', width: 30, height: 30),
//                   Image.network('https://dashboard.codeparrot.ai/api/image/Z8kxQ7wkNXOiaV99/monitori.png', width: 30, height: 30),
//                   Image.network('https://dashboard.codeparrot.ai/api/image/Z8kxQ7wkNXOiaV99/add-circ.png', width: 50, height: 50),
//                   const Icon(Icons.notifications_outlined, color: Color(0xFF9EEF9E), size: 30),
//                   Image.network('https://dashboard.codeparrot.ai/api/image/Z8kxQ7wkNXOiaV99/person-2.png', width: 30, height: 30),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildCropCard(String title, String imageUrl) {
//     return Expanded(
//       child: Container(
//         height: 153,
//         decoration: BoxDecoration(
//           color: const Color(0x2E9EEF9E),
//           borderRadius: BorderRadius.circular(10),
//         ),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             ClipRRect(
//               borderRadius: BorderRadius.circular(10),
//               child: Image.network(
//                 imageUrl,
//                 width: 111,
//                 height: 111,
//                 fit: BoxFit.cover,
//               ),
//             ),
//             const SizedBox(height: 5),
//             Text(
//               title,
//               style: const TextStyle(
//                 fontSize: 16,
//                 fontFamily: 'Enriqueta',
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

