From: Paul Durrant <Paul.Durrant@citrix.com>
Subject: Re: [PATCH v8 7/7] vtd: add lookup_page method to
 iommu_ops
Date: Thu, 13 Sep 2018 14:04:50 +0000
Message-ID: <33c6c87a30cd471ab3499e297da768ca@AMSPEX02CL03.citrite.net>
References: <20180913103153.33377-1-paul.durrant@citrix.com>
 <20180913103153.33377-9-paul.durrant@citrix.com>
 <5B9A662D02000078001E83F4@prv1-mh.provo.novell.com>
 <f69c1a46c5764297b7dfdb8f55e7b1f8@AMSPEX02CL03.citrite.net>
 <5B9A69CF02000078001E8448@prv1-mh.provo.novell.com>
 <0bc9e5bbc5aa4b7ab07d023ffeef570f@AMSPEX02CL03.citrite.net>
 <5B9A6C9A02000078001E849B@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=o9xv=l3=citrix.com=prvs=787a2ff47=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1g0SGL-0001LQ-Ft
 for xen-devel@lists.xenproject.org; Thu, 13 Sep 2018 14:06:29 +0000
In-Reply-To: <5B9A6C9A02000078001E849B@prv1-mh.provo.novell.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: 'Jan Beulich' <JBeulich@suse.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>, Kevin Tian <kevin.tian@intel.com>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@citrix.com>
List-Id: xen-devel@lists.xenproject.org

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQo+IEZyb206IEphbiBCZXVsaWNoIFttYWlsdG86
SkJldWxpY2hAc3VzZS5jb21dCj4gU2VudDogMTMgU2VwdGVtYmVyIDIwMTggMTQ6NTcKPiBUbzog
UGF1bCBEdXJyYW50IDxQYXVsLkR1cnJhbnRAY2l0cml4LmNvbT4KPiBDYzogR2VvcmdlIER1bmxh
cCA8R2VvcmdlLkR1bmxhcEBjaXRyaXguY29tPjsgV2VpIExpdQo+IDx3ZWkubGl1MkBjaXRyaXgu
Y29tPjsgS2V2aW4gVGlhbiA8a2V2aW4udGlhbkBpbnRlbC5jb20+OyB4ZW4tZGV2ZWwgPHhlbi0K
PiBkZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZz4KPiBTdWJqZWN0OiBSRTogW1BBVENIIHY4IDcv
N10gdnRkOiBhZGQgbG9va3VwX3BhZ2UgbWV0aG9kIHRvIGlvbW11X29wcwo+IAo+ID4+PiBPbiAx
My4wOS4xOCBhdCAxNTo1MCwgPFBhdWwuRHVycmFudEBjaXRyaXguY29tPiB3cm90ZToKPiA+IE9r
LiBJJ2xsIHNwZWxsIGl0IG91dCBpbiB0aGUgaGVhZGVyIGlmIHlvdSB0aGluayBpdCBpcyBub24t
b2J2aW91cy4KPiAKPiBPYnZpb3VzIG9yIG5vdCAtIGRvIHdlIF9oYXZlXyBhbnkgc3VjaCBvdXRl
ciBsb2NraW5nIGluIHBsYWNlIHJpZ2h0IG5vdz8KPiAKClllcy4gVGhlIGxvY2tpbmcgaXMgZWl0
aGVyIHZpYSB0aGUgUDJNIG9yIGdyYW50IHRhYmxlIGxvY2tzIGZvciBhbGwgY3VycmVudCB1c2Vz
IG9yIG1hcCBhbmQgdW5tYXAgdGhhdCBJIGNhbiBzZWUuCgogIFBhdWwKCj4gSmFuCj4gCgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1h
aWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54
ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
