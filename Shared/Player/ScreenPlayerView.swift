//
//  ScreenPlayerView.swift
//  OneScreenScroll (iOS)
//
//  Created by Mitsuaki Ihara on 2020/12/23.
//

import AVKit
import SwiftUI

struct ScreenPlayerView: UIViewControllerRepresentable {

    func updateUIViewController(_ controller: UIViewController, context: Context) {

        let assetName = getVideoName()
        let asset = NSDataAsset(name: assetName)
        let videoUrl = URL(fileURLWithPath: NSTemporaryDirectory()).appendingPathComponent("\(assetName).mp4")
        try? asset?.data.write(to: videoUrl, options: [.atomic])
        let playerItem = AVPlayerItem(url: videoUrl)

        let player = AVPlayer(playerItem: playerItem)
        let playerLayer = AVPlayerLayer(player: player)
        playerLayer.frame = controller.view.bounds
        playerLayer.videoGravity = .resizeAspectFill
        playerLayer.zPosition = -1
        controller.modalPresentationStyle = .fullScreen
        controller.view.layer.insertSublayer(playerLayer, at: 0)

        player.play()
    }

    func makeUIViewController(context: Context) -> UIViewController {
        return UIViewController()
    }

    private func getVideoName() -> String {
        switch Int.random(in: 1..<9) {
        case 0...3:
            return "Bee"
        case 3...6:
            return "CatEye"
        default:
            return "CoffeeBeans"
        }
    }
}
