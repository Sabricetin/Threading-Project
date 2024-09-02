//
//  ViewController.swift
//  ThreadingProject
//
//  Created by Sabri Çetin on 2.09.2024.
//

import UIKit

class ViewController: UIViewController , UITableViewDelegate , UITableViewDataSource {
    
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var imageView: UIImageView!
    
    let imageArray = ["https://images.wallpapersden.com/image/download/a-new-planet-4k-sunrise_bmZpaGWUmZqaraWkpJRobWllrWdmamc.jpg" , "https://4kwallpapers.com/images/walls/thumbs_3t/18173.jpg"]
    
    var data = Data()
    var tracker = 0
    override func viewDidLoad() {

       
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        tableView.dataSource = self
        tableView.delegate = self
        
        DispatchQueue.global().async {
            self.data = try! Data(contentsOf: URL(string : self.imageArray[self.tracker])!)
            DispatchQueue.main.async {
                self.imageView.image = UIImage(data: self.data)

            }

        }
        
         
        
        self.navigationController?.navigationBar.topItem?.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self , action: #selector(changeİmage))
        
    }
    
    @objc func changeİmage () {
        
        if tracker == 0 {
            tracker += 1
        } else {
            tracker -= 1
        }
            DispatchQueue.global().async {
                self.data = try! Data(contentsOf: URL(string : self.imageArray[self.tracker])!)
                DispatchQueue.main.async {
                    self.imageView.image = UIImage(data: self.data)
                }
            }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        
        let cell = UITableViewCell()
        cell.textLabel?.text = "Threading test "
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return  25
    }

}

