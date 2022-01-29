//
//  BountyViewController.swift
//  BountyList
//
//  Created by 엄철찬 on 2022/01/17.
//

import UIKit

class BountyViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    

    // MVVM
    
    
    // Model
    // - BountyInfo
    // > BountyInfo 만들자
    
    // View
    // - ListCell
    // > ListCell 필요한 정보를 ViewModle 한테서 받아야 겠다
    // > ListCell을 ViewModel로 부터 받은 정보로 View Update 하기
    
    // ViewModel
    // - BountyViewModel
    // > BountyViewModel 만들고, View에서 필요한 메서드 만들기
    // > Model 가지고 있기 .. BountyInfo 들
    
    
//    let bountyInfoList : [BountyInfo] = [
//        BountyInfo(name : "brook"  , bounty : 33000000),
//        BountyInfo(name : "chopper", bounty : 50),
//        BountyInfo(name : "franky" , bounty : 44000000),
//        BountyInfo(name : "luffy"  , bounty : 300000000),
//        BountyInfo(name : "nami"   , bounty : 16000000),
//        BountyInfo(name : "robin"  , bounty : 80000000),
//        BountyInfo(name : "sanji"  , bounty : 77000000),
//        BountyInfo(name : "zoro"   , bounty : 120000000)
//    ]
    
    let viewModel = BountyViewModle()
    

    
    
//    let nameList   = ["brook","chopper","franky","luffy","nami","robin","sanji","zoro"]
//    let bountyList = [3000000,50,440000000,3000000000,160000000,80000000,7000000,12000000000]
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetail" {
            let vc = segue.destination as? DetailViewController
            if let index = sender as? Int {
//              let bountyInfo = bountyInfoList[index]
                let bountyInfo = viewModel.bountyInfo(at: index)
//            vc?.name           = nameList[index]
//            vc?.bounty         = bountyList[index]
                vc?.viewModel.update(model: bountyInfo)
//                vc?.name           = bountyInfo.name
//                vc?.bounty         = bountyInfo.bounty
            
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    //UITableViewDataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return bountyList.count
//        return bountyInfoList.count
        return viewModel.numOfBountyInfoList
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? ListCell
            else { return UITableViewCell() }
//        let img = UIImage(named: "\(nameList[indexPath.row]).jpg")
//        cell.ImgView.image = img
//        cell.nameLabel.text = nameList[indexPath.row]
//        cell.bountyLabel.text = "\(bountyList[indexPath.row])"
//        let bountyInfo = bountyInfoList[indexPath.row]
        let bountyInfo = viewModel.bountyInfo(at : indexPath.row)
//        let img = bountyInfo.image
//        cell.ImgView.image = img
//        cell.nameLabel.text = bountyInfo.name
//        cell.bountyLabel.text = "\(bountyInfo.bounty)"
//
        cell.update(info: bountyInfo)
        
        
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
    
    func update(info:BountyInfo){
        ImgView.image = info.image
        nameLabel.text = info.name
        bountyLabel.text = "\(info.bounty)"
        
    }
}


//struct BountyInfo{
//    let name   : String
//    let bounty : Int
//    // \(name).jpg 방식으로 접근하기 때문에 옵셔널
//    var image  : UIImage? {
//        return UIImage(named:"\(name).jpg")
//    }
//    
//    init(name: String, bounty: Int) {
//        self.name   = name
//        self.bounty = bounty
//    }
//}


class BountyViewModle {
    let bountyInfoList : [BountyInfo] = [
        BountyInfo(name : "brook"  , bounty : 33000000),
        BountyInfo(name : "chopper", bounty : 50),
        BountyInfo(name : "franky" , bounty : 44000000),
        BountyInfo(name : "luffy"  , bounty : 300000000),
        BountyInfo(name : "nami"   , bounty : 16000000),
        BountyInfo(name : "robin"  , bounty : 80000000),
        BountyInfo(name : "sanji"  , bounty : 77000000),
        BountyInfo(name : "zoro"   , bounty : 120000000)
    ]
    
    var sortedList : [BountyInfo] {
        let sortedList = bountyInfoList.sorted { prev, next in
            return prev.bounty > next.bounty
        }
        
        return sortedList
    }
    
    var numOfBountyInfoList : Int {
        return bountyInfoList.count
    }
    
    func bountyInfo(at index: Int) -> BountyInfo{
        return sortedList[index]
    }
}
