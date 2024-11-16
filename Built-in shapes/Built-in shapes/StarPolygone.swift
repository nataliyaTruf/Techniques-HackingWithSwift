//
//  StarPolygone.swift
//  Built-in shapes
//
//  Created by Natasha Trufanova on 16/11/2024.
//

import SwiftUI

struct Star: Shape {
    // Храним количество углов звезды и степень её "заострённости" (ближе к центру или дальше)
    let corners: Int
    let smoothness: Double
    
    func path(in rect: CGRect) -> Path {
        // Убедимся, что количество углов звезды >= 2, иначе возвращаем пустой путь
        guard corners >= 2 else { return Path() }
        
        // Находим центр прямоугольника, откуда начнём рисовать звезду
        let center = CGPoint(x: rect.width / 2, y: rect.height / 2)
        
        // Устанавливаем текущий угол как  -\pi / 2 , чтобы начать рисовать звезду с верхней точки (сверху, а не справа или снизу).
        var currentAngle = -CGFloat.pi / 2
        
        // Рассчитываем угол поворота между каждой точкой звезды (внешней или внутренней)
        let angleAdjustment = .pi * 2 / Double(corners * 2)
        
        // Рассчитываем смещение по X и Y для внутренних точек звезды
        let innerX = center.x * smoothness
        let innerY = center.y * smoothness
        
        // Инициализируем путь для рисования
        var path = Path()
        
        // Переходим к начальной точке — верхней внешней вершине звезды
        path.move(to: CGPoint(x: center.x * cos(currentAngle), y: center.y * sin(currentAngle)))
        
        // Отслеживаем самую нижнюю точку фигуры, чтобы позже выровнять звезду
        var bottomEdge: Double = 0
        
        // Проходим по всем точкам звезды (внешним и внутренним), их будет corners * 2
        for corner in 0..<corners * 2 {
            // Рассчитываем синус и косинус текущего угла
            let sinAngle = sin(currentAngle)
            let cosAngle = cos(currentAngle)
            let bottom: Double // Переменная для отслеживания Y-координаты текущей точки
            
            // Если текущий угол кратен 2, то это внешняя вершина звезды
            if corner.isMultiple(of: 2) {
                // Рассчитываем Y-координату внешней точки
                bottom = center.y * sinAngle
                
                // Добавляем линию к этой точке
                path.addLine(to: CGPoint(x: center.x * cosAngle, y: bottom))
            } else {
                // Это внутренняя вершина звезды
                
                // Рассчитываем Y-координату внутренней точки
                bottom = innerY * sinAngle
                
                // Добавляем линию к этой точке
                path.addLine(to: CGPoint(x: innerX * cosAngle, y: bottom))
            }
            
            // Обновляем самую нижнюю точку, если она ниже предыдущей
            if bottom > bottomEdge {
                bottomEdge = bottom
            }
            
            // Увеличиваем угол для перехода к следующей точке
            currentAngle += angleAdjustment
        }
        
        // Рассчитываем, сколько свободного места осталось снизу фигуры
        let unusedSpace = (rect.height / 2 - bottomEdge) / 2
        
        // Создаём преобразование, чтобы сдвинуть фигуру вниз и выровнять по центру
        let transform = CGAffineTransform(translationX: center.x, y: center.y + unusedSpace)
        
        // Применяем преобразование к пути и возвращаем результат
        return path.applying(transform)
    }
}

struct StarPolygone: View {
    var body: some View {
        Star(corners: 5, smoothness: 0.45)
            .frame(width: 200, height: 200)
    }
}

#Preview {
    StarPolygone()
}
