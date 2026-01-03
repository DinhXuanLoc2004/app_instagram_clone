let Effects: [Effect] = [
    Effect(preview: "Burning", path: "burning_effect.deepar"),
    Effect(preview: "Devil_Neon_Horns", path: "Neon_Devil_Horns.deepar"),
    Effect(preview: "Elephant_Trunk", path: "Elephant_Trunk.deepar"),
    Effect(preview: "Emotion_Meter", path: "Emotion_Meter.deepar"),
    Effect(preview: "Emotions_Exaggerator", path: "Emotions_Exaggerator.deepar"),
    Effect(preview: "Fire_Effect", path: "Fire_Effect.deepar"),
    Effect(preview: "Flower_Face", path: "flower_face.deepar"),
    Effect(preview: "Galaxy_Background", path: "galaxy_background.deepar"),
    Effect(preview: "Hope", path: "Hope.deepar"),
    Effect(preview: "Humanoid", path: "Humanoid.deepar"),
    Effect(preview: "Makeup_Look_Simple", path: "MakeupLook.deepar"),
    Effect(preview: "Makeup_Lo...creen_Effect", path: "Split_View_Look.deepar"),
    Effect(preview: "Ping_Pong_Minigame", path: "Ping_Pong.deepar"),
    Effect(preview: "Pixel_Heart_Particles", path: "Pixel_Hearts.deepar"),
    Effect(preview: "Snail", path: "Snail.deepar"),
    Effect(preview: "Stallone", path: "Stallone.deepar"),
    Effect(preview: "Vendetta_Mask", path: "Vendetta_Mask.deepar"),
    Effect(preview: "Viking_Helmet_PBR", path: "viking_helmet.deepar")
]

extension String {
    var path: String? {
        return Bundle.main.path(forResource: self, ofType: nil)
    }
}
