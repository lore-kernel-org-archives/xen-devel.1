From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v4 15/44] x86emul: support AVX512{F,
 DQ} FP broadcast insns
Date: Tue, 13 Nov 2018 19:37:55 +0000
Message-ID: <e9040923-cc5c-ced4-c4fd-92d4dbb2df5d@citrix.com>
References: <5B6BF83602000078001DC548@prv1-mh.provo.novell.com>
 <5BAA34B502000078001EB9B6@prv1-mh.provo.novell.com>
 <5BAA399602000078001EBA4E@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=fay+=ny=citrix.com=prvs=848d83c09=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1gMeVa-00075t-F4
 for xen-devel@lists.xenproject.org; Tue, 13 Nov 2018 19:37:58 +0000
In-Reply-To: <5BAA399602000078001EBA4E@prv1-mh.provo.novell.com>
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
Cc: George Dunlap <George.Dunlap@eu.citrix.com>, Wei Liu <wei.liu2@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMjUvMDkvMjAxOCAxNDozNSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gQEAgLTc5NzksNiArNzk5
MSw0MiBAQCB4ODZfZW11bGF0ZSgKPiAgICAgICAgICBkc3QudHlwZSA9IE9QX05PTkU7Cj4gICAg
ICAgICAgYnJlYWs7Cj4gIAo+ICsgICAgY2FzZSBYODZFTVVMX09QQ19FVkVYXzY2KDB4MGYzOCwg
MHgxOCk6IC8qIHZicm9hZGNhc3RzcyB4bW0vbTMyLFt4eXpdbW17a30gKi8KPiArICAgICAgICBn
ZW5lcmF0ZV9leGNlcHRpb25faWYoZXZleC53IHx8IGV2ZXguYnIsIEVYQ19VRCk7Cj4gKyAgICBh
dng1MTJfYnJvYWRjYXN0Ogo+ICsgICAgICAgIC8qCj4gKyAgICAgICAgICogRm9yIHRoZSByZXNw
ZWN0aXZlIGNvZGUgYmVsb3cgdGhlIG1haW4gc3dpdGNoKCkgdG8gd29yayB3ZSBuZWVkIHRvCj4g
KyAgICAgICAgICogZm9sZCBvcF9tYXNrIGhlcmU6IEEgc291cmNlIGVsZW1lbnQgZ2V0cyByZWFk
IHdoZW5ldmVyIGFueSBvZiBpdHMKPiArICAgICAgICAgKiByZXNwZWN0aXZlIGRlc3RpbmF0aW9u
IGVsZW1lbnRzJyBtYXNrIGJpdHMgaXMgc2V0Lgo+ICsgICAgICAgICAqLwo+ICsgICAgICAgIGlm
ICggZmF1bHRfc3VwcHJlc3Npb24gKQo+ICsgICAgICAgIHsKPiArICAgICAgICAgICAgbiA9IDEg
PDwgKChiICYgMykgLSBldmV4LncpOwo+ICsgICAgICAgICAgICBBU1NFUlQob3BfYnl0ZXMgPT0g
biAqIGVsZW1fYnl0ZXMpOwo+ICsgICAgICAgICAgICBmb3IgKCBpID0gbjsgaSA8ICgxNiA8PCBl
dmV4LmxyKSAvIGVsZW1fYnl0ZXM7IGkgKz0gbiApCgpBcyBiZWZvcmUsIHdlIHNob3VsZCBoYXZl
IGEgcmVsZWFzZS1idWlsZCBzYWZlIGNoZWNrIG9mIGVsZW1fYnl0ZXMuCgp+QW5kcmV3CgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFp
bGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhl
bnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
