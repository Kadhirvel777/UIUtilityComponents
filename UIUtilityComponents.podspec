Pod::Spec.new do |s|
  s.name             = 'UIUtilityComponents'
  s.version          = '1.0.0'
  s.summary          = 'UIUtilityComponents is used for to create a UI Components'

  s.description      = "This library contains Google reCaptcha V2 with invisible reCaptcha badge"

  s.homepage         = 'https://www.zensar.com/'
  s.license          = 'MIT'
  s.author           = { 'Kadhirvel' => 'Kadhirvel.n@zensar.com' }
  s.source           = {
    :git => 'https://github.com/Kadhirvel777/UIUtilityComponents',
    :tag => s.version.to_s }

  s.ios.deployment_target = '11.0'
  s.platform     = :ios, '11.0'
  s.requires_arc = true
  s.default_subspec = 'All'
  s.swift_versions = '5.0'

  s.subspec "All" do |sp|
    # Internal dependencies
    
    # Third Party Dependencies
   sp.source_files = 'UIUtilityComponents/**/*.{swift}'
   sp.resource_bundles = {
      'UIUtilityComponents' => ["UIUtilityComponents/*.{html,xib}"]
    }
  end
end
