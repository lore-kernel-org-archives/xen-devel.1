From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Re: [PATCH v9 09/11] vpci/msi: add MSI handlers
Date: Thu, 15 Mar 2018 11:48:17 +0000
Message-ID: <20180315114817.kenim6hpnqjdbuzp@MacBook-Pro-de-Roger.local>
References: <20180314140408.40947-1-roger.pau@citrix.com>
 <20180314140408.40947-10-roger.pau@citrix.com>
 <5AA9610B02000078001B1AFD@prv-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=i8qd=gf=citrix.com=prvs=6054e4102=roger.pau@srs-us1.protection.inumbo.net>)
 id 1ewRN0-00006h-K1
 for xen-devel@lists.xenproject.org; Thu, 15 Mar 2018 11:48:30 +0000
Content-Disposition: inline
In-Reply-To: <5AA9610B02000078001B1AFD@prv-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, Paul Durrant <paul.durrant@citrix.com>, xen-devel@lists.xenproject.org, Boris Ostrovsky <boris.ostrovsky@oracle.com>
List-Id: xen-devel@lists.xenproject.org

T24gV2VkLCBNYXIgMTQsIDIwMTggYXQgMTA6NTE6MDdBTSAtMDYwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gPj4+IE9uIDE0LjAzLjE4IGF0IDE1OjA0LCA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdy
b3RlOgo+ID4gLS0tIGEveGVuL2RyaXZlcnMvdnBjaS92cGNpLmMKPiA+ICsrKyBiL3hlbi9kcml2
ZXJzL3ZwY2kvdnBjaS5jCj4gPiBAQCAtNDcsNiArNDcsMTAgQEAgdm9pZCB2cGNpX3JlbW92ZV9k
ZXZpY2Uoc3RydWN0IHBjaV9kZXYgKnBkZXYpCj4gPiAgICAgICAgICB4ZnJlZShyKTsKPiA+ICAg
ICAgfQo+ID4gICAgICBzcGluX3VubG9jaygmcGRldi0+dnBjaS0+bG9jayk7Cj4gPiArI2lmZGVm
IF9fWEVOX18KPiA+ICsgICAgLyogTkI6IGZpZWxkcyBiZWxvdyBhcmUgbm90IGV4cG9zZWQgdG8g
dGhlIHVzZXItc3BhY2UgdGVzdCBoYXJuZXNzLiAqLwo+ID4gKyAgICB4ZnJlZShwZGV2LT52cGNp
LT5tc2kpOwo+ID4gKyNlbmRpZgo+IAo+IFdvdWxkIGl0IG1heWJlIGJlIGJldHRlciB0byBhZGQg
c3VjaCBkdW1teSBmaWVsZChzKSwgdG8gYXZvaWQgdGhlCj4gI2lmZGVmIGhlcmU/IEFueXdheSwg
d2l0aCBvciB3aXRob3V0IHRoYXQKPiBSZXZpZXdlZC1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNo
QHN1c2UuY29tPgoKRm9yIHRoZSBtc2kgc3RydWN0dXJlIHRoYXQncyBkb2FibGUsIGJ1dCBmb3Ig
bXNpeCBpdCdzIG1vcmUgY29tcGxleApiZWNhdXNlIGl0IGluY2x1ZGVzIHRoZSB2cGNpX2FyY2hf
bXNpeF9lbnRyeSBzdHJ1Y3R1cmUsIGFuZCB0aGF0IHdvdWxkCm1lYW4gZXhwb3NpbmcgbW9yZSBz
dHVmZiB0byB0aGUgdXNlci1zcGFjZSB0ZXN0IGhhcm5lc3MuCgpJIHdvdWxkIHByZWZlciB0byBr
ZWVwIHRoZSBjdXJyZW50IGFwcHJvYWNoLCBJIHRoaW5rIGl0J3Mgc2FmZXIgZ29pbmcKZm9yd2Fy
ZCBpZiB3ZSBrZWVwIGFkZGluZyBmaWVsZHMgdG8gdGhlIHZwY2kgc3RydWN0dXJlLgoKVGhhbmtz
LCBSb2dlci4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
