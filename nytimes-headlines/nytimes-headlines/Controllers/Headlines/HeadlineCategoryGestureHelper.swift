//
//  HeadlinesGestureSettings.swift
//  nytimes-headlines
//
//  Created by KUTAN ÇINGISIZ on 3.03.2019.
//  Copyright © 2019 KUTAN ÇINGISIZ. All rights reserved.
//

import UIKit

class HeadlineCategoryGestureHelper {
    
    final let categories : [String] = ["World","U.S","Politics","Business","Opinion","Tech","Science","Health","Sports","Art","Book","Style"
        ,"Food","Travel","Magazine","T Magazine","Real Estate","Video"]
    
    // CategoryCollectionView constant values
    final let categoryItemWidth : CGFloat =  (UIScreen.main.bounds.size.width - 66) / 4
    final let categoryItemHeight : CGFloat = 30.0
    final let categoryVerticalSpacing : CGFloat = 8.0
    final let categoryHorizontalSpacing : CGFloat = 8.0
    
    var collectionViewFrame : CGRect = .zero
    var rowCount = 0
    let columnCount = 4
    
    
    init() {
        self.setRowColumnCount()
    }
    
    func setRowColumnCount(){
        
        let divider = self.categories.count / 4
        let remainder = self.categories.count.remainderReportingOverflow(dividingBy: 4)
        
        if remainder.partialValue == 0 {
            self.rowCount = divider
        }else {
            self.rowCount = divider + 1
        }
        
    }
    
}

// MARK: GestureView Extension Methods
extension HeadlineCategoryGestureHelper {
    
    func getCurrentHoveredItemIndex(ghosView : UIView, collectionViewFrame : CGRect) -> Int {
        
        self.collectionViewFrame = collectionViewFrame
        
        guard let hoveredRow = calculateCurrentRowIndex(ghostView: ghosView) else {
            return -1
        }
        
        guard let hoveredColumn = calculateCurrentColumnIndex(ghostView: ghosView) else {
            return -1
        }
        
        let item = (hoveredRow * 4) + hoveredColumn
        return item
        
    }
    
    func calculateCurrentRowIndex(ghostView : UIView) -> Int?{
        
        let centerYFromBottom = ghostView.center.y - (self.collectionViewFrame.minY)
        
        if centerYFromBottom >= categoryItemHeight + categoryVerticalSpacing {
            
            if centerYFromBottom - (CGFloat(rowCount) * categoryVerticalSpacing) < categoryItemHeight {
                return 1
            }else {
                return Int((centerYFromBottom - (CGFloat(rowCount) * categoryVerticalSpacing)) / categoryItemHeight)
            }
            
        }else {
            return 0
        }
    }
    
    func calculateCurrentColumnIndex(ghostView : UIView) -> Int?{
        
        let centerXFromRight = ghostView.center.x - (self.collectionViewFrame.minX)
        
        if centerXFromRight >= categoryItemWidth + categoryHorizontalSpacing {
            
            if centerXFromRight - (CGFloat(columnCount) * categoryHorizontalSpacing) < categoryItemWidth {
                return 1
            }else {
                return Int((centerXFromRight - (CGFloat(columnCount) * categoryHorizontalSpacing)) / categoryItemWidth)
            }
            
        }else {
            return 0
        }
        
    }
    
}
