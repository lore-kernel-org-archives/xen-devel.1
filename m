From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 0/2] MMIO emulation fixes
Date: Wed, 29 Aug 2018 12:09:23 +0100
Message-ID: <314e3982-625d-118b-3c3e-61c852d0ffa3@citrix.com>
References: <fdf19f7d-1b92-a9c0-3602-b1c9807bf610@citrix.com>
 <a735b4359ccc4b278330204d9790c6ac@AMSPEX02CL03.citrite.net>
 <5B6DAF9F02000078001DD040@prv1-mh.provo.novell.com>
 <e2f77af0b2394b8f859a1f2dc1a91797@AMSPEX02CL03.citrite.net>
 <5B6DB69D02000078001DD06A@prv1-mh.provo.novell.com>
 <eaab5a73-2910-7fb6-e1fc-08537e63088c@citrix.com>
 <92ca69e5-98b1-61e4-817a-3868f829471a@citrix.com>
 <5B712A3502000078001DD514@prv1-mh.provo.novell.com>
 <20180829103614.GA31376@aepfle.de>
 <75009cae-1c9b-65d9-8269-497f94469983@citrix.com>
 <20180829110052.GC31376@aepfle.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=xzde=lm=citrix.com=prvs=772b5abf7=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1fuyM4-0002fR-Hg
 for xen-devel@lists.xenproject.org; Wed, 29 Aug 2018 11:09:44 +0000
In-Reply-To: <20180829110052.GC31376@aepfle.de>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Olaf Hering <olaf@aepfle.de>
Cc: George Dunlap <George.Dunlap@eu.citrix.com>, xen-devel <xen-devel@lists.xenproject.org>, Paul Durrant <paul.durrant@citrix.com>, george.dunlap@citrix.com, Jan Beulich <JBeulich@suse.com>
List-Id: xen-devel@lists.xenproject.org

T24gMjkvMDgvMTggMTI6MDAsIE9sYWYgSGVyaW5nIHdyb3RlOgo+IE9uIFdlZCwgQXVnIDI5LCBB
bmRyZXcgQ29vcGVyIHdyb3RlOgo+Cj4+IEFyY2hpdGVjdHVyYWxseSBzcGVha2luZywgaGFuZGlu
ZyAjTUMgYmFjayBpcyBwcm9iYWJseSB0aGUgY2xvc2VzdCB3ZQo+PiBjYW4gZ2V0IHRvIHNlbnNp
YmxlIGJlaGF2aW91ciwgYnV0IGl0IGlzIHN0aWxsIGEgYnVnIHRoYXQgTGludXggaXMKPj4gdG91
Y2hpbmcgdGhlIGJhbGxvb25lZCBvdXQgcGFnZSBpbiB0aGUgZmlyc3QgcGxhY2UuCj4gV2VsbCwg
dGhlIGlzc3VlIGlzIHRoYXQgYSByZWFkIGNyb3NzZXMgYSBwYWdlIGJvdW5kYXJ5LiBJZiB0aGF0
IHdvdWxkIGJlCj4gZm9yYmlkZGVuLCBsb2FkX3VuYWxpZ25lZF96ZXJvcGFkKCkgd291bGQgbm90
IGV4aXN0LiBJdCBjYW4gbm90IGtub3cKPiB3aGF0IGlzIGluIHRoZSBmb2xsb3dpbmcgcGFnZS4g
QW5kIHN1Y2ggcGFnZSBjcm9zc2luZyBoYXBwZW5zIGFsc28gaW4KPiB0aGUgdW5iYWxsb29uZWQg
Y2FzZS4gU2FkbHkgSSBjYW4gbm90IHRyaWdnZXIgdGhlIHJlcG9ydGVkIE5GUyBidWcKPiBteXNl
bGYuIEJ1dCBpdCBjYW4gYmUgZW5mb3JjZWQgYnkgYmFsbG9vbmluZyBlbm91Z2ggcGFnZXMgc28g
dGhhdCBhbgo+IGFsbG9jYXRlZCByZWFkZGlyIHJlcGx5IGV2ZW50dWFsbHkgaXMgcmlnaHQgaW4g
ZnJvbnQgb2YgYSBiYWxsb29uZWQKPiBwYWdlLgoKVGhlIExpbnV4IGJ1ZyBpcyBub3Qgc2hvb3Rp
bmcgdGhlIGJhbGxvb25lZCBwYWdlIG91dCBvZiB0aGUgZGlyZWN0bWFwLsKgCkxpbnV4IHNob3Vs
ZCBiZSB0YWtpbmcgYSBmYXRhbCAjUEYgZm9yIHRoYXQgcmVhZCwgYmVjYXVzZSBpdHMgYSB2aXJ0
dWFsCm1hcHBpbmcgZm9yIGEgZnJhbWUgd2hpY2ggTGludXggaGFzIHZvbHVudGFyaWx5IGVsZWN0
ZWQgdG8gbWFrZSBpbnZhbGlkLgoKQXMgWGVuIGNhbid0IHByZXZlbnQgTGludXggZnJvbSBtYWtp
bmcvbWFpbnRhaW5pbmcgc3VjaCBhbiBpbnZhbGlkCm1hcHBpbmcsIHRocm93aW5nICNNQyBiYWNr
IGlzIHRoZSBuZXh0IGJlc3QgdGhpbmcsIGJlY2F1c2UgdGVybWluYXRpbmcKdGhlIGFjY2VzcyB3
aXRoIH4wIGlzIGp1c3QgZ29pbmcgdG8gaGlkZSB0aGUgYnVnLCBhbmQgcnVuIGF0IGEgZ2xhY2lh
bApwYWNlIHdoaWxlIGRvaW5nIHNvLgoKfkFuZHJldwoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL3hlbi1kZXZlbA==
