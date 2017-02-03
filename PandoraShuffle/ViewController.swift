//
//  ViewController.swift
//  PandoraShuffle
//
//  Created by Kiranpal Reddy Gurijala on 1/15/17.
//  Copyright © 2017 AryaVahni. All rights reserved.
//

import UIKit

class PandoraViewController: UITableViewController {

    @IBOutlet weak var pandoraMusicTable: UITableView!
    var pandoraMusicList = [String]()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //pandoraMusicTable = UITableView()
        //self.pandoraMusicTable.backgroundColor = UIColor.clear
        pandoraMusicList = ["ARRahman", "BryanAdams", "CelineDion", "Drake", "EnriqueIglesias", "FifthHarmony", "GeorgeMichael", "Halsey", "IggyAzalea", "JustinBieber", "KanyeWest", "LadyGaga", "MichaelJackson", "NorahJones"]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pandoraMusicList.count
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let frame: CGRect = tableView.frame
        
        let headerView:UIView = UIView(frame: CGRect(x:0, y:0, width:frame.size.width, height:50))
        headerView.backgroundColor = UIColor.blue
        
        let pandoraShuffleButton: UIButton = UIButton(frame: CGRect(x:80, y:20, width:200, height:30))
        pandoraShuffleButton.setTitle("Shuffle", for: .normal)
        pandoraShuffleButton.backgroundColor = UIColor.blue
        pandoraShuffleButton.addTarget(self, action: #selector(PandoraViewController.pandoraShuffle), for: .touchUpInside)
        headerView.addSubview(pandoraShuffleButton)
        headerView.backgroundColor = UIColor.yellow
        return headerView
        
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat  {
        return 100.0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SongLabelCell", for: indexPath)
        
        
        
        cell.textLabel?.text = pandoraMusicList[indexPath.row]
        
        return cell
    }
    
    func pandoraShuffle(){
        print("Fisher-Yates Algorithm: ")
        pandoraMusicList=shuffleArray(rArray: pandoraMusicList)
        self.pandoraMusicTable.reloadData()
    }
    func shuffleArray<T>(rArray: Array<T>) -> Array<T>
    {
        var rawArray = rArray
        for index in ((0 + 1)...rawArray.count - 1)
        {
            // Random int from 0 to index-1
            let j = Int(arc4random_uniform(UInt32(index-1)))
            // Swap two array elements
            // Notice '&' required as swap uses 'inout' parameters
            swap(&rawArray[index], &rawArray[j])
        }
        return rawArray
    }

}

