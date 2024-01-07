import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_beats/consts/colors.dart';
import 'package:my_beats/consts/text_styles.dart';
import 'package:my_beats/controllers/player_controller.dart';
import 'package:on_audio_query/on_audio_query.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    PlayerController controller = Get.put(PlayerController());
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: Text(
          'Music App',
          style: TextStyles.headingH1,
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 24),
        child: FutureBuilder<List<SongModel>>(
          future: controller.audioQuery.querySongs(
            ignoreCase: true,
            orderType: OrderType.ASC_OR_SMALLER,
            sortType: null,
            uriType: UriType.EXTERNAL,
          ),
          builder: (context, snapshot) {
            if (snapshot.data == null) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.data!.isEmpty) {
              return Text(
                'No song found',
                style: TextStyles.headingH3,
              );
            } else {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      ListTile(
                        onTap: () {
                          controller.playSong(snapshot.data![index].uri);
                        },
                        leading: Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                          ),
                          child: QueryArtworkWidget(
                            id: snapshot.data![index].id,
                            type: ArtworkType.AUDIO,
                            artworkFit: BoxFit.fill,
                            nullArtworkWidget: Container(
                              height: 50,
                              width: 50,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                gradient: const LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomRight,
                                  colors: [
                                    Color(0xff842ED8),
                                    Color(0xffDB28A9),
                                    Color(0xff9D1DCA),
                                  ],
                                ),
                                borderRadius: BorderRadius.circular(100),
                              ),
                              child: const Icon(
                                Icons.music_note_rounded,
                                color: Colors.white,
                                size: 24,
                              ),
                            ),
                          ),
                        ),
                        title: Text(
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          snapshot.data![index].displayNameWOExt,
                          style: TextStyles.normalText.copyWith(
                            fontWeight: FontWeight.w600,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        subtitle: Text(
                          '${snapshot.data![index].artist}',
                          style: TextStyles.captionText.copyWith(
                            color: Colors.grey,
                          ),
                        ),
                        trailing: Text(
                          '$index',
                          style: TextStyles.captionText.copyWith(
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    ],
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }
}
