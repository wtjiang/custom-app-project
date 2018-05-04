//
//  WelcomeViewController.swift
//  CalDining App
//
//  Created by Winston Jiang on 5/2/18.
//  Copyright © 2018 Jagpinder, Manan, Winston. All rights reserved.
//

import UIKit

class WelcomeViewController: UIViewController {

    @IBOutlet weak var skipButton: UIButton!
    @IBOutlet weak var regButton: UIButton!
    @IBOutlet weak var logIn: UIButton!
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
        assignBackground()
        self.view.bringSubview(toFront: logo)
        regButton.layer.cornerRadius = 4
        logIn.layer.cornerRadius = 4
        skipButton.layer.cornerRadius = 4
        //blur.frame.size = CGSize(width: 200, height: 200)
        blur.layer.cornerRadius = blur.frame.size.height / 2.0
        blur.clipsToBounds = true
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        blur.layer.cornerRadius = blur.frame.height / 2.0
    }

    func assignBackground() {
        let background = UIImage(named: "berkeleyview.jpg")
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

