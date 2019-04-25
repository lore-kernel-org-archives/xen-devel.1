From: Igor Druzhinin <igor.druzhinin@citrix.com>
Subject: [PATCH v3 2/3] OvmfPkg/XenSupport: use a correct PCI
 host bridge aperture for BAR64
Date: Thu, 25 Apr 2019 21:23:57 +0100
Message-ID: <1556223838-5176-3-git-send-email-igor.druzhinin@citrix.com>
References: <1556223838-5176-1-git-send-email-igor.druzhinin@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=tBju=S3=citrix.com=prvs=011b478a6=igor.druzhinin@srs-us1.protection.inumbo.net>)
 id 1hJkuy-0001Im-Ta
 for xen-devel@lists.xenproject.org; Thu, 25 Apr 2019 20:24:28 +0000
In-Reply-To: <1556223838-5176-1-git-send-email-igor.druzhinin@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: devel@edk2.groups.io
Cc: Igor Druzhinin <igor.druzhinin@citrix.com>, ard.biesheuvel@linaro.org, jordan.l.justen@intel.com, julien.grall@arm.com, anthony.perard@citrix.com, xen-devel@lists.xenproject.org, lersek@redhat.com
List-Id: xen-devel@lists.xenproject.org

SW4gY2FzZSBCQVI2NCBpcyBwbGFjZWQgYmVsb3cgNEcgY2hvb3NlIHRoZSBjb3JyZWN0IGFwZXJ0
dXJlLgpUaGlzIGZpeGVzIGEgZmFpbGVkIGFzc2VydGlvbiBkb3duIHRoZSBjb2RlIHBhdGguCgpB
Y2tlZC1ieTogQW50aG9ueSBQRVJBUkQgPGFudGhvbnkucGVyYXJkQGNpdHJpeC5jb20+ClNpZ25l
ZC1vZmYtYnk6IElnb3IgRHJ1emhpbmluIDxpZ29yLmRydXpoaW5pbkBjaXRyaXguY29tPgotLS0K
IE92bWZQa2cvTGlicmFyeS9QY2lIb3N0QnJpZGdlTGliL1hlblN1cHBvcnQuYyB8IDYgKysrKyst
CiAxIGZpbGUgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0t
Z2l0IGEvT3ZtZlBrZy9MaWJyYXJ5L1BjaUhvc3RCcmlkZ2VMaWIvWGVuU3VwcG9ydC5jIGIvT3Zt
ZlBrZy9MaWJyYXJ5L1BjaUhvc3RCcmlkZ2VMaWIvWGVuU3VwcG9ydC5jCmluZGV4IDM1NGIwYTUu
Ljc2ZmNhNTMgMTAwNjQ0Ci0tLSBhL092bWZQa2cvTGlicmFyeS9QY2lIb3N0QnJpZGdlTGliL1hl
blN1cHBvcnQuYworKysgYi9Pdm1mUGtnL0xpYnJhcnkvUGNpSG9zdEJyaWRnZUxpYi9YZW5TdXBw
b3J0LmMKQEAgLTEzNyw3ICsxMzcsMTEgQEAgUGNhdFBjaVJvb3RCcmlkZ2VQYXJzZUJhcnMgKAog
ICAgICAgICAgIExlbmd0aCA9IExlbmd0aCB8IExTaGlmdFU2NCAoKFVJTlQ2NCkgVXBwZXJWYWx1
ZSwgMzIpOwogICAgICAgICAgIExlbmd0aCA9ICh+TGVuZ3RoKSArIDE7CiAKLSAgICAgICAgICBN
ZW1BcGVydHVyZSA9IE1lbUFib3ZlNEc7CisgICAgICAgICAgaWYgKEJhc2UgPCBCQVNFXzRHQikg
eworICAgICAgICAgICAgTWVtQXBlcnR1cmUgPSBNZW07CisgICAgICAgICAgfSBlbHNlIHsKKyAg
ICAgICAgICAgIE1lbUFwZXJ0dXJlID0gTWVtQWJvdmU0RzsKKyAgICAgICAgICB9CiAgICAgICAg
IH0KIAogICAgICAgICBMaW1pdCA9IEJhc2UgKyBMZW5ndGggLSAxOwotLSAKMi43LjQKCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFp
bGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhl
bnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
