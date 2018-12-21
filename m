From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Subject: Re: [PATCH 03/15] x86/cpu/vpmu: Add Hygon Dhyana
 support for vPMU
Date: Fri, 21 Dec 2018 08:33:24 -0500
Message-ID: <6b6fd6a1-831f-c2ac-183c-049bc01a7546@oracle.com>
References: <cover.1545284932.git.puwen@hygon.cn>
 <717bb961700ecc2ebb9d3c424f2f0fea3bb71d00.1545284932.git.puwen@hygon.cn>
 <7c064b6e-b7c6-3a7a-b6d0-6842d12cea7f@oracle.com>
 <b5a31e1c-11f6-7073-cd26-0ee021d56d82@hygon.cn>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=XD92=O6=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
 id 1gaKwM-0003oR-Vl
 for xen-devel@lists.xenproject.org; Fri, 21 Dec 2018 13:34:11 +0000
In-Reply-To: <b5a31e1c-11f6-7073-cd26-0ee021d56d82@hygon.cn>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Pu Wen <puwen@hygon.cn>, "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Wei Liu <wei.liu2@citrix.com>, Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>, Brian Woods <brian.woods@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMTIvMjEvMTggNTowMiBBTSwgUHUgV2VuIHdyb3RlOgo+IE9uIDIwMTgvMTIvMjAgMjI6MjUs
IEJvcmlzIE9zdHJvdnNreSB3cm90ZToKPiAuLi4KPj4+IGRpZmYgLS1naXQgYS94ZW4vYXJjaC94
ODYvY3B1L3ZwbXVfYW1kLmMgYi94ZW4vYXJjaC94ODYvY3B1L3ZwbXVfYW1kLmMKPj4+IGluZGV4
IDVlZmMzOWIuLmU5ZjBhNWMgMTAwNjQ0Cj4+PiAtLS0gYS94ZW4vYXJjaC94ODYvY3B1L3ZwbXVf
YW1kLmMKPj4+ICsrKyBiL3hlbi9hcmNoL3g4Ni9jcHUvdnBtdV9hbWQuYwo+Pj4gQEAgLTU1NCw2
ICs1NTQsOCBAQCBpbnQgX19pbml0IGFtZF92cG11X2luaXQodm9pZCkKPj4+ICAgICAgIGNhc2Ug
MHgxMjoKPj4+ICAgICAgIGNhc2UgMHgxNDoKPj4+ICAgICAgIGNhc2UgMHgxNjoKPj4+ICsgICAg
Y2FzZSAweDE3Ogo+Pj4gKyAgICBjYXNlIDB4MTg6Cj4+Cj4+IFRoaXMgYWxzbyBlbmFibGVzIFZQ
TVUgc3VwcG9ydCBmb3IgWmVuIHdoaWNoIGdvZXMgYmV5b25kIHdoYXQgdGhlCj4+IGNvbW1pdCBt
ZXNzYWdlIGNsYWltcyB0byBkby4KPiBTb3JyeSBmb3IgdGhlIG5vdCBjbGVhciBjb21taXQgbWVz
c2FnZS4gV2lsbCBhZGQgbW9kaWZpY2F0aW9uIGRlc2NyaXB0aW9uCj4gaW4gdGhlIGNvbW1pdCBt
ZXNzYWdlIGFuZCBtYWtlIHRoZSBjaGFuZ2VzIGNvbXBsZXRlLgo+Cj4gT24gdGhlIG90aGVyIGhh
bmQsIHNpbmNlIGN1cnJlbnQgWGVuIHZQTVUgc3RpbGwgbm90IHN1cHBvcnQgWmVuLiBzbyBpbgo+
IHRoaXMgcGF0Y2ggd2UgZW5hYmxlIDB4MTcgc3VwcG9ydC4gSWYgdGhpcyBtb2RpZmljYXRpb24g
aXMgbm90IHByZWZlcnJlZCwKPiB3aWxsIHJlbW92ZSBBTUQgWGVuIDB4MTcgc3VwcG9ydCBpbiBu
ZXh0IHZlcnNpb24uCgpFbmFibGluZyAweDE3IHNob3VsZCBiZSBmaW5lLCBJIGp1c3QgdGhvdWdo
dCBjb21taXQgbWVzc2FnZSBzaG91bGQgYmUKZXhwbGljaXQgYWJvdXQgdGhhdC4KCgo+PiBBbHNv
LCB3aHkgYXJlIHlvdSBjaG9vc2luZyB0byB1c2UgbGVnYWN5IE1TUnMgKGFuZCB5b3UgZGlkIHRo
ZSBzYW1lIGluCj4+IExpbnV4KT8gRG9lc24ndCBaZW4gKHdoaWNoIHlvdSBhcmUgc2F5aW5nIGlz
IHNpbWlsYXIgdG8gSHlnb24pIHN1cHBvcnQKPj4gYzAwMV8wMjBYIGJhbms/Cj4gSW4gTGludXgs
IHRoZSBYZW4gUE1VIGRyaXZlciB1c2UgdGhlIGRlZmF1bHQgYnJhbmNoIGNhc2VzLCB3aGljaCBh
bHNvIHVzZQo+IHRoZSBsZWdhY3kgTVNScyB3YXkuIFNvIHdlIGNob29zZSB0byBmb2xsb3cgbGVn
YWN5IE1TUnMgaGVyZSBpbiBEaHlhbmEKPiBjYXNlcy4KPgo+IFNpbmNlIGJvdGggb2YgWmVuIGFu
ZCBEaHlhbmEgc3VwcG9ydCBDMDAxXzAyMFggTVNScy4gSWYgdXNlIHRoZSBDMDAxXzAyMFgKPiBp
cyBwcmVmZXJyZWQsIHdlIHdpbGwgdHJ5IHRvIG1vZGlmeSB0aGUgcmVsYXRlZCBjb2RlcyBhbmQg
Y3JlYXRlIGEgcGF0Y2guCgoKSSBkb24ndCBoYXZlIGEgWmVuIGJveCBhdmFpbGFibGUgcmlnaHQg
bm93IGJ1dCBmcm9tIHdoYXQgSSBjYW4gc2VlIDB4MTcKY291bnRlcnMgYXJlIGNvbXBhdGlibGUg
d2l0aCAweDE1IHNvIEkgdGhpbmsgc3dpdGNoaW5nIHRvIEMwMDFfMDIwWApzaG91bGQgd29yay4g
QW5kIGxvb2tzIGxpa2UgeW91IGFyZSB1c2luZyB0aG9zZSBpbiBMaW51eCAobm9uLVhlbiBwYXJ0
KSB0b28uCgoKPiBBbHNvIHRoZSBMaW51eCBYZW4gUE1VIGRyaXZlciBtYXkgbmVlZCB0byBiZSB1
cGRhdGVkIHRvIHVzZSB0aGVzZSBNU1JzLgoKWWVzLCBhbHRob3VnaCBMaW51eCBwYXJ0IGlzIHVz
ZWQgb25seSBieSBQViBndWVzdHMuCgotYm9yaXMKCgotYm9yaXMKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcv
bWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
