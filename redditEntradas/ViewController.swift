//
//  ViewController.swift
//  redditEntradas
//
//  Created by Joaquin Perez Nano on 26/09/2020.
//  Copyright © 2020 Joaquin Perez Nano. All rights reserved.
//

import UIKit
import Foundation


class ViewController: UIViewController, UITableViewDataSource {
    
    
    
    
    @IBOutlet weak var itemsTableView: UITableView!
    
   // var entradas = [decode]()
    
    var items : NSArray = []
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.items.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "DefaultCell", for: indexPath) as! TableViewCellX

        let item = self.items.object(at: indexPath.row) as! Dictionary<String, AnyObject>
        let dataDictionary = item["data"] as! Dictionary<String, AnyObject>
        let title = dataDictionary["title"] as! String
        let autor = dataDictionary["author"] as! String
        let comentarios = dataDictionary["num_comments"] as! Int
        let imageURL = dataDictionary["thumbnail"] as! String
        
        
        
        cell.titleLabel.text = title
        cell.autorLabel.text = autor
        cell.commentsLabel.text = "\(comentarios)"
        
        let url = URL(string: imageURL)
        let data = try? Data(contentsOf: url!)
        if (data != nil) {
            cell.thumbnail.image = UIImage(data: data!)
        }
        
        cell.subreddit.addTarget(self, action: #selector(openAlert(sender:)), for: .touchUpInside)
        cell.tag = indexPath.row

        
        return cell
    }
    
    
    @objc func openAlert(sender: UIButton){
        let buttonTag = sender.tag
        
        let item = self.items.object(at: buttonTag) as! Dictionary<String, AnyObject>
        let dataDictionary = item["data"] as! Dictionary<String, AnyObject>
        
        let subreddit = dataDictionary["subreddit"] as! String

        let alert = UIAlertController(title: "Subreddit", message: subreddit, preferredStyle: .alert)

        alert.addAction(UIAlertAction(title: "Got it", style: .default, handler: nil))

        self.present(alert, animated: true)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.loadPosts()
        
        
    }

    func convertToDictionary(text: String) -> [String: Any]? {
        if let data = text.data(using: .utf8) {
            do {
                return try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
            } catch {
                print(error.localizedDescription)
            }
        }
        return nil
    }
    
    func loadPosts(){
        
        let url = URL(string: "https://www.reddit.com/top/.json")!

        let task = URLSession.shared.dataTask(with: url) {(data, response, error) in
            guard let data = data else { return }
            let jsonString = String(data: data, encoding: .utf8)!
            let aDictionary = self.convertToDictionary(text: jsonString)
            
            let aData = aDictionary?["data"] as! Dictionary<String, AnyObject>
            self.items = aData["children"] as! NSArray
            
            DispatchQueue.main.async {
                self.itemsTableView.reloadData()
            }
            

        }
        task.resume()

    }

    

    
}


