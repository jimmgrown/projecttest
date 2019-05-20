//
//  ViewController.swift
//  RESTApi
//
//  Created by user152741 on 26/04/2019.
//  Copyright © 2019 user152741. All rights reserved.
//

import UIKit
import AlamofireImage
import SwiftyVK

class ViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    var imagesID = [Int]()
    var imagesArray = [String](){
        didSet {
            collectionView.reloadData()
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        collectionView.delegate = self
        collectionView.dataSource = self
        
        VK.API.Photos.getById([Parameter.photos : "-63458533_317782387"])
            .onSuccess { (result) in
                let json = JSON(result)
                let url = json[0]["sizes"][2]["url"].stringValue
                self.imagesArray.append(url)
                
                            }
            .onError { (error) in
                print(error)
            }.send()
        
    }


}
extension ViewController:UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        performSegue(withIdentifier: "openArticle", sender: nil)
    }
}

extension ViewController:UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imagesArray.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ImageCollectionViewCell", for: indexPath) as! ImageCollectionViewCell
        
        cell.setup(stringURL: imagesArray[indexPath.item])
     
        return cell
    }
}



extension ViewController:UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = collectionView.frame.size.width - 30
        let cellSize = size / 2
        
        return CGSize(width: cellSize, height: cellSize)
    }
}
