#
#  Be sure to run `pod spec lint iOSOpenCC.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see https://guides.cocoapods.org/syntax/podspec.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

# pod lint 的最终下载的文件件路径： /Users/mac/Library/Caches/CocoaPods/Pods/External/iOSOpenCC
# 本次制作需要手动编译出 ocd2, 直接 make ，然后到 build 产物找到
# 然后需要将  marisa 编译为静态库，通过 https://github.com/leetal/ios-cmake 打出的静态库
# lint 过程：pod spec lint iOSOpenCC.podspec --allow-warnings --verbose --skip-import-validation  --use-libraries
# trunk 过程： pod trunk push iOSOpenCC.podspec --allow-warnings --verbose --skip-import-validation  --use-libraries

Pod::Spec.new do |spec|
  spec.name         = "iOSOpenCC"
  spec.version      = "1.1.6"
  spec.summary      = "iOS 的 OpenCC（1.1.3） 版本 "
  spec.description  = <<-DESC
  Opencc for iOS, 因为没有iOS的Pod库，现在构造一个
                   DESC

  spec.homepage     = "https://github.com/swiftdo/OpenCC"
 
  spec.license      = "MIT"
  spec.author       = { "lai" => "1164258202@qq.com" }
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
  spec.vendored_libraries = "iOS/marisa/libmarisa.a"
  spec.libraries = "c++"
  
  spec.resources =  [
    "iOS/config/*.json",
    "iOS/ocd2/*.ocd2"
  ]

  spec.preserve_paths = "iOS/marisa/*.h",
  'iOS/marisa/include/marisa/*.h',
  'deps/rapidjson-1.1.0/rapidjson/*.h',
  'deps/rapidjson-1.1.0/rapidjson/error/*.h',
  'deps/rapidjson-1.1.0/rapidjson/internal/*.h',
  'deps/rapidjson-1.1.0/rapidjson/msinttypes/*.h'
  

  pod_h_search_path = [
     # Podfile不使用 use_frameworks 搜索路径
     "$(PODS_ROOT)/Headers/Public/iOSOpenCC",
     "$(PODS_ROOT)/Headers/Private/iOSOpenCC",
     #Podfile使用use_frameworks库内搜索路径
     "$(PODS_ROOT)/iOSOpenCC/Headers",
     "$(PODS_ROOT)/iOSOpenCC/PrivateHeaders",
     # Podfile使用指定路径链接
     "$(PODS_TARGET_SRCROOT)/iOS/marisa",
     "$(PODS_TARGET_SRCROOT)/iOS/marisa/include",
     "$(PODS_TARGET_SRCROOT)/deps/rapidjson-1.1.0",
     "$(PODS_TARGET_SRCROOT)/deps/rapidjson-1.1.0/rapidjson"
  ]

  spec.pod_target_xcconfig = {
    "CLANG_CXX_LANGUAGE_STANDARD" => "c++14",
    "CLANG_CXX_LIBRARY" => "libc++",
    "HEADER_SEARCH_PATHS" => pod_h_search_path.join(' '),
    'ENABLE_BITCODE' => 'NO'
  }
  
  spec.user_target_xcconfig = { 'ENABLE_BITCODE' => 'NO'}
end
