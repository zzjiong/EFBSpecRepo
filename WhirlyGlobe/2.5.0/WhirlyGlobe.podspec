#
# Be sure to run `pod lib lint WhirlyGlobe.podspec' to ensure this is a
# valid spec and remove all comments before submitting the spec.
#
# Any lines starting with a # are optional, but encouraged
#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = "WhirlyGlobe"
  s.version          = "2.5"
  s.summary          = "WhirlyGlobe-Maply: Geospatial visualization for iOS and Android."
  s.description      = <<-DESC
                        WhirlyGlobe-Maply is a high performance geospatial display toolkit for iOS and Android.
                        The iOS version supports big, complex apps like Dark Sky and National Geographic World Atlas,
                        among others.  Even so, it's easy to get started on your own project.
                       DESC
  s.homepage         = "https://github.com/mousebird/WhirlyGlobe"
  s.screenshots     = "http://mousebird.github.io/WhirlyGlobe/images/carousel/home/mapandglobe.jpg", "http://mousebird.github.io/WhirlyGlobe/images/carousel/home/mtrainier.jpg"
  s.license          = 'Apache 2.0'
  s.author           = { "Steve Gifford" => "contact@mousebirdconsulting.com" }
  s.social_media_url = 'https://twitter.com/@mousebirdc'

  s.platform     = :ios, '7.0'
  s.requires_arc = true

  s.source = { :git => 'https://github.com/mousebird/WhirlyGlobe.git', :branch => 'master', :tag => 'v2.5' }

  s.compiler_flags = '-D__USE_SDL_GLES__', '-D__IPHONEOS__ -DSQLITE_OPEN_READONLY'
  s.xcconfig = { "HEADER_SEARCH_PATHS" => "\"${PODS_ROOT}/eigen\" \"${PODS_ROOT}/clipper\" \"$(SDKROOT)/usr/include/libxml2\"" }

  s.default_subspec = 'MaplyComponent'

  s.subspec 'glues-wg' do |gl|
    gl.source_files = 'WhirlyGlobeSrc/local_libs/glues/**/*.{c,h}'
    gl.preserve_paths = 'WhirlyGlobeSrc/local_libs/glues/**/*.i'
    gl.private_header_files = 'WhirlyGlobeSrc/local_libs/glues/**/*.h'
    gl.exclude_files = 'WhirlyGlobeSrc/local_libs/glues/source/libnurbs/nurbtess/{glimports,mystdio,mystdlib}.h', 'WhirlyGlobeSrc/local_libs/glues/source/glu.h'
  end

  s.subspec 'shapefile' do |shp|
    shp.source_files = 'WhirlyGlobeSrc/local_libs/shapefile/**/*.{c,h}'
    shp.private_header_files = 'WhirlyGlobeSrc/local_libs/shapefile/**/*.h'
  end

  s.subspec 'kissxml' do |kss|
    kss.source_files = 'WhirlyGlobeSrc/local_libs/KissXML/**/*.{h,m}'
    kss.private_header_files = 'WhirlyGlobeSrc/local_libs/KissXML/**/*.h'
  end

  s.subspec 'aaplus' do |aa|
    aa.source_files = 'WhirlyGlobeSrc/local_libs/aaplus/**/*.{h,cpp}'
    aa.private_header_files = 'WhirlyGlobeSrc/local_libs/aaplus/**/*.h'
  end

  s.subspec 'octencoding' do |oe|
    oe.source_files = 'WhirlyGlobeSrc/local_libs/octencoding/**/*.h'
    oe.private_header_files = 'WhirlyGlobeSrc/local_libs/octencoding/**/*.h'
  end

  s.subspec 'Lib-Headers' do |lh|
    lh.source_files = 'WhirlyGlobeSrc/WhirlyGlobeLib/include/*.h'
    lh.private_header_files = 'WhirlyGlobeSrc/WhirlyGlobeLib/include/*.h'
    lh.dependency 'eigen', '~> 3.2.4'
  end

  s.subspec 'Lib' do |l|
    l.source_files = 'WhirlyGlobeSrc/WhirlyGlobeLib/src/*.{mm,m}'
    l.dependency 'WhirlyGlobe/Lib-Headers'
    l.dependency 'WhirlyGlobe/glues-wg'
    l.dependency 'WhirlyGlobe/octencoding'
    l.dependency 'proj4', '~> 4.8.0'
#   Pulled internally
    l.dependency 'WhirlyGlobe/shapefile'
    l.dependency 'clipper', '~> 6.1.3a'
    l.dependency 'libjson', '~> 7.6.0'
    l.dependency 'tinyxml', '~> 2.1.0'
    l.libraries = 'c++', 'sqlite3'
    l.frameworks = 'UIKit', 'OpenGLES'
  end

  s.subspec 'MaplyComponent-Headers' do |mch|
    mch.source_files = 'WhirlyGlobeSrc/WhirlyGlobe-MaplyComponent/include/**/*.h'
    mch.public_header_files = 'WhirlyGlobeSrc/WhirlyGlobe-MaplyComponent/include/*.h' # , "WhirlyGlobeSrc/WhirlyGlobe-MaplyComponent/include/private/*.h"
    mch.private_header_files = 'WhirlyGlobeSrc/WhirlyGlobe-MaplyComponent/include/{MaplyBridge,vector_tile.pb}.h', 'WhirlyGlobeSrc/local_libs/**'
    mch.dependency 'WhirlyGlobe/Lib-Headers'
  end

  s.subspec 'Headers' do |h|
    h.dependency 'WhirlyGlobe/MaplyComponent-Headers'
  end

  s.subspec 'MaplyComponent' do |mc|
    mc.source_files = 'WhirlyGlobeSrc/WhirlyGlobe-MaplyComponent/src/*.{mm,m,cpp}'
    mc.dependency 'WhirlyGlobe/kissxml'
    mc.dependency 'WhirlyGlobe/aaplus'
    mc.dependency 'WhirlyGlobe/Lib'
    mc.dependency 'WhirlyGlobe/MaplyComponent-Headers'
    mc.dependency 'SMCalloutView'
    mc.dependency 'FMDB'
    mc.libraries = 'z', 'xml2'
    mc.frameworks = 'CoreLocation', 'MobileCoreServices', 'SystemConfiguration', 'CFNetwork'
  end

end
