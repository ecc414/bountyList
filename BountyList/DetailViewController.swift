//
//  DetailViewController.swift
//  BountyList
//
//  Created by 엄철찬 on 2022/01/18.
//

import UIKit

class DetailViewController: UIViewController {

   
    // MVVM
    
    
    // Model
    // - BountyInfo
    // > BountyInfo 만들자
    
    // View
    // - imgView, nameLabel, ListCell
    // > view들은 viewModel을 통해서 구성되기
    
    // ViewModel
    // - DetailViewModel
    // > View에서 필요한 메서드 만들기
    // > Model 가지고 있기 .. BountyInfo 들
    
    
    
    
    @IBOutlet weak var ImgView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var bountyLabel: UILabel!
    
//    var name  : String?
//    var bounty: Int?
    
//    var bountyInfo : BountyInfo?
    
    let viewModel = DetailViewModel()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateUI()
        
        // Do any additional setup after loading the view.
    }
    
    func updateUI(){
        //String을 바로 UILabel에 넣지 못하기 때문에 옵셔널 바인딩을 통해서 대입한다
        //또 name.self 와 bounty.self가 옵셔널이므로
        if let bountyInfo = viewModel.bountyInfo {
            ImgView.image = bountyInfo.image
            nameLabel.text = bountyInfo.name
            bountyLabel.text = "\(bountyInfo.bounty)"
        }
//        if let name = self.name, let bounty = self.bounty {
//            let img = UIImage( named: "\(name).jpg")
//            ImgView.image = img
//            nameLabel.text = name
//            bountyLabel.text = "\(bounty)"
//        }
    }

    @IBAction func close(_ sender: Any) {
    dismiss(animated: true, completion: nil)
        //completion : 사라지고 난 후 동작할 것들
    }
}


class DetailViewModel {
    var bountyInfo : BountyInfo?
    
    func update(model: BountyInfo?) {
        bountyInfo = model
    }
}
