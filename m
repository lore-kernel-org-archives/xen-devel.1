From: "Jan Beulich" <JBeulich@suse.com>
Subject: [PATCH] AMD/IOMMU: don't open-code for_each_amd_iommu()
Date: Fri, 05 Apr 2019 01:01:04 -0600
Message-ID: <5CA6FD300200007800224C43@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=KiBs=SH=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hCIqb-00020y-5b
 for xen-devel@lists.xenproject.org; Fri, 05 Apr 2019 07:01:09 +0000
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel <xen-devel@lists.xenproject.org>
Cc: Brian Woods <brian.woods@amd.com>, Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>
List-Id: xen-devel@lists.xenproject.org

U2lnbmVkLW9mZi1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgoKLS0tIGEveGVu
L2RyaXZlcnMvcGFzc3Rocm91Z2gvYW1kL2lvbW11X2ludHIuYworKysgYi94ZW4vZHJpdmVycy9w
YXNzdGhyb3VnaC9hbWQvaW9tbXVfaW50ci5jCkBAIC01MDMsNyArNTAzLDcgQEAgc3RhdGljIHN0
cnVjdCBhbWRfaW9tbXUgKl9maW5kX2lvbW11X2ZvcgogewogICAgIHN0cnVjdCBhbWRfaW9tbXUg
KmlvbW11OwogCi0gICAgbGlzdF9mb3JfZWFjaF9lbnRyeSAoIGlvbW11LCAmYW1kX2lvbW11X2hl
YWQsIGxpc3QgKQorICAgIGZvcl9lYWNoX2FtZF9pb21tdSAoIGlvbW11ICkKICAgICAgICAgaWYg
KCBpb21tdS0+c2VnID09IHNlZyAmJiBpb21tdS0+YmRmID09IGJkZiApCiAgICAgICAgICAgICBy
ZXR1cm4gTlVMTDsKIAoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRl
dmVs
