//
//  ViewController.swift
//  AttributedStringTest
//
//  Created by 이준혁 on 2023/01/06.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = 6.0
        
        let attributes: [NSAttributedString.Key: Any] = [
            .font: UIFont.systemFont(ofSize: 20.0, weight: .semibold),
            .foregroundColor: UIColor.systemBlue,
            .paragraphStyle: paragraphStyle
        ]
        
        let mutableAttributedString = NSMutableAttributedString(
            string: "여름 장이란 애시당초에 글러서, 해는 아직 중천에 있건만 장판은 벌써 쓸쓸하고",
            attributes: attributes)
        
        paragraphStyle.paragraphSpacing = 10.0
        
        let addtionalAttributes: [NSAttributedString.Key: Any] = [
            .font: UIFont.systemFont(ofSize: 30.0, weight: .thin),
            .foregroundColor: UIColor.systemPink,
            .paragraphStyle: paragraphStyle
        ]
        
        mutableAttributedString.addAttributes(addtionalAttributes, range: NSRange(location: 3, length: 10))
        
        textView.attributedText = mutableAttributedString
        
//        let attributedText = NSAttributedString(
//            string: "여름 장이란 애시당초에 글러서, 해는 아직 중천에 있건만 장판은 벌써 쓸쓸하고",
//            attributes: attributes)
//
//        textView.attributedText = attributedText
    }


}

