//
//  MenuListViewController.swift
//  CalDining App
//
//  Created by Winston Jiang on 5/4/18.
//  Copyright © 2018 Jagpinder, Manan, Winston. All rights reserved.
//

import UIKit

class MenuListViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBOutlet weak var menuDisplay: UILabel!
    var textToDisplay = String()
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        menuDisplay.text = textToDisplay
        menuDisplay.frame = view.bounds
        menuDisplay.contentMode = UIViewContentMode.scaleAspectFill
        menuDisplay.clipsToBounds = true
        menuDisplay.center = view.center
        self.view.addSubview(menuDisplay)
        //self.view.bringSubview(toFront: imageView)
//        self.view.sendSubview(toBack: menuDisplay)

        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
