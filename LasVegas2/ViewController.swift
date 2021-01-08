

import UIKit

class ViewController: UIViewController {

    @IBOutlet var leftDice: [UIImageView]! //左邊骰子
    @IBOutlet var rightDice: [UIImageView]! //右邊骰子
    @IBOutlet var dicesNumber: [UILabel]! //兩邊點數label
    @IBOutlet var addTextField: [UITextField]! //輸入賭注金額
    @IBOutlet var leftMoney: [UILabel]! //顯示餘額
    
    @IBOutlet weak var statusLabel: UILabel! //狀態顯示
    
    @IBOutlet weak var again: UIButton! //再一次
    
    
    
    
    //左右骰子圖片的array
    var leftImage = ["l1","l2","l3","l4","l5","l6"]
    var rightImage = ["r1","r2","r3","r4","r5","r6",]
    //餘額
    var leftLast = 1000
    var rightLast = 1000
    //讀出投注金額
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        again.alpha = 0 //再一次按鈕消失
        
    }
    // 開始按紐
    @IBAction func playing(_ sender: Any) {
        let leftBidMoney = Int(addTextField[0].text!) //讀左邊下注金額
        let rightBidMoney = Int(addTextField[1].text!) //讀右邊下注金額
        if leftLast >= 0,rightLast > 0,leftBidMoney != nil,rightBidMoney != nil{ //如果餘額不等於0,有輸入下注金額
        //存點數總和
        var leftSum = 0
        var rightSum = 0
        //亂數排列左邊骰子、讀出骰子點數
        for leftDices in leftDice {
            let number = Int.random(in: 0...5)
            leftDices.image = UIImage(named: leftImage[number])
            leftSum = leftSum + number + 1
            dicesNumber[0].text = "\(leftSum)"
        }
        //亂數排列右邊骰子、讀出骰子點數
        for rightDices in rightDice{
            let number = Int.random(in: 0...5)
            rightDices.image = UIImage(named: rightImage[number])
            rightSum = rightSum + number + 1
            dicesNumber[1].text = "\(rightSum)"
        }
      
//        leftBidMoney = Int(addTextField[0].text!)! //讀左邊下注金額
//        rightBidMoney = Int(addTextField[1].text!)! //讀右邊下注金額
        
        
        //如果左邊比右邊大
        if leftSum > rightSum{
            statusLabel.text = "隔壁老王獲勝"
            leftLast = leftLast + leftBidMoney! //左邊餘額=左邊餘額＋左邊下注金額
            leftMoney[0].text = "\(leftLast)" //更改左邊餘額
            rightLast = rightLast - rightBidMoney!//右邊餘額=右邊餘額-右邊下注金額
            leftMoney[1].text = "\(rightLast)" //更改右邊餘額
            //如果左邊比右邊小
        }else if leftSum < rightSum{
            statusLabel.text = "8號乾妹獲勝"
            leftLast = leftLast - leftBidMoney!
            leftMoney[0].text = "\(leftLast)"
            rightLast = rightLast + rightBidMoney!
            leftMoney[1].text = "\(rightLast)"
        }else{ //如果平手 扣除下注金額＊２
            statusLabel.text = "和局！！莊家通殺"
            leftLast = leftLast - (leftBidMoney! * 2)
            leftMoney[0].text = "\(leftLast)"
            rightLast = rightLast - (rightBidMoney! * 2)
            leftMoney[1].text = "\(rightLast)"
        }
       
    }
        else if leftLast <= 0{
            statusLabel.text = "遊戲結束！！8號乾妹獲勝"
            again.alpha = 1
        }
        else if rightLast <= 0{
            statusLabel.text = "遊戲結束！！隔壁老王獲勝"
            again.alpha = 1
        }
    }
    //再一次 平常消失，遊戲結束後出現，按下後歸零遊戲 再次消失
    @IBAction func playAgin(_ sender: UIButton) {
        //存點數總和
        let leftSum = 0
        let rightSum = 0
        ////餘額 回到初始值 1000
        leftLast = 1000
        rightLast = 1000
        leftMoney[0].text = "\(leftLast)"
        leftMoney[1].text = "\(rightLast)"
        //輸入賭金 空白
        addTextField[0].text = ""
        addTextField[1].text = ""
        //狀態空白
        statusLabel.text = ""
        //亂數排列左邊骰子、讀出骰子點數
        for leftDices in leftDice {
            let number = 0
            leftDices.image = UIImage(named: leftImage[number])
            dicesNumber[0].text = "\(leftSum)"
        }
        //亂數排列右邊骰子、讀出骰子點數
        for rightDices in rightDice{
            let number = 0
            rightDices.image = UIImage(named: rightImage[number])
            dicesNumber[1].text = "\(rightSum)"
        }
        again.alpha = 0
    }
    
}
   
    
    
    
    
    



