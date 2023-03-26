//
//  PlayerViewModal.swift
//  LearningWithPOC
//
//  Created by Dipakbhai Valjibhai Makwana on 22/04/22.
//

import Foundation
import AVKit


enum PlayerGravity {
    case aspectFill
    case resize
}
enum PlayerAction {
    case play
    case pause
}



class PlayerViewModel: ObservableObject {

    let player: AVPlayer
    
    init(videoURL: URL) {
        self.player = AVPlayer(playerItem: AVPlayerItem(url: videoURL))
        
    }
    
    @Published var isPlaying: Bool = false {
        didSet {
            if isPlaying {
                play()
            } else {
                pause()
            }
        }
    }
    
    func play() {
        let currentItem = player.currentItem
        if currentItem?.currentTime() == currentItem?.duration {
            currentItem?.seek(to: .zero, completionHandler: nil)
        }
        
        player.play()
    }
    
    func pause() {
        player.pause()
    }
}

