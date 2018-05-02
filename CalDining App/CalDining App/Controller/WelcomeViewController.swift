//
//  WelcomeViewController.swift
//  CalDining App
//
//  Created by Winston Jiang on 5/2/18.
//  Copyright © 2018 Jagpinder, Manan, Winston. All rights reserved.
//

import UIKit

class WelcomeViewController: UIViewController {

    @IBOutlet weak var logo: UIImageView!
    @IBOutlet weak var copyright: UILabel!
    @IBOutlet weak var blur: UIVisualEffectView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
//        let blurEffect = UIBlurEffect(style:UIBlurEffectStyle.light)
//        let blurView = UIVisualEffectView(effect: blurEffect)
//        blurView.frame.size = CGSize(width: 130, height: 180)
//        blurView.center = logo.center
//        view.addSubview(blurView)
        assignbackground()
        self.view.bringSubview(toFront: logo)
    }
    
    func assignbackground() {
        let background = UIImage(named: "ViewFromTopOfCampanile_MicahelDrummond.jpg")
        var imageView : UIImageView!
        imageView = UIImageView(frame: view.bounds)
        imageView.contentMode =  UIViewContentMode.scaleAspectFill
        imageView.clipsToBounds = true
        imageView.image = background
        imageView.center = view.center
        view.addSubview(imageView)
        //self.view.bringSubview(toFront: imageView)
        self.view.sendSubview(toBack: imageView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
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
