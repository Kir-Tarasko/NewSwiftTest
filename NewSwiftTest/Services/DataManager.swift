//
//  DataManager.swift
//  NewSwiftTest
//
//  Created by Кирилл Тараско on 07.01.2022.
//

import Foundation


class DataManager {
    private let questions :[(question: String, rightAnswer: String, possibleAnswers: [String])] = [
        (question: "Можем ли мы менять значение переменных?", rightAnswer: "Да", possibleAnswers: ["Ну да, но вообще-то нет", "Нет", "Да", "Зависит от обстоятельств"]),
        (question: "Если мы уверены, что значение свойства меняться не будет, что нужно использовать?", rightAnswer: "Константу", possibleAnswers: ["Константу", "Литерал", "Переменную", "Свойство"]),
        (question: "Какая из перечисленных ниже строк создаст новую переменную?", rightAnswer: "var name = «Tim Cook»", possibleAnswers: ["var name = «Tim Cook»", "fruit = «Apple»", "pet = «Rex»", "let city = «Moscow»"]),
        (question: "С какой буквы надо писать все типы в Swift?", rightAnswer: "Со строчной буквы", possibleAnswers: ["Со строчной буквы", "С заглавной буквы", "На свое усмотрение", "Это числовые значения, обмануть меня решили?"]),
        (question: "Можно ли присвоить значению свойство по умолчанию?", rightAnswer: "Да", possibleAnswers: ["Ну да, но вообще-то нет", "Нет", "Да", "Зависит от обстоятельств"]),
        (question: "С какой буквы должны именоваться свойства в Swift?", rightAnswer: "Со строчной", possibleAnswers: ["По желанию", "Со второй буквы, первая не нужна", "С заглавной", "Со строчной"]),
        (question: "Любые целые числа без дробной части хранятся в типе:", rightAnswer: "Int", possibleAnswers: ["Float", "Int", "Trouble", "Double"]),
        (question: "Тип данных, отвечающий за хранение произвольной текстовой информации:", rightAnswer: "String", possibleAnswers: ["Bool", "Int", "Character", "String"]),
        (question: "Каким ключевым словом можно определить константу?", rightAnswer: "let", possibleAnswers: ["cat", "let", "set", "var"]),
        (question: "Какая из перечисленных ниже строк создаст целочисленное значение?", rightAnswer: "var age = 40", possibleAnswers: ["var age = 40", "let power = «1000»", "var size = «12»", "var voltage = 220.0"]),
        (question: "Как называется оператор в этом выражении: a += 2?", rightAnswer: "Присваивания со сложением", possibleAnswers: ["Присваивания", "Составного сложения", "Сложения", "Присваивания со сложением"]),
        (question: "Если при использовании логического И (&&) первый операнд = false будет ли проверяться второе выражение?", rightAnswer: "Нет", possibleAnswers: ["Ну да, но вообще-то нет", "Нет", "Да", "Зависит от обстоятельств"]),
        (question: "Какой будет результат выражения 9 % 5 ?", rightAnswer: "4", possibleAnswers: ["1", "3", "6", "4"]),
        (question: "Левая часть выражения с логическим оператором || равна true, будем ли мы проверять вторую часть?", rightAnswer: "Нет", possibleAnswers: ["Зависит от операндов", "Нет", "Да, только если она true", "Да, только если она false"]),
        (question: "Операторы, которые применяются к двум величинам", rightAnswer: "Бинарные", possibleAnswers: ["Бинарные", "Тернарные", "Унарные", "Двоичные"]),
        (question: "Этот логический оператор будет давать true, когда хотя бы один операнд = true", rightAnswer: "Логическое ИЛИ ||", possibleAnswers: ["Логическое ИЛИ ||", "Логическое НЕ !", "Логическое И &&", "Зависит от обстоятельств"]),
        (question: "Присваивание объявленному объекту начального значения это:", rightAnswer: "Инициализация", possibleAnswers: ["Объявление", "Инициализация", "Обновление", "Возведение"]),
        (question: "ТОЛЬКО когда оба операнда равны true, этот логический оператор дает true", rightAnswer: "&&", possibleAnswers: ["!", "||", "&&", "??"]),
        (question: "Задайте диапазон от a до b, исключая b", rightAnswer: "a..< b", possibleAnswers: ["a...b", "a..<", "a..< b", "a..."]),
        (question: "Унарные операторы, которые ставятся перед величиной", rightAnswer: "Префиксные", possibleAnswers: ["Постфиксные", "Суффиксные", "Префиксные", "Зависит от обстоятельств"]),
    ]
    
    private var test: Test!
    private var _totalAnswers = 0
    private var _totalRightAnswers = 0
    
    var question: String {
        return test.question
    }
    
    var possibleAnswers: [String] {
        return test.possibleAnswers
    }
    
    var totalAnswers: Int {
        return _totalAnswers
    }
    
    var totalRightAnswers: Int {
        return _totalRightAnswers
    }
    
    func refreshTest() {
        let randomIndex = Int.random(in: 0..<20)
        let testData = questions[randomIndex]
        
        test = Test(question: testData.question, possibleAnswers: testData.possibleAnswers, rightedAnswer: testData.rightAnswer)
    }
    
    func validateAnswer(index: Int) {
        _totalAnswers += 1
        if test.validatePossibleAnswer(index){
            _totalRightAnswers += 1
        }
    }

}
