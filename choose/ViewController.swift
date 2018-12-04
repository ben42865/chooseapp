//
//  ViewController.swift
//  choose
//
//  Created by User15 on 2018/11/28.
//  Copyright © 2018 ee. All rights reserved.
//

import UIKit
import GameplayKit
import AVFoundation

struct Qna{
    var question: String
    var Ansers: [String]
    var Anser: String
    var QImage: String
}

class ViewController: UIViewController {
    
    var qans = [Qna]()
    var number = 0
    var point = 0
    
    @IBOutlet weak var QueLabel: UILabel!
    @IBOutlet var Anss: [UIButton]!
    @IBOutlet weak var Qimage: UIImageView!
    @IBOutlet weak var points: UILabel!
    @IBOutlet weak var Qnum: UILabel!
    @IBOutlet weak var hints: UIButton!
    @IBOutlet weak var hintLabel: UILabel!
    @IBOutlet weak var Start: UIButton!
    @IBOutlet weak var Startimg: UIImageView!
    @IBOutlet weak var pointLabel: UILabel!
    @IBOutlet weak var pic: UIImageView!
    @IBOutlet weak var qus: UIImageView!
    @IBOutlet var anssimg: [UIImageView]!
    @IBOutlet weak var Qnumimg: UIImageView!
    
    var playagain = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Do any additional setup after loading the view, typically from a nib.
        qans = [Qna(question:"乒乓球始於那個國家？", Ansers:["瑞典", "英國", "台灣"], Anser:"英國", QImage:"桌球"),
                Qna(question:"“垂簾聽政”始於何時？", Ansers:["宋朝", "元朝", "唐朝"], Anser:"唐朝", QImage:"垂簾聽政"),
                Qna(question:"人體最大的解毒器官是", Ansers:["胃", "腎", "肝"], Anser:"肝", QImage:"人體器官"),
                Qna(question:"下列各朝代疆域西至最遠的是", Ansers:["秦朝", "唐朝", "清朝"], Anser:"唐朝", QImage:"疆域"),
                Qna(question:"“草聖”是指那位書法家？", Ansers:["張旭", "王羲之", "張芝"], Anser:"張旭", QImage:"書法"),
                Qna(question:"“一衣帶水”的水是指哪條河流？", Ansers:["長江", "黃河", "黑龍江"], Anser:"長江", QImage:"大河"),
                Qna(question:"五子棋段位制最高為", Ansers:["一段", "九段", "十二段"], Anser:"十二段", QImage:"五子棋"),
                Qna(question:"避雷針的發明者是", Ansers:["富蘭克林", "愛迪生", "伏打"], Anser:"富蘭克林", QImage:"避雷針"),
                Qna(question:"從抹香鯨體內提煉出的香料是", Ansers:["沉水香", "龍涎香", "麝香"], Anser:"龍涎香", QImage:"抹香鯨"),
                Qna(question:"在雲南，湖泊習慣上被稱為", Ansers:["澱", "泊", "海"], Anser:"海", QImage:"湖泊"),
                Qna(question:"黯然銷魂掌的第16招是？", Ansers:["心驚肉跳", "呆若木雞", "力不從心"], Anser:"呆若木雞", QImage:"黯然銷魂掌"),
                Qna(question:"“範進中舉”的故事出自？", Ansers:["《紅樓夢》", "《水滸》", "《儒林外史》"], Anser:"《儒林外史》", QImage:"范進中舉"),
        ]
        qans.shuffle()
        
        for i in 0...11
        {
            qans[i].Ansers.shuffle()
        }
        number = 0
        point = 0
        QueLabel.text = qans[number].question
        for i in 0...2
        {
            Anss[i].setTitle(qans[number].Ansers[i], for: UIControl.State.normal)
        }
        Qimage.image = UIImage(named: qans[number].QImage)
        
        Qnum.text = "第" + String(number+1) + "題"
        points.text = String(point)
        
        QueLabel.isHidden = true
        Anss[0].isHidden = true
        Anss[1].isHidden = true
        Anss[2].isHidden = true
        Qimage.isHidden = true
        Qnum.isHidden = true
        points.isHidden = true
        pointLabel.isHidden = true
        pic.isHidden = true
        qus.isHidden = true
        anssimg[0].isHidden = true
        anssimg[1].isHidden = true
        anssimg[2].isHidden = true
        Qnumimg.isHidden = true
        
        if playagain != 0
        {
            Start.isHidden = false
            Startimg.isHidden = false
        }
    }
    
    @IBAction func StartGame(_ sender: UIButton) {
        sender.isHidden = true
        Startimg.isHidden = true
        
        QueLabel.isHidden = false
        Anss[0].isHidden = false
        Anss[1].isHidden = false
        Anss[2].isHidden = false
        Qimage.isHidden = false
        Qnum.isHidden = false
        points.isHidden = false
        pointLabel.isHidden = false
        pic.isHidden = false
        qus.isHidden = false
        anssimg[0].isHidden = false
        anssimg[1].isHidden = false
        anssimg[2].isHidden = false
        Qnumimg.isHidden = false
    }
    
    func endGame(){
        let alertController = UIAlertController(title: "結束遊戲",
                                                message: "得到了" + String(point) + "分！", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "再玩一次", style: .default, handler:
        {
            (action: UIAlertAction!) -> Void in self.viewDidLoad()
            })
        alertController.addAction(okAction)
        self.present(alertController, animated: true, completion: nil)
        self.view.setNeedsLayout()
        playagain = 1
    }
    
    func press(){
        if number == 9
        {
            endGame()
        }
        else
        {
            number = number + 1
        }
        
        QueLabel.text = qans[number].question
        for i in 0...2
        {
            Anss[i].setTitle(qans[number].Ansers[i], for: UIControl.State.normal)
        }
        Qimage.image = UIImage(named: qans[number].QImage)
        
        Qnum.text = "第" + String(number+1) + "題"
        points.text = String(point)
        
    }
    
    @IBAction func pressAns(_ sender: UIButton) {
        let cellect = sender.currentTitle!
        if cellect == qans[number].Anser
        {
            point = point + 10
            
            press()
        }
        else
        {
            press()
        }
    }
    
    
}

