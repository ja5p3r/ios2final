//
//  picCollectionViewController.swift
//  jasper
//
//  Created by User07 on 2019/6/23.
//  Copyright © 2019 User07. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class picCollectionViewController: UICollectionViewController {
    

    var photos = [Item]()
    
    func fetchData() {
        
        if let url = URL(string: "https://www.flickr.com/services/feeds/photos_public.gne?format=json&nojsoncallback=1") {
            let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
                if let data = data, let feedData = try? JSONDecoder().decode(FeedData.self, from: data) {
                    self.photos = feedData.items
                    DispatchQueue.main.async {
                        self.collectionView.reloadData()
                    }
                }
                
            }
            
            task.resume()
        }
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Register cell classes
        let layout = self.collectionView.collectionViewLayout as? UICollectionViewFlowLayout
        let width = (view.bounds.width - 10) / 2
        layout?.itemSize = CGSize(width: width, height: width + 80)
        fetchData()

        // Do any additional setup after loading the view.
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: UICollectionViewDataSource

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return photos.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! picCollectionViewCell
        
        // Configure the cell
        let photo = photos[indexPath.item]
        cell.titleLabel.text = photo.title
        cell.imageURL = photo.media.m
        cell.showImage.image = nil
        
        
        NetworkUtility.downloadImage(url: cell.imageURL) { (image) in
            if cell.imageURL == photo.media.m, let image = image  {
                DispatchQueue.main.async {
                    cell.showImage.image = image
                }
            }
        }
        
        return cell
    }

    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */

}
