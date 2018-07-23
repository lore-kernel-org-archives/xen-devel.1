From: Mark Railton <mark@markrailton.com>
Subject: Re: [PATCH] Drivers: Xen: xlate_mmu.c: Fixed comment
 layout
Date: Mon, 23 Jul 2018 22:40:11 +0100
Message-ID: <20180723214011.GA21167__29959.3511307195$1532410339$gmane$org@ZeroCool>
References: <20180723213404.20720-1-mark@markrailton.com>
 <e0b30ab8-d418-cbe0-d03c-a0aee1d48367@infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=kipy=kh=markrailton.com=mark@srs-us1.protection.inumbo.net>)
 id 1fhiYy-0004PG-9i
 for xen-devel@lists.xenproject.org; Mon, 23 Jul 2018 21:40:16 +0000
Received: by mail-ed1-x542.google.com with SMTP id r4-v6so2219325edp.9
 for <xen-devel@lists.xenproject.org>; Mon, 23 Jul 2018 14:40:14 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <e0b30ab8-d418-cbe0-d03c-a0aee1d48367@infradead.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: jgross@suse.com, xen-devel@lists.xenproject.org, boris.ostrovsky@oracle.com, linux-kernel@vger.kernel.org
List-Id: xen-devel@lists.xenproject.org

T24gTW9uLCBKdWwgMjMsIDIwMTggYXQgMDI6Mzg6MjBQTSAtMDcwMCwgUmFuZHkgRHVubGFwIHdy
b3RlOgo+IE9uIDA3LzIzLzIwMTggMDI6MzQgUE0sIE1hcmsgUmFpbHRvbiB3cm90ZToKPiA+IEZp
eGVkIGlzc3VlIHdpdGggbXVsdGkgbGluZSBjb21tZW50Cj4gCj4gRml4IFtub3QgRml4ZWRdCj4g
Cj4gPiAKPiA+IFNpZ25lZC1vZmYtYnk6IE1hcmsgUmFpbHRvbiA8bWFya0BtYXJrcmFpbHRvbi5j
b20+Cj4gPiAtLS0KPiA+ICBkcml2ZXJzL3hlbi94bGF0ZV9tbXUuYyB8IDUgKysrLS0KPiA+ICAx
IGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+ID4gCj4gPiBk
aWZmIC0tZ2l0IGEvZHJpdmVycy94ZW4veGxhdGVfbW11LmMgYi9kcml2ZXJzL3hlbi94bGF0ZV9t
bXUuYwo+ID4gaW5kZXggMjNmMTM4N2IzZWY3Li4zYjAzYmMxNjQxZWQgMTAwNjQ0Cj4gPiAtLS0g
YS9kcml2ZXJzL3hlbi94bGF0ZV9tbXUuYwo+ID4gKysrIGIvZHJpdmVycy94ZW4veGxhdGVfbW11
LmMKPiA+IEBAIC0xNTEsOCArMTUxLDkgQEAgaW50IHhlbl94bGF0ZV9yZW1hcF9nZm5fYXJyYXko
c3RydWN0IHZtX2FyZWFfc3RydWN0ICp2bWEsCj4gPiAgCXN0cnVjdCByZW1hcF9kYXRhIGRhdGE7
Cj4gPiAgCXVuc2lnbmVkIGxvbmcgcmFuZ2UgPSBESVZfUk9VTkRfVVAobnIsIFhFTl9QRk5fUEVS
X1BBR0UpIDw8IFBBR0VfU0hJRlQ7Cj4gPiAgCj4gPiAtCS8qIEtlcHQgaGVyZSBmb3IgdGhlIHB1
cnBvc2Ugb2YgbWFraW5nIHN1cmUgY29kZSBkb2Vzbid0IGJyZWFrCj4gPiAtCSAgIHg4NiBQVk9Q
UyAqLwo+ID4gKwkvKiBLZXB0IGhlcmUgZm9yIHRoZSBwdXJwb3NlIG9mIG1ha2luZyBzdXJlIGNv
ZGUgZG9lc24ndAo+ID4gKwkgKiBicmVhayB4ODYgUFZPUFMKPiA+ICsJICovCj4gCj4gVGhhdCBp
cyBzdGlsbCBub3QgdGhlIHByZWZlcnJlZCBrZXJuZWwgbXVsdGktbGluZSBjb21tZW50IHN0eWxl
Lgo+IERvY3VtZW50YXRpb24vcHJvY2Vzcy9jb2Rpbmctc3R5bGUucnN0IHNheXM6Cj4gCj4gCS8q
Cj4gCSAqIFRoaXMgaXMgdGhlIHByZWZlcnJlZCBzdHlsZSBmb3IgbXVsdGktbGluZQo+IAkgKiBj
b21tZW50cyBpbiB0aGUgTGludXgga2VybmVsIHNvdXJjZSBjb2RlLgo+IAkgKiBQbGVhc2UgdXNl
IGl0IGNvbnNpc3RlbnRseS4KPiAJICoKPiAJICogRGVzY3JpcHRpb246ICBBIGNvbHVtbiBvZiBh
c3Rlcmlza3Mgb24gdGhlIGxlZnQgc2lkZSwKPiAJICogd2l0aCBiZWdpbm5pbmcgYW5kIGVuZGlu
ZyBhbG1vc3QtYmxhbmsgbGluZXMuCj4gCSAqLwo+IAo+IGFsdGhvdWdoIE5ldHdvcmtpbmcgY29k
ZSBoYXMgYSBzbGlnaHRseSBkaWZmZXJlbnQgcHJlZmVycmVkIHN0eWxlIChhcyBpbgo+IHlvdXIg
cGF0Y2gpLgo+IAo+ID4gIAlCVUdfT04oISgodm1hLT52bV9mbGFncyAmIChWTV9QRk5NQVAgfCBW
TV9JTykpID09IChWTV9QRk5NQVAgfCBWTV9JTykpKTsKPiA+ICAKPiA+ICAJZGF0YS5mZ2ZuID0g
Z2ZuOwo+ID4gCj4gCj4gCj4gLS0gCj4gflJhbmR5CgpUaGFuaydzIGZvciB0aGUgZmVlZGJhY2ss
IEknbGwgZ2V0IHRoYXQgdXBkYXRlZCBub3cuCgpJJ20gc3RpbGwga2luZGEgbmV3IHRvIHRoaXMs
IEkgYXNzdW1lIEkgbmVlZCB0byBzZW5kIHRoZSBuZXcgcGF0Y2ggdmlhCmdpdCBzZW5kLWVtYWls
PwoKVGhhbmtzLAoKTWFyawoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1k
ZXZlbA==
