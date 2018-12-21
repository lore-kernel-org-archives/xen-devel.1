From: Pu Wen <puwen@hygon.cn>
Subject: Re: [PATCH 03/15] x86/cpu/vpmu: Add Hygon Dhyana
 support for vPMU
Date: Fri, 21 Dec 2018 18:02:23 +0800
Message-ID: <b5a31e1c-11f6-7073-cd26-0ee021d56d82@hygon.cn>
References: <cover.1545284932.git.puwen@hygon.cn>
 <717bb961700ecc2ebb9d3c424f2f0fea3bb71d00.1545284932.git.puwen@hygon.cn>
 <7c064b6e-b7c6-3a7a-b6d0-6842d12cea7f@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=8j5l=O6=hygon.cn=puwen@srs-us1.protection.inumbo.net>)
 id 1gaHiJ-0007QZ-L1
 for xen-devel@lists.xenproject.org; Fri, 21 Dec 2018 10:07:27 +0000
In-Reply-To: <7c064b6e-b7c6-3a7a-b6d0-6842d12cea7f@oracle.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Boris Ostrovsky <boris.ostrovsky@oracle.com>, "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Wei Liu <wei.liu2@citrix.com>, Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>, Brian Woods <brian.woods@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMjAxOC8xMi8yMCAyMjoyNSwgQm9yaXMgT3N0cm92c2t5IHdyb3RlOgouLi4KPj4gZGlmZiAt
LWdpdCBhL3hlbi9hcmNoL3g4Ni9jcHUvdnBtdV9hbWQuYyBiL3hlbi9hcmNoL3g4Ni9jcHUvdnBt
dV9hbWQuYwo+PiBpbmRleCA1ZWZjMzliLi5lOWYwYTVjIDEwMDY0NAo+PiAtLS0gYS94ZW4vYXJj
aC94ODYvY3B1L3ZwbXVfYW1kLmMKPj4gKysrIGIveGVuL2FyY2gveDg2L2NwdS92cG11X2FtZC5j
Cj4+IEBAIC01NTQsNiArNTU0LDggQEAgaW50IF9faW5pdCBhbWRfdnBtdV9pbml0KHZvaWQpCj4+
ICAgICAgIGNhc2UgMHgxMjoKPj4gICAgICAgY2FzZSAweDE0Ogo+PiAgICAgICBjYXNlIDB4MTY6
Cj4+ICsgICAgY2FzZSAweDE3Ogo+PiArICAgIGNhc2UgMHgxODoKPgo+Cj4gVGhpcyBhbHNvIGVu
YWJsZXMgVlBNVSBzdXBwb3J0IGZvciBaZW4gd2hpY2ggZ29lcyBiZXlvbmQgd2hhdCB0aGUKPiBj
b21taXQgbWVzc2FnZSBjbGFpbXMgdG8gZG8uCgpTb3JyeSBmb3IgdGhlIG5vdCBjbGVhciBjb21t
aXQgbWVzc2FnZS4gV2lsbCBhZGQgbW9kaWZpY2F0aW9uIGRlc2NyaXB0aW9uCmluIHRoZSBjb21t
aXQgbWVzc2FnZSBhbmQgbWFrZSB0aGUgY2hhbmdlcyBjb21wbGV0ZS4KCk9uIHRoZSBvdGhlciBo
YW5kLCBzaW5jZSBjdXJyZW50IFhlbiB2UE1VIHN0aWxsIG5vdCBzdXBwb3J0IFplbi4gc28gaW4K
dGhpcyBwYXRjaCB3ZSBlbmFibGUgMHgxNyBzdXBwb3J0LiBJZiB0aGlzIG1vZGlmaWNhdGlvbiBp
cyBub3QgcHJlZmVycmVkLAp3aWxsIHJlbW92ZSBBTUQgWGVuIDB4MTcgc3VwcG9ydCBpbiBuZXh0
IHZlcnNpb24uCgo+Cj4gQWxzbywgd2h5IGFyZSB5b3UgY2hvb3NpbmcgdG8gdXNlIGxlZ2FjeSBN
U1JzIChhbmQgeW91IGRpZCB0aGUgc2FtZSBpbgo+IExpbnV4KT8gRG9lc24ndCBaZW4gKHdoaWNo
IHlvdSBhcmUgc2F5aW5nIGlzIHNpbWlsYXIgdG8gSHlnb24pIHN1cHBvcnQKPiBjMDAxXzAyMFgg
YmFuaz8KCkluIExpbnV4LCB0aGUgWGVuIFBNVSBkcml2ZXIgdXNlIHRoZSBkZWZhdWx0IGJyYW5j
aCBjYXNlcywgd2hpY2ggYWxzbyB1c2UKdGhlIGxlZ2FjeSBNU1JzIHdheS4gU28gd2UgY2hvb3Nl
IHRvIGZvbGxvdyBsZWdhY3kgTVNScyBoZXJlIGluIERoeWFuYQpjYXNlcy4KClNpbmNlIGJvdGgg
b2YgWmVuIGFuZCBEaHlhbmEgc3VwcG9ydCBDMDAxXzAyMFggTVNScy4gSWYgdXNlIHRoZSBDMDAx
XzAyMFgKaXMgcHJlZmVycmVkLCB3ZSB3aWxsIHRyeSB0byBtb2RpZnkgdGhlIHJlbGF0ZWQgY29k
ZXMgYW5kIGNyZWF0ZSBhIHBhdGNoLgpBbHNvIHRoZSBMaW51eCBYZW4gUE1VIGRyaXZlciBtYXkg
bmVlZCB0byBiZSB1cGRhdGVkIHRvIHVzZSB0aGVzZSBNU1JzLgoKLS0gClJlZ2FyZHMsClB1IFdl
bgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRl
dmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
