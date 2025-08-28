//
//  AspectVGrid.swift
//  Memorize
//
//  Created by Guillermo Reyes on 8/28/25.
//

import SwiftUI

struct AspectVGrid<Item: Identifiable, ItemView: View>: View {
    let items: [Item]
    var aspectRatio: CGFloat = 1
    let content: (Item) -> ItemView
    
    init(_ items: [Item], aspectRatio: CGFloat, @ViewBuilder content: @escaping (Item) -> ItemView) {
        self.items = items
        self.aspectRatio = aspectRatio
        self.content = content
    }
    
    var body: some View {
        GeometryReader { geometry in
            let gridItemSize = gridItemWidthThatFits(
                count: items.count,
                size: geometry.size,
                atAspectRatio: aspectRatio
            )
            LazyVGrid(columns: [GridItem(.adaptive(minimum: gridItemSize), spacing: 0)], spacing: 0) {
                ForEach(items) { item in
                    content(item)
                        .aspectRatio(aspectRatio, contentMode: .fit)
                }
            }
        }
    }
    
    func gridItemWidthThatFits(
        count: Int,
        size: CGSize,
        atAspectRatio aspectRatio: CGFloat
    ) -> CGFloat {
        var columnCount = 1
        var rowCount = count
        
        repeat {
            let itemWidth = size.width / CGFloat(columnCount)
            let itemHeight = itemWidth / aspectRatio
            if CGFloat(rowCount) * itemHeight <= size.height {
                return floor(itemWidth)
            }
            columnCount += 1
            rowCount = (count + (columnCount - 1)) / columnCount
        } while columnCount <= count
        
        return floor(size.width / CGFloat(count))
    }


}
