From: "Jan Beulich" <JBeulich@suse.com>
Subject: [PATCH] x86/idle: don't mix up ACPI and APIC IDs
Date: Tue, 26 Jun 2018 01:35:18 -0600
Message-ID: <5B31ECB602000078001CDD47@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=x7n8=jm=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1fXiVX-000592-FQ
 for xen-devel@lists.xenproject.org; Tue, 26 Jun 2018 07:35:23 +0000
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Q29ycmVjdCBhIGxvZyBtZXNzYWdlIGFuZCwgdG8gY2xhcmlmeSBjb2RlIGFzIHdlbGwsIHJlbmFt
ZSB0aGUKcmVzcGVjdGl2ZSBmdW5jdGlvbiBwYXJhbWV0ZXIgdG9vLgoKU2lnbmVkLW9mZi1ieTog
SmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgoKLS0tIGEveGVuL2FyY2gveDg2L2FjcGkv
Y3B1X2lkbGUuYworKysgYi94ZW4vYXJjaC94ODYvYWNwaS9jcHVfaWRsZS5jCkBAIC0xMTcyLDcg
KzExNzIsNyBAQCBzdGF0aWMgdm9pZCBwcmludF9jeF9wbWluZm8odWludDMyX3QgY3B1CiAjZGVm
aW5lIHByaW50X2N4X3BtaW5mbyhjLCBwKQogI2VuZGlmCiAKLWxvbmcgc2V0X2N4X3BtaW5mbyh1
aW50MzJfdCBjcHUsIHN0cnVjdCB4ZW5fcHJvY2Vzc29yX3Bvd2VyICpwb3dlcikKK2xvbmcgc2V0
X2N4X3BtaW5mbyh1aW50MzJfdCBhY3BpX2lkLCBzdHJ1Y3QgeGVuX3Byb2Nlc3Nvcl9wb3dlciAq
cG93ZXIpCiB7CiAgICAgWEVOX0dVRVNUX0hBTkRMRSh4ZW5fcHJvY2Vzc29yX2N4X3QpIHN0YXRl
czsKICAgICB4ZW5fcHJvY2Vzc29yX2N4X3QgeGVuX2N4OwpAQCAtMTE4NSwxNiArMTE4NSwxNiBA
QCBsb25nIHNldF9jeF9wbWluZm8odWludDMyX3QgY3B1LCBzdHJ1Y3QKICAgICBpZiAoIHBtX2lk
bGVfc2F2ZSAmJiBwbV9pZGxlICE9IGFjcGlfcHJvY2Vzc29yX2lkbGUgKQogICAgICAgICByZXR1
cm4gMDsKIAotICAgIHByaW50X2N4X3BtaW5mbyhjcHUsIHBvd2VyKTsKKyAgICBwcmludF9jeF9w
bWluZm8oYWNwaV9pZCwgcG93ZXIpOwogCiAgICAgLyogbWFwIGZyb20gYWNwaV9pZCB0byBjcHVf
aWQgKi8KLSAgICBjcHVfaWQgPSBnZXRfY3B1X2lkKGNwdSk7CisgICAgY3B1X2lkID0gZ2V0X2Nw
dV9pZChhY3BpX2lkKTsKICAgICBpZiAoIGNwdV9pZCA9PSAtMSApCiAgICAgewogICAgICAgICBz
dGF0aWMgYm9vbCB3YXJuX29uY2UgPSB0cnVlOwogCiAgICAgICAgIGlmICggd2Fybl9vbmNlIHx8
IG9wdF9jcHVfaW5mbyApCi0gICAgICAgICAgICBwcmludGsoWEVOTE9HX1dBUk5JTkcgIk5vIENQ
VSBJRCBmb3IgQVBJQyBJRCAlI3hcbiIsIGNwdSk7CisgICAgICAgICAgICBwcmludGsoWEVOTE9H
X1dBUk5JTkcgIk5vIENQVSBmb3IgQUNQSSBJRCAlI3hcbiIsIGFjcGlfaWQpOwogICAgICAgICB3
YXJuX29uY2UgPSBmYWxzZTsKICAgICAgICAgcmV0dXJuIC1FSU5WQUw7CiAgICAgfQoKCgoKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBt
YWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMu
eGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
