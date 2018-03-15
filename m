From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Re: [PATCH v9 09/11] vpci/msi: add MSI handlers
Date: Thu, 15 Mar 2018 15:54:40 +0000
Message-ID: <20180315155440.v3gr65t376x4kfde@MacBook-Pro-de-Roger.local>
References: <20180314140408.40947-1-roger.pau@citrix.com>
 <20180314140408.40947-10-roger.pau@citrix.com>
 <5AA9610B02000078001B1AFD@prv-mh.provo.novell.com>
 <20180315114817.kenim6hpnqjdbuzp@MacBook-Pro-de-Roger.local>
 <5AAA78AD02000078001B21F2@prv-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=i8qd=gf=citrix.com=prvs=6054e4102=roger.pau@srs-us1.protection.inumbo.net>)
 id 1ewVTW-0001qK-Lu
 for xen-devel@lists.xenproject.org; Thu, 15 Mar 2018 16:11:30 +0000
Content-Disposition: inline
In-Reply-To: <5AAA78AD02000078001B21F2@prv-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, IanJackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, Paul Durrant <paul.durrant@citrix.com>, xen-devel@lists.xenproject.org, Boris Ostrovsky <boris.ostrovsky@oracle.com>
List-Id: xen-devel@lists.xenproject.org

T24gVGh1LCBNYXIgMTUsIDIwMTggYXQgMDY6NDQ6MTNBTSAtMDYwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gPj4+IE9uIDE1LjAzLjE4IGF0IDEyOjQ4LCA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdy
b3RlOgo+ID4gT24gV2VkLCBNYXIgMTQsIDIwMTggYXQgMTA6NTE6MDdBTSAtMDYwMCwgSmFuIEJl
dWxpY2ggd3JvdGU6Cj4gPj4gPj4+IE9uIDE0LjAzLjE4IGF0IDE1OjA0LCA8cm9nZXIucGF1QGNp
dHJpeC5jb20+IHdyb3RlOgo+ID4+ID4gLS0tIGEveGVuL2RyaXZlcnMvdnBjaS92cGNpLmMKPiA+
PiA+ICsrKyBiL3hlbi9kcml2ZXJzL3ZwY2kvdnBjaS5jCj4gPj4gPiBAQCAtNDcsNiArNDcsMTAg
QEAgdm9pZCB2cGNpX3JlbW92ZV9kZXZpY2Uoc3RydWN0IHBjaV9kZXYgKnBkZXYpCj4gPj4gPiAg
ICAgICAgICB4ZnJlZShyKTsKPiA+PiA+ICAgICAgfQo+ID4+ID4gICAgICBzcGluX3VubG9jaygm
cGRldi0+dnBjaS0+bG9jayk7Cj4gPj4gPiArI2lmZGVmIF9fWEVOX18KPiA+PiA+ICsgICAgLyog
TkI6IGZpZWxkcyBiZWxvdyBhcmUgbm90IGV4cG9zZWQgdG8gdGhlIHVzZXItc3BhY2UgdGVzdCBo
YXJuZXNzLiAqLwo+ID4+ID4gKyAgICB4ZnJlZShwZGV2LT52cGNpLT5tc2kpOwo+ID4+ID4gKyNl
bmRpZgo+ID4+IAo+ID4+IFdvdWxkIGl0IG1heWJlIGJlIGJldHRlciB0byBhZGQgc3VjaCBkdW1t
eSBmaWVsZChzKSwgdG8gYXZvaWQgdGhlCj4gPj4gI2lmZGVmIGhlcmU/IEFueXdheSwgd2l0aCBv
ciB3aXRob3V0IHRoYXQKPiA+PiBSZXZpZXdlZC1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1
c2UuY29tPgo+ID4gCj4gPiBGb3IgdGhlIG1zaSBzdHJ1Y3R1cmUgdGhhdCdzIGRvYWJsZSwgYnV0
IGZvciBtc2l4IGl0J3MgbW9yZSBjb21wbGV4Cj4gPiBiZWNhdXNlIGl0IGluY2x1ZGVzIHRoZSB2
cGNpX2FyY2hfbXNpeF9lbnRyeSBzdHJ1Y3R1cmUsIGFuZCB0aGF0IHdvdWxkCj4gPiBtZWFuIGV4
cG9zaW5nIG1vcmUgc3R1ZmYgdG8gdGhlIHVzZXItc3BhY2UgdGVzdCBoYXJuZXNzLgo+IAo+IEkg
ZG9uJ3QgdW5kZXJzdGFuZDogVGhlc2UgYXJlIHBvaW50ZXJzLCBoZW5jZSBpdCBzdWZmaWNlcyB0
bwo+IHVzZSB0aGUgc3RydWN0dXJlcyBoZXJlIHdpdGhvdXQgYWN0dWFsbHkgZGVmaW5pbmcgdGhl
aXIgbWVtYmVycwo+IGFueXdoZXJlOyB5b3UgZG9uJ3QgZXZlbiBuZWVkIHRvIGRlY2xhcmUgdGhl
bSBhcyBhbiBlbXB0eQo+IHN0cnVjdHVyZS4gWW91J2QganVzdCBuZWVkIHRvIG1ha2Ugc3VyZSB0
aGF0IHRoZSB0ZXN0IHRvb2wgZmlsbHMKPiB0aGUgcG9pbnRlciBmaWVsZHMgd2l0aCBOVUxMIChz
byB0aGF0IGZyZWUoKWluZyB0aGVtIGlzIGEgbm8tb3ApLgoKVGhlIGlzc3VlIGlzIHRoYXQgdGhl
IHN0cnVjdHVyZSBkZWZpbml0aW9uIGFuZCB0aGUgZmllbGQgZGVjbGFyYXRpb24KYXJlIGRvbmUg
YXQgdGhlIHNhbWUgdGltZToKCnN0cnVjdCB2cGNpIHsKICAgIC4uLgojaWZkZWYgX19YRU5fXwog
ICAgc3RydWN0IHZwY2lfbXNpIHsKICAgICAgICAuLi4KICAgIH0gKm1zaTsKCiAgICBzdHJ1Y3Qg
dnBjaV9tc2l4IHsKICAgICAgICAuLi4KICAgIH0gKm1zaXg7CiNlbmRpZgp9CgpXb3VsZCB5b3Ug
bGlrZSBtZSB0byBhZGQgYSAjZWxzZSB3aXRoIHZvaWQgKiBkZWNsYXJhdGlvbnMgZm9yIGJvdGgg
bXNpCmFuZCBtc2l4PwoKSSBjb3VsZCBkZWZpbmUgdGhlIHN0cnVjdHVyZXMgc2VwYXJhdGVseSBp
bnNpZGUgb2YgX19YRU5fXyBndWFyZHMsIGJ1dApJIGRvbid0IHNlZSB0aGF0IGFwcHJvYWNoIGJl
dHRlciB0aGFuIHRoZSBvbmUgdXNlZCBoZXJlLgoKUm9nZXIuCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVs
