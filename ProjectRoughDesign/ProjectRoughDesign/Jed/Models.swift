import Foundation

struct Section {
    
    let category: String
    var models: [Model]
}

struct Model {
    
    let title: String
    let subtitle: String
    let progress: Int
    let target: Int
}

final class ModelManager {
    
    var sections: [Section] = [
        Section(category: "운동", models: []),
        Section(category: "공부", models: []),
        Section(category: "건강", models: []),
        Section(category: "독서", models: [])
    ]
    
    init() {
        category1()
        category2()
        category3()
        category4()
    }
    
    private func category1() {
        let models = [
            Model(title: "유산소", subtitle: "공원에서 달리기", progress: 50, target: 100),
            Model(title: "근력", subtitle: "2분할 주 4회", progress: 60, target: 100),
            Model(title: "스트레칭", subtitle: "스트레칭 하기", progress: 20, target: 100),
            Model(title: "보조 운동", subtitle: "팔과 복근", progress: 40, target: 100),
        ]
        sections[0].models = models
    }
    
    private func category2() {
        let models = [
            Model(title: "CS 공부", subtitle: "운영체제, 네트워크 스터디", progress: 10, target: 100),
            Model(title: "Swift 공부", subtitle: "WWDC 발표자료 정리", progress: 20, target: 100)
        ]
        sections[1].models = models
    }
    
    private func category3() {
        let models = [
            Model(title: "영양제", subtitle: "비타민 먹기", progress: 40, target: 80),
            Model(title: "수면 패턴", subtitle: "일찍 자기", progress: 60, target: 120)
        ]
        sections[2].models = models
    }
    
    private func category4() {
        let models = [
            Model(title: "만화책 읽기", subtitle: "짱구는 못말려 완독", progress: 50, target: 200)
        ]
        sections[3].models = models
    }
}
