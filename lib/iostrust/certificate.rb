require 'openssl'
require 'digest/sha1'

module Iostrust
  class Certificate

    @@PLIST = <<PLIST
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST1.0//EN"  "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<array/>
</plist>
PLIST

    def initialize(cert_path)
      raw_cert = File.read cert_path
      @cert = OpenSSL::X509::Certificate.new raw_cert
    end

    def tset
      return @@PLIST
    end

    def data
      @cert.to_der
    end

    def sha1
      str = Digest::SHA1.hexdigest(data)
      [str].pack('H*')
    end

    def subj
      subj = ""
      asn_subject = OpenSSL::ASN1.decode(@cert.subject)
      asn_subject.each do |asn_sub|
        subj << asn_sub.to_der
      end
      subj
    end

  end
end



