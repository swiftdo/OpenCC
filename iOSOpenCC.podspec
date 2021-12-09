#
#  Be sure to run `pod spec lint iOSOpenCC.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see https://guides.cocoapods.org/syntax/podspec.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |spec|
  spec.name         = "iOSOpenCC"
  spec.version      = "1.1.4"
  spec.summary      = "iOS 的 OpenCC（1.1.3） 版本 "
  spec.description  = <<-DESC
  Opencc for iOS
                   DESC

  spec.homepage     = "https://github.com/swiftdo/OpenCC"
 
  spec.license      = "MIT"
  spec.author             = { "lai" => "1164258202@qq.com" }
  spec.platform     = :ios, "11.0"
  spec.source       = { :git => "https://github.com/swiftdo/OpenCC", :tag => "#{spec.version}" }

  spec.source_files  = [
    "src/BinaryDict.{hpp,cpp}",
    "src/CmdLineOutput.hpp",
    "src/Common.hpp",
    "src/Config.{hpp,cpp}",
    "src/Conversion.{hpp,cpp}",
    "src/ConversionChain.{hpp,cpp}",
    "src/Converter.{hpp,cpp}",
    "src/DartsDict.{hpp,cpp}",
    "src/Dict.{hpp,cpp}",
    "src/DictEntry.{hpp,cpp}",
    "src/DictGroup.{hpp,cpp}",
    "src/DictConverter.{hpp,cpp}",
    "src/Exception.hpp",
    "src/Export.hpp",
    "src/Lexicon.{hpp,cpp}",
    "src/MarisaDict.{hpp,cpp}",
    "src/MaxMatchSegmentation.{hpp,cpp}",
    "src/opencc.h",
    "src/Optional.hpp",
    "src/PhraseExtract.{hpp,cpp}",
    "src/Segmentation.{hpp,cpp}",
    "src/Segments.hpp",
    "src/SerializableDict.hpp",
    "src/SerializedValues.{hpp,cpp}",
    "src/SimpleConverter.{hpp,cpp}",
    "src/TestUtils.hpp",
    "src/TextDict.{hpp,cpp}",
    "src/Opencc_Export.hpp",
    "src/UTF8StringSlice.{hpp,cpp}",
    "src/UTF8Util.{hpp,cpp}",
    "deps/darts-clone/darts.h",
    "iOS/OpenCCService.{h,mm}",
    "iOS/opencc_config.h",
  ]

  # 通过 https://github.com/leetal/ios-cmake 打出的静态库
  spec.vendored_libraries = "iOS/OpenCC/marisa/libmarisa.a"
  spec.libraries = "c++"
  
  spec.resources =  [
    "iOS/config/*.json",
    "iOS/ocd2/*.ocd2"
  ]

  spec.private_header_files = "iOS/OpenCC/marisa/*/*.h", 'deps/rapidjson-1.1.0/rapidjson/*/*.h'

  spec.preserve_paths = 'iOS/OpenCC/marisa', 'deps/rapidjson-1.1.0/rapidjson'

  pod_h_search_path = [
     "\"${PODS_TARGET_SRCROOT}/iOS/OpenCC/marisa\"",
     "\"${PODS_TARGET_SRCROOT}/iOS/OpenCC/marisa/include\"",
     "\"${PODS_TARGET_SRCROOT}/deps/rapidjson-1.1.0/rapidjson\""
  ]

  spec.pod_target_xcconfig = {
    "CLANG_CXX_LANGUAGE_STANDARD" => "c++14",
    "CLANG_CXX_LIBRARY" => "libc++",
    "HEADER_SEARCH_PATHS" => pod_h_search_path.join(' '),
    'ENABLE_BITCODE' => 'NO'
  }
    
  spec.user_target_xcconfig = { 'ENABLE_BITCODE' => 'NO' }

end
