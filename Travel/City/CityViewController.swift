//
//  RealCityViewController.swift
//  Travel
//
//  Created by yk on 7/17/25.
//

import UIKit

class CityViewController: UIViewController {
    
    @IBOutlet var textField: UITextField!
    @IBOutlet var cityTableView: UITableView!
    
    @IBOutlet var allButton: UIButton!
    @IBOutlet var domesticButton: UIButton!
    @IBOutlet var abroadButton: UIButton!
    
    var list = CityInfo().city
    
    // 0-모두, 1-국내, 2-해외
    // 하나에 묶을수있는방법없을까
    var domesticNumber = 0
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        textField.delegate = self
        configureTableView()
        
        allButton.addTarget(self, action: #selector(allButtonTapped), for: .touchUpInside)
        domesticButton.addTarget(self, action: #selector(domesticButtonTapped), for: .touchUpInside)
        abroadButton.addTarget(self, action: #selector(abroadButtonTapped), for: .touchUpInside)
    }
    
    
    func configureTableView() {
        print(#function)
        cityTableView.delegate = self
        cityTableView.dataSource = self
        
        cityTableView.backgroundColor = .clear
        
        cityTableView.rowHeight = 200
        
        let xib = UINib(nibName: "CityTableViewCell", bundle: nil)
        cityTableView.register(xib, forCellReuseIdentifier: "CityTableViewCell")
    }
    // MARK: all
    @objc func allButtonTapped() {
        let all = CityInfo().city
        var filter: [City] = []
        for item in all {
            filter.append(item)
        }
        
        list = filter
        // 모두버튼선택
        domesticNumber = 0
        cityTableView.reloadData()
    }
    
    // MARK: 국내
    @objc func domesticButtonTapped(){
        //전체 데이터
        let all = CityInfo().city
        
        var filter: [City] = []
        
        for item in all {
            if item.domestic_travel == true {
                filter.append(item)
            }
        }
        
        list = filter
        domesticNumber = 1
        cityTableView.reloadData()
    }
    
    // MARK: 해외
    @objc func abroadButtonTapped() {
        // 전체 데이터
        let all = CityInfo().city
        // 필터데이터
        var filter: [City] = []
        
        for item in all {
            if item.domestic_travel == false {
                filter.append(item)
            }
        }
        list = filter
        
        domesticNumber = 2
        cityTableView.reloadData()
    }
    
}

extension CityViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // guard var상관없나
        guard let text = textField.text else {return true}
        
        var isA: Bool = false
        
        if !text.trimmingCharacters(in: .whitespaces).isEmpty { // 공백 아닌 문자열이 있을경우
            print(text) // 텍스트필드내용
            
            // 텍스트필드에 들어온 영어 소문자
            var lowercasedText = text.lowercased()
            
            let all = CityInfo().city
            // 국내데이터만가지고온건지
            var allFilter: [City] = []
            var filter: [City] = []
            var abroadFilter: [City] = []
            
            for item in all {
                // 구조체에 들어있는거 소문자로 만들어주기
                var lowerEngName = item.city_english_name.lowercased()
//                [1, 2, 3].filter { num in
//                    if num == 1 { return true }
//                } // 1
//                switch case {
//                case 0 : all
//                case 1: filter = isDomestic.filter
//                case 2:!isDomestic.filter
//                }
//                
                // 전체
                if item.city_name.contains(lowercasedText) || lowerEngName.contains(lowercasedText) || item.city_explain.contains(lowercasedText) {
                    allFilter.append(item)
                }
                
                if item.domestic_travel == true {
                    // 포함하는거 꺼내기
                    if item.city_name.contains(lowercasedText) || lowerEngName.contains(lowercasedText) || item.city_explain.contains(lowercasedText) {
                        filter.append(item)
                    }
                }
                
                // 뭐가됬든외국만
                if item.domestic_travel == false {
                    // 포함하는거 꺼내기
                    if item.city_name.contains(lowercasedText) || lowerEngName.contains(lowercasedText) || item.city_explain.contains(lowercasedText) {
                        abroadFilter.append(item)
                        //list = abroadFilter
                    }
                }
                
                
                
                if domesticNumber == 1 {
                    list = filter
                } else if domesticNumber == 2{
                    list = abroadFilter
                } else if domesticNumber == 0 {
                    list = allFilter
                }
                cityTableView.reloadData()
                
                                
                }
            } else {
            print("텍스트필드가 비어있어요")
        }
        return true
    }
}
extension CityViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CityTableViewCell", for: indexPath) as! CityTableViewCell
        
        let row = list[indexPath.row]
        // 국내 + 검색어로 필터링된 데이터인지
        cell.backgroundColor = .clear
        
        cell.cityName.text = row.city_name + " | " + row.city_english_name
        cell.cityName.textColor = .white
        cell.cityName.font = UIFont.boldSystemFont(ofSize: 20)
        
        cell.cityExplain.text = row.city_explain
        cell.cityExplain.textColor = .white
        cell.cityExplain.backgroundColor = .black.withAlphaComponent(0.5)
        
        
        // 여행이미지
        let img = list[indexPath.row].city_image
        let url = URL(string: img)
        cell.cityImage.kf.setImage(with: url)
        cell.cityImage.layer.cornerRadius = 16
        cell.cityImage.clipsToBounds = true
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: "CityDetailViewController") as! CityDetailViewController
        vc.city = list[indexPath.row].city_name
        
        present(vc, animated: true)
    }
}

