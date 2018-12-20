From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Subject: Re: [PATCH 03/15] x86/cpu/vpmu: Add Hygon Dhyana
 support for vPMU
Date: Thu, 20 Dec 2018 09:24:27 -0500
Message-ID: <7c064b6e-b7c6-3a7a-b6d0-6842d12cea7f@oracle.com>
References: <cover.1545284932.git.puwen@hygon.cn>
 <717bb961700ecc2ebb9d3c424f2f0fea3bb71d00.1545284932.git.puwen@hygon.cn>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=XYju=O5=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
 id 1gZzGL-0001jx-Jl
 for xen-devel@lists.xenproject.org; Thu, 20 Dec 2018 14:25:21 +0000
In-Reply-To: <717bb961700ecc2ebb9d3c424f2f0fea3bb71d00.1545284932.git.puwen@hygon.cn>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Pu Wen <puwen@hygon.cn>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wei.liu2@citrix.com>, Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>, Brian Woods <brian.woods@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMTIvMjAvMTggODoxMiBBTSwgUHUgV2VuIHdyb3RlOgo+IFRoZSBQTVUgYXJjaGl0ZWN0dXJl
IGZvciB0aGUgSHlnb24gRGh5YW5hIENQVSBpcyBzaW1pbGFyIHRvIHRoZSBBTUQKPiBmYW1pbHkg
MTdoIG9uZS4gVG8gc3VwcG9ydCBpdCwgYWRkIEh5Z29uIERoeWFuYSBzdXBwb3J0IGluIHRoZSBz
aW1pbGFyCj4gd2F5IGFzIEFNRCBkb2VzLgo+Cj4gU2lnbmVkLW9mZi1ieTogUHUgV2VuIDxwdXdl
bkBoeWdvbi5jbj4KPiAtLS0KPiAgeGVuL2FyY2gveDg2L2NwdS92cG11LmMgICAgIHwgMiArKwo+
ICB4ZW4vYXJjaC94ODYvY3B1L3ZwbXVfYW1kLmMgfCAyICsrCj4gIDIgZmlsZXMgY2hhbmdlZCwg
NCBpbnNlcnRpb25zKCspCj4KPiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L2NwdS92cG11LmMg
Yi94ZW4vYXJjaC94ODYvY3B1L3ZwbXUuYwo+IGluZGV4IDhhNGY3NTMuLmFmZDM2MDcgMTAwNjQ0
Cj4gLS0tIGEveGVuL2FyY2gveDg2L2NwdS92cG11LmMKPiArKysgYi94ZW4vYXJjaC94ODYvY3B1
L3ZwbXUuYwo+IEBAIC00NzMsNiArNDczLDcgQEAgc3RhdGljIGludCB2cG11X2FyY2hfaW5pdGlh
bGlzZShzdHJ1Y3QgdmNwdSAqdikKPiAgCj4gICAgICBzd2l0Y2ggKCB2ZW5kb3IgKQo+ICAgICAg
ewo+ICsgICAgY2FzZSBYODZfVkVORE9SX0hZR09OOgo+ICAgICAgY2FzZSBYODZfVkVORE9SX0FN
RDoKPiAgICAgICAgICByZXQgPSBzdm1fdnBtdV9pbml0aWFsaXNlKHYpOwo+ICAgICAgICAgIGJy
ZWFrOwo+IEBAIC04OTAsNiArODkxLDcgQEAgc3RhdGljIGludCBfX2luaXQgdnBtdV9pbml0KHZv
aWQpCj4gIAo+ICAgICAgc3dpdGNoICggdmVuZG9yICkKPiAgICAgIHsKPiArICAgIGNhc2UgWDg2
X1ZFTkRPUl9IWUdPTjoKPiAgICAgIGNhc2UgWDg2X1ZFTkRPUl9BTUQ6Cj4gICAgICAgICAgaWYg
KCBhbWRfdnBtdV9pbml0KCkgKQo+ICAgICAgICAgICAgIHZwbXVfbW9kZSA9IFhFTlBNVV9NT0RF
X09GRjsKPiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L2NwdS92cG11X2FtZC5jIGIveGVuL2Fy
Y2gveDg2L2NwdS92cG11X2FtZC5jCj4gaW5kZXggNWVmYzM5Yi4uZTlmMGE1YyAxMDA2NDQKPiAt
LS0gYS94ZW4vYXJjaC94ODYvY3B1L3ZwbXVfYW1kLmMKPiArKysgYi94ZW4vYXJjaC94ODYvY3B1
L3ZwbXVfYW1kLmMKPiBAQCAtNTU0LDYgKzU1NCw4IEBAIGludCBfX2luaXQgYW1kX3ZwbXVfaW5p
dCh2b2lkKQo+ICAgICAgY2FzZSAweDEyOgo+ICAgICAgY2FzZSAweDE0Ogo+ICAgICAgY2FzZSAw
eDE2Ogo+ICsgICAgY2FzZSAweDE3Ogo+ICsgICAgY2FzZSAweDE4OgoKClRoaXMgYWxzbyBlbmFi
bGVzIFZQTVUgc3VwcG9ydCBmb3IgWmVuIHdoaWNoIGdvZXMgYmV5b25kIHdoYXQgdGhlCmNvbW1p
dCBtZXNzYWdlIGNsYWltcyB0byBkby4KCkFsc28sIHdoeSBhcmUgeW91IGNob29zaW5nIHRvIHVz
ZSBsZWdhY3kgTVNScyAoYW5kIHlvdSBkaWQgdGhlIHNhbWUgaW4KTGludXgpPyBEb2Vzbid0IFpl
biAod2hpY2ggeW91IGFyZSBzYXlpbmcgaXMgc2ltaWxhciB0byBIeWdvbikgc3VwcG9ydApjMDAx
XzAyMFggYmFuaz8KCi1ib3JpcwoKPiAgICAgICAgICBudW1fY291bnRlcnMgPSBGMTBIX05VTV9D
T1VOVEVSUzsKPiAgICAgICAgICBjb3VudGVycyA9IEFNRF9GMTBIX0NPVU5URVJTOwo+ICAgICAg
ICAgIGN0cmxzID0gQU1EX0YxMEhfQ1RSTFM7CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3hlbi1kZXZlbA==
