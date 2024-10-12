//
//  Extensions.swift
//  Loja de Filmes
//
//  Created by Jamerson Macedo on 03/10/24.
//

import Foundation
extension Date{
    
    func formatDate(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yyyy"
        return formatter.string(from: date)
    }
    func formatDateAndTime(_ date: Date) -> (date: String, time: String) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy"
        let formattedDate = dateFormatter.string(from: date)
        
        let timeFormatter = DateFormatter()
        timeFormatter.dateFormat = "HH:mm"
        let formattedTime = timeFormatter.string(from: date)
        
        return (date: formattedDate, time: formattedTime)
    }
}
