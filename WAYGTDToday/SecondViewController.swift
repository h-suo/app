//
//  SecondViewController.swift
//  WAYGTDToday
//
//  Created by 표현수 on 2022/11/13.
//

import UIKit

class SecondViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    let maxData = 10
    let pickerViewCnt = 1
    var pickerViewData = ["노래방",
                          "영화관",
                          "카페",
                          "보드게임",
                          "볼링",
                          "오락실",
                          "방탈출",
                          "PC방",
                          "모텔",
                          "당구장"]
    
    @IBOutlet weak var pickerView: UIPickerView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pickerView.isUserInteractionEnabled = false
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        //pickerview의 열을 의미하는 정수를 리턴
        return pickerViewCnt
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        //pickerview에서 선택할 수 있는 데이터 개수
        return pickerViewData.count * 100
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        //pickerview의 데이터를 리턴
        return pickerViewData[row % pickerViewData.count]
    }
    
    func trigger() {
        let timer = Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(scrollRandomly), userInfo: nil, repeats: true);
        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + Double(Int64(1*NSEC_PER_SEC))/Double(NSEC_PER_SEC)) {
            timer.invalidate()
        }
    }
    
    @objc func scrollRandomly() {
        let row: Int = Int.random(in: 1..<100)
        self.pickerView.selectRow(row, inComponent: 0, animated: true)
    }
    
    @IBAction func choiceButtonTapped(_ sender: UIButton) {
//        let index = Int.random(in: 0 ..< pickerViewData.count)
//        pickerView.selectRow(index, inComponent: 0, animated: true)
        trigger()
        
    }
}
