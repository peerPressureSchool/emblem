//
//  ProfileViewController.swift
//  Emelem
//
//  Created by Jared Mermey on 5/8/15.
//  Copyright (c) 2015 Jared Mermey. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {
    
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var userNameLabel: UILabel!

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        navigationItem.titleView = UIImageView(image: UIImage(named: "profile-header"))
        let leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "nav-back-button"), style: UIBarButtonItemStyle.Plain, target: self, action: "exitProfileVC:")
        navigationItem.setLeftBarButtonItem(leftBarButtonItem, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        userNameLabel.text = currentUser()?.fullName
        currentUser()?.getPhoto({
            image in
            self.profileImageView.layer.masksToBounds = true
            self.profileImageView.contentMode = .ScaleAspectFill
            self.profileImageView.image = image
        })

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func exitProfileVC(button: UIBarButtonItem){
        pageController.goToNextVC()
    }

}
