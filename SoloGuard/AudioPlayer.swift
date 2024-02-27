//
//  AudioView.swift
//  SoloGuardUITests
//
//  Created by Sam Chen on 2/12/24.
//

import SwiftUI
import AVKit
import AVFoundation
import AVFAudio

struct AudioPlayer: View {
    @State var player1: AVAudioPlayer!
    @State var player2: AVAudioPlayer!
    
    let song1 = "cat"
    let song2 = "phone"
    
    @State private var isPlaying1 = false
    @State private var isPlaying2 = false
    
    var body: some View {
        ZStack{
            Color.bg2
                .ignoresSafeArea()
            VStack {
                Image(systemName: "phone.badge.waveform.fill")
                    .font(.system(size: 100))
                    .foregroundColor(.pink)
                    .padding(.bottom)
                HStack {
                    Text("Recording 1")
                        .font(.system(size: 50))
                    Image(systemName: isPlaying1 ? "pause.circle.fill" : "play.circle.fill")
                        .font(.system(size: 50))
                        .onTapGesture {
                            isPlaying1 ? stopSong1() : playSong1()
                        }
                    }
                    .padding(.bottom, 100)
                
                Image(systemName: "phone.badge.waveform.fill")
                    .font(.system(size: 100))
                    .foregroundColor(.pink)
                    .padding(.bottom)
                HStack {
                    Text("Recording 2")
                        .font(.system(size: 50))
                    Image(systemName: isPlaying2 ? "pause.circle.fill" : "play.circle.fill")
                        .font(.system(size: 50))
                        .onTapGesture {
                            isPlaying2 ? stopSong2() : playSong2()
                        }
                    }
            }
        }
        .onAppear {
            setupAudio1()
            setupAudio2()
        }
    }
    
    func setupAudio1() {
        guard let url = Bundle.main.url(forResource: song1, withExtension: "mp3") else {
            print("Error: Couldn't find the audio file \(song1) in the bundle.")
            return
        }
        
        print("File URL \(song1): \(url)")
        
        do {
            player1 = try AVAudioPlayer(contentsOf: url)
            player1?.prepareToPlay()
        } catch let error {
            print("Error: \(error)")
        }
    }
    
    func setupAudio2() {
        guard let url = Bundle.main.url(forResource: song2, withExtension: "mp3") else {
            print("Error: Couldn't find the audio file \(song2) in the bundle.")
            return
        }
        
        print("File URL \(song2): \(url)")
        
        do {
            player2 = try AVAudioPlayer(contentsOf: url)
            player2?.prepareToPlay()
        } catch let error {
            print("Error: \(error)")
        }
    }
    
    func playSong1() {
        player1?.play()
        isPlaying1 = true
    }
    
    func playSong2() {
        player2?.play()
        isPlaying2 = true
    }
    
    func stopSong1() {
        player1?.pause()
        isPlaying1 = false
    }
    
    func stopSong2() {
        player2?.pause()
        isPlaying2 = false
    }
}


#Preview {
    AudioPlayer()
}
