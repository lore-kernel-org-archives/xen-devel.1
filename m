From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Re: Ping: [PATCH] x86/HVM: correct an inverted check in
 hvm_load()
Date: Thu, 16 Aug 2018 17:18:07 +0200
Message-ID: <20180816151807.k5p33fvol3lq7eh3@mac>
References: <5B61D38002000078001DA043@prv1-mh.provo.novell.com>
 <5B75302E02000078001DEBE3@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=kltf=k7=citrix.com=prvs=759492735=roger.pau@srs-us1.protection.inumbo.net>)
 id 1fqKXu-0001wQ-4W
 for xen-devel@lists.xenproject.org; Thu, 16 Aug 2018 15:50:46 +0000
Content-Disposition: inline
In-Reply-To: <5B75302E02000078001DEBE3@prv1-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gVGh1LCBBdWcgMTYsIDIwMTggYXQgMDI6MDU6MDJBTSAtMDYwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gPj4+IE9uIDAxLjA4LjE4IGF0IDE3OjM2LCAgd3JvdGU6Cj4gPiBDbGVhcmx5IHdlIHdh
bnQgdG8gcHV0IGEgdkNQVSB0byBzbGVlcCBpZiBpdCBpcyBfbm90XyBhbHJlYWR5IGRvd24uCj4g
PiAKPiA+IFNpZ25lZC1vZmYtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KPiA+
IC0tLQo+ID4gVEJEOiBTaW5jZSB0aGUgZmxhdyBhcHBhcmVudGx5IG5ldmVyIG1hdHRlcmVkLCBJ
IGltcGx5IHRoYXQgdGhlIGZ1bmN0aW9uCj4gPiAgICAgIGlzIG5ldmVyIGNhbGxlZCB3aXRoIGFu
eSB2Q1BVIHVwLiBIZW5jZSBhbiBhbHRlcm5hdGl2ZSBtaWdodCBiZSB0bwo+ID4gICAgICBzaW1w
bHkgcmV0dXJuIGFuIGVycm9yIGlmIGEgdkNQVSBkb2Vzbid0IGhhdmUgVlBGX2Rvd24gc2V0Lgo+
IAo+IFdoaWxlIGluIGFuIGVhcmxpZXIgcmVwbHkgeW91J3ZlIGluZGljYXRlZCB0aGF0IHRoZSBz
dWdnZXN0ZWQKPiBhbHRlcm5hdGl2ZSBpcyBub3QgYW4gb3B0aW9uLCBJJ3ZlIG5vdCBoYWQgY2xl
YXIgZmVlZGJhY2sgb24gdGhlCj4gY2hhbmdlIGJlbG93LgoKVGhpcyBMR1RNIGFuZCBmaXhlcyBh
biBvYnZpb3VzIGJ1Zy4gSSBkb24ndCBoYXZlIGFuIG9waW5pb24gb24gdGhlCmFib3ZlIG9yIHdo
ZXRoZXIgQ29sby9SZW11cyB3b3JrcyBhdCBhbGwsIGJ1dCB0aGUgZml4IGJlbG93IHNlZW1zIHRv
CmJlIGxlc3MgY29udHJvdmVyc2lhbCB0aGFuIHJldHVybmluZyBlcnJvci4KClJldmlld2VkLWJ5
OiBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4KClJvZ2VyLgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxp
bmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
