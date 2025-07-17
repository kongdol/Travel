//
//  TravelTableViewController.swift
//  Travel
//
//  Created by yk on 7/14/25.
//

import UIKit

class TravelTableViewController: UITableViewController {
    
    var ti = TravelInfo()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ti.travel.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var backColor:[UIColor] = [.systemPink,.green]
        
        if ti.travel[indexPath.row].ad == true {
           let cell = tableView.dequeueReusableCell(withIdentifier: "AdvertiseTableViewCell", for: indexPath) as! AdvertiseTableViewCell
            cell.advertiseLabel.text = ti.travel[indexPath.row].title
            cell.advertiseLabel.font = .boldSystemFont(ofSize: 16)
            cell.adView.layer.cornerRadius = 32
            cell.adView.clipsToBounds = true
            cell.adView.backgroundColor = backColor.randomElement()

            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "TravelTableViewCell", for: indexPath) as! TravelTableViewCell
            
            // 타이틀
            cell.travelTitle.text = ti.travel[indexPath.row].title
            
            // 서브타이틀
            if let realDescription = ti.travel[indexPath.row].description {
                cell.travelDescription.text = realDescription
            } else {
                cell.travelDescription.text = ""
            }
            
            // 저장레이블
            if let realSave = ti.travel[indexPath.row].save {
                cell.saveLabel.text = "저장 " + saveCount(realSave)
            } else {
                cell.saveLabel.text = "저장 0"
            }
            
            // 여행이미지
            if let realImg = ti.travel[indexPath.row].travel_image {
                let url = URL(string: realImg)
                cell.travelImage.kf.setImage(with: url)
                cell.travelImage.layer.cornerRadius = 8
            } else {}
            
            
            let score = ti.travel[indexPath.row].grade
            
            if score != nil {
                switch Int(score!) {
                case 0...1 :
                    cell.rate.text = "★☆☆☆☆"
                case 1...2 :
                    cell.rate.text = "★★☆☆☆"
                case 2...3 :
                    cell.rate.text = "★★★☆☆"
                case 3...4 :
                    cell.rate.text = "★★★★☆"
                case 4...5 :
                    cell.rate.text = "★★★★★"
                default:
                    print("뭔가잘못됬습니다")
                }
            } else {
                cell.rate.text = ""
            }
            
            // 좋아요이미지
            if let realLike = ti.travel[indexPath.row].like {
                let imageName = realLike ? "heart" : "heart.fill"
                cell.heartImage.setImage(UIImage(systemName: imageName), for: .normal)
            } else {
                cell.heartImage.setImage(UIImage(systemName: "heart"), for: .normal)
            }
            
            cell.heartImage.tag = indexPath.row
            cell.heartImage.addTarget(self, action: #selector(heartTapped), for: .touchUpInside)
            
            
            return cell
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 160
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if ti.travel[indexPath.row].ad == false {
            // 1. 스토리보드 파일찾기
            let sb = UIStoryboard(name: "Main", bundle: nil)
            // 2. 스토리보드 파일내 뷰컨 찾기
            let vc = sb.instantiateViewController(identifier: "DetailTravelViewController") as! DetailTravelViewController
            // 3. 전환
            vc.city = ti.travel[indexPath.row]
            navigationController?.pushViewController(vc, animated: true)
            print("광고가아닌거선택!")
        } else {
            // 1. 스토리보드 찾기
            let sb = UIStoryboard(name: "Main", bundle: nil)
            // 2. 스토리보드 파일내 뷰컨찾기
            let vc = sb.instantiateViewController(withIdentifier: "AdViewController") as! AdViewController
            vc.content = ti.travel[indexPath.row].title
            // 2-1 제목바로 present하기 위해서
            let nav = UINavigationController(rootViewController: vc)
            
            nav.modalPresentationStyle = .fullScreen
            
            // 3. 전환
            present(nav, animated: true)
            print("광고입니다.")
        }
    }
    
    
    
    func saveCount(_ count: Int) -> String {
        let numberFormatter: NumberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        
        let result: String = numberFormatter.string(for: count)!
        
        return result
    }
    
    // 사용할려고 travelInfo를 var로바꿈
    @objc func heartTapped(sender: UIButton) {
        ti.travel[sender.tag].like?.toggle()
        
        tableView.reloadRows(at: [IndexPath(row: sender.tag, section: 0)], with: .fade)
    }
}

//TODO: 별갯수에따라 분기처리, 여행사진없는데 heart누르면 사진 생기는 버그 수정
