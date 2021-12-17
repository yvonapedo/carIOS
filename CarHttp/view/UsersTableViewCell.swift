//
//  UsersTableViewCell.swift
//  CarHttp
//
//  Created by mac09 on 2021/12/17.
//

import UIKit
import Alamofire

class UsersTableViewCell: UITableViewCell {
    let rootURL = rootAddress.ipAddUrl
    
    @IBOutlet weak var lb_mobile: UILabel!
    @IBOutlet weak var lb_name: UILabel!
    @IBOutlet weak var img_photo: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        img_photo.layer.cornerRadius = 30
        // Initialization code
    }
    
    func setHttpImage(name:String) {
       
        let imgURL = rootURL + "img/" + name
        let url = URL(string: imgURL)
        let request = AF.request(url!, method: .get)
        
        request.responseData{ (data) in
            if data.error == nil {
//                print("ok")
                if let imgdata = data.value {
                    let img = UIImage(data: imgdata)
                    self.img_photo.image = img
              
                }
            }
        }
    }
  
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
