//
//  PhotosCollectionViewController.swift
//  PhotoTapps
//
//  Created by Александр Касьянов on 10.11.2021.
//

import UIKit


class PhotosCollectionViewController: UICollectionViewController {
    
    //массив с изображениями
    let photos = ["dog01", "dog02", "dog03", "dog04", "dog05", "dog06", "dog07", "dog08", "dog09", "dog10", "dog11", "dog12", "dog13", "dog14", "dog15"]
    
    //задаём количество объектов в одном ряду
    let itemsPerRow: CGFloat = 2
    //константа с отступами
    let sectionInsets = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)

    override func viewDidLoad() {
        super.viewDidLoad()
        
//        let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
//        layout.itemSize = CGSize(width: 100, height: 100)
//        layout.sectionInset = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
//        layout.minimumLineSpacing = 30
//        layout.minimumInteritemSpacing = 30
//        layout.scrollDirection = .vertical
//
//        collectionView.showsVerticalScrollIndicator = false

    }
    //реализация открытия изображения в отдельном экране
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "pickPhotoSegue" {
            let photoVC = segue.destination as! PhotoViewController
            let cell = sender as! PhotoCell
            photoVC.image = cell.dogImageView.image
        }
    }

    // MARK: - Navigation


    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return photos.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "photoCell", for: indexPath) as! PhotoCell
    
        // Configure the cell
        //получаем название изображения из массива
        let imageName = photos[indexPath.item]
        //получаем объект типа UIImage
        let image = UIImage(named: imageName)
        //передаём изображение в ячейку
        cell.dogImageView.image = image
        
        return cell
    }

    // MARK: UICollectionViewDelegate


}

//настройка Flow Layout
extension PhotosCollectionViewController: UICollectionViewDelegateFlowLayout {

    //задаём размеры ячеек (sizeForItemAt)
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        //настраиваем динамический размер ячеек в зависимости от экрана
        
        //суммарная ширина горизонтальных отступов в одном ряду
        let paddingWidth = sectionInsets.left * (itemsPerRow + 1)
        //суммарная ширина ячеек в одном ряду
        let availableWidth = collectionView.frame.width - paddingWidth
        //ширина ячейки
        let widthPerItem = availableWidth / itemsPerRow

        return CGSize(width: widthPerItem, height: widthPerItem)
    }
    //задаём отступы секции от границ экрана (insetForSectionAt)
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return sectionInsets
    }
    //задаём вертикальное расстояние, между линиями (minimumLineSpacingForSectionAt)
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return sectionInsets.left
    }
    //задаём горизонтальное расстояние между объектами (minimumInteritemSpacingForSectionAt)
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return sectionInsets.left
    }
}
