Pod::Spec.new do |s|
  s.name = 'RMStore'
  s.version = '0.7.1'
  s.license = 'Apache 2.0'
  s.summary = 'Fork because the original version is not maintained anymore. A lightweight iOS library for In-App Purchases that adds blocks and notifications to StoreKit, plus verification, persistence and downloads.'
  s.homepage = 'https://github.com/robotmedia/RMStore'
  s.author = 'Hermes Pique'
  s.social_media_url = 'https://twitter.com/hpique'
  s.source = { :git => 'https://github.com/thegrizzlylabs/RMStore.git', :tag => "v#{s.version}" }
  s.platform = :ios, '11.0'
  s.frameworks = 'StoreKit'
  s.requires_arc = true
  s.default_subspec = 'Core'

  s.subspec 'Core' do |core|
    core.source_files = 'RMStore/*.{h,m}'
  end

  s.subspec 'KeychainPersistence' do |kp|
    kp.dependency 'RMStore/Core'
    kp.source_files = 'RMStore/Optional/RMStoreKeychainPersistence.{h,m}'
    kp.frameworks = 'Security'
  end

  s.subspec 'NSUserDefaultsPersistence' do |nsudp|
    nsudp.dependency 'RMStore/Core'
    nsudp.source_files = 'RMStore/Optional/RMStoreUserDefaultsPersistence.{h,m}', 'RMStore/Optional/RMStoreTransaction.{h,m}'
  end

  s.subspec 'AppReceiptVerifier' do |arv|
    arv.dependency 'RMStore/Core'
    arv.platform = :ios, '11.0'
    arv.source_files = 'RMStore/Optional/RMStoreAppReceiptVerifier.{h,m}', 'RMStore/Optional/RMAppReceipt.{h,m}'
    arv.dependency 'OpenSSL-Universal/Framework', '~> 1.0'
  end

  s.subspec 'TransactionReceiptVerifier' do |trv|
    trv.dependency 'RMStore/Core'
    trv.source_files = 'RMStore/Optional/RMStoreTransactionReceiptVerifier.{h,m}'
  end

end
