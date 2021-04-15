//
//  ViewController.swift
//  Bloom
//
//  Created by Arhan on 2021-04-06.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var calendar: FSCalendar!

    @IBOutlet weak var plantList: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.\
        
        
    
    
    func calendar( _ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition){
            let formatter = DateFormatter()
            formatter.dateFormat = "EEEE MM-dd-YYYY"
            let string = formatter.string(from: date)
            print(string)
        }
    }


}

