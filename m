From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH RFC v1 41/74] xen/pvh: do not mark the low
 1MB as IO mem
Date: Mon, 08 Jan 2018 03:30:17 -0700
Message-ID: <5A535649020000780019C0C7@prv-mh.provo.novell.com>
References: <20180104130625.28605-1-wei.liu2@citrix.com>
 <20180104130625.28605-42-wei.liu2@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2)
 (envelope-from <srs0=dk2s=ed=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1eYUhD-0000Dk-49
 for xen-devel@lists.xenproject.org; Mon, 08 Jan 2018 10:30:23 +0000
In-Reply-To: <20180104130625.28605-42-wei.liu2@citrix.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>, Roger Pau Monne <roger.pau@citrix.com>, wei.liu2@citrix.com
Cc: Xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDA0LjAxLjE4IGF0IDE0OjA1LCA8d2VpLmxpdTJAY2l0cml4LmNvbT4gd3JvdGU6Cj4g
QEAgLTI4OCw4ICsyODksMTIgQEAgdm9pZCBfX2luaXQgYXJjaF9pbml0X21lbW9yeSh2b2lkKQo+
ICAgICAgZG9tX2NvdyA9IGRvbWFpbl9jcmVhdGUoRE9NSURfQ09XLCBET01DUkZfZHVtbXksIDAs
IE5VTEwpOwo+ICAgICAgQlVHX09OKElTX0VSUihkb21fY293KSk7Cj4gIAo+IC0gICAgLyogRmly
c3QgMU1CIG9mIFJBTSBpcyBoaXN0b3JpY2FsbHkgbWFya2VkIGFzIEkvTy4gKi8KPiAtICAgIGZv
ciAoIGkgPSAwOyBpIDwgMHgxMDA7IGkrKyApCj4gKyAgICAvKgo+ICsgICAgICogRmlyc3QgMU1C
IG9mIFJBTSBpcyBoaXN0b3JpY2FsbHkgbWFya2VkIGFzIEkvTy4gIElmIHdlIGJvb3RlZCBQVkgs
Cj4gKyAgICAgKiByZWNsYWltIHRoZSBzcGFjZS4gIElycmVzcGVjdGl2ZSwgbGVhdmUgTUZOIDAg
YXMgc3BlY2lhbCBmb3IgdGhlIHNha2UKPiArICAgICAqIG9mIDAgYmVpbmcgYSB2ZXJ5IGNvbW1v
biBkZWZhdWx0IHZhbHVlLgo+ICsgICAgICovCj4gKyAgICBmb3IgKCBpID0gMDsgaSA8IChwdmhf
Ym9vdCA/IDEgOiAweDEwMCk7IGkrKyApCj4gICAgICAgICAgc2hhcmVfeGVuX3BhZ2Vfd2l0aF9n
dWVzdChtZm5fdG9fcGFnZShfbWZuKGkpKSwKPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIGRvbV9pbywgWEVOU0hBUkVfd3JpdGFibGUpOwoKSSBjYW4gc2VlIHRoaXMgYmVpbmcg
dmFsaWQgYXMgbG9uZyBhcyB0aGVyZSdzIG5vIGZpcm13YXJlLiBXaGF0CmRvZXNuJ3QgYmVjb21l
IGNsZWFyIGZyb20gbmVpdGhlciB0aGUgZGVzY3JpcHRpb24gbm9yIHRoZQpjb21tZW50IGlzIHdo
ZXRoZXIgdGhpcyBpcyBhIG5lY2Vzc2FyeSBjaGFuZ2UsIG9yIGp1c3QgYW4Kb3B0aW1pemF0aW9u
IHRvIGF2b2lkIHdhc3RpbmcgdGhlc2UgMjU1IHBhZ2VzLgoKSmFuCgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApY
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
