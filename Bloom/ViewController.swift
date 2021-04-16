//
//  ViewController.swift
//  Bloom
//
//  Created by Arhan on 2021-04-06.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var plantNameText: UITextField!
    
    @IBOutlet weak var lastWateredText: UITextField!
    
    @IBOutlet weak var lastFertilizedText: UITextField!
    
    @IBOutlet weak var waterCycleText: UITextField!
    
    @IBOutlet weak var fertilizerCycleText: UITextField!
    
    var newFlower: Flower!
    
    @IBOutlet weak var calendar: FSCalendar!

    @IBOutlet weak var plantList: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.\
        

        
        
    
    
    /*func calendar( _ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition){
            let formatter = DateFormatter()
            formatter.dateFormat = "EEEE MM-dd-YYYY"
            let string = formatter.string(from: date)
            print(string)
        }*/
        
    }


    @IBAction func addButton(_ sender: Any) {
        
    }
    @IBAction func saveButton(_ sender: Any) {
        
        //I was thinking this button could take us to the new plant view screen as well maybe

        newFlower = Flower(flowerName: plantNameText.text!, lastWatered: lastWateredText.text!, lastFertilized: lastFertilizedText.text!, waterCylce: Int(waterCycleText.text!)!, fertilizerCycle: Int(fertilizerCycleText.text!)!)
        
        newFlower.printFlower();

    }
}

