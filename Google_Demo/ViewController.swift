//
//  ViewController.swift
//  Google_Demo
//
//  Created by 준수김 on 2021/10/18.
//

import UIKit
import GoogleSignIn

class ViewController: UIViewController {
    let signInConfig = GIDConfiguration.init(clientID: "685524618021-1v15qe5nkq2vt609vei47k9pf1mbbfvf.apps.googleusercontent.com")
   
    @IBOutlet weak var id: UILabel!
    @IBOutlet weak var email: UILabel!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var image: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func signIn(sender: Any) {
      GIDSignIn.sharedInstance.signIn(with: signInConfig, presenting: self) { user, error in
        guard error == nil else { return }
          guard let user = user else { return }
          self.name.text = user.profile?.name
          self.name.sizeToFit()
          self.email.text = user.profile?.email
          self.email.sizeToFit()
          self.id.text = user.userID
          self.id.sizeToFit()
          
          let url = user.profile?.imageURL(withDimension: 320)
          let data = try? Data(contentsOf: url!)
          self.image.image = UIImage(data: data!)
          
          
          
      }
    }
    
    @IBAction func signOut(sender: Any) {
      GIDSignIn.sharedInstance.signOut()
    }
    
    


}

