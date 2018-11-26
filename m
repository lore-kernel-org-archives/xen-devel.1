From: "Jan Beulich" <JBeulich@suse.com>
Subject: [PATCH] CODING_STYLE: explicitly call out label
 indentation
Date: Mon, 26 Nov 2018 02:04:05 -0700
Message-ID: <5BFBB70502000078001FFBDC@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=azgn=of=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1gRCoN-000317-0R
 for xen-devel@lists.xenproject.org; Mon, 26 Nov 2018 09:04:11 +0000
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>
List-Id: xen-devel@lists.xenproject.org

U2luY2UgdGhlIGJlaGF2aW9yIG9mICJkaWZmIC1wIiB0byB1c2UgYW4gdW5pbmRlbnRlZCBsYWJl
bCBhcyBjb250ZXh0CmlkZW50aWZpZXIgb2Z0ZW4gbWFrZXMgaXQgaGFyZGVyIHRvIHJldmlldyBw
YXRjaGVzLCBtYWtlIGV4cGxpY2l0IHRoZQpyZXF1aXJlbWVudCBmb3IgbGFiZWxzIHRvIGJlIGlu
ZGVudGVkLgoKU2lnbmVkLW9mZi1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgoK
LS0tIGEvQ09ESU5HX1NUWUxFCisrKyBiL0NPRElOR19TVFlMRQpAQCAtMzEsNiArMzEsMTAgQEAg
dm9pZCBmdW4odm9pZCkKICAgICB9CiB9CiAKK0R1ZSB0byB0aGUgYmVoYXZpb3Igb2YgR05VIGRp
ZmZ1dGlscyAiZGlmZiAtcCIsIGxhYmVscyBzaG91bGQgYmUKK2luZGVudGVkIGJ5IGF0IGxlYXN0
IG9uZSBibGFuay4gIE5vbi1jYXNlIGxhYmVscyBpbnNpZGUgc3dpdGNoKCkgYm9kaWVzCithcmUg
cHJlZmVycmVkIHRvIGJlIGluZGVudGVkIHRoZSBzYW1lIGFzIHRoZSBibG9jaydzIGNhc2UgbGFi
ZWxzLgorCiBXaGl0ZSBzcGFjZQogLS0tLS0tLS0tLS0KIAoKCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVs
