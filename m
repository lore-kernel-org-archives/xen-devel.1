From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH RFC v1 41/74] xen/pvh: do not mark the low
 1MB as IO mem
Date: Mon, 08 Jan 2018 04:11:45 -0700
Message-ID: <5A536001020000780019C171@prv-mh.provo.novell.com>
References: <20180104130625.28605-1-wei.liu2@citrix.com>
 <20180104130625.28605-42-wei.liu2@citrix.com>
 <5A535649020000780019C0C7@prv-mh.provo.novell.com>
 <20180108103740.c6mmjd6vgp2a2d6s@MacBook-Pro-de-Roger.local>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2)
 (envelope-from <srs0=dk2s=ed=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1eYVLR-0004q6-Cu
 for xen-devel@lists.xenproject.org; Mon, 08 Jan 2018 11:11:57 +0000
In-Reply-To: <20180108103740.c6mmjd6vgp2a2d6s@MacBook-Pro-de-Roger.local>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: =?UTF-8?Q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, wei.liu2@citrix.com, Xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDA4LjAxLjE4IGF0IDExOjM3LCA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdyb3RlOgo+
IE9uIE1vbiwgSmFuIDA4LCAyMDE4IGF0IDAzOjMwOjE3QU0gLTA3MDAsIEphbiBCZXVsaWNoIHdy
b3RlOgo+PiA+Pj4gT24gMDQuMDEuMTggYXQgMTQ6MDUsIDx3ZWkubGl1MkBjaXRyaXguY29tPiB3
cm90ZToKPj4gPiBAQCAtMjg4LDggKzI4OSwxMiBAQCB2b2lkIF9faW5pdCBhcmNoX2luaXRfbWVt
b3J5KHZvaWQpCj4+ID4gICAgICBkb21fY293ID0gZG9tYWluX2NyZWF0ZShET01JRF9DT1csIERP
TUNSRl9kdW1teSwgMCwgTlVMTCk7Cj4+ID4gICAgICBCVUdfT04oSVNfRVJSKGRvbV9jb3cpKTsK
Pj4gPiAgCj4+ID4gLSAgICAvKiBGaXJzdCAxTUIgb2YgUkFNIGlzIGhpc3RvcmljYWxseSBtYXJr
ZWQgYXMgSS9PLiAqLwo+PiA+IC0gICAgZm9yICggaSA9IDA7IGkgPCAweDEwMDsgaSsrICkKPj4g
PiArICAgIC8qCj4+ID4gKyAgICAgKiBGaXJzdCAxTUIgb2YgUkFNIGlzIGhpc3RvcmljYWxseSBt
YXJrZWQgYXMgSS9PLiAgSWYgd2UgYm9vdGVkIFBWSCwKPj4gPiArICAgICAqIHJlY2xhaW0gdGhl
IHNwYWNlLiAgSXJyZXNwZWN0aXZlLCBsZWF2ZSBNRk4gMCBhcyBzcGVjaWFsIGZvciB0aGUgc2Fr
ZQo+PiA+ICsgICAgICogb2YgMCBiZWluZyBhIHZlcnkgY29tbW9uIGRlZmF1bHQgdmFsdWUuCj4+
ID4gKyAgICAgKi8KPj4gPiArICAgIGZvciAoIGkgPSAwOyBpIDwgKHB2aF9ib290ID8gMSA6IDB4
MTAwKTsgaSsrICkKPj4gPiAgICAgICAgICBzaGFyZV94ZW5fcGFnZV93aXRoX2d1ZXN0KG1mbl90
b19wYWdlKF9tZm4oaSkpLAo+PiA+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ZG9tX2lvLCBYRU5TSEFSRV93cml0YWJsZSk7Cj4+IAo+PiBJIGNhbiBzZWUgdGhpcyBiZWluZyB2
YWxpZCBhcyBsb25nIGFzIHRoZXJlJ3Mgbm8gZmlybXdhcmUuIFdoYXQKPj4gZG9lc24ndCBiZWNv
bWUgY2xlYXIgZnJvbSBuZWl0aGVyIHRoZSBkZXNjcmlwdGlvbiBub3IgdGhlCj4+IGNvbW1lbnQg
aXMgd2hldGhlciB0aGlzIGlzIGEgbmVjZXNzYXJ5IGNoYW5nZSwgb3IganVzdCBhbgo+PiBvcHRp
bWl6YXRpb24gdG8gYXZvaWQgd2FzdGluZyB0aGVzZSAyNTUgcGFnZXMuCj4gCj4gSXQncyBqdXN0
IGFuIG9wdGltaXphdGlvbiB0byBub3Qgd2FzdGUgdGhlIGxvdyAxTWlCLiBUaGUgc2hpbSB3aWxs
Cj4gd29yayBlcXVhbGx5IHdlbGwgd2l0aG91dCB0aGlzLgoKR29vZC4gUGxlYXNlIHNheSBzbyBp
biB0aGUgZGVzY3JpcHRpb24uCgpKYW4KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs
