From: Wei Liu <wei.liu2@citrix.com>
Subject: [PATCH] automation: build with 32 bit stretch
Date: Mon, 23 Jul 2018 09:04:46 +0100
Message-ID: <20180723080446.13074-1-wei.liu2@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=l8wo=kh=citrix.com=prvs=7352c57fe=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1fhVpr-00009k-Ss
 for xen-devel@lists.xenproject.org; Mon, 23 Jul 2018 08:04:51 +0000
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Wei Liu <wei.liu2@citrix.com>, Doug Goldstein <cardoe@cardoe.com>
List-Id: xen-devel@lists.xenproject.org

U2lnbmVkLW9mZi1ieTogV2VpIExpdSA8d2VpLmxpdTJAY2l0cml4LmNvbT4KLS0tClNlZTogaHR0
cHM6Ly9naXRsYWIuY29tL2xpdXcveGVuL3BpcGVsaW5lcy8yNjI4OTE0NQoKQ2xhbmcgYnVpbGQg
ZmFpbGVkLiBUaGF0IHNob3VsZCBiZSBmaXhlZCBzZXBhcmF0ZWx5LgotLS0KIC5naXRsYWItY2ku
eW1sIHwgMzIgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysKIDEgZmlsZSBjaGFuZ2Vk
LCAzMiBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvLmdpdGxhYi1jaS55bWwgYi8uZ2l0bGFi
LWNpLnltbAppbmRleCA2ODJlNDhlZjUxLi4xYjk4NzdiMzQ4IDEwMDY0NAotLS0gYS8uZ2l0bGFi
LWNpLnltbAorKysgYi8uZ2l0bGFiLWNpLnltbApAQCAtMTAzLDYgKzEwMywzOCBAQCBkZWJpYW4t
c3RyZXRjaC1nY2MtZGVidWc6CiAgICAgZGVidWc6IHkKICAgICBYRU5fVEFSR0VUX0FSQ0g6IHg4
Nl82NAogCitkZWJpYW4tc3RyZXRjaC0zMi1jbGFuZzoKKyAgPDw6ICpidWlsZAorICB2YXJpYWJs
ZXM6CisgICAgPDw6ICpjbGFuZworICAgIENPTlRBSU5FUjogZGViaWFuOnN0cmV0Y2gtaTM4Ngor
ICAgIGRlYnVnOiBuCisgICAgWEVOX1RBUkdFVF9BUkNIOiB4ODZfMzIKKworZGViaWFuLXN0cmV0
Y2gtMzItY2xhbmctZGVidWc6CisgIDw8OiAqYnVpbGQKKyAgdmFyaWFibGVzOgorICAgIDw8OiAq
Y2xhbmcKKyAgICBDT05UQUlORVI6IGRlYmlhbjpzdHJldGNoLWkzODYKKyAgICBkZWJ1ZzogeQor
ICAgIFhFTl9UQVJHRVRfQVJDSDogeDg2XzMyCisKK2RlYmlhbi1zdHJldGNoLTMyLWdjYzoKKyAg
PDw6ICpidWlsZAorICB2YXJpYWJsZXM6CisgICAgPDw6ICpnY2MKKyAgICBDT05UQUlORVI6IGRl
YmlhbjpzdHJldGNoLWkzODYKKyAgICBkZWJ1ZzogbgorICAgIFhFTl9UQVJHRVRfQVJDSDogeDg2
XzMyCisKK2RlYmlhbi1zdHJldGNoLTMyLWdjYy1kZWJ1ZzoKKyAgPDw6ICpidWlsZAorICB2YXJp
YWJsZXM6CisgICAgPDw6ICpnY2MKKyAgICBDT05UQUlORVI6IGRlYmlhbjpzdHJldGNoLWkzODYK
KyAgICBkZWJ1ZzogeQorICAgIFhFTl9UQVJHRVRfQVJDSDogeDg2XzMyCisKICMgVWJ1bnR1IFRy
dXN0eSdzIENsYW5nIGlzIDMuNCB3aGlsZSBYZW4gcmVxdWlyZXMgMy41CiAKIHVidW50dS10cnVz
dHktZ2NjOgotLSAKMi4xMS4wCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hl
bi1kZXZlbA==
