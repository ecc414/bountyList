//
//  BountyViewController.swift
//  BountyList
//
//  Created by 엄철찬 on 2022/01/17.
//

import UIKit

class BountyViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let nameList   = ["brook","chopper","franky","luffy","nami","robin","sanji","zoro"]
    let bountyList = [3000000,50,440000000,3000000000,160000000,80000000,7000000,12000000000]
    var information : [String : Int] = [:]
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetail" {
            let vc = segue.destination as? DetailViewController
            if let index = sender as? Int {
            vc?.name           = nameList[index]
            vc?.bounty         = bountyList[index]
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    //UITableViewDataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return bountyList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? ListCell
            else { return UITableViewCell() }
        information = Dictionary(uniqueKeysWithValues: zip(nameList, bountyList))
        let img = UIImage(named: "\(nameList[indexPath.row]).jpg")
        cell.ImgView.image = img
        cell.nameLabel.text = nameList[indexPath.row]
        cell.bountyLabel.text = "\(bountyList[indexPath.row])"
        
        return cell
        
        
//        위의 guard 구문과 같은 말
//        if let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? ListCell {
//            return cell
//        }else {
//            return UITableViewCell()
//        }
        
        
    }
    
    //UITableViewDelegate
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("-->\(indexPath.row)")
        performSegue(withIdentifier: "showDetail", sender: indexPath.row)
        //sender : 세그웨이를 수행하는데 특정 오브젝트를 같이 껴서 보낼 수 있다
        
    }

}

class ListCell : UITableViewCell {
    @IBOutlet weak var ImgView : UIImageView!
    @IBOutlet weak var nameLabel : UILabel!
    @IBOutlet weak var bountyLabel : UILabel!
}
