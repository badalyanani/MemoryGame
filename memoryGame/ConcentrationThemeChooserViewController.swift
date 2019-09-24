//
//  ConcentrationThemeChooserViewController.swift
//  memoryGame
//
//  Created by Ani on 9/13/19.
//  Copyright © 2019 Ani. All rights reserved.
//

import UIKit

class ConcentrationThemeChooserViewController: UIViewController {
    
    let themes = [
        "Spring": "🌿🧚‍♀️🌸🌷🕊🥰🧞‍♀️💐🌾🎋🎍🍬",
        "Animal": "🙀🐁🐰🐼🐷🐴🐘🐝🐙🐳🐞🐜",
        "Sport": "⚽️🏀🏈⚾️🥎🏐🏓🥊"
    ]
    
    
    @IBAction func touchButton(_ sender: UIButton) {
       
        guard let themeName = sender.currentTitle, let _ = themes[themeName] else {return}
        if let detail = (self.splitViewController?.viewControllers.last as? ViewController) {
            detail.theme = themes[themeName]
        } else if let lastDetailController = lastDetailController {
            lastDetailController.theme = themes[themeName]
            self.navigationController?.pushViewController(lastDetailController, animated: true)
        } else {
            performSegue(withIdentifier: "Choose theme", sender: sender)
        }
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.setNavigationBarHidden(true, animated: true)
        
        // Do any additional setup after loading the view.
    }
    
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "Choose theme"){
            if let button = sender as? UIButton{
                if let themeName = button.currentTitle {
                    if let theme = themes[themeName]{
                        if let cvc = segue.destination as? ViewController {

                            cvc.theme = theme
                            }

                        }

                    }
                }
            }
        }

//    }
//    var lastDetailController: ViewController
//
//    extension ConcentrationThemeChooserViewController: UISplitViewControllerDelegate {
//        override func awakeFromNib() {
//            self.splitViewController?.delegate = self as! UISplitViewControllerDelegate
//        }
//        func splitViewController(_ splitViewController: UISplitViewController, collapseSecondary secondaryViewController: UIViewController, onto primaryViewController: UIViewController) -> Bool {
//            if let cvc = secondaryViewController as? ViewController {
//                lastDetailController = cvc
//                return true
//            }
//            return false
//        }
//
    
//    }
    
    var lastDetailController: ViewController?
    
    // Get the new view controller using segue.destination.
    // Pass the selected object to the new view controller.
}
extension ConcentrationThemeChooserViewController: UISplitViewControllerDelegate{
    //vor details-ic sksi
    override func awakeFromNib() {
                    self.splitViewController?.delegate = self as! UISplitViewControllerDelegate
                }
    
                func splitViewController(_ splitViewController: UISplitViewController, collapseSecondary secondaryViewController: UIViewController, onto primaryViewController: UIViewController) -> Bool {
                    if let cvc = secondaryViewController as? ViewController {
                       lastDetailController = cvc
                        return true
                    }
                    return false
                }
    
}
