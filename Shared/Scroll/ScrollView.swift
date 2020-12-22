//
//  ScrollView.swift
//  OneScreenScroll (iOS)
//
//  Created by Mitsuaki Ihara on 2020/12/22.
//

import SwiftUI

struct ScrollView: View {

    var body: some View {
        List {
            ForEach(1..<10) {_ in
                PlayerView()
                    .listRowInsets(EdgeInsets())
            }
        }
    }
}

struct ScrollView_Previews: PreviewProvider {
    static var previews: some View {
        ScrollView()
    }
}
