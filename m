From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH] x86/mm: subsume set_gpfn_from_mfn() into
 guest_physmap_add_entry()
Date: Wed, 08 May 2019 09:16:18 -0600
Message-ID: <5CD2F2C2020000780022CE81@prv1-mh.provo.novell.com>
References: <5CCA94F9020000780022B02A@prv1-mh.provo.novell.com>
 <64365dfd-3324-7b2d-f8d9-8600627f467f@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=RDkG=TI=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hOOIw-0002Ps-If
 for xen-devel@lists.xenproject.org; Wed, 08 May 2019 15:16:22 +0000
In-Reply-To: <64365dfd-3324-7b2d-f8d9-8600627f467f@citrix.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: george.dunlap@citrix.com
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDA4LjA1LjE5IGF0IDE3OjA4LCA8Z2VvcmdlLmR1bmxhcEBjaXRyaXguY29tPiB3cm90
ZToKPiBPbiA1LzIvMTkgNzo1OCBBTSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+IC0tLSBhL3hlbi9h
cmNoL3g4Ni9tbS9wMm0uYwo+PiArKysgYi94ZW4vYXJjaC94ODYvbW0vcDJtLmMKPj4gQEAgLTg0
MSwxNSArODQxLDE5IEBAIGd1ZXN0X3BoeXNtYXBfYWRkX2VudHJ5KHN0cnVjdCBkb21haW4gKmQK
Pj4gICAgICAgICAgICogYW55IGd1ZXN0LXJlcXVlc3RlZCB0eXBlIGNoYW5nZXMgc3VjY2VlZCBh
bmQgcmVtb3ZlIHRoZSBJT01NVQo+PiAgICAgICAgICAgKiBlbnRyeSkuCj4+ICAgICAgICAgICAq
Lwo+PiAtICAgICAgICBpZiAoICFuZWVkX2lvbW11X3B0X3N5bmMoZCkgfHwgdCAhPSBwMm1fcmFt
X3J3ICkKPj4gKyAgICAgICAgaWYgKCB0ICE9IHAybV9yYW1fcncgKQo+PiAgICAgICAgICAgICAg
cmV0dXJuIDA7Cj4gCj4gU28sIHlvdSBzZWVtIHRvIGJlIGNsYWltaW5nIHRoYXQgdGhlIG9ubHkg
d2F5IHRvIGdldCBoZXJlIGlzIHZpYQo+IGd1ZXN0X3BoeXNtYXBfYWRkX3BhZ2UoKSwKCldlbGws
IEknbSBub3QgImNsYWltaW5nIiBhbnl0aGluZyBoZXJlLCBJJ20ganVzdCBtb2RpZnlpbmcgZXhp
c3RpbmcKY29kZSAoYW5kIG5vIG1vcmUgdGhhbiB3aGF0IGZpdHMgdW5kZXIgdGhpcyBwYXRjaCdz
IHRpdGxlKS4KCj4gd2hpY2ggd2lsbCBhbHdheXMgY2FsbCB0aGlzIGZ1bmN0aW9uIHdpdGgKPiBw
Mm1fcmFtX3J3LiAgU28gdGhlbiB3aGF0J3MgdGhlIHBvaW50IG9mIHRoaXMgY29uZGl0aW9uYWwg
YXQgYWxsCj4gYW55bW9yZT8gIFdvdWxkIGl0IGJlIGJldHRlciB0byBhZGQgYW4gQVNTRVJUKHQg
PT0gcDJtX3JhbV9ydykgaGVyZT8KPiAKPiBBbmQgaWYgd2UgZXZlciAqZG8qIGdldCBoZXJlIHdp
dGggdCA9PSBwMm1fcmFtX3J3LCBkbyB3ZSByZWFsbHkgbm90IHdhbnQKPiB0byBjYWxsIHNldF9n
cGZuX2Zyb21fbWZuKCk/CgpUaGlua2luZyBhYm91dCBlLmcuIHAybV9ncmFudF9tYXBfKiBJIHdv
dWxkbid0IHdhbnQgdG8gYWRkIHRoZQpzdWdnZXN0ZWQgQVNTRVJUKCksIGFuZCB0aGUgTTJQIGRv
ZXNuJ3Qgd2FudCB1cGRhdGluZyBpbiB0aGF0CmNhc2UgZWl0aGVyLgoKSmFuCgoKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5n
IGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJv
amVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
