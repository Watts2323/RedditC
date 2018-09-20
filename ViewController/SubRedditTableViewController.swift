//
//  SubRedditTableViewController.swift
//  RedditObjC
//
//  Created by Xavier on 9/20/18.
//  Copyright © 2018 Xavier ios dev. All rights reserved.
//

import UIKit


class SubRedditTableViewController: UITableViewController{
    
    
    
    @IBOutlet weak var redditSearchBar: UISearchBar!
    

    
    var posts: [XMWPost]?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        redditSearchBar.delegate = self
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return posts?.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "postCell", for: indexPath) as? PostTableViewCell
        let post = posts?[indexPath.row]
        if let post = post{
            XMWSubRedditClient.fetchImageData(forUrl: post.imageUrl) { (photo) in
                DispatchQueue.main.async {
                    cell?.postImageView.image = photo
                }
            }
            
        }
        cell?.post = post
        return cell ?? UITableViewCell()
    }
}

extension SubRedditTableViewController: UISearchBarDelegate{
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let searchTerm = searchBar.text, !searchTerm.isEmpty else { return }
        XMWSubRedditClient.fetchAllSubReddits(forTitle: searchTerm, with: { (posts) in
            self.posts = posts
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        })
    }
}
















