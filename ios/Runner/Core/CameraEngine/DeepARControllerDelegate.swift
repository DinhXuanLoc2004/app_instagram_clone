protocol DeepARControllerDelegate: AnyObject {
    func dismiss(_: DeepARController)
    func takePhoto(_: DeepARController, image: UIImage)
}
