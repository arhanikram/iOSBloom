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
    var sharedGarden : Garden?
    var currentFlower : Flower?

    
    @IBOutlet weak var calendar: FSCalendar!

    @IBOutlet weak var plantList: UITableView!/*{
        didSet{
            plantList.dataSource = self
            plantList.delegate = self
        }
    }*/
    
    let cellReuseIdentifier = "cell"
    
    //var plants: [String] = []
    
    var date: Date!

    
    override func viewDidLoad() {
        super.viewDidLoad()       

        newGarden = Garden()

        if plantList != nil{

            
            self.plantList.register(UITableViewCell.self, forCellReuseIdentifier: cellReuseIdentifier)
            // Do any additional setup after loading the view.\
            plantList.delegate = self
            plantList.dataSource = self
            plantList.rowHeight = UITableView.automaticDimension

         
            

        }

    }
    
    func calendar( _ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition){
            let formatter = DateFormatter()
            formatter.dateFormat = "EEEE MM-dd-YYYY"
            let string = formatter.string(from: date)
            print(string)
        }
        
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //print(self.plants.count)
        print(newGarden.getCount())
        return self.newGarden.getCount()
    }
    
    //slide to button
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete from your source, then update the tableView
            self.newGarden.getCurrentIndex(with: self.newGarden.currentFlower().getName())
            self.newGarden.removeCurrentFlower()
            print(newGarden.getCount())
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
    
    // create a cell for each table view row
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // create a new cell if needed or reuse an old one
        let cell:UITableViewCell = (self.plantList.dequeueReusableCell(withIdentifier: cellReuseIdentifier) as UITableViewCell?)!

        
        // set the text from the data model

        cell.textLabel?.text = self.newGarden.garden[indexPath.row].printFlower()
        cell.sizeToFit()
        cell.textLabel?.sizeToFit()
        cell.textLabel?.numberOfLines = 0
        cell.textLabel?.lineBreakMode = .byWordWrapping

        
        return cell
    }
  
    
    @IBAction func unwind(_ segue: UIStoryboardSegue) {
        return
    }
    
    @IBAction func addButton(_ sender: Any) {
        
    }
    
    @IBAction func saveButton(_ sender: Any) {

        if !(plantNameText.text!.isEmpty) && !(lastWateredText.text!.isEmpty) && !(lastFertilizedText.text!.isEmpty) && !(waterCycleText.text!.isEmpty) && !(fertilizerCycleText.text!.isEmpty) {
            
            newFlower = Flower(flowerName: plantNameText.text!, lastWatered: lastWateredText.text!, lastFertilized: lastFertilizedText.text!, waterCylce: Int(waterCycleText.text!)!, fertilizerCycle: Int(fertilizerCycleText.text!)!)

        
            newGarden.addFlower(flowerObj: newFlower)

        }
        else{
            print("All values must be filled")
        }
        
        self.performSegue (withIdentifier: "return", sender: self)
        
        
    }

}

