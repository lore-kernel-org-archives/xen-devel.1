From: Artem Mygaiev <artem_mygaiev@epam.com>
Subject: [PATCH] arm: Coverity 1469342 correct find_*_bit()
 functions use
Date: Thu, 24 May 2018 16:20:52 +0300
Message-ID: <0c1ba7c0-e3a6-2ad0-4679-422aeb07b8d1@epam.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=g4nx=il=epam.com=artem_mygaiev@srs-us1.protection.inumbo.net>)
 id 1fLqB2-00067s-5w
 for xen-devel@lists.xenproject.org; Thu, 24 May 2018 13:21:08 +0000
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel <xen-devel@lists.xenproject.org>, Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien.grall@arm.com>, Andre Przywara <andre.przywara@linaro.org>
List-Id: xen-devel@lists.xenproject.org

dmdpY192Y3B1X3BlbmRpbmdfaXJxKCkgdXNlcyBmaW5kX25leHRfYml0KCkgbGlicmFyeSBmdW5j
dGlvbiB3aXRoIApzaW5nbGUgJ3Vuc2lnbmVkIGxvbmcnIHZhcmlhYmxlLCB3aGlsZSBpdCBpcyBk
ZXNpZ25lZCB0byB3b3JrIHdpdGggCm1lbW9yeSByZWdpb25zLiBOb3RoaW5nIHdyb25nIGlzIGhh
cHBlbmluZyBzaW5jZSAnb2Zmc2V0JyBpcyBzZXQgdG8gMCAKKG90aGVyIHZhbHVlcyBjb3VsZCBs
ZWFkIHRvIG1lbW9yeSBjb3JydXB0aW9uKSwgYnV0IGl0IHdvdWxkIGJlIG1vcmUgCmNvcnJlY3Qg
dG8gdXNlIHRoZSBmaW5kX2ZpcnN0X2JpdCgpIGZ1bmN0aW9uIGluc3RlYWQuCgpDb3Zlcml0eSBT
Y2FuIGlzc3VlIDE0NjkzNDIKClNpZ25lZC1vZmYtYnk6IEFydGVtIE15Z2FpZXYgPGFydGVtX215
Z2FpZXZAZXBhbS5jb20+CgpkaWZmIC0tZ2l0IGEveGVuL2FyY2gvYXJtL2dpYy12Z2ljLmMgYi94
ZW4vYXJjaC9hcm0vZ2ljLXZnaWMuYwppbmRleCBkODMxYjM1NTI1Li5mZDYzOTA2ZTliIDEwMDY0
NAotLS0gYS94ZW4vYXJjaC9hcm0vZ2ljLXZnaWMuYworKysgYi94ZW4vYXJjaC9hcm0vZ2ljLXZn
aWMuYwpAQCAtMzYyLDcgKzM2Miw3IEBAIGludCB2Z2ljX3ZjcHVfcGVuZGluZ19pcnEoc3RydWN0
IHZjcHUgKnYpCiAgICAgIEFTU0VSVCh2ID09IGN1cnJlbnQpOwoKICAgICAgbWFza19wcmlvcml0
eSA9IGdpY19od19vcHMtPnJlYWRfdm1jcl9wcmlvcml0eSgpOwotICAgIGFjdGl2ZV9wcmlvcml0
eSA9IGZpbmRfbmV4dF9iaXQoJmFwciwgMzIsIDApOworICAgIGFjdGl2ZV9wcmlvcml0eSA9IGZp
bmRfZmlyc3RfYml0KCZhcHIsIDMyKTsKCiAgICAgIHNwaW5fbG9ja19pcnFzYXZlKCZ2LT5hcmNo
LnZnaWMubG9jaywgZmxhZ3MpOwoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94
ZW4tZGV2ZWw=
