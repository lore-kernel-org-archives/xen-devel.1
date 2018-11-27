From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] x86emul: correct 32-bit address handling
 for AVX2 gathers
Date: Tue, 27 Nov 2018 13:14:18 +0000
Message-ID: <159e5dbb-9510-90ca-62ae-f34be7fe95ee@citrix.com>
References: <5BFD3D4502000078002005A7@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=curg=og=citrix.com=prvs=86220cbda=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1gRdCX-0004X2-7f
 for xen-devel@lists.xenproject.org; Tue, 27 Nov 2018 13:14:53 +0000
In-Reply-To: <5BFD3D4502000078002005A7@prv1-mh.provo.novell.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>
Cc: Wei Liu <wei.liu2@citrix.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMjcvMTEvMjAxOCAxMjo0OSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gQXMgZG9uZSBmb3Igb3Ro
ZXIgY2FzZXMgYnkgY29tbWl0IDc4NjllMmJhZmUgKCJ4ODZlbXVsL2Z1eno6IGFkZAo+IHJ1ZGlt
ZW50YXJ5IGxpbWl0IGNoZWNraW5nIiksIGFkZHJlc3MgY2FsY3VsYXRpb25zIHNob3VsZCBhbHNv
IHVzZQo+IHRydW5jYXRlX2VhKCkgZm9yIHRoZSBBVlgyIGdhdGhlciBpbnNucy4KPgo+IFNpZ25l
ZC1vZmYtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KCkFja2VkLWJ5OiBBbmRy
ZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
