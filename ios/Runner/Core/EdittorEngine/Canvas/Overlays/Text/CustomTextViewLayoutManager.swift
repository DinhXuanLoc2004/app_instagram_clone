//
//  CustomTextViewLayoutManager.swift
//  Runner
//
//  Created by User on 2/1/26.
//

enum TextBackgroundType {
    case none
    case solid
    case border
}

final class CustomTextViewLayoutManager: NSLayoutManager {
    // MARK: - Public properties
    var R: CGFloat = 8
    var LINE_WIDTH: CGFloat = 5
    var useColor: UIColor?
    var type: TextBackgroundType = .none
    
    // MARK: - Private properties
    private var maxIndex: Int = 0
    private var offsetY: CGFloat = 0
    private var extendWidth: CGFloat = 0
    
    private var pointArray: NSArray = []
    private lazy var path: UIBezierPath = UIBezierPath()
    private lazy var rectArray: [CGRect] = []
    
    // MARK: - Override
    override func drawBackground(forGlyphRange glyphsToShow: NSRange, at origin: CGPoint) {
        super.drawBackground(forGlyphRange: glyphsToShow, at: origin)
        
        let range = characterRange(forGlyphRange: glyphsToShow, actualGlyphRange: nil)
        let glyphRange = glyphRange(forCharacterRange: range, actualCharacterRange: nil)
        
        guard let context = UIGraphicsGetCurrentContext() else {return}
        context.saveGState()
        context.translateBy(x: origin.x, y: origin.y)
        
        setContext(context, ifClear: false)
        
        path.removeAllPoints()
        rectArray.removeAll()
        
        enumerateLineFragments(forGlyphRange: glyphRange) { rect, usedRect, textContainer, lineGlyphRange, stop in
            
            let newRect = CGRect(x: usedRect.origin.x - self.extendWidth, y: usedRect.origin.y + self.offsetY, width: usedRect.size.width + self.extendWidth * 2, height: usedRect.size.height)
            
            self.rectArray.append(newRect)
        }
        
        preProccess()
        
        if type == .solid {
            drawSolid()
        }
        
        if type == .border {
            drawBorder(context)
        }
        
        context.restoreGState()
    }
}

extension CustomTextViewLayoutManager {
    // MARK: - Private methods
    private func drawSolid(){
        for i in 0 ..< rectArray.count {
            let cur = rectArray[i]
            R = cur.size.height * 0.18
            
            path.append(
                UIBezierPath(roundedRect: cur, cornerRadius: R)
            )
            
            var last: CGRect? = nil
            
            if i > 0 {
                last = rectArray[i - 1]
                
                guard let last = last else {return}
                
                let a = cur.origin
                let b = CGPoint(x: cur.maxX, y: cur.origin.y)
                let c = CGPoint(x: last.origin.x, y: last.maxY)
                let d = CGPoint(x: last.maxX, y: last.maxY)
                
                if a.x - c.x >= 2*R {
                    // Draw
                    let p = UIBezierPath(
                        arcCenter: CGPoint(x: a.x - R, y: a.y + R),
                        radius: R,
                        startAngle: .pi * 1.5,
                        endAngle: 0,
                        clockwise: true
                    )
                    p.append(
                        UIBezierPath(
                            arcCenter: CGPoint(x: a.x + R, y: a.y + R),
                            radius: R,
                            startAngle: .pi,
                            endAngle: .pi * 1.5,
                            clockwise: true
                        )
                    )
                    p.addLine(to: CGPoint(x: a.x - R, y: a.y))
                    path.append(p)
                    // remove
                }
                
                if a.x == c.x {
                    // draw
                    path.move(to: CGPoint(x: a.x, y: a.y - R))
                    path.addLine(to: CGPoint(x: a.x, y: a.y + R))
                    path.addArc(withCenter: CGPoint(x: a.x + R, y: a.y + R), radius: R, startAngle: .pi, endAngle: .pi * 1.5, clockwise: true)
                    path.addArc(withCenter: CGPoint(x: a.x + R, y: a.y - R), radius: R, startAngle: .pi / 2, endAngle: .pi, clockwise: true)
                    // remove
                }
                
                if d.x - b.x >= 2*R {
                    // draw
                    let p = UIBezierPath(arcCenter: CGPoint(x: b.x + R, y: b.y + R), radius: R, startAngle: .pi * 1.5, endAngle: .pi, clockwise: false)
                    p.append(UIBezierPath(arcCenter: CGPoint(x: b.x - R, y: b.y + R), radius: R, startAngle: 0, endAngle: .pi * 1.5, clockwise: false))
                    p.addLine(to: CGPoint(x: b.x + R, y: b.y))
                    path.append(p)
                    // remove
                }
                
                if d.x == b.x {
                    // draw
                    path.move(to: CGPoint(x: b.x, y: b.y - R))
                    path.addLine(to: CGPoint(x: b.x, y: b.y + R))
                    path.addArc(withCenter: CGPoint(x: b.x - R, y: b.y + R), radius: R, startAngle: 0, endAngle: .pi * 1.5, clockwise: false)
                    path.addArc(withCenter: CGPoint(x: b.x - R, y: b.y - R), radius: R, startAngle: .pi / 2, endAngle: 0, clockwise: false)
                    // remove
                }
                
                if c.x - a.x >= 2*R {
                    // draw
                    let p = UIBezierPath(arcCenter: CGPoint(x: c.x - R, y: c.y - R), radius: R, startAngle: .pi / 2, endAngle: 0, clockwise: false)
                    p.append(UIBezierPath(arcCenter: CGPoint(x: c.x + R, y: c.y - R), radius: R, startAngle: .pi, endAngle: .pi / 2, clockwise: false))
                    p.addLine(to: CGPoint(x: c.x - R, y: c.y))
                    path.append(p)
                    // remove
                }
                
                if b.x - d.x >= 2*R {
                    // draw
                    let p = UIBezierPath(arcCenter: CGPoint(x: d.x + R, y: d.y - R), radius: R, startAngle: .pi / 2, endAngle: .pi, clockwise: true)
                    p.append(UIBezierPath(arcCenter: CGPoint(x: d.x - R, y: d.y - R), radius: R, startAngle: 0, endAngle: .pi / 2, clockwise: true))
                    p.addLine(to: CGPoint(x: d.x + R, y: d.y))
                    path.append(p)
                    // remove
                }
            }
        }
        
        path.fill()
        path.stroke()
    }
    
    private func setContext(_ context: CGContext, ifClear isClear: Bool){
        if isClear {
            context.setBlendMode(.clear)
            UIColor.clear.setStroke()
        } else {
            context.setBlendMode(.normal)
            
            if let useColor = self.useColor {
                useColor.setFill()
                useColor.setStroke()
            } else {
                UIColor.black.setFill()
                UIColor.black.setStroke()
            }
        }
    }
    
    private func drawBorder(_ context: CGContext){
        for i in 0 ..< rectArray.count {
            let cur = rectArray[i]
            R = cur.size.height * 0.18
            LINE_WIDTH = R * 0.25
            
            setContext(context, ifClear: false)
            
            path = UIBezierPath(roundedRect: cur, cornerRadius: R)
            path.lineWidth = LINE_WIDTH
            path.stroke()
            
            var last: CGRect? = nil
            
            if i > 0 {
                last = rectArray[i - 1]
                
                guard let last = last else { return }
                
                let a = cur.origin
                let b = CGPoint(x: cur.maxX, y: cur.origin.y)
                let c =  CGPoint(x: last.origin.x, y: last.maxY)
                let d = CGPoint(x: last.maxX, y: last.maxY)
                let centerX = ((a.x > c.x ? a.x : c.x) + (b.x > d.x ? d.x : b.x)) / 2
                
                if a.x - c.x >= 2*R {
                    setContext(context, ifClear: true)
                    let clearPath = UIBezierPath()
                    clearPath.append(UIBezierPath(arcCenter: CGPoint(x: a.x + R, y: a.y + R), radius: R, startAngle: .pi, endAngle: .pi * 1.5, clockwise: true))
                    clearPath.addLine(to: CGPoint(x: centerX + 1, y: a.y))
                    clearPath.addLine(to: CGPoint(x: a.x - R, y: a.y))
                    clearPath.lineWidth = LINE_WIDTH * 1.25
                    clearPath.stroke()
                    
                    setContext(context, ifClear: false)
                    
                    let addPath = UIBezierPath(arcCenter: CGPoint(x: a.x - R, y: a.y + R), radius: R, startAngle: .pi * 1.5, endAngle: 0, clockwise: true)
                    addPath.lineWidth = LINE_WIDTH
                    addPath.lineCapStyle = .round
                    addPath.stroke()
                }
                
                if a.x == c.x {
                    setContext(context, ifClear: true)
                    let clearPath = UIBezierPath()
                    clearPath.addArc(withCenter: CGPoint(x: a.x + R, y: c.y + R), radius: R, startAngle: .pi, endAngle: .pi * 1.5, clockwise: true)
                    clearPath.addLine(to: CGPoint(x: centerX + 1, y: a.y))
                    clearPath.addArc(withCenter: CGPoint(x: a.x + R, y: a.y - R), radius: R, startAngle: .pi / 2, endAngle: .pi, clockwise: true)
                    clearPath.lineWidth = LINE_WIDTH * 1.25
                    clearPath.stroke()
                    
                    setContext(context, ifClear: false)
                    let addPath = UIBezierPath()
                    addPath.move(to: CGPoint(x: a.x, y: a.y - R))
                    addPath.addLine(to: CGPoint(x: a.x, y: a.y + R))
                    addPath.lineWidth = LINE_WIDTH
                    addPath.lineCapStyle = .round
                    addPath.stroke()
                }
                
                if d.x - b.x >= 2*R {
                    setContext(context, ifClear: true)
                    let clearPath = UIBezierPath()
                    clearPath.append(UIBezierPath(arcCenter: CGPoint(x: b.x - R, y: b.y + R), radius: R, startAngle: 0, endAngle: .pi * 1.5, clockwise: false))
                    clearPath.addLine(to: CGPoint(x: centerX - 1, y: b.y))
                    clearPath.addLine(to: CGPoint(x: b.x + R, y: b.y))
                    clearPath.lineWidth = LINE_WIDTH
                    clearPath.stroke()
                    
                    setContext(context, ifClear: false)
                    
                    let addPath = UIBezierPath(arcCenter: CGPoint(x: b.x + R, y: b.y + R), radius: R, startAngle: .pi * 1.5, endAngle: .pi, clockwise: false)
                    addPath.lineWidth = LINE_WIDTH
                    addPath.lineCapStyle = .round
                    addPath.stroke()
                }
                
                if d.x == b.x {
                    setContext(context, ifClear: true)
                    let clearPath = UIBezierPath()
                    clearPath.addArc(withCenter: CGPoint(x: b.x - R, y: b.y + R), radius: R, startAngle: 0, endAngle: .pi * 1.5, clockwise: false)
                    clearPath.addLine(to: CGPoint(x: centerX - 1, y: a.y))
                    clearPath.addArc(withCenter: CGPoint(x: b.x - R, y: b.y - R), radius: R, startAngle: .pi / 2, endAngle: 0, clockwise: false)
                    clearPath.lineWidth = LINE_WIDTH * 1.25
                    clearPath.stroke()
                    
                    setContext(context, ifClear: false)
                    
                    let addPath = UIBezierPath()
                    addPath.move(to: CGPoint(x: b.x, y: b.y - R))
                    addPath.addLine(to: CGPoint(x: b.x, y: b.y + R))
                    addPath.lineWidth = LINE_WIDTH
                    addPath.lineCapStyle = .round
                    addPath.stroke()
                }
                
                if c.x - a.x >= 2*R {
                    setContext(context, ifClear: true)
                    
                    let clearPath = UIBezierPath()
                    clearPath.addArc(withCenter: CGPoint(x: c.x + R, y: c.y - R), radius: R, startAngle: .pi, endAngle: .pi / 2, clockwise: false)
                    clearPath.addLine(to: CGPoint(x: centerX + 1, y: c.y))
                    clearPath.addLine(to: CGPoint(x: c.x - R, y: c.y))
                    clearPath.lineWidth = LINE_WIDTH
                    clearPath.stroke()
                    
                    setContext(context, ifClear: false)
                    let addPath = UIBezierPath(arcCenter: CGPoint(x: c.x - R, y: c.y - R), radius: R, startAngle: .pi / 2, endAngle: 0, clockwise: false)
                    addPath.lineWidth = LINE_WIDTH
                    addPath.lineCapStyle = .round
                    addPath.stroke()
                }
                
                if b.x - d.x >= 2*R {
                    setContext(context, ifClear: true)
                    let clearPath = UIBezierPath()
                    clearPath.append(UIBezierPath(arcCenter: CGPoint(x: d.x - R, y: d.y - R), radius: R, startAngle: 0, endAngle: .pi / 2, clockwise: true))
                    clearPath.addLine(to: CGPoint(x: centerX - 1, y: d.y))
                    clearPath.addLine(to: CGPoint(x: d.x + R, y: d.y))
                    clearPath.lineWidth = LINE_WIDTH * 1.25
                    clearPath.stroke()
                    
                    setContext(context, ifClear: false)
                    
                    let addPath = UIBezierPath(arcCenter: CGPoint(x: d.x + R, y: d.y - R), radius: R, startAngle: .pi / 2, endAngle: .pi, clockwise: true)
                    addPath.lineWidth = LINE_WIDTH
                    addPath.lineCapStyle = .round
                    addPath.stroke()
                }
            }
        }
    }
    
    private func preProccess(){
        maxIndex = 0
        if self.rectArray.count < 2 {
            return
        }
        for i in 1 ..< self.rectArray.count {
            maxIndex = i
            proccessRectIndex(index: i)
        }
    }
    
    private func proccessRectIndex(index: Int) {
        if rectArray.count < 2 || index < 1 || index > maxIndex {
            return
        }
        
        let cur = rectArray[index]
        let last = rectArray[index - 1]
        R = cur.size.height * 0.18
        
        // if t1 == true -> change cur
        let t1 = ((cur.origin.x - last.origin.x < 2 * R) && (cur.origin.x > last.origin.x)) ||
        ((cur.maxX - last.maxX > -2 * R) && (cur.maxX < last.maxX))
        // if t2 == true -> change last
        let t2 = ((last.origin.x - cur.origin.x < 2 * R) && (last.origin.x > cur.origin.x)) ||
        ((last.maxX - cur.maxX > -2 * R) && (last.maxX < cur.maxX))
        
        if t2 {
            let newRect = CGRect(x: cur.origin.x, y: last.origin.y, width: cur.size.width, height: last.size.height)
            rectArray[index - 1] = newRect
            proccessRectIndex(index: index - 1)
        }
        
        if t1 {
            let newRect = CGRect(x: last.origin.x, y: cur.origin.y, width: last.size.width, height: cur.size.height)
            rectArray[index] = newRect
            proccessRectIndex(index: index + 1)
        }
        
        return
    }
}
