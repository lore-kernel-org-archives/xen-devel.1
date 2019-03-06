From: Igor Druzhinin <igor.druzhinin@citrix.com>
Subject: [PATCH RESEND 2/3] OvmfPkg/XenSupport: use a correct
 PCI host bridge aperture for BAR64
Date: Wed, 6 Mar 2019 12:40:55 +0000
Message-ID: <1551876056-28223-3-git-send-email-igor.druzhinin@citrix.com>
References: <1551876056-28223-1-git-send-email-igor.druzhinin@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=/oGn=RJ=citrix.com=prvs=961469de7=igor.druzhinin@srs-us1.protection.inumbo.net>)
 id 1h1Vro-0000EM-FK
 for xen-devel@lists.xenproject.org; Wed, 06 Mar 2019 12:41:48 +0000
In-Reply-To: <1551876056-28223-1-git-send-email-igor.druzhinin@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: edk2-devel@lists.01.org
Cc: Igor Druzhinin <igor.druzhinin@citrix.com>, ard.biesheuvel@linaro.org, jordan.l.justen@intel.com, julien.grall@arm.com, anthony.perard@citrix.com, xen-devel@lists.xenproject.org, lersek@redhat.com
List-Id: xen-devel@lists.xenproject.org

SW4gY2FzZSBCQVI2NCBpcyBwbGFjZWQgYmVsb3cgNEcgY2hvb3NlIHRoZSBjb3JyZWN0IGFwZXJ0
dXJlLgpUaGlzIGZpeGVzIGEgZmFpbGVkIGFzc2VydGlvbiBkb3duIHRoZSBjb2RlIHBhdGguCgpD
b250cmlidXRlZC11bmRlcjogVGlhbm9Db3JlIENvbnRyaWJ1dGlvbiBBZ3JlZW1lbnQgMS4xClNp
Z25lZC1vZmYtYnk6IElnb3IgRHJ1emhpbmluIDxpZ29yLmRydXpoaW5pbkBjaXRyaXguY29tPgot
LS0KIE92bWZQa2cvTGlicmFyeS9QY2lIb3N0QnJpZGdlTGliL1hlblN1cHBvcnQuYyB8IDYgKysr
KystCiAxIGZpbGUgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZm
IC0tZ2l0IGEvT3ZtZlBrZy9MaWJyYXJ5L1BjaUhvc3RCcmlkZ2VMaWIvWGVuU3VwcG9ydC5jIGIv
T3ZtZlBrZy9MaWJyYXJ5L1BjaUhvc3RCcmlkZ2VMaWIvWGVuU3VwcG9ydC5jCmluZGV4IGMyM2M0
NmQuLjQwOGZiMjQgMTAwNjQ0Ci0tLSBhL092bWZQa2cvTGlicmFyeS9QY2lIb3N0QnJpZGdlTGli
L1hlblN1cHBvcnQuYworKysgYi9Pdm1mUGtnL0xpYnJhcnkvUGNpSG9zdEJyaWRnZUxpYi9YZW5T
dXBwb3J0LmMKQEAgLTE0NSw3ICsxNDUsMTEgQEAgUGNhdFBjaVJvb3RCcmlkZ2VQYXJzZUJhcnMg
KAogICAgICAgICAgIExlbmd0aCA9IExlbmd0aCB8IExTaGlmdFU2NCAoKFVJTlQ2NCkgVXBwZXJW
YWx1ZSwgMzIpOwogICAgICAgICAgIExlbmd0aCA9ICh+TGVuZ3RoKSArIDE7CiAKLSAgICAgICAg
ICBNZW1BcGVydHVyZSA9IE1lbUFib3ZlNEc7CisgICAgICAgICAgaWYgKEJhc2UgPCAweDEwMDAw
MDAwMCkgeworICAgICAgICAgICAgTWVtQXBlcnR1cmUgPSBNZW07CisgICAgICAgICAgfSBlbHNl
IHsKKyAgICAgICAgICAgIE1lbUFwZXJ0dXJlID0gTWVtQWJvdmU0RzsKKyAgICAgICAgICB9CiAg
ICAgICAgIH0KIAogICAgICAgICBMaW1pdCA9IEJhc2UgKyBMZW5ndGggLSAxOwotLSAKMi43LjQK
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
