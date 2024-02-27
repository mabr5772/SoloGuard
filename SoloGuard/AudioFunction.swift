//
//  AudioFunction.swift
//  SoloGuard
//
//  Created by Sam Chen on 2/12/24.
//

import Foundation
import AVFoundation

class AudioPlayerViewModel: ObservableObject {
  var audioPlayer: AVAudioPlayer?

  @Published var isPlaying = false

  init() {
    if let sound = Bundle.main.path(forResource: "AreYouBoredYet", ofType: "mp3") {
      do {
        self.audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: sound))
      } catch {
        print("AVAudioPlayer could not be instantiated.")
      }
    } else {
      print("Audio file could not be found.")
    }
  }

  func playOrPause() {
    guard let player = audioPlayer else { return }

    if player.isPlaying {
      player.pause()
      isPlaying = false
    } else {
      player.play()
      isPlaying = true
    }
  }
}

//var player: AVAudioPlayer?
//
//func playSong(fileName: String) {
//    guard let url = Bundle.main.url(forResource: fileName, withExtension: ".mp3") else {
//        print("Unable to find file")
//        return
//    }
//
//    do {
//        let player = try AVAudioPlayer(contentsOf: url)
//        player.prepareToPlay()
//        player.play()
//    } catch let error {
//        print("Error playing mp3 file: \(error.localizedDescription)")
//    }
//}
