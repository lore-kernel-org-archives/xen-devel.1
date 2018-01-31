From: "Jan Beulich" <JBeulich@suse.com>
Subject: [PATCH] x86/shim: don't use 32-bit compare on boolean
	variable
Date: Wed, 31 Jan 2018 08:33:46 -0700
Message-ID: <5A71EFEA02000078001A40E6@prv-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2)
 (envelope-from <srs0=xytx=e2=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1eguOa-0005Cp-0h
 for xen-devel@lists.xenproject.org; Wed, 31 Jan 2018 15:33:56 +0000
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

Q3VycmVudCB1cHN0cmVhbSBnYXMgc2lsZW50bHkgYXNzdW1lcyAzMi1iaXQgb3BlcmFuZCBzaXpl
IGZvciBtb3N0Cm9wZXJhdGlvbnMgd2hlcmUgdGhlIHNpemUgY2FuJ3QgYmUgaW5mZXJyZWQgZnJv
bSBhbiBpbnZvbHZlZCByZWdpc3RlcgoobXkgb3duIG9uZSBkb2Vzbid0IGFueW1vcmUsIHdoaWNo
IGlzIGhvdyBJJ3ZlIG5vdGljZWQgdGhpcykuIEl0IGlzIHB1cmUKbHVjayB0aGF0IHRoZSAzIGJ5
dGVzIGZvbGxvd2luZyBwdmhfYm9vdCBhcmUgY3VycmVudGx5IHBhZGRpbmcgb25lcy4KClNpZ25l
ZC1vZmYtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KCi0tLSBhL3hlbi9hcmNo
L3g4Ni9ib290L2hlYWQuUworKysgYi94ZW4vYXJjaC94ODYvYm9vdC9oZWFkLlMKQEAgLTU4Niw3
ICs1ODYsNyBAQCB0cmFtcG9saW5lX3NldHVwOgogICAgICAgICBwdXNoICAgICVlYXggICAgICAg
ICAgICAgICAgLyogTWFnaWMgbnVtYmVyLiAqLwogICAgICAgICBjYWxsICAgIHJlbG9jCiAjaWZk
ZWYgQ09ORklHX1BWSF9HVUVTVAotICAgICAgICBjbXAgICAgICQwLCBzeW1fZnMocHZoX2Jvb3Qp
CisgICAgICAgIGNtcGIgICAgJDAsIHN5bV9mcyhwdmhfYm9vdCkKICAgICAgICAgamUgICAgICAx
ZgogICAgICAgICBtb3YgICAgICVlYXgsIHN5bV9mcyhwdmhfc3RhcnRfaW5mb19wYSkKICAgICAg
ICAgam1wICAgICAyZgoKCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1k
ZXZlbA==
