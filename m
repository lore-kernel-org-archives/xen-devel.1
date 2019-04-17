From: Julien Grall <julien.grall@arm.com>
Subject: Re: [PATCH for-next 8/9] xen: Introduce HAS_M2P config
 and use to protect mfn_to_gmfn call
Date: Wed, 17 Apr 2019 18:42:47 +0100
Message-ID: <fefbf936-c28d-8ae9-0560-8c0b0d6bc75a@arm.com>
References: <20190218113600.9540-1-julien.grall@arm.com>
 <20190218113600.9540-9-julien.grall@arm.com>
 <5C891FA4020000780021E3A0@prv1-mh.provo.novell.com>
 <5b02c8e1-5ff6-a1a1-e1dd-650123d66006@arm.com>
 <5C8A0903020000780021E662@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Uj5y=ST=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hGoaC-0002wJ-67
 for xen-devel@lists.xenproject.org; Wed, 17 Apr 2019 17:42:52 +0000
In-Reply-To: <5C8A0903020000780021E662@prv1-mh.provo.novell.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>, Wei Liu <wei.liu2@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, "andrii_anisov@epam.com" <andrii_anisov@epam.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Tim Deegan <tim@xen.org>, oleksandr_tyshchenko@epam.com, xen-devel <xen-devel@lists.xenproject.org>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

SGksCgpAV2VpLCBASWFuOiBEbyB5b3UgaGF2ZSBhbnkgaW5wdXQ/CgpPbiAxNC8wMy8yMDE5IDA3
OjU1LCBKYW4gQmV1bGljaCB3cm90ZToKPj4+PiBPbiAxMy4wMy4xOSBhdCAxODozMCwgPGp1bGll
bi5ncmFsbEBhcm0uY29tPiB3cm90ZToKPj4gT24gMTMvMDMvMjAxOSAxNToyMCwgSmFuIEJldWxp
Y2ggd3JvdGU6Cj4+Pj4+PiBPbiAxOC4wMi4xOSBhdCAxMjozNSwgPGp1bGllbi5ncmFsbEBhcm0u
Y29tPiB3cm90ZToKPj4+PiAtLS0gYS94ZW4vY29tbW9uL2RvbWN0bC5jCj4+Pj4gKysrIGIveGVu
L2NvbW1vbi9kb21jdGwuYwo+Pj4+IEBAIC0yMDUsNyArMjA1LDcgQEAgdm9pZCBnZXRkb21haW5p
bmZvKHN0cnVjdCBkb21haW4gKmQsIHN0cnVjdAo+PiB4ZW5fZG9tY3RsX2dldGRvbWFpbmluZm8g
KmluZm8pCj4+Pj4gICAgICAgIGluZm8tPm91dHN0YW5kaW5nX3BhZ2VzID0gZC0+b3V0c3RhbmRp
bmdfcGFnZXM7Cj4+Pj4gICAgICAgIGluZm8tPnNocl9wYWdlcyAgICAgICAgID0gYXRvbWljX3Jl
YWQoJmQtPnNocl9wYWdlcyk7Cj4+Pj4gICAgICAgIGluZm8tPnBhZ2VkX3BhZ2VzICAgICAgID0g
YXRvbWljX3JlYWQoJmQtPnBhZ2VkX3BhZ2VzKTsKPj4+PiAtICAgIGluZm8tPnNoYXJlZF9pbmZv
X2ZyYW1lID0gbWZuX3RvX2dtZm4oZCwgdmlydF90b19tZm4oZC0+c2hhcmVkX2luZm8pKTsKPj4+
PiArICAgIGluZm8tPnNoYXJlZF9pbmZvX2ZyYW1lID0gZ2ZuX3goZG9tYWluX3NoYXJlZF9pbmZv
X2dmbihkKSk7Cj4+Pgo+Pj4gSSB0aGluayB0aGlzIGNoYW5nZSB3YW50cyB0byBiZSBhY2NvbXBh
bmllZCBieSBhIHdhcm5pbmcgYXR0YWNoZWQKPj4+IHRvIHRoZSBmaWVsZCBkZWNsYXJhdGlvbiBp
biB0aGUgcHVibGljIGhlYWRlci4KPj4KPj4gTWFrZSBzZW5zZS4KPj4KPj4+Cj4+PiBCdXQgSSdk
IGFsc28gbGlrZSB0byBoYXZlIHRoZSB0b29sIHN0YWNrIG1haW50YWluZXJzJyB2aWV3IG9uIG1h
a2luZwo+Pj4gdGhpcyBmaWVsZCBlZmZlY3RpdmVseSB1bnVzYWJsZSBmb3IgQXJtLgo+Pgo+PiBU
aGUgdmFsdWUgaW4gc2hhcmVkX2luZm9fZnJhbWUgd2FzIHBsYWluIHdyb25nIHNpbmNlIHRoZSBj
cmVhdGlvbiBvZiBYZW4gQXJtLiBTbwo+PiB0aGlzIGlzIGp1c3QgbWFraW5nIHRoZSBlcnJvciBt
b3JlIG9idmlvdXMuIEkgZG9uJ3QgZXhwZWN0IGFueSB1c2VyIG9mIGl0IG9uIEFybS4KPiAKPiBX
ZWxsLCBteSByZXF1ZXN0IGZvciB0b29sIHN0YWNrIG1haW50YWluZXIgaW5wdXQgd2Fzbid0IHRv
IHB1dCB1bmRlcgo+IHF1ZXN0aW9uIHRoYXQgdGhlIGZpZWxkIGNhbid0IGN1cnJlbnRseSBiZSB1
c2VkIHNlbnNpYmx5IG9uIEFybS4KPiBJbnN0ZWFkIEknbSBtZWFuaW5nIHRvIGtub3cgd2hldGhl
ciBpdCBjYW4gYmUgc2Vuc2libHkgZXhwZWN0ZWQKPiBmb3IgdGhlIHRvb2wgc3RhY2sgdG8gd2Fu
dCB0byB1c2UgdGhlIGZpZWxkIHVuaWZvcm1seSwgaW4gd2hpY2ggY2FzZQo+IHJhdGhlciB0aGFu
IG1ha2luZyBpdCBtb3JlIG9idmlvdXNseSBub3Qgd29yayBpdCBzaG91bGQgYmUgZml4ZWQKPiBp
bnN0ZWFkLgo+IAo+IEphbgo+IAo+IAoKLS0gCkp1bGllbiBHcmFsbAoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApY
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
