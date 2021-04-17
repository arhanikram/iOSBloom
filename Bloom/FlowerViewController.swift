//
//  FlowerViewController.swift
//  Bloom
//
//  Created by Rana Qaderi on 2021-04-16.
//

import UIKit

class FlowerViewController: UIViewController {

    @IBOutlet var lastWateredLabel: UIView!
    @IBOutlet weak var lastFertilizedLabel: UILabel!
    @IBOutlet weak var waterCycleLabel: UILabel!
    @IBOutlet weak var fertilizerCycleLabel: UILabel!
    
    var flowerName: String!
    var lastWatered: String!
    var lastFertilized: String!
    var waterCycle: String!
    var fertilizerCycle: String!
    var currentFlower: Flower?
    
    @IBOutlet weak var titleofFlower: UINavigationItem!
    
    func initWithData(_ flower : Flower){
        currentFlower = flower
    }
    @IBAction func deleteFlowerButton(_ sender: Any) {
//        Garden.getCurrentIndex(with: flowerName)
        titleofFlower.title = currentFlower?.getName()
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        titleofFlower.title = currentFlower?.getName()
//        self.lastFertilizedLabel.text = lastWatered
//        self.lastFertilizedLabel.text = lastFertilized
//        self.waterCycleLabel.text = waterCycle
//        self.fertilizerCycleLabel.text = fertilizerCycle
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
