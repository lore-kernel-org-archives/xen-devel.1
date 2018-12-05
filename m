From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 2/5] x86/idle: re-arrange dead-idle handling
Date: Wed, 5 Dec 2018 20:33:47 +0000
Message-ID: <89aaace9-e345-a1ce-7545-48f0b3a59134@citrix.com>
References: <5B61C21202000078001D9F2D@prv1-mh.provo.novell.com>
 <5B61C45502000078001D9F62@prv1-mh.provo.novell.com>
 <d10cfc13-e027-b4f2-9d42-45a1085d43da@citrix.com>
 <5B9643C002000078001E6AF4@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=9kzc=oo=citrix.com=prvs=870f008d4=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1gUdrm-0002mQ-1B
 for xen-devel@lists.xenproject.org; Wed, 05 Dec 2018 20:33:54 +0000
In-Reply-To: <5B9643C002000078001E6AF4@prv1-mh.provo.novell.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gMTAvMDkvMjAxOCAxMToxMywgSmFuIEJldWxpY2ggd3JvdGU6Cj4KPj4gRXF1YWxseSwgaXQg
bWF5IHN0aWxsIGJlIGFibGUgdG8gc2VydmljZSAjTUMncywgc28gSSBjYW4ndCBzZWUgaG93IGl0
IGlzCj4+IHNhZmUgZm9yIHVzIHRvIGV2ZXIgZnJlZSB0aGUgcGVyY3B1IGRhdGEuCj4gSSdtIGhh
dmluZyB0cm91YmxlIHNlZWluZyBob3cgdGhpcyByZW1hcmsgcmVsYXRlcyB0byB0aGUgc2VyaWVz
IGhlcmUuCgpCZWNhdXNlIHlvdSd2ZSB0cmllZCB0byBtYWtlIE5NSXMgc2FmZSwgYnV0IG5vdCBt
YWRlIGVxdWl2YWxlbnQKYWRqdXN0bWVudHMgdG8gdGhlICNNQyBzaWRlIG9mIHRoaW5ncy4KCj4g
UGx1cyBpdCdzIGEgdGhlb3JldGljYWwgcHJvYmxlbSBhdCBwcmVzZW50IG9ubHkgYW55d2F5Ogo+
IC0gcGh5c2ljYWwgaG90IHJlbW92ZSBpcyBub3QgaW1wbGVtZW50ZWQgKHRoZXJlJ3Mgbm8gc291
cmNlIG9mIHRoZQo+ICAgbmV3IENQVV9SRU1PVkUgbm90aWZpY2F0aW9uKSwKPiAtIEludGVsIENQ
VXMgZ2V0IHBhcmtlZCwgaS5lLiBuZXZlciBoYXZlIHRoZWlyIHBlci1DUFUgZGF0YSBmcmVlZCwK
PiAtIEFNRCBDUFVzIGRvbid0IGJyb2FkY2FzdCAjTUMuCgpJZ25vcmluZyBNQ0UncyBpcyBuZXZl
ciBhbiBvcHRpb24sIGJ1dCB3aGVuZXZlciBDUjQuTUNFIGlzIHNldCwgd2UgbXVzdApiZSBwcmVw
YXJlZCB0byBoYW5kbGUgI01DLsKgIEp1c3QgYmVjYXVzZSBhbiBBTUQgQ1BVIGlzIHBsYXlpbmcg
ZGVhZApkb2Vzbid0IG1lYW4gaXQgaXMgaW1tdW5lIHRvIHJlY2VpdmluZyAjTUMncy4KCn5BbmRy
ZXcKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1k
ZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8v
bGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
