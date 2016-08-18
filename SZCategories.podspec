
Pod::Spec.new do |s|

    s.name         = "SZCategories"
    s.version      = "1.3.0"
    s.summary      = "some useful categories"
    s.homepage     = "https://github.com/chenshengzhi/SZCategories"
    s.license      = { :type => 'MIT', :file => 'LICENSE' }
    s.author       = { "陈圣治" => "csz2136@163.com" }
    s.platform     = :ios, "7.0"
    s.ios.deployment_target = "7.0"
    s.source       = { :git => "https://github.com/chenshengzhi/SZCategories.git", :tag => s.version.to_s }

    s.source_files = 'SZCategories/SZCategories.h'


    s.subspec 'Foundation' do |ss|
        ss.source_files = "SZCategories/Foundation/SZFoundation.h"

        ss.subspec 'NSArray' do |sss|
            sss.source_files = 'SZCategories/Foundation/NSArray/*.{h,m}'
            sss.frameworks   = 'Foundation'
        end

        ss.subspec 'NSBundle' do |sss|
            sss.source_files = 'SZCategories/Foundation/NSBundle/*.{h,m}'
            sss.frameworks   = 'Foundation'
        end

        ss.subspec 'NSData' do |sss|
            sss.source_files = 'SZCategories/Foundation/NSData/*.{h,m}'
            sss.frameworks   = 'Foundation'
        end

        ss.subspec 'NSDate' do |sss|
            sss.source_files = 'SZCategories/Foundation/NSDate/*.{h,m}'
            sss.frameworks   = 'Foundation'
        end

        ss.subspec 'NSDictionary' do |sss|
            sss.source_files = 'SZCategories/Foundation/NSDictionary/*.{h,m}'
            sss.frameworks   = 'Foundation'
        end

        ss.subspec 'NSFileManager' do |sss|
            sss.source_files = 'SZCategories/Foundation/NSFileManager/*.{h,m}'
            sss.frameworks   = 'Foundation'
        end

        ss.subspec 'NSNumber' do |sss|
            sss.source_files = 'SZCategories/Foundation/NSNumber/*.{h,m}'
            sss.frameworks   = 'Foundation'
        end

        ss.subspec 'NSObject' do |sss|
            sss.source_files = 'SZCategories/Foundation/NSObject/*.{h,m}'
            sss.frameworks   = 'Foundation'
        end

        ss.subspec 'NSString' do |sss|
            sss.ios.dependency 'SZCategories/Foundation/NSData'
            sss.source_files = 'SZCategories/Foundation/NSString/*.{h,m}'
            sss.frameworks   = 'Foundation'
            sss.libraries    = 'z'
        end

    end


    s.subspec 'UIKit' do |ss|
        ss.source_files = "SZCategories/UIKit/SZUIKit.h"

        ss.subspec 'UIButton' do |sss|
            sss.ios.dependency 'SZCategories/UIKit/UIImage'
            sss.source_files = 'SZCategories/UIKit/UIButton/*.{h,m}'
            sss.frameworks   = 'Foundation', 'UIKit'
        end

        ss.subspec 'UIColor' do |sss|
            sss.source_files = 'SZCategories/UIKit/UIColor/*.{h,m}'
            sss.frameworks   = 'Foundation', 'UIKit'
        end

        ss.subspec 'UIControl' do |sss|
            sss.source_files = 'SZCategories/UIKit/UIControl/*.{h,m}'
            sss.frameworks   = 'Foundation', 'UIKit'
        end

        ss.subspec 'UIFont' do |sss|
            sss.source_files = 'SZCategories/UIKit/UIFont/*.{h,m}'
            sss.frameworks   = 'Foundation', 'UIKit'
        end

        ss.subspec 'UIImage' do |sss|
            sss.source_files = 'SZCategories/UIKit/UIImage/*.{h,m}'
            sss.frameworks   = 'Foundation', 'UIKit'
        end

        ss.subspec 'UILabel' do |sss|
            sss.source_files = 'SZCategories/UIKit/UILabel/*.{h,m}'
            sss.frameworks   = 'Foundation', 'UIKit'
        end

        ss.subspec 'UINavigationController' do |sss|
            sss.source_files = 'SZCategories/UIKit/UINavigationController/*.{h,m}'
            sss.frameworks   = 'Foundation', 'UIKit'
        end

        ss.subspec 'UIResponder' do |sss|
            sss.source_files = 'SZCategories/UIKit/UIResponder/*.{h,m}'
            sss.frameworks   = 'Foundation', 'UIKit'
        end

        ss.subspec 'UIScrollView' do |sss|
            sss.source_files = 'SZCategories/UIKit/UIScrollView/*.{h,m}'
            sss.frameworks   = 'Foundation', 'UIKit'
        end

        ss.subspec 'UITableViewCell' do |sss|
            sss.source_files = 'SZCategories/UIKit/UITableViewCell/*.{h,m}'
            sss.frameworks   = 'Foundation', 'UIKit'
        end

        ss.subspec 'UITextField' do |sss|
            sss.source_files = 'SZCategories/UIKit/UITextField/*.{h,m}'
            sss.frameworks   = 'Foundation', 'UIKit'
        end

        ss.subspec 'UITextView' do |sss|
            sss.source_files = 'SZCategories/UIKit/UITextView/*.{h,m}'
            sss.frameworks   = 'Foundation', 'UIKit'
        end

        ss.subspec 'UIView' do |sss|
            sss.source_files = 'SZCategories/UIKit/UIView/*.{h,m}'
            sss.frameworks   = 'Foundation', 'UIKit', 'QuartzCore'
        end

        ss.subspec 'UIViewController' do |sss|
            sss.source_files = 'SZCategories/UIKit/UIViewController/*.{h,m}'
            sss.frameworks   = 'Foundation', 'UIKit', 'AVFoundation', 'MobileCoreServices'
        end

        ss.subspec 'UIWindow' do |sss|
            sss.source_files = 'SZCategories/UIKit/UIWindow/*.{h,m}'
            sss.frameworks   = 'Foundation', 'UIKit'
        end
    end


end
