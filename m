From: "Jan Beulich" <JBeulich@suse.com>
Subject: [PATCH] x86/XPTI: fix S3 resume (and CPU offlining in
 general)
Date: Thu, 24 May 2018 07:41:13 -0600
Message-ID: <5B06C0F902000078001C5925@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=y5hq=il=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1fLqUY-0008Dc-0B
 for xen-devel@lists.xenproject.org; Thu, 24 May 2018 13:41:18 +0000
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
Cc: George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Simon Gaiser <simon@invisiblethingslab.com>, Juergen Gross <jgross@suse.com>
List-Id: xen-devel@lists.xenproject.org

SW4gY29tbWl0IGQxZDZmYzk3ZDYgKCJ4ODYveHB0aTogcmVhbGx5IGhpZGUgYWxtb3N0IGFsbCBv
ZiBYZW4gaW1hZ2UiKQpJJ3ZlIGZhaWxlZCB0byByZW1lbWJlciB0aGUgZmFjdCB0aGF0IG11bHRp
cGxlIENQVXMgc2hhcmUgYSBzdHViCm1hcHBpbmcgcGFnZS4gVGhlcmVmb3JlIGl0IGlzIHdyb25n
IHRvIHVuY29uZGl0aW9uYWxseSB6YXAgdGhlIG1hcHBpbmcKd2hlbiBicmluZ2luZyBkb3duIGEg
Q1BVOyBpdCBtYXkgb25seSBiZSB1bm1hcHBlZCB3aGVuIG5vIG90aGVyIG9ubGluZQpDUFUgdXNl
cyB0aGF0IHNhbWUgcGFnZS4KClJlcG9ydGVkLWJ5OiBTaW1vbiBHYWlzZXIgPHNpbW9uQGludmlz
aWJsZXRoaW5nc2xhYi5jb20+ClNpZ25lZC1vZmYtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBz
dXNlLmNvbT4KCi0tLSBhL3hlbi9hcmNoL3g4Ni9zbXBib290LmMKKysrIGIveGVuL2FyY2gveDg2
L3NtcGJvb3QuYwpAQCAtODc2LDcgKzg3NiwyMSBAQCBzdGF0aWMgdm9pZCBjbGVhbnVwX2NwdV9y
b290X3BndCh1bnNpZ25lCiAKICAgICBmcmVlX3hlbl9wYWdldGFibGUocnB0KTsKIAotICAgIC8q
IEFsc28gemFwIHRoZSBzdHViIG1hcHBpbmcgZm9yIHRoaXMgQ1BVLiAqLworICAgIC8qCisgICAg
ICogQWxzbyB6YXAgdGhlIHN0dWIgbWFwcGluZyBmb3IgdGhpcyBDUFUsIGlmIG5vIG90aGVyIG9u
bGluZSBvbmUgdXNlcworICAgICAqIHRoZSBzYW1lIHBhZ2UuCisgICAgICovCisgICAgaWYgKCBz
dHViX2xpbmVhciApCisgICAgeworICAgICAgICB1bnNpZ25lZCBpbnQgb3RoZXI7CisKKyAgICAg
ICAgZm9yX2VhY2hfb25saW5lX2NwdShvdGhlcikKKyAgICAgICAgICAgIGlmICggISgocGVyX2Nw
dShzdHVicy5hZGRyLCBvdGhlcikgXiBzdHViX2xpbmVhcikgPj4gUEFHRV9TSElGVCkgKQorICAg
ICAgICAgICAgeworICAgICAgICAgICAgICAgIHN0dWJfbGluZWFyID0gMDsKKyAgICAgICAgICAg
ICAgICBicmVhazsKKyAgICAgICAgICAgIH0KKyAgICB9CiAgICAgaWYgKCBzdHViX2xpbmVhciAp
CiAgICAgewogICAgICAgICBsM19wZ2VudHJ5X3QgKmwzdCA9IGw0ZV90b19sM2UoY29tbW9uX3Bn
dCk7CgoKCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
WGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0
cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
