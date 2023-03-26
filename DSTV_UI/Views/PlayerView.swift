//
//  PlayerView.swift
//  LearningWithPOC
//
//  Created by Dipakbhai Valjibhai Makwana on 22/04/22.
//

import SwiftUI
import AVKit

import Combine



class PlayerView: UIView {
    
    var player: AVPlayer? {
        get {
            return playerLayer.player
        }
        set {
            playerLayer.player = newValue
        }
    }
    
    let gravity: PlayerGravity
    
    init(player: AVPlayer, gravity: PlayerGravity) {
        self.gravity = gravity
        super.init(frame: .zero)
        self.player = player
        self.backgroundColor = .black
        setupLayer()
    }
    
    func setupLayer() {
        switch gravity {
        
        case .aspectFill:
            playerLayer.contentsGravity = .resizeAspectFill
            playerLayer.videoGravity = .resizeAspectFill
            
        case .resize:
            playerLayer.contentsGravity = .resize
            playerLayer.videoGravity = .resize
            
        }
    }
        
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var playerLayer: AVPlayerLayer {
        return layer as! AVPlayerLayer
    }
    
    // Override UIView property
    override static var layerClass: AnyClass {
        return AVPlayerLayer.self
    }
}

final class PlayerContainerView: UIViewRepresentable {
    typealias UIViewType = PlayerView
    
    let player: AVPlayer
    let gravity: PlayerGravity
    
    init(player: AVPlayer, gravity: PlayerGravity) {
        self.player = player
        self.gravity = gravity
    }
    
    func makeUIView(context: Context) -> PlayerView {
        return PlayerView(player: player, gravity: gravity)
    }
    
    func updateUIView(_ uiView: PlayerView, context: Context) { }
}


struct VideoPlayerView: View {
    
    //@ObservedObject var model: PlayerViewModel
    
     var videoURL: URL
    
//    init(videoURL: URL) {
//        model = PlayerViewModel(videoURL: videoURL)
//    }
    
    var body: some View {
        
        VideoPlayer(player: AVPlayer(url:  videoURL))
            .frame(height: 300)
        
//        ZStack {
//            VStack {
////                PlayerContainerView(player: model.player, gravity: .resize)
////                    .frame(width: 300, height: 300)
////                    .blur(radius: 3.0)
////                    .clipShape(Circle())
//
//                PlayerContainerView(player: model.player, gravity: .aspectFill)
//                    .frame(height: 200)
//                    .overlay(Color.black.opacity(0.1)
//                    )
//                    .padding()
//                    .border(Color.black, width: 2)
//                    .padding()
//
//                Button(action: {
//                    self.model.isPlaying.toggle()
//                }, label: {
//                    Image(systemName: self.model.isPlaying ? "pause" : "play")
//                        .padding()
//                })
//                    .background(Color.black)
//            }
//        }
        .ignoresSafeArea()
    }
}

/*struct PlayerView: View {
    
    @State var player = AVPlayer()
    var body: some View {
        VideoPlayer(player: AVPlayer(url:  URL(string: "https://bit.ly/swswift")!)) {
            VStack {
                Text("Watermark")
                    .foregroundColor(.black)
                    .background(Color.white.opacity(0.7))
                Spacer()
            }
            .frame(width: 400, height: 300)
        }
    }
}

struct PlayerView_Previews: PreviewProvider {
    static var previews: some View {
        PlayerView()
    }
}
*/
