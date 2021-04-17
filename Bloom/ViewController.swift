//
//  ViewController.swift
//  Bloom
//
//  Created by Arhan on 2021-04-06.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    


    
    @IBOutlet weak var plantNameText: UITextField!
    
    @IBOutlet weak var lastWateredText: UITextField!
    
    @IBOutlet weak var lastFertilizedText: UITextField!
    
    @IBOutlet weak var waterCycleText: UITextField!
    
    @IBOutlet weak var fertilizerCycleText: UITextField!
    
    var newFlower: Flower!
    var newGarden: Garden!
    
    @IBOutlet weak var calendar: FSCalendar!

    @IBOutlet weak var plantList: UITableView!/*{
        didSet{
            plantList.dataSource = self
            plantList.delegate = self
        }
    }*/
    
    let cellReuseIdentifier = "cell"
    
    var plants: [String] = []
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        newGarden = Garden()
        
        if plantList != nil{

            
            self.plantList.register(UITableViewCell.self, forCellReuseIdentifier: cellReuseIdentifier)

        
        // Do any additional setup after loading the view.\
        
        
        plantList.delegate = self
        plantList.dataSource = self

        //plantList.estimatedRowHeight = 200.0
        plantList.rowHeight = UITableView.automaticDimension

         
            var sizeGarden: Int
            sizeGarden = newGarden.getCount()

            
            for _ in 0...sizeGarden{
                plants.append(newGarden.currentFlower().printFlower())
                newGarden.incrementCurrent()

            }


        
        }
    
    /*func calendar( _ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition){
            let formatter = DateFormatter()
            formatter.dateFormat = "EEEE MM-dd-YYYY"
            let string = formatter.string(from: date)
            print(string)
        }*/
        

    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(self.plants.count)
        return self.plants.count
    }
    
    // create a cell for each table view row
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // create a new cell if needed or reuse an old one
        let cell:UITableViewCell = (self.plantList.dequeueReusableCell(withIdentifier: cellReuseIdentifier) as UITableViewCell?)!

        
        // set the text from the data model
        cell.textLabel?.text = self.plants[indexPath.row]
        
        cell.sizeToFit()
        cell.textLabel?.sizeToFit()
        cell.textLabel?.numberOfLines = 0
        cell.textLabel?.lineBreakMode = .byWordWrapping

        
        return cell
    }
    


    @IBAction func addButton(_ sender: Any) {
        
    }
    @IBAction func saveButton(_ sender: Any) {
        
        //I was thinking this button could take us to the new plant view screen as well maybe

        if !(plantNameText.text!.isEmpty) && !(lastWateredText.text!.isEmpty) && !(lastFertilizedText.text!.isEmpty) && !(waterCycleText.text!.isEmpty) && !(fertilizerCycleText.text!.isEmpty) {
        
            
            newFlower = Flower(flowerName: plantNameText.text!, lastWatered: lastWateredText.text!, lastFertilized: lastFertilizedText.text!, waterCylce: Int(waterCycleText.text!)!, fertilizerCycle: Int(fertilizerCycleText.text!)!)
        
        newGarden.addFlower(flowerObj: newFlower)

        
        newGarden.printGarden()
        }
        else{
            print("All values must be filled")
        }
        
        
    }

}

