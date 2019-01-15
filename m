From: Pu Wen <puwen@hygon.cn>
Subject: Re: [PATCH 03/15] x86/cpu/vpmu: Add Hygon Dhyana
 support for vPMU
Date: Wed, 16 Jan 2019 00:22:12 +0800
Message-ID: <f43290cb-daa9-f9d1-31f2-684e94e6f0ab@hygon.cn>
References: <cover.1545284932.git.puwen@hygon.cn>
 <717bb961700ecc2ebb9d3c424f2f0fea3bb71d00.1545284932.git.puwen@hygon.cn>
 <5C3CB2EC020000780020D68E@prv1-mh.provo.novell.com>
 <b7a0d3ee-aefd-2917-bcd3-a8fac9c773c5@hygon.cn>
 <5C3DD9B4020000780020DD82@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=N85w=PX=hygon.cn=puwen@srs-us1.protection.inumbo.net>)
 id 1gjRZB-0003z6-SF
 for xen-devel@lists.xenproject.org; Tue, 15 Jan 2019 16:27:53 +0000
In-Reply-To: <5C3DD9B4020000780020DD82@prv1-mh.provo.novell.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Wei Liu <wei.liu2@citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>, xen-devel <xen-devel@lists.xenproject.org>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Brian Woods <brian.woods@amd.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMjAxOS8xLzE1IDIxOjAyLCBKYW4gQmV1bGljaCB3cm90ZToKPj4+PiBPbiAxNS4wMS4xOSBh
dCAxMzo0OSwgPHB1d2VuQGh5Z29uLmNuPiB3cm90ZToKPj4gT24gMjAxOS8xLzE1IDA6NDcsIEph
biBCZXVsaWNoIHdyb3RlOgo+Pj4+Pj4gT24gMjAuMTIuMTggYXQgMTQ6MTIsIDxwdXdlbkBoeWdv
bi5jbj4gd3JvdGU6Cj4+Pj4gLS0tIGEveGVuL2FyY2gveDg2L2NwdS92cG11LmMKPj4+PiArKysg
Yi94ZW4vYXJjaC94ODYvY3B1L3ZwbXUuYwo+Pj4+IEBAIC00NzMsNiArNDczLDcgQEAgc3RhdGlj
IGludCB2cG11X2FyY2hfaW5pdGlhbGlzZShzdHJ1Y3QgdmNwdSAqdikKPj4+PiAgICAKPj4+PiAg
ICAgICAgc3dpdGNoICggdmVuZG9yICkKPj4+PiAgICAgICAgewo+Pj4+ICsgICAgY2FzZSBYODZf
VkVORE9SX0hZR09OOgo+Pj4+ICAgICAgICBjYXNlIFg4Nl9WRU5ET1JfQU1EOgo+Pj4+ICAgICAg
ICAgICAgcmV0ID0gc3ZtX3ZwbXVfaW5pdGlhbGlzZSh2KTsKPj4+PiAgICAgICAgICAgIGJyZWFr
Owo+Pj4+IEBAIC04OTAsNiArODkxLDcgQEAgc3RhdGljIGludCBfX2luaXQgdnBtdV9pbml0KHZv
aWQpCj4+Pj4gICAgCj4+Pj4gICAgICAgIHN3aXRjaCAoIHZlbmRvciApCj4+Pj4gICAgICAgIHsK
Pj4+PiArICAgIGNhc2UgWDg2X1ZFTkRPUl9IWUdPTjoKPj4+PiAgICAgICAgY2FzZSBYODZfVkVO
RE9SX0FNRDoKPj4+PiAgICAgICAgICAgIGlmICggYW1kX3ZwbXVfaW5pdCgpICkKPj4+PiAgICAg
ICAgICAgICAgIHZwbXVfbW9kZSA9IFhFTlBNVV9NT0RFX09GRjsKPj4+Cj4+PiBIZXJlIGFuZCBl
dmVyeXdoZXJlIGVsc2UsIG1heSBJIGFzayB0aGF0IHlvdSBkbyB5b3VyIGluc2VydGlvbnMKPj4+
IGJlbG93IHRoZSByZXNwZWN0aXZlIEFNRCBvbmVzIGluc3RlYWQgb2YgYWJvdmU/Cj4+Cj4+IElu
IGFsbCB0aGUgc3dpdGNoIGNhc2VzLCBpZiBIeWdvbiBkaXJlY3RseSBmb2xsb3dlZCBBTUQncyBj
YXNlcywgdGhlCj4+IGluc2VydGlvbnMgYXJlIHBsYWNlZCBhYm92ZSB0aGUgcmVzcGVjdGl2ZSBB
TUQgb25lcy4KPiAKPiBBcyBzYWlkIC0gcGxlYXNlIGRvbid0LCBpbnNlcnQgdGhlIG5ldyBvbmVz
IGFmdGVyIEFNRCdzLgoKT0suIFdpbGwgaW5zZXJ0IHRoZSBuZXcgb25lcyBhZnRlciBBTUQncyBp
biBuZXh0IHZlcnNpb24gcGF0Y2ggc2V0LgoKLS0gClJlZ2FyZHMsClB1IFdlbgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcg
bGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9q
ZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
