From: "Jan Beulich" <JBeulich@suse.com>
Subject: [PATCH 2/4] x86/IRQ: bail early from
 irq_guest_eoi_timer_fn() when nothing is in flight
Date: Wed, 08 May 2019 06:46:51 -0600
Message-ID: <5CD2CFBB020000780022CCC6@prv1-mh.provo.novell.com>
References: <5CD2CDEC020000780022CC95@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=RDkG=TI=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hOLyL-00049b-7a
 for xen-devel@lists.xenproject.org; Wed, 08 May 2019 12:46:57 +0000
In-Reply-To: <5CD2CDEC020000780022CC95@prv1-mh.provo.novell.com>
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

VGhlcmUncyBubyBwb2ludCBlbnRlcmluZyB0aGUgbG9vcCBpbiB0aGUgZnVuY3Rpb24gaW4gdGhp
cyBjYXNlLiBJbnN0ZWFkCnRoZXJlIHN0aWxsIGJlaW5nIHNvbWV0aGluZyBpbiBmbGlnaHQgX2Fm
dGVyXyB0aGUgbG9vcCB3b3VsZCBiZSBhbgphY3R1YWwgcHJvYmxlbTogTm8gdGltZXIgd291bGQg
YmUgcnVubmluZyBhbnltb3JlIGZvciBpc3N1aW5nIHRoZSBFT0kKZXZlbnR1YWxseSwgYW5kIGhl
bmNlIHRoaXMgSVJRIChhbmQgcG9zc2libHkgbG93ZXIgcHJpb3JpdHkgb25lcykgd291bGQKYmUg
YmxvY2tlZCwgcGVyaGFwcyBpbmRlZmluaXRlbHkuCgpJc3N1ZSBhIHdhcm5pbmcgaW5zdGVhZCBh
bmQgcHJlZmVyIGJyZWFraW5nIHNvbWUgKHByZXN1bWFibHkKbWlzYmVoYXZpbmcpIGd1ZXN0IG92
ZXIgc3RhbGxpbmcgcGVyaGFwcyB0aGUgZW50aXJlIHN5c3RlbS4KClNpZ25lZC1vZmYtYnk6IEph
biBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KCi0tLSBhL3hlbi9hcmNoL3g4Ni9pcnEuYwor
KysgYi94ZW4vYXJjaC94ODYvaXJxLmMKQEAgLTExMTUsNyArMTExNSw3IEBAIHN0YXRpYyB2b2lk
IGlycV9ndWVzdF9lb2lfdGltZXJfZm4odm9pZAogCiAgICAgYWN0aW9uID0gKGlycV9ndWVzdF9h
Y3Rpb25fdCAqKWRlc2MtPmFjdGlvbjsKIAotICAgIGlmICggdGltZXJfaXNfYWN0aXZlKCZhY3Rp
b24tPmVvaV90aW1lcikgKQorICAgIGlmICggIWFjdGlvbi0+aW5fZmxpZ2h0IHx8IHRpbWVyX2lz
X2FjdGl2ZSgmYWN0aW9uLT5lb2lfdGltZXIpICkKICAgICAgICAgZ290byBvdXQ7CiAKICAgICBp
ZiAoIGFjdGlvbi0+YWNrX3R5cGUgIT0gQUNLVFlQRV9OT05FICkKQEAgLTExMzAsOCArMTEzMCwx
MCBAQCBzdGF0aWMgdm9pZCBpcnFfZ3Vlc3RfZW9pX3RpbWVyX2ZuKHZvaWQKICAgICAgICAgfQog
ICAgIH0KIAotICAgIGlmICggYWN0aW9uLT5pbl9mbGlnaHQgIT0gMCApCi0gICAgICAgIGdvdG8g
b3V0OworICAgIGlmICggYWN0aW9uLT5pbl9mbGlnaHQgKQorICAgICAgICBwcmludGsoWEVOTE9H
X0dfV0FSTklORworICAgICAgICAgICAgICAgIklSUSVkOiAlZCBoYW5kbGVycyBzdGlsbCBpbiBm
bGlnaHQgYXQgZm9yY2VkIEVPSVxuIiwKKyAgICAgICAgICAgICAgIGRlc2MtPmlycSwgYWN0aW9u
LT5pbl9mbGlnaHQpOwogCiAgICAgc3dpdGNoICggYWN0aW9uLT5hY2tfdHlwZSApCiAgICAgewoK
CgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1k
ZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8v
bGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
