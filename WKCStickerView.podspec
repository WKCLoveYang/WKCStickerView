Pod::Spec.new do |s|
s.name         = "WKCStickerView"
s.version      = "1.3.3"
s.summary      = "贴纸、文本编辑视图"
s.homepage     = "https://github.com/WKCLoveYang/WKCStickerView.git"
s.license      = { :type => "MIT", :file => "LICENSE" }
s.author             = { "WKCLoveYang" => "wkcloveyang@gmail.com" }
s.platform     = :ios, "10.0"
s.source       = { :git => "https://github.com/WKCLoveYang/WKCStickerView.git", :tag => "1.3.3" }
s.source_files  = "WKCStickerView/**/*.{h,m}"
s.public_header_files = "WKCStickerView/**/*.h"
s.frameworks = "Foundation", "UIKit"
s.requires_arc = true

end
