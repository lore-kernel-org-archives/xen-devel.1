From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH v2 03/16] x86: make traps.c build with
 !CONFIG_PV
Date: Tue, 30 Oct 2018 17:48:52 +0000
Message-ID: <20181030174852.zlc7itmgtbdjaqh5@zion.uk.xensource.com>
References: <cover.a9d086fddeb7425fc8cbb3d907dbe8d99a55b46c.1539959287.git-series.wei.liu2@citrix.com>
 <d378cf29afda47cd5f5ead07e8f2ae3e98910e41.1539959287.git-series.wei.liu2@citrix.com>
 <5BD33A8B02000078001F5578@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=mwh5=nk=citrix.com=prvs=834ba7b9c=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1gHY8P-0007kH-KX
 for xen-devel@lists.xenproject.org; Tue, 30 Oct 2018 17:48:57 +0000
Content-Disposition: inline
In-Reply-To: <5BD33A8B02000078001F5578@prv1-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gRnJpLCBPY3QgMjYsIDIwMTggYXQgMTA6MDI6MTlBTSAtMDYwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gPj4+IE9uIDE5LjEwLjE4IGF0IDE2OjI4LCA8d2VpLmxpdTJAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gPiBAQCAtMTMzNyw4ICsxMzM5LDE1IEBAIHN0YXRpYyBpbnQgZml4dXBfcGFnZV9mYXVs
dCh1bnNpZ25lZCBsb25nIGFkZHIsIHN0cnVjdCBjcHVfdXNlcl9yZWdzICpyZWdzKQo+ID4gICAg
ICB7Cj4gPiAgICAgICAgICBpZiAoICEocmVncy0+ZXJyb3JfY29kZSAmIChQRkVDX3VzZXJfbW9k
ZSB8IFBGRUNfcmVzZXJ2ZWRfYml0KSkgJiYKPiA+ICAgICAgICAgICAgICAgKGFkZHIgPj0gR0RU
X0xEVF9WSVJUX1NUQVJUKSAmJiAoYWRkciA8IEdEVF9MRFRfVklSVF9FTkQpICkKPiA+ICsgICAg
ICAgIHsKPiA+ICsjaWZkZWYgQ09ORklHX1BWCj4gPiAgICAgICAgICAgICAgcmV0dXJuIGhhbmRs
ZV9nZHRfbGR0X21hcHBpbmdfZmF1bHQoCj4gPiAgICAgICAgICAgICAgICAgIGFkZHIgLSBHRFRf
TERUX1ZJUlRfU1RBUlQsIHJlZ3MpOwo+ID4gKyNlbHNlCj4gPiArICAgICAgICAgICAgQVNTRVJU
X1VOUkVBQ0hBQkxFKCk7Cj4gCj4gSSdtIG5vdCBjb252aW5jZWQ6IEEgYnVnZ3kgYWNjZXNzIHRv
IHRoaXMgcmFuZ2Ugc2hvdWxkIGxlYWQgdG8KPiBhbiB1bmhhbmRsZWQgI1BGLCBub3QgYW4gYXNz
ZXJ0aW9uIGZhaWx1cmUuCgpPSy4gSW4gdGhhdCBjYXNlIEFTU0VSVF9VTlJFQUNIQUJMRSBpcyBu
b3QgbmVlZGVkIGhlcmUuIFNpbmNlIHRoaXMgd2hvbGUKc25pcHBldCBlbmRzIHVwIHJldHVybmlu
ZyAwIGFueXdheSBJIHdpbGwgcHV0IHRoZSBpbm5lciBpZiBzdGF0ZW1lbnQKdW5kZXIgQ09ORklH
X1BWLgoKV2VpLgoKPiAKPiBKYW4KPiAKPiAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0
aW5mby94ZW4tZGV2ZWw=
