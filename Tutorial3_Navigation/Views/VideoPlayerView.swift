//
//  VideoPlayerView.swift
//  Tutorial3_Navigation
//
//  Created by rafał.łowczy on 07/12/2020.
//

import UIKit
import AVKit

class VideoPlayerView: UIView {
    var player: AVPlayer? {
        get {
            return playerLayer.player
        }

        set {
            playerLayer.player = newValue
        }
    }

    var playerLayer: AVPlayerLayer {
        return layer as! AVPlayerLayer
    }

    override class var layerClass: AnyClass {
        return AVPlayerLayer.self
    }
    
    init(player: AVPlayer) {
        super.init(frame: .zero)
        self.player = player
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
