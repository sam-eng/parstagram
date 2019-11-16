//
//  FeedViewController.swift
//  parstagram
//
//  Created by Samantha Eng on 11/15/19.
//  Copyright © 2019 Samantha Eng. All rights reserved.
//

import UIKit
import Parse
import AlamofireImage
import Alamofire

class FeedViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var posts = [PFObject]()
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
        DataRequest.addAcceptableImageContentTypes(["application/octet-stream"])
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        let query = PFQuery(className:"posts")
        query.includeKey("author")
        query.limit = 20
        
        query.findObjectsInBackground { (posts, Error) in
            if posts != nil {
                self.posts = posts!
                self.tableView.reloadData()
            }
            else {
                print("Error, could not retrieve posts: \(Error)")
            }
        }
    }
    
    @IBAction func onPost(_ sender: Any) {
        performSegue(withIdentifier: "cameraSegue", sender: nil)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let post = posts[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "PostCell", for: indexPath) as! PostCell
        let user = post["author"] as! PFUser
        cell.usernameLabel.text = user.username
        cell.commentLabel.text = post["caption"] as? String
        let imageFile = post["image"] as! PFFileObject
        print(imageFile.url!)
        let urlString = imageFile.url!
        let imageURL = URL(string: urlString)!
        cell.postView.af_setImage(withURL: imageURL)
        return cell
    }

}
