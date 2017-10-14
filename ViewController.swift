//
//  ViewController.swift
//  SleepAssistant
//
//  Created by JD on 2017/10/11.
//  Copyright © 2017年 JD. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var dataSource:[CGFloat] = [CGFloat]()
    var titleSource:[String] = [String]()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.dataSource = [645,546,695,654,2666,1954,956,4265]
        self.titleSource = ["6月1号","2","3","4","5","6","7","8"]
        
        let v:FBLineChartView = FBLineChartView.init(delegate: self)
        v.Y = 100
        self.view.addSubview(v)
        
        
        delayAction(atime: 3) {
            
            self.dataSource = [20,56,84,92,41,65,48,62]
            v.setBackGColor(UIColor.init(RGBA: "#008B8B"))
            v.setUnitColor(UIColor.red)
            v.refreshUIData()
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

extension ViewController:LineChartViewDelegate{
    /// 单位字符
    ///
    /// - Returns: 垂直单位字符
    func verticalUnitText() -> String {
        return "/美元"
    }
    
    ///  底部水平上的展示文字
    ///
    /// - Parameter index: 位置，从左至右 0-N N取决于设定的默认格栅数
    /// - Returns: 展示文字的内容
    func horizontalText(atIndex index:NSInteger)->String{
        
        return self.titleSource[index]
    }
    
    /// 图表中的值
    ///
    /// - Returns: 展示
    func values() -> [CGFloat] {
        return self.dataSource
    }
    
}
