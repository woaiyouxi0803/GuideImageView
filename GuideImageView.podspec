Pod::Spec.new do |s|
s.name         = "GuideImageView" # 项目名称
s.version      = "1.0"        # 版本号 与 你仓库的 标签号 对应
s.license      = "MIT"          # 开源证书
s.summary      = "iOS新手引导--GuideImageView" # 项目简介

s.homepage     = "https://github.com/woaiyouxi0803/GuideImageView" # 你的主页
s.source       = { :git => "https://github.com/woaiyouxi0803/GuideImageView.git", :tag => "#{s.version}" }#你的仓库地址，不能用SSH地址
s.source_files = "GuideImageView/*.{h,m}" # 你代码的位置， GuideImageView/*.{h,m} 表示 BYPhoneNumTF 文件夹下所有的.h和.m文件
s.requires_arc = true # 是否启用ARC
s.platform     = :ios, "7.0" #平台及支持的最低版本
s.frameworks   = "UIKit", "Foundation" #支持的框架


# User
s.author             = { "woaiyouxi" => "woaiyouxi0803@163.com" } # 作者信息
s.social_media_url   = "https://www.jianshu.com/u/2db8fe439069" # 个人主页

end
