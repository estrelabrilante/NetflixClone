//
//  CollectionViewTableViewCell.swift
//  Netflix clone
//
//  Created by SHYNU MARY VARGHESE on 2023-05-13.
//

import UIKit

class CollectionViewTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    //anonymous closure
    let colletcionView : UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 140, height:200)
        layout.scrollDirection = .horizontal
        //inialise collection
        let collectionView = UICollectionView(frame: .zero,collectionViewLayout: layout)
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        return collectionView
    }()
    static let identifier = "CollectionViewTableViewCell"
    //inialized cell
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = .cyan
        //add collectionview to our view
        contentView.addSubview(colletcionView)
        colletcionView.delegate = self
        colletcionView.dataSource = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    //frame for collectionview
    override func layoutSubviews() {
        super.layoutSubviews()
        colletcionView.frame = contentView.bounds
    }
    
}
extension CollectionViewTableViewCell:UICollectionViewDelegate,UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        cell.backgroundColor = .red
    return cell
        
    }
    
    
}



