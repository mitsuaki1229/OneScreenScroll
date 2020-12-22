//
//  PlayerView.swift
//  OneScreenScroll (iOS)
//
//  Created by Mitsuaki Ihara on 2020/12/23.
//

import AVKit
import SwiftUI
import UIKit

struct PlayerView: View {

    private let toPresent = UIHostingController(rootView: AnyView(EmptyView()))
    private let mainBoundsSize: CGSize = UIScreen.main.bounds.size
    private let iconSize: CGFloat = 55.0
    @State private var redraw = "Bee"

    var body: some View {

        ZStack(alignment: .bottomTrailing) {

            Color.purple
                .ignoresSafeArea()

            if (redraw != "Bee") {
                ScreenPlayerView()
                    .transition(.move(edge: .bottom))
                    .frame(width: mainBoundsSize.width, height: mainBoundsSize.height, alignment: .center)
                    .edgesIgnoringSafeArea(.all)
                    .gesture(DragGesture(minimumDistance: 0, coordinateSpace: .local)
                                        .onEnded({ value in
                                            if value.translation.width < 0 {
                                                redraw = "Bee"
                                            }

                                            if value.translation.width > 0 {
                                                redraw = "CatEye"
                                            }
                                            if value.translation.height < 0 {
                                                redraw = "CoffeeBeans"
                                            }

                                            if value.translation.height > 0 {
                                                redraw = "CatEye"
                                            }
                                        }))
            } else {
                ScreenPlayerView()
                    .transition(.move(edge: .bottom))
                    .frame(width: mainBoundsSize.width, height: mainBoundsSize.height, alignment: .center)
                    .edgesIgnoringSafeArea(.all)
                    .gesture(DragGesture(minimumDistance: 0, coordinateSpace: .local)
                                        .onEnded({ value in
                                            if value.translation.width < 0 {
                                                redraw = "Bee"
                                            }

                                            if value.translation.width > 0 {
                                                redraw = "CatEye"
                                            }
                                            if value.translation.height < 0 {
                                                redraw = "CoffeeBeans"
                                            }

                                            if value.translation.height > 0 {
                                                redraw = "CatEye"
                                            }
                                        }))
            }

            VStack(alignment: .center) {
                Button(action: {
                    print("Tap UserIcon.")
                }, label: {
                    Image("UserIcon")
                        .resizable()
                        .frame(width: iconSize, height: iconSize)
                })
                Button(action: {
                    print("Tap Heart.")
                }, label: {
                    Image("Heart")
                        .resizable()
                        .frame(width: iconSize, height: iconSize)
                })
                Button(action: {
                    print("Tap Comment.")
                }, label: {
                    Image("Comment")
                        .resizable()
                        .frame(width: iconSize, height: iconSize)
                })
                Button(action: {
                    print("Tap ShareArrow.")
                }, label: {
                    Image("ShareArrow")
                        .resizable()
                        .frame(width: iconSize, height: iconSize)
                })
                Button(action: {
                    print("Tap CD.")
                }, label: {
                    Image("CD")
                        .resizable()
                        .frame(width: iconSize, height: iconSize)
                })
            }
            .frame(width: iconSize * 1.5, height: iconSize * 6.5)
            
            VStack(alignment: .leading) {
                Text("@TestUser")
                    .foregroundColor(Color.white)
                Text("#test #video #scroll")
                    .foregroundColor(Color.white)
                Text("Paging scroll one screen at a time.")
                    .foregroundColor(Color.white)
            }.frame(width: 200, height: 100)
            .offset(x: -170, y: 0)
        }
    }
}
