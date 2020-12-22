//
//  ContentView.swift
//  OneScreenScroll
//
//  Created by Mitsuaki Ihara on 2020/12/22.
//

import SwiftUI

struct ContentView: View {

    @State private var orientation = UIDevice.current.orientation

    private let orientationChanged = NotificationCenter.default.publisher(for: UIDevice.orientationDidChangeNotification)
        .makeConnectable()
        .autoconnect()

    var body: some View {
        Group {
            if orientation.isLandscape {
                PlayerView()
                    .edgesIgnoringSafeArea(.all)
            } else {
                PlayerView()
                    .edgesIgnoringSafeArea(.all)
            }
        }.onReceive(orientationChanged) { _ in
            self.orientation = UIDevice.current.orientation
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
