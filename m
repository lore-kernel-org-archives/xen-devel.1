From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v7 03/49] x86emul: support AVX512{F, BW,
 DQ} extract insns
Date: Wed, 19 Dec 2018 18:20:59 +0000
Message-ID: <45cb6075-10e3-4a3a-d322-eef3449a3943@citrix.com>
References: <5B6BF83602000078001DC548@prv1-mh.provo.novell.com>
 <5C1A52ED0200007800207865@prv1-mh.provo.novell.com>
 <5C1A578102000078002078A4@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=zx63=O4=citrix.com=prvs=884ade4f2=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1gZgSt-0003LR-AE
 for xen-devel@lists.xenproject.org; Wed, 19 Dec 2018 18:21:03 +0000
In-Reply-To: <5C1A578102000078002078A4@prv1-mh.provo.novell.com>
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
Cc: George Dunlap <George.Dunlap@eu.citrix.com>, Wei Liu <wei.liu2@citrix.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMTkvMTIvMjAxOCAxNDozNiwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gQEAgLTI4MCw2ICsyODUs
MTIgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCB0ZXN0IGF2eDUxMmJ3X2FsbFtdCj4gICAgICBJTlNO
KHB0ZXN0bm0sICAgICBmMywgMGYzOCwgMjYsICAgIHZsLCAgIGJ3LCB2bCksCj4gIH07Cj4gIAo+
ICtzdGF0aWMgY29uc3Qgc3RydWN0IHRlc3QgYXZ4NTEyYndfMTI4W10gPSB7Cj4gKyAgICBJTlNO
KHBleHRyYiwgNjYsIDBmM2EsIDE0LCBlbCwgYiwgZWwpLAo+ICsvLyAgICAgICBwZXh0cncsIDY2
LCAgIDBmLCBjNSwgICAgIHcKCkkgcHJlc3VtZSB0aGlzIGlzbid0IHRlc3RlZCwgZHVlIHRvIGl0
cyBsYWNrIG9mIGEgbWVtb3J5IG9wZXJhbmQ/CgpJdCBkb2VzIGFwcGVhciB0byBiZSBhIHBhcnRp
Y3VsYXJseSBvZGQgZW5jb2RpbmcuCgp+QW5kcmV3Cgo+ICsgICAgSU5TTihwZXh0cncsIDY2LCAw
ZjNhLCAxNSwgZWwsIHcsIGVsKSwKPiArfTsKPiArCj4gIHN0YXRpYyBjb25zdCBzdHJ1Y3QgdGVz
dCBhdng1MTJkcV9hbGxbXSA9IHsKPiAgICAgIElOU05fUEZQKGFuZCwgICAgICAgICAgICAgIDBm
LCA1NCksCj4gICAgICBJTlNOX1BGUChhbmRuLCAgICAgICAgICAgICAwZiwgNTUpLAo+CgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1h
aWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54
ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
