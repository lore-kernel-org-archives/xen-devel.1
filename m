From: Julien Grall <julien.grall@arm.com>
Subject: Re: [PATCH 1/4] xen/arm: gic: Ensure we have an ISB
 between ack and do_IRQ()
Date: Mon, 3 Dec 2018 13:10:38 +0000
Message-ID: <aac48194-0c66-10b6-e283-c6b273b3ba4c@arm.com>
References: <20181023181709.11883-1-julien.grall@arm.com>
 <22f7ebc8-c74b-0d8e-4847-9d3df9bcf5db@arm.com>
 <3622e468-8f44-1e31-138f-db58ca3835ff@epam.com>
 <2090f5b4-22ff-38bc-3d47-6dbb6d7fccfb@epam.com>
 <6d1c980b-b316-f634-7793-0aca4b34aa85@arm.com>
 <VI1PR0302MB26882FD1B2445807F8C2B026E6C60@VI1PR0302MB2688.eurprd03.prod.outlook.com>
 <5ad76791-075d-e588-2669-e01c79674f0d@gmail.com>
 <CAF3u54CmW32NwN0q73LaXwnj2wUt72uuq9LGPRQ3RNMzZTV==Q@mail.gmail.com>
 <d260c074-6107-a5d1-94c8-fdb019585135@gmail.com>
 <4ceea0f6-ede1-420a-d3b7-80c4584739ce@arm.com>
 <2199be43-ef12-28c3-4dcb-cac404be1e4d@gmail.com>
 <20181122180401.0f1d21a0@donnerap.cambridge.arm.com>
 <969c7156-162b-09b0-f328-03dadee06461@gmail.com>
 <9a5c5731-50fe-76ca-354a-3eb05fba41e6@arm.com>
 <bad74dba-41d1-2f16-9542-ad8431793886@gmail.com>
 <cafe59b5-acfd-7899-f2d6-60c39f47a992@arm.com>
 <88f3cf3a-1f1f-2217-9926-375b3ad62ab4@gmail.com>
 <e3c48fd4-12ae-bada-07b2-85b8ee674c41@arm.com>
 <8bf0e104-fd52-b5dc-003d-6dd9840ecc95@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <8bf0e104-fd52-b5dc-003d-6dd9840ecc95@gmail.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrii Anisov <andrii.anisov@gmail.com>, Andre Przywara <andre.przywara@arm.com>
Cc: Julien Grall <julien.grall@gmail.com>, Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>, "sstabellini@kernel.org" <sstabellini@kernel.org>, Andrii Anisov <Andrii_Anisov@epam.com>, "xen-devel@lists.xen.org" <xen-devel@lists.xen.org>
List-Id: xen-devel@lists.xenproject.org

SGkgQW5kcmlpLAoKT24gMDMvMTIvMjAxOCAxMjo1OCwgQW5kcmlpIEFuaXNvdiB3cm90ZToKPiAK
PiBPbiAwMy4xMi4xOCAxNDoxNywgSnVsaWVuIEdyYWxsIHdyb3RlOgo+PiBOby4gSSBtZWFudCB0
aGF0IEkgd291bGQgYmUgaGFwcHkgd2l0aCB0aGF0IGFuZCBJIHRoaW5rIHNob3VsZCBhbHNvIHN1
aXQgeW91Lgo+IEdyZWF0IQo+IAo+PiBUaGVyZSBhcmUgbm8gaXNiKCkgaW4gZG9fdHJhcF9pcnEo
KS4gU28gZGlkIHlvdSBtZWFuIGdpY19pbnRlcnJ1cHQoKT8KPiBSaWdodCB5b3UgYXJlLgo+IAo+
PiBCdXQgdGhlbiwgSSBhbSBub3Qgc3VyZSB3aHkgeW91IHdhbnQgdG8gYXZvaWQgdGhlIGlzYigp
IGluIHRoZSBndWVzdCBwYXRoLgo+IFdlbGwsIGFzIEkgcmVtZW1iZXIsIGFuZCB0aGUgY29tbWl0
IG1lc3NhZ2Ugc2F5cywgaXQgaXMgbmVlZGVkIHRvIGdldCBwZXJpcGhlcmFsIAo+IHJlZ2lzdGVy
IHRvIGJlIHVwZGF0ZWQgYmVmb3JlIGludGVycnVwdCBoYW5kbGVyIHJlYWRzIHRoZW0gZm9yIGlu
dGVycnVwdCAKPiBoYW5kbGluZyA6KQo+IEFib3V0IGd1ZXN0IGlycXMsIHdlLCBhY3R1YWxseSwg
ZG8gbm90IGhhbmRsZSB0aGVtLCBqdXN0IHJpc2UgYSBub3RpZmljYXRpb24gdG8gCj4gZ3Vlc3Qg
dGhhdCBpdCBuZWVkcyBoYW5kbGluZy4gVGh1cyB0aGF0IHN5bmNocm9uaXphdGlvbiBpcyBub3Qg
cmVxdWlyZWQgaW4gYSAKPiBndWVzdCBpbnRlcnJ1cHQgcHJvY2Vzc2luZyBwYXRoLgoKUG9zc2li
bHksIGJ1dCBJIHdvdWxkIHByZWZlciB0byBrZWVwIHRoZSBpc2IoKSBpbiB0aGUgY3VycmVudCBw
b3NpdGlvbi4gSXQgCmNhdGNoZXMgYWxsIHRoZSBoYW5kbGVycyBzbyBsZXNzIHJpc2sgZm9yIG1p
c3NpbmcgdGhlIGlzYigpIGluIHRoZSBmdXR1cmUuIERvIAp5b3Ugc2VlIGFueSBwZXJmb3JtYW5j
ZSBkcm9wPwoKQ2hlZXJzLAoKLS0gCkp1bGllbiBHcmFsbAoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
