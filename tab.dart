        appBar: AppBar(
                // elevation: 10.0,
                toolbarHeight: 60.0,


                flexibleSpace:Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      // foregroundColor: Colors.transparent,
                      // radius: 70.0,
                      //   backgroundColor: Theme.of(context).indicatorColor,
                      //   foregroundImage: AssetImage(
                      //     'assets/image/ic/logo.png',
                      //   )
                      decoration: BoxDecoration(
                        // color: Theme.of(context).indicatorColor,
                        borderRadius: BorderRadius.circular(100.0),
                        // color: C,
                        image:const DecorationImage(

                          image: AssetImage(
                                'assets/image/ic/logo.png',

                              ),
                          fit:  BoxFit.cover,

                          // filterQuality: FilterQuality.high,
                          colorFilter: ColorFilter.mode(Colors.white,BlendMode.color)
                        )
                      ),
                    height: 100.0,
                      width: 100.0,
                    ),
                  ),
                  ],
                ) ,

                bottom: PreferredSize(

                  preferredSize: Size(
                      220.0,
                    70.0
                  ),
                  child: Container(
                    alignment: Alignment.center,
                    width: 210.0,
                    height: 60.0,
                    child: Stack(
                      children: [
                            AnimatedAlign(
                              duration: const Duration(seconds: 1),
                              curve: Curves.easeInOut,
                              alignment: FractionalOffset(1/(controller.tabs.length -1)*controller.tabIndex.value,0),
                              child: Container(
                                height: 60.0,
                                width: 70.0,
                                alignment: Alignment.bottomCenter,
                                padding: const EdgeInsets.only(top:40.0),
                                decoration: BoxDecoration(
                                    border: Border(
                                        bottom: BorderSide(
                                            color: Theme.of(context).primaryColor,
                                            width: 3.0
                                        ),
                                    ),
                                ),
                                child:Text(
                                  controller.getCurrentTabName(),
                                  style: Theme.of(context).textTheme.titleSmall,
                                ),
                              ),
                            ),
                            Row(
                                mainAxisSize: MainAxisSize.min,
                                children: List.generate(controller.tabs.length, (index) => InkWell(
                                  onTap: ()=>controller.animateToInded(index),
                                  child: AnimatedOpacity(
                                    curve: Curves.easeInOut,
                                    opacity: controller.isActiveTab(index)?1:.5,
                                    duration: const Duration(seconds: 1),
                                    child: SizedBox(
                                      height:60.0,
                                      width: 70.0,

                                      child: AnimatedSlide(
                                        offset:Offset(
                                            0,controller.isActiveTab(index)?-0.2:0.0),
                                        curve: Curves.easeInOut,
                                        duration: const Duration(seconds: 1),
                                        child: controller.tabs[index].icon,
                                      ),
                                    ),
                                  ),
                                ),)
                            ),
                      ],
                    ),
                  ),
                ),

                actions: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0.0,18.0,18.0,0.0),
                    child: Icon(Icons.search),
                  )
                ],
                // leading: Row(
                //   mainAxisSize: MainAxisSize.min,
                //   children: [
                //     CircleAvatar(
                //       backgroundImage: AssetImage('assets/image/ic/logo.png'),
                //     ),
                //     Text('CameSafe',style: Theme.of(context).textTheme.labelSmall,),
                //   ],
                // ),

              ),
        
