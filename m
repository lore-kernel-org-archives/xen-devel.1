From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] x86emul: permit SAE for V{,U}COMIS{S,D}
Date: Mon, 10 Dec 2018 13:20:54 +0000
Message-ID: <1623e964-26ed-1031-3087-89ebb23859e9@citrix.com>
References: <5C0E4ED902000078002049CB@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=R27G=OT=citrix.com=prvs=87506bf53=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1gWLUt-0001Qq-AI
 for xen-devel@lists.xenproject.org; Mon, 10 Dec 2018 13:21:19 +0000
In-Reply-To: <5C0E4ED902000078002049CB@prv1-mh.provo.novell.com>
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

T24gMTAvMTIvMjAxOCAxMTozMiwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gVGhlIGF2eDUxMl92bGVu
X2NoZWNrKCkgaW52b2NhdGlvbiBuZWVkcyB0byBiZSBjb25kaXRpb25hbC4KPgo+IFNpZ25lZC1v
ZmYtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KCkknbSBub3Qgc3VyZSBpZiBJ
J3ZlIGFza2VkIGJlZm9yZSwgYnV0IGRvIExJRyBpbnN0cnVjdGlvbnMgcmVhbGx5ICNVRApmb3Ig
TD0zID/CoCBJIGRvbid0IHNlZSBhbnkgZG9jdW1lbnRhdGlvbiB0byB0aGlzIGVmZmVjdC4KCj4K
PiAtLS0gYS94ZW4vYXJjaC94ODYveDg2X2VtdWxhdGUveDg2X2VtdWxhdGUuYwo+ICsrKyBiL3hl
bi9hcmNoL3g4Ni94ODZfZW11bGF0ZS94ODZfZW11bGF0ZS5jCj4gQEAgLTYxNzksNyArNjE3OSw4
IEBAIHg4Nl9lbXVsYXRlKAo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgZXZleC53
ICE9IGV2ZXgucGZ4KSwKPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgRVhDX1VEKTsK
PiAgICAgICAgICBob3N0X2FuZF92Y3B1X211c3RfaGF2ZShhdng1MTJmKTsKPiAtICAgICAgICBh
dng1MTJfdmxlbl9jaGVjayh0cnVlKTsKPiArICAgICAgICBpZiAoICFldmV4LmJyICkKCk9uIHRo
ZSBzdWJqZWN0IG9mIGluZWxpZ2liaWxpdHkgb2YgdGhlIGNvZGUsIHdoYXQgYWJvdXQgI2RlZmlu
ZSBzYWUgYnIgPwoKVGhhdCB3YXksIHRoaXMgd291bGQgcmVhZCAiaWYgKCAhZXZleC5zYWUgKSBj
aGVja192bGVuKCkiCgp+QW5kcmV3Cgo+ICsgICAgICAgICAgICBhdng1MTJfdmxlbl9jaGVjayh0
cnVlKTsKPiAgICAgICAgICBnZXRfZnB1KFg4NkVNVUxfRlBVX3ptbSk7Cj4gIAo+ICAgICAgICAg
IG9wYyA9IGluaXRfZXZleChzdHViKTsKPgo+CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3hlbi1kZXZlbA==
