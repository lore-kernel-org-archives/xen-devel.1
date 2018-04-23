From: Ian Jackson <ian.jackson@eu.citrix.com>
Subject: [OSSTEST PATCH 2/3] ms-planner: include PreviousShare
 information in Unshare events
Date: Mon, 23 Apr 2018 15:52:26 +0100
Message-ID: <1524495147-28891-3-git-send-email-ian.jackson@eu.citrix.com>
References: <1524495147-28891-1-git-send-email-ian.jackson@eu.citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=n26l=hm=citrix.com=prvs=644ea31d5=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1fAcpa-0007dh-Ir
 for xen-devel@lists.xenproject.org; Mon, 23 Apr 2018 14:52:38 +0000
In-Reply-To: <1524495147-28891-1-git-send-email-ian.jackson@eu.citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Ian Jackson <Ian.Jackson@eu.citrix.com>
List-Id: xen-devel@lists.xenproject.org

V2UgY2FuJ3QgcHV0IHRoaXMgaW4gJGV2dC0+e1NoYXJlfSBiZWNhdXNlIGV4aXN0aW5nIGNsaWVu
dHMgd2lsbCBzZWUKaXQgdGhlcmUgYW5kIGFzc3VtZSBpdCBtZWFucyB0aGUgcmVzb3VyY2UgaXMg
c2hhcmVkLgoKU2lnbmVkLW9mZi1ieTogSWFuIEphY2tzb24gPElhbi5KYWNrc29uQGV1LmNpdHJp
eC5jb20+Ci0tLQogbXMtcGxhbm5lciB8IDMgKysrCiAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRp
b25zKCspCgpkaWZmIC0tZ2l0IGEvbXMtcGxhbm5lciBiL21zLXBsYW5uZXIKaW5kZXggYWYwYzc0
Ni4uNWQyMGNjMiAxMDA3NTUKLS0tIGEvbXMtcGxhbm5lcgorKysgYi9tcy1wbGFubmVyCkBAIC0y
MzQsNiArMjM0LDcgQEAgc3ViIGxhdW5kZXJfY2hlY2tfcGxhbiAoKSB7CiAJCQlUeXBlID0+IFVu
c2hhcmUsCiAJCQlBdmFpbCA9PiAxLAogCQkJSW5mbyA9PiAkY3NoYXJlLT57VHlwZX0sCisJCQlQ
cmV2aW91c1NoYXJlID0+ICRjc2hhcmUsCiAJCSAgICB9OwogCQkgICAgJGNzaGFyZT0gdW5kZWY7
CiAJCX0KQEAgLTQxMiw2ICs0MTMsNyBAQCBzdWIgY21kX2dldF9wbGFuICgpIHsKIAlteSBAamV2
dHM7CiAJZm9yZWFjaCBteSAkZXZ0IChAJGV2dHMpIHsKIAkgICAgbXkgJHNoYXJlPSAkZXZ0LT57
U2hhcmV9OworCSAgICBteSAkcHJldmlvdXNzaGFyZT0gJGV2dC0+e1ByZXZpb3VzU2hhcmV9Owog
CSAgICBteSAkam9iPSAkZXZ0LT57Sm9ifTsKIAkgICAgcHVzaCBAamV2dHMsIHsKIAkJVGltZSA9
PiAkZXZ0LT57VGltZX0gLSAkcGxhbi0+e1N0YXJ0fSwKQEAgLTQxOSw2ICs0MjEsNyBAQCBzdWIg
Y21kX2dldF9wbGFuICgpIHsKIAkJQXZhaWwgPT4gJGV2dC0+e0F2YWlsfSwKIAkJKCRqb2IgPyAo
Sm9iID0+ICRqb2IpIDogKCkpLAogCQkoJHNoYXJlID8gKFNoYXJlID0+ICRzaGFyZSkgOiAoKSks
CisJCSgkcHJldmlvdXNzaGFyZSA/IChQcmV2aW91c1NoYXJlID0+ICRwcmV2aW91c3NoYXJlKSA6
ICgpKSwKIAkgICAgfTsKIAl9CiAJJGpwbGFuLT57RXZlbnRzfXskcmVzb309IFxAamV2dHM7Ci0t
IAoyLjEuNAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
