Pod::Spec.new do |s|
  s.name                = 'PSPDFKit'
  s.version             = '6.9.0'
  s.homepage            = 'https://pspdfkit.com'
  s.documentation_url   = 'https://pspdfkit.com/guides/ios/current'
  s.license             = { :type => 'Commercial', :file => 'PSPDFKit.framework/PSPDFKit-LICENSE' }
  s.author              = { 'PSPDFKit GmbH' => 'support@pspdfkit.com' }
  s.summary             = 'The leading cross-platform PDF framework.'

  s.description         = <<-DESC
                          The leading cross-platform PDF framework.
                          DESC
  s.screenshots         = 'https://pspdfkit.com/images/devices/ipad-air-hero-07c554d5.png'

  s.platform            = :ios, '9.0'
  s.source              = { :http => 'https://customers.pspdfkit.com/cocoapods/fCBFEQK7Muky7Pj4pytZHKUJCFP6j7/pspdfkit/6.9.0.zip' }

  s.preserve_paths      = 'PSPDFKit.framework'
  s.public_header_files = 'PSPDFKit.framework/Headers/*.h'
  s.vendored_frameworks = 'PSPDFKit.framework'

  s.library             = 'z', 'sqlite3', 'xml2', 'c++'
  s.xcconfig            = { 'FRAMEWORK_SEARCH_PATHS' => '"$(PODS_ROOT)/PSPDFKit/**"',
                            'HEADER_SEARCH_PATHS' => '$(SDKROOT)/usr/include/libxml2' }
  s.frameworks          = 'QuartzCore', 'CoreText', 'CoreMedia', 'MediaPlayer', 'AVFoundation', 'ImageIO', 'MessageUI',
                          'CoreGraphics', 'Foundation', 'CFNetwork', 'MobileCoreServices', 'SystemConfiguration',
                          'AssetsLibrary', 'Security', 'UIKit', 'AudioToolbox', 'QuickLook', 'CoreTelephony',
                          'Accelerate', 'JavaScriptCore', 'GLKit', 'OpenGLES', 'CoreImage'
  s.requires_arc        = true
end
