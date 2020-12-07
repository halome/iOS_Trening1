//
//  DetailsViewController.swift
//  Tutorial3_Navigation
//
//  Created by rafał.łowczy on 30/11/2020.
//

import UIKit
import AVKit

enum PlayerState {
    case stop, play
}

class DetailsViewController: UIViewController {
    var user: User
    var detailsView: DetailsView
    var player: AVPlayer
    var playerState: PlayerState = .stop {
        didSet {
            detailsView.updateButtons(state: playerState)
        }
    }
    
    init(user: User) {
        self.detailsView = DetailsView()
        self.user = user
        self.player = AVPlayer(url: URL(string: "https://multiplatform-f.akamaihd.net/i/multi/will/bunny/big_buck_bunny_,640x360_400,640x360_700,640x360_1000,950x540_1500,.f4v.csmil/master.m3u8")!)
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }


    override func viewDidLoad() {
        super.viewDidLoad()
        title = user.name
        setupView()
        setupButtons()
        addPlayer(to: detailsView.firstHalf)
    }
    
    func setupView() {
        view.addSubview(detailsView)
        detailsView.pin()
    }
    
    func setupButtons() {
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Back", style: .plain, target: self, action: #selector(backAction))
        
        detailsView.playButton.addTarget(self, action: #selector(onPlayerTogglePress), for: .touchUpInside)
    }
    
    func addPlayer(to superView: UIView) {
        let playerView = VideoPlayerView(player: player)
        superView.addSubview(playerView)
        
        playerView.snp.makeConstraints { (make) in
            make.size.equalTo(superView)
            make.centerY.equalTo(superView)
        }
    }
    
    @objc func onPlayerTogglePress() {
        if(playerState == .play){
            self.player.pause()
        } else {
            self.player.play()
        }
        playerState = playerState == .play ? .stop : .play
    }
    
    @objc func backAction(){
        player.pause()
        navigationController?.popViewController(animated: true)
    }
}
