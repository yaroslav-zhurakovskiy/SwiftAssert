//
//  Created by Yaroslav Zhurakovskiy on 27.02.2020.
//

import XCTest

@available(iOS 9.0, *)
public class XCUIElementTypeFormatter {
    public static var shared = XCUIElementTypeFormatter()
    
    public init() {
        
    }
    
    public func format(_ element: XCUIElement.ElementType) -> String {
        switch element {
        case .any:
            return "Any"
        case .other:
            return "Other"
        case .application:
            return "Application"
        case .group:
            return "Group"
        case .window:
            return "Window"
        case .sheet:
            return "Sheet"
        case .drawer:
            return "Drawer"
        case .alert:
            return "Alert"
        case .dialog:
            return "Dialog"
        case .button:
            return "Button"
        case .radioButton:
            return "Radio Button"
        case .radioGroup:
            return "Radio Group"
        case .checkBox:
            return "Check Box"
        case .disclosureTriangle:
            return "Disclosure Triangle"
        case .popUpButton:
            return "Pop Up Button"
        case .comboBox:
            return "Combo Box"
        case .menuButton:
            return "Menu Button"
        case .toolbarButton:
            return "Toolbar Button"
        case .popover:
            return "Popover"
        case .keyboard:
            return "Keyboard"
        case .key:
            return "Key"
        case .navigationBar:
            return "Navigation Bar"
        case .tabBar:
            return "Tab Bar"
        case .tabGroup:
            return "Tab Group"
        case .toolbar:
            return "Toolbar"
        case .statusBar:
            return "Status Bar"
        case .table:
            return "Table"
        case .tableRow:
            return "Table Row"
        case .tableColumn:
            return "Table Column"
        case .outline:
            return "Outline"
        case .outlineRow:
            return "Outline Row"
        case .browser:
            return "Browser"
        case .collectionView:
            return "Collection View"
        case .slider:
            return "Slider"
        case .pageIndicator:
            return "Page Indicator"
        case .progressIndicator:
            return "Progress Indicator"
        case .activityIndicator:
            return "Activity Indicator"
        case .segmentedControl:
            return "Segmented Control"
        case .picker:
            return "Picker"
        case .pickerWheel:
            return "Picker Wheel"
        case .switch:
            return "Switch"
        case .toggle:
            return "Toggle"
        case .link:
            return "Link"
        case .image:
            return "Image"
        case .icon:
            return "Icon"
        case .searchField:
            return "Search Field"
        case .scrollView:
            return "Scroll View"
        case .scrollBar:
            return "Scroll Bar"
        case .staticText:
            return "Static Text"
        case .textField:
            return "Text Field"
        case .secureTextField:
            return "Secure Text Field"
        case .datePicker:
            return "Date Picker"
        case .textView:
            return "Text View"
        case .menu:
            return "Menu"
        case .menuItem:
            return "Menu Item"
        case .menuBar:
            return "Menu Bar"
        case .menuBarItem:
            return "Menu Bar Item"
        case .map:
            return "Map"
        case .webView:
            return "Web View"
        case .incrementArrow:
            return "Increment Arrow"
        case .decrementArrow:
            return "Decrement Arrow"
        case .timeline:
            return "Timeline"
        case .ratingIndicator:
            return "Rating Indicator"
        case .valueIndicator:
            return "Value Indicator"
        case .splitGroup:
            return "Split Group"
        case .splitter:
            return "Splitter"
        case .relevanceIndicator:
            return "Relevance Indicator"
        case .colorWell:
            return "Color Well"
        case .helpTag:
            return "Help Tag"
        case .matte:
            return "Matte"
        case .dockItem:
            return "Dock Item"
        case .ruler:
            return "Ruler"
        case .rulerMarker:
            return "Ruler Marker"
        case .grid:
            return "Grid"
        case .levelIndicator:
            return "Level Indicator"
        case .cell:
            return "Cell"
        case .layoutArea:
            return "Layout Area"
        case .layoutItem:
            return "Layout Item"
        case .handle:
            return "Handle"
        case .stepper:
            return "Stepper"
        case .tab:
            return "Tab"
        case .touchBar:
            return "Touch Bar"
        case .statusItem:
            return "Status Item"
        @unknown default:
            return "\(element.rawValue)"
        }
    }
}
