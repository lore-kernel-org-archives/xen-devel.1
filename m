From: "Jan Beulich" <JBeulich@suse.com>
Subject: [PATCH] x86: hap_enabled() is HVM-only
Date: Thu, 27 Sep 2018 09:30:51 -0600
Message-ID: <5BACF7AB02000078001ECB10@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=gbjr=mj=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1g5YFi-0001I5-3z
 for xen-devel@lists.xenproject.org; Thu, 27 Sep 2018 15:30:54 +0000
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

VGhlcmUgYXQgbGVhc3QgdHdvIGNhc2VzIHdoZXJlIHRoZSBmaWVsZCBzbyBmYXIgZ290IGFjY2Vz
c2VkIGZvciBQVgpndWVzdHMgYXMgd2VsbDogT25lIGlzIGluIGlvbW11X2NvbnN0cnVjdCgpLCB2
aWEgaW9tbXVfdXNlX2hhcF9wdCgpLAphbmQgdGhlIG90aGVyIGlzCmFyY2hfZG9tYWluX2NyZWF0
ZSgpCi0+IHBhZ2luZ19kb21haW5faW5pdCgpCiAgIC0+IHAybV9pbml0KCkKICAgICAgLT4gcDJt
X2luaXRfaG9zdHAybSgpCiAgICAgICAgIC0+IHAybV9pbml0X29uZSgpCiAgICAgICAgICAgIC0+
IHAybV9pbml0aWFsaXNlKCkKSXQganVzdCBzbyBoYXBwZW5zIHRoYXQgdGhlIGZpZWxkIGN1cnJl
bnRseSBsaXZlcyBpbiBzdHJ1Y3QgaHZtX2RvbWFpbgphdCBhbiBvZmZzZXQgbGFyZ2VyIHRoYW4g
c2l6ZW9mKHN0cnVjdCBwdl9kb21haW4pLgoKU2lnbmVkLW9mZi1ieTogSmFuIEJldWxpY2ggPGpi
ZXVsaWNoQHN1c2UuY29tPgoKLS0tIGEveGVuL2luY2x1ZGUvYXNtLXg4Ni9odm0vZG9tYWluLmgK
KysrIGIveGVuL2luY2x1ZGUvYXNtLXg4Ni9odm0vZG9tYWluLmgKQEAgLTE5NSw3ICsxOTUsNyBA
QCBzdHJ1Y3QgaHZtX2RvbWFpbiB7CiB9OwogCiAjaWZkZWYgQ09ORklHX0hWTQotI2RlZmluZSBo
YXBfZW5hYmxlZChkKSAgKChkKS0+YXJjaC5odm0uaGFwX2VuYWJsZWQpCisjZGVmaW5lIGhhcF9l
bmFibGVkKGQpICAoaXNfaHZtX2RvbWFpbihkKSAmJiAoZCktPmFyY2guaHZtLmhhcF9lbmFibGVk
KQogI2Vsc2UKICNkZWZpbmUgaGFwX2VuYWJsZWQoZCkgICh7KHZvaWQpKGQpOyBmYWxzZTt9KQog
I2VuZGlmCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
