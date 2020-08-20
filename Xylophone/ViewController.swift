

import UIKit
import AVFoundation

class ViewController: UIViewController {
                                        
    var player: AVAudioPlayer!

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func keyPressed(_ sender: UIButton) {
//        let buttonName = sender.titleLabel?.text ?? "unknown"
        let buttonName = sender.currentTitle!
        playSound(buttonName: buttonName)
        let color = sender.backgroundColor
        sender.backgroundColor = color!.withAlphaComponent(0.5)
        
        //timer to reset the alpha value
        _ = Timer.scheduledTimer(withTimeInterval: 0.2, repeats: false) { timer in
              sender.backgroundColor = color!.withAlphaComponent(1)
        }
    }
    
    func playSound(buttonName: String) {
        
        let url = Bundle.main.url(forResource: buttonName, withExtension: "wav")
        player = try! AVAudioPlayer(contentsOf: url!)
        player.play()
                
    }

}
