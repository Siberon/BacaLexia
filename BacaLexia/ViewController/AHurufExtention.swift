//
//  AHurufExtention.swift
//  BacaLexia
//
//  Created by Muhammad Tafani Rabbani on 13/11/20.
//

import Foundation
import UIKit
import Speech
import AVFoundation

extension AhurufViewController{
    func requestTranscribePermissions() {
        
//        SFSpeechRecognizer.requestAuthorization { authStatus in
//            DispatchQueue.main.async {
//                if authStatus == .authorized {
//                    let locale = NSLocale(localeIdentifier: "fr_FR")
//                    let sf = SFSpeechRecognizer(locale: locale as Locale)
//                    self.speechRequest = SFSpeechAudioBufferRecognitionRequest()
//                    sf?.recognitionTask(with: self.speechRequest!, delegate: self)
//
//                } else {
//                    print("Transcription permission was declined.")
//                }
//            }
//        }
    }
    
    private func requestPermissions() {
        //
        // Do not forget to add `NSMicrophoneUsageDescription` and `NSSpeechRecognitionUsageDescription` to `Info.plist`
        //
        
        // Request recording permission
        AVAudioSession.sharedInstance().requestRecordPermission { allowed in
            if allowed {
                // Request speech recognition authorization
                SFSpeechRecognizer.requestAuthorization { status in
                    switch status {
                    case .authorized: self.prepareSpeechRecognition()
                    case .notDetermined, .denied, .restricted: print("SFSpeechRecognizer authorization status: \(status).")
                    @unknown default:
                        print("def")
                    }
                }
                
            } else {
                print("AVAudioSession record permission: \(allowed).")
            }
        }
    }
    
    @objc func hurufImageLongTapped(){
        requestPermissions()
    }
    
    
    private func prepareSpeechRecognition() {
        
        let locale = NSLocale(localeIdentifier: "id_ID")
        recognizer = SFSpeechRecognizer(locale: locale as Locale)
        request = SFSpeechAudioBufferRecognitionRequest()
        // Check if recognizer is available (has failable initializer)
        guard let recognizer = recognizer else {
            print("SFSpeechRecognizer not supported.")
            return
        }

        // Prepare recognition task
        recognizer.recognitionTask(with: request) { (result, error) in
            if let result = result {
                self.engine.stop()
                print("SFSpeechRecognizer result: \(result.bestTranscription.formattedString)")
                self.stringListen = result.bestTranscription.formattedString
                print(self.stringListen[0])
                if self.stringListen[0] == self.huruf{
                    
                    self.benar()
                }
                
            } else {
                print("SFSpeechRecognizer error: \(String(describing: error))")
            }
        }

        // Install tap to audio engine input node
        let inputNode = engine.inputNode
        let busNumber = 0
        let recordingFormat = inputNode.outputFormat(forBus: busNumber)
        inputNode.installTap(onBus: busNumber, bufferSize: 1024, format: recordingFormat) { buffer, time in
            self.request.append(buffer);
        }

        // Prepare and start audio engine
        engine.prepare()

        do {
            try engine.start()
        } catch {
            return print(error)
        }
    }
    
    func benar(){
        print("Correct!!!")
        
        let selamat = UILabel()
        selamat.frame = self.hurufImage.frame
        selamat.center = self.hurufImage.center
        selamat.frame.size = CGSize(width: 0, height: 0)
        selamat.text = "BENAAR!!!!"
        selamat.textColor = .black
        selamat.font = UIFont.systemFont(ofSize: 1000)
        selamat.textAlignment = .center
        self.view.addSubview(selamat)
        UIView.animate(withDuration: 2) {
            selamat.frame.size = CGSize(width: 500, height: 500)
            selamat.font = UIFont(name: .init(), size: 800)
            selamat.center = self.hurufImage.center
            self.hurufImage.alpha = 0
        } completion: { (done) in
            
        }
    }
}

extension String {

    var length: Int {
        return count
    }

    subscript (i: Int) -> String {
        return self[i ..< i + 1]
    }

    func substring(fromIndex: Int) -> String {
        return self[min(fromIndex, length) ..< length]
    }

    func substring(toIndex: Int) -> String {
        return self[0 ..< max(0, toIndex)]
    }

    subscript (r: Range<Int>) -> String {
        let range = Range(uncheckedBounds: (lower: max(0, min(length, r.lowerBound)),
                                            upper: min(length, max(0, r.upperBound))))
        let start = index(startIndex, offsetBy: range.lowerBound)
        let end = index(start, offsetBy: range.upperBound - range.lowerBound)
        return String(self[start ..< end])
    }
}
