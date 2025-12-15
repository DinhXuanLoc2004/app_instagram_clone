protocol FilterPickerDelegate: AnyObject {
    func picker(_: FilterPickerController, didSelect index: Int)
    func takePhoto(_: FilterPickerController)
}
