
// play and stop music

import AVFoundation

var audioPlayer: AVAudioPlayer?

class Sounds {
    static var audioPlayer: AVAudioPlayer!
    static var musicPlayer: AVAudioPlayer!

    static func playSound(sound: String, type: String) {
        if let path = Bundle.main.path(forResource: sound, ofType: type) {
           do {
               //Doesn't stop background music
               _ = try? AVAudioSession.sharedInstance().setCategory(AVAudioSession.Category.ambient, mode: .default, options: .mixWithOthers)
               //Load & play sound
               audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
               audioPlayer?.play()
           } catch {
               print("Error playing sound")
           }
        }
    }
    
    static func playMusic(music: String, type: String) {
        if let path = Bundle.main.path(forResource: music, ofType: type) {
           do {
               //Doesn't stop background music
               _ = try? AVAudioSession.sharedInstance().setCategory(AVAudioSession.Category.playback, mode: .default, options: .mixWithOthers)
               //Load & play sound
               musicPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
               musicPlayer?.play()
           } catch {
               print("Error playing sound")
           }
        }
    }
}
