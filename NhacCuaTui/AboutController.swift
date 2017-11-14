//
//  HomeController.swift
//  NhacCuaTui
//
//  Created by Van Thanh on 8/14/17.
//  Copyright © 2017 Van Thanh. All rights reserved.
//

import UIKit



class AboutController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    

    let cellid = "cellid"
    
    let color1 = UIColor.rgb(red: 58, green: 194, blue: 217)
    let color2 = UIColor.rgb(red: 245, green: 142, blue: 161)
    let color3 = UIColor.rgb(red: 49, green: 167, blue: 154)
    let color4 = UIColor.rgb(red: 234, green: 154, blue: 112)

    
    override var prefersStatusBarHidden: Bool{
        return true
    }
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.dataSource = self
        cv.delegate = self
        cv.backgroundColor = .clear
        cv.isPagingEnabled = true
        cv.showsHorizontalScrollIndicator = false
        cv.register(UICollectionViewCell.self, forCellWithReuseIdentifier: self.cellid)
        return cv
        
    }()
    
    
    let viewMobile: UIView = {
        
        let v = UIView()
        v.backgroundColor = .clear
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
        
    }()
    
    
    let viewForeMobile: UIView = {
        
        let v = UIView()
        v.backgroundColor = .clear
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
        
    }()
    
    
    let viewBackMobile: UIView = {
        
        let v = UIView()
        v.backgroundColor = .clear
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
        
    }()
    
    
    let titleLabel:UILabel = {
       
        let lb = UILabel()
        lb.text = "GIAO DIỆN MỚI"
        lb.textAlignment = .center
        lb.textColor = .white
        lb.font = .boldSystemFont(ofSize: 17)
        lb.translatesAutoresizingMaskIntoConstraints = false
        lb.backgroundColor = .clear
        return lb
        
    }()
    
    let detailLabel:UILabel = {
        
        let lb = UILabel()
        lb.text = "Giới thiệu nhạc phong phú và chính xác"
        lb.textAlignment = .center
        lb.textColor = .white
        lb.adjustsFontSizeToFitWidth = true
        lb.translatesAutoresizingMaskIntoConstraints = false
        lb.backgroundColor = .clear
        return lb
        
    }()
    
    let pageControl: UIPageControl = {
       
        let page = UIPageControl()
        page.translatesAutoresizingMaskIntoConstraints = false
        page.numberOfPages = 4
        return page
        
    }()
    
    
    lazy var experienceBtn: UIButton = {
        let bt = UIButton()
        bt.setTitle("TRẢI NGHIỆM NGAY", for: UIControlState())
        bt.setTitleColor(.white, for: UIControlState())
        bt.backgroundColor = .clear
        bt.translatesAutoresizingMaskIntoConstraints = false
        bt.addTarget(self, action: #selector(handleDismiss), for: .touchUpInside)
        bt.layer.cornerRadius = 20
        bt.layer.masksToBounds = true
        bt.layer.borderColor = UIColor.white.cgColor
        bt.layer.borderWidth = 1.5
        return bt
    }()
    
    override func loadView() {
        super.loadView()
        print("load view")
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("will view")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("did view")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("did dis")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("will dis")
    }
    
    override func viewDidLoad() {
        
        
        super.viewDidLoad()
        print("did load")
        view.backgroundColor = color1
        
        setupViewBackMobile()
        setupViewMobile()
        setupViewForeMobile()
        setupTitleView()
        setupPageControl()
        
        setupCollectionView()
        setupExperienceBtn()
    }
    
    
    func handleDismiss(){
        self.dismiss(animated: true, completion: nil)
    }
    
    var bottomExperience: NSLayoutConstraint?
    var lineExperience:CGFloat = 83
    
    
    
    func setupExperienceBtn(){
        view.addSubview(experienceBtn)
        bottomExperience = experienceBtn.topAnchor.constraint(equalTo: view.bottomAnchor, constant: 100*lineExperience)
        bottomExperience?.isActive = true
        experienceBtn.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0).isActive = true
        experienceBtn.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.7).isActive = true
        experienceBtn.heightAnchor.constraint(equalToConstant: 40).isActive = true
    }
    
    
    func setupPageControl(){
        view.addSubview(pageControl)
        pageControl.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -12).isActive = true
        pageControl.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0).isActive = true
        pageControl.widthAnchor.constraint(equalToConstant: 70).isActive = true
        pageControl.heightAnchor.constraint(equalToConstant: 40).isActive = true
    }
    
    func setupTitleView(){
        
        view.addSubview(titleLabel)
        
        titleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 15).isActive = true
        titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0).isActive = true
        titleLabel.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5).isActive = true
        titleLabel.heightAnchor.constraint(equalToConstant: 22).isActive = true
        
        
        view.addSubview(detailLabel)
        
        detailLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant:0).isActive = true
        detailLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0).isActive = true
        detailLabel.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.85).isActive = true
        detailLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        
    }
    
    
    
    func setupViewBackMobile(){
        
        view.addSubview(viewBackMobile)
        let width = view.frame.width
        let height = view.frame.height
        let width4: CGFloat = 4*width
        
        
        viewBackMobile.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        viewBackMobile.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        viewBackMobile.widthAnchor.constraint(equalToConstant: width4).isActive = true
        rightViewBackMobileConstraint = viewBackMobile.rightAnchor.constraint(equalTo: view.rightAnchor,constant: 0)
        rightViewBackMobileConstraint?.isActive = true
        
        
        let viewBack1 = ViewBackComponent()
        viewBack1.backgroundColor = .clear
        viewBack1.translatesAutoresizingMaskIntoConstraints = false
        viewBackMobile.addSubview(viewBack1)
        
        viewBack1.topAnchor.constraint(equalTo: viewBackMobile.topAnchor, constant: 0).isActive = true
        viewBack1.rightAnchor.constraint(equalTo: viewBackMobile.rightAnchor, constant: 0).isActive = true
        viewBack1.widthAnchor.constraint(equalToConstant: width).isActive = true
        viewBack1.heightAnchor.constraint(equalToConstant: height).isActive = true
        
        
        
        let viewBack2 = ViewBackComponent()
        viewBack2.backgroundColor = .clear
        viewBack2.translatesAutoresizingMaskIntoConstraints = false
        viewBackMobile.addSubview(viewBack2)
        
        viewBack2.topAnchor.constraint(equalTo: viewBackMobile.topAnchor, constant: 0).isActive = true
        viewBack2.rightAnchor.constraint(equalTo: viewBack1.leftAnchor, constant: 0).isActive = true
        viewBack2.widthAnchor.constraint(equalToConstant: width).isActive = true
        viewBack2.heightAnchor.constraint(equalToConstant: height).isActive = true
        
        
        
        let viewBack3 = ViewBackComponent()
        viewBack3.backgroundColor = .clear
        viewBack3.translatesAutoresizingMaskIntoConstraints = false
        viewBackMobile.addSubview(viewBack3)
        
        viewBack3.topAnchor.constraint(equalTo: viewBackMobile.topAnchor, constant: 0).isActive = true
        viewBack3.rightAnchor.constraint(equalTo: viewBack2.leftAnchor, constant: 0).isActive = true
        viewBack3.widthAnchor.constraint(equalToConstant: width).isActive = true
        viewBack3.heightAnchor.constraint(equalToConstant: height).isActive = true
        
        
        let viewBack4 = ViewBackComponent()
        viewBack4.backgroundColor = .clear
        viewBack4.translatesAutoresizingMaskIntoConstraints = false
        viewBackMobile.addSubview(viewBack4)
        
        viewBack4.topAnchor.constraint(equalTo: viewBackMobile.topAnchor, constant: 0).isActive = true
        viewBack4.rightAnchor.constraint(equalTo: viewBack3.leftAnchor, constant: 0).isActive = true
        viewBack4.widthAnchor.constraint(equalToConstant: width).isActive = true
        viewBack4.heightAnchor.constraint(equalToConstant: height).isActive = true
        
        
    }
    
    
    func setupViewForeMobile(){
        
        view.addSubview(viewForeMobile)
        
        let width = view.frame.width
        let width4: CGFloat = 4*width
        
        
        viewForeMobile.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        viewForeMobile.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        viewForeMobile.widthAnchor.constraint(equalToConstant: width4).isActive = true
        rightViewForeMobileConstraint = viewForeMobile.rightAnchor.constraint(equalTo: view.rightAnchor,constant: 0)
        rightViewForeMobileConstraint?.isActive = true

        
        let viewFore1 = ViewForeComponent()
        viewFore1.backgroundColor = .clear
        viewFore1.translatesAutoresizingMaskIntoConstraints = false
        viewForeMobile.addSubview(viewFore1)
        
        viewFore1.topAnchor.constraint(equalTo: viewForeMobile.topAnchor, constant: 0).isActive = true
        viewFore1.rightAnchor.constraint(equalTo: viewForeMobile.rightAnchor, constant: 0).isActive = true
        viewFore1.widthAnchor.constraint(equalToConstant: width).isActive = true
        viewFore1.heightAnchor.constraint(equalToConstant: 200).isActive = true
        
        
        
        let viewFore2 = ViewForeComponent()
        viewFore2.backgroundColor = .clear
        viewFore2.translatesAutoresizingMaskIntoConstraints = false
        viewForeMobile.addSubview(viewFore2)
        
        viewFore2.topAnchor.constraint(equalTo: viewForeMobile.topAnchor, constant: 0).isActive = true
        viewFore2.rightAnchor.constraint(equalTo: viewFore1.leftAnchor, constant: 0).isActive = true
        viewFore2.widthAnchor.constraint(equalToConstant: width).isActive = true
        viewFore2.heightAnchor.constraint(equalToConstant: 200).isActive = true
        
        
        
        let viewFore3 = ViewForeComponent()
        viewFore3.backgroundColor = .clear
        viewFore3.translatesAutoresizingMaskIntoConstraints = false
        viewForeMobile.addSubview(viewFore3)
        
        viewFore3.topAnchor.constraint(equalTo: viewForeMobile.topAnchor, constant: 0).isActive = true
        viewFore3.rightAnchor.constraint(equalTo: viewFore2.leftAnchor, constant: 0).isActive = true
        viewFore3.widthAnchor.constraint(equalToConstant: width).isActive = true
        viewFore3.heightAnchor.constraint(equalToConstant: 200).isActive = true

        
        let viewFore4 = ViewForeComponent()
        viewFore4.backgroundColor = .clear
        viewFore4.translatesAutoresizingMaskIntoConstraints = false
        viewForeMobile.addSubview(viewFore4)
        
        viewFore4.topAnchor.constraint(equalTo: viewForeMobile.topAnchor, constant: 0).isActive = true
        viewFore4.rightAnchor.constraint(equalTo: viewFore3.leftAnchor, constant: 0).isActive = true
        viewFore4.widthAnchor.constraint(equalToConstant: width).isActive = true
        viewFore4.heightAnchor.constraint(equalToConstant: 200).isActive = true

    }
    
    
    
    func setupCollectionView(){
        view.addSubview(collectionView)
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":collectionView]))
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":collectionView]))
    }
    
    
    var rightViewBackMobileConstraint:NSLayoutConstraint?
    var leftViewMobileConstraint:NSLayoutConstraint?
    var rightViewForeMobileConstraint: NSLayoutConstraint?
    func setupViewMobile(){
        view.addSubview(viewMobile)
        
        let width = view.frame.width
        let height = view.frame.height
        let width4: CGFloat = 4*width
        
        
        viewMobile.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        viewMobile.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        viewMobile.widthAnchor.constraint(equalToConstant: width4).isActive = true
        leftViewMobileConstraint = viewMobile.leftAnchor.constraint(equalTo: view.leftAnchor,constant: 0)
        leftViewMobileConstraint?.isActive = true
        
        
        let iconMobile1 = UIImageView()
        iconMobile1.translatesAutoresizingMaskIntoConstraints = false
        iconMobile1.contentMode = .scaleAspectFill
        iconMobile1.image = #imageLiteral(resourceName: "backgroundMobile.png")
        viewMobile.addSubview(iconMobile1)
        
        
        let iconMobile2 = UIImageView()
        iconMobile2.translatesAutoresizingMaskIntoConstraints = false
        iconMobile2.contentMode = .scaleAspectFill
        iconMobile2.image = #imageLiteral(resourceName: "backgroundMobile2.png")
        viewMobile.addSubview(iconMobile2)
        
        
        let iconMobile3 = UIImageView()
        iconMobile3.translatesAutoresizingMaskIntoConstraints = false
        iconMobile3.contentMode = .scaleAspectFill
        iconMobile3.image = #imageLiteral(resourceName: "backgroundMobile.png")
        viewMobile.addSubview(iconMobile3)
        
        
        let iconMobile4 = UIImageView()
        iconMobile4.translatesAutoresizingMaskIntoConstraints = false
        iconMobile4.contentMode = .scaleAspectFill
        iconMobile4.image = #imageLiteral(resourceName: "backgroundMobile2.png")
        viewMobile.addSubview(iconMobile4)
        
        
        iconMobile1.centerYAnchor.constraint(equalTo: viewMobile.centerYAnchor).isActive = true
        iconMobile1.leftAnchor.constraint(equalTo: viewMobile.leftAnchor, constant: 0.14*width).isActive = true
        iconMobile1.widthAnchor.constraint(equalToConstant: 0.413*height).isActive = true
        iconMobile1.heightAnchor.constraint(equalToConstant: 0.7*height).isActive = true
        
        
        iconMobile2.centerYAnchor.constraint(equalTo: viewMobile.centerYAnchor).isActive = true
        iconMobile2.leftAnchor.constraint(equalTo: iconMobile1.rightAnchor, constant: 0.28*width).isActive = true
        iconMobile2.widthAnchor.constraint(equalToConstant: 0.413*height).isActive = true
        iconMobile2.heightAnchor.constraint(equalToConstant: 0.7*height).isActive = true
        
        iconMobile3.centerYAnchor.constraint(equalTo: viewMobile.centerYAnchor).isActive = true
        iconMobile3.leftAnchor.constraint(equalTo: iconMobile2.rightAnchor, constant: 0.28*width).isActive = true
        iconMobile3.widthAnchor.constraint(equalToConstant: 0.413*height).isActive = true
        iconMobile3.heightAnchor.constraint(equalToConstant: 0.7*height).isActive = true
        
        
        iconMobile4.centerYAnchor.constraint(equalTo: viewMobile.centerYAnchor).isActive = true
        iconMobile4.leftAnchor.constraint(equalTo: iconMobile3.rightAnchor, constant: 0.24*width).isActive = true
        iconMobile4.widthAnchor.constraint(equalToConstant: 0.413*height).isActive = true
        iconMobile4.heightAnchor.constraint(equalToConstant: 0.7*height).isActive = true
        
    }
    
    
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        
        
        let width = view.frame.width
        let contentOffset = scrollView.contentOffset.x
        let offset = contentOffset*lineExperience/width
        bottomExperience?.constant = 2*lineExperience - offset
        
        leftViewMobileConstraint?.constant = -contentOffset
        rightViewForeMobileConstraint?.constant = contentOffset
        rightViewBackMobileConstraint?.constant = contentOffset

        let remain = CGFloat(Int(contentOffset)%Int(width))
        let color1 = ( 58, 194,  217)
        let color2 = ( 245, 142,  161)
        let color3 = ( 49,  167,  154)
        let color4 = ( 234,  154,  112)
        
        let divide = Int(contentOffset/width)
        
        if contentOffset >= 0 && contentOffset <= 3*width {
            
            if indexScroll == divide {
                switch indexScroll {
                    
                case 0:
                    switchColorIncrease(startColor: color1, endColor: color2, offset: remain, width: width)
                    break
                case 1:
                    switchColorIncrease(startColor: color2, endColor: color3, offset: remain, width: width)
                    break
                case 2:
                    switchColorIncrease(startColor: color3, endColor: color4, offset: remain, width: width)
                    break
                default:
                    break
                }
            }else if indexScroll == divide + 1 {
                switch indexScroll {
                    
                case 1:
                    switchColorDecrease(startColor: color2, endColor: color1, offset: remain, width: width)
                    break
                case 2:
                    switchColorDecrease(startColor: color3, endColor: color2, offset: remain, width: width)
                    break
                case 3:
                    switchColorDecrease(startColor: color4, endColor: color3, offset: remain, width: width)
                    break
                default:
                    
                    break
                }
            }
   
        }

    }

    
    private func switchColorIncrease(startColor: (Int,Int,Int),endColor: (Int,Int,Int),offset:CGFloat,width: CGFloat ) {
    
        let offsetContent = offset/width
        let x = CGFloat(endColor.0 - startColor.0)
        let y = CGFloat(endColor.1 - startColor.1)
        let z = CGFloat(endColor.2 - startColor.2)
        let colorX: CGFloat
        let colorY: CGFloat
        let colorZ: CGFloat
        
        if x > 0{
            colorX = x*offsetContent + CGFloat(startColor.0)
        }else {
            colorX = CGFloat(startColor.0) - abs(x)*offsetContent
        }
        
        if y > 0{
            colorY = y*offsetContent + CGFloat(startColor.1)
        }else {
            colorY = CGFloat(startColor.1) - abs(y)*offsetContent
        }
        
        
        if z > 0{
            colorZ = z*offsetContent + CGFloat(startColor.2)
        }else {
            colorZ = CGFloat(startColor.2) - abs(z)*offsetContent
        }
        
        view.backgroundColor = UIColor.rgb(red: colorX, green: colorY, blue: colorZ)
        
    }
    
    
    
    private func switchColorDecrease(startColor: (Int,Int,Int),endColor: (Int,Int,Int),offset:CGFloat,width: CGFloat ) {
        
        let offsetContent = offset/width
        let x = CGFloat(endColor.0 - startColor.0)
        let y = CGFloat(endColor.1 - startColor.1)
        let z = CGFloat(endColor.2 - startColor.2)
        let colorX: CGFloat
        let colorY: CGFloat
        let colorZ: CGFloat
        
        if x > 0{
            colorX = x*(1 - offsetContent) + CGFloat(startColor.0)
        }else {
            colorX = CGFloat(startColor.0) - abs(x)*(1 - offsetContent)
        }
        
        if y > 0{
            colorY = y*(1 - offsetContent) + CGFloat(startColor.1)
        }else {
            colorY = CGFloat(startColor.1) - abs(y)*(1 - offsetContent)
        }
        
        
        if z > 0{
            colorZ = z*(1 - offsetContent) + CGFloat(startColor.2)
        }else {
            colorZ = CGFloat(startColor.2) - abs(z)*(1 - offsetContent)
        }
        
        view.backgroundColor = UIColor.rgb(red: colorX, green: colorY, blue: colorZ)
        
    }
    
    var indexScroll = 0
    
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        let width = view.frame.width
        
        let index = Int(targetContentOffset.pointee.x/width)
        indexScroll = index
        pageControl.currentPage = index
    
        
        switch index {
        case 0:
        titleLabel.text = "GIAO DIỆN MỚI"
        detailLabel.text = "Giới thiệu nhạc phong phú và chính xác"
        view.backgroundColor = color1
        break
        case 1:
        titleLabel.text = "ĐỔI THEME"
        detailLabel.text = "Mỗi ngày một giao diện mới"
        view.backgroundColor = color2
        break
        case 2:
        titleLabel.text = "NhacCuaTui VIP"
        detailLabel.text = "Quyền lợi và ưu đãi hấp dẫn dành riêng cho VIP"
        view.backgroundColor = color3
        break
        default:
        titleLabel.text = "NhacCuaTui 6.0"
        detailLabel.text = "Nghe nhạc mọi lúc mọi nơi"
        view.backgroundColor = color4
        }
        
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
       
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellid, for: indexPath)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: view.frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
}


extension UIColor {
    
    static func rgb(red: CGFloat,green: CGFloat, blue: CGFloat) -> UIColor{
        return UIColor(red: red/255.0, green: green/255.0, blue: blue/255.0, alpha: 1)
    }
    
}

