From: Paul Durrant <Paul.Durrant@citrix.com>
Subject: Re: [PATCH v8 7/7] vtd: add lookup_page method to
 iommu_ops
Date: Thu, 13 Sep 2018 14:53:02 +0000
Message-ID: <cb30f0c244a447eca09e639eeb0da13a@AMSPEX02CL03.citrite.net>
References: <20180913103153.33377-1-paul.durrant@citrix.com>
 <20180913103153.33377-9-paul.durrant@citrix.com>
 <5B9A662D02000078001E83F4@prv1-mh.provo.novell.com>
 <f69c1a46c5764297b7dfdb8f55e7b1f8@AMSPEX02CL03.citrite.net>
 <5B9A69CF02000078001E8448@prv1-mh.provo.novell.com>
 <0bc9e5bbc5aa4b7ab07d023ffeef570f@AMSPEX02CL03.citrite.net>
 <5B9A6C9A02000078001E849B@prv1-mh.provo.novell.com>
 <33c6c87a30cd471ab3499e297da768ca@AMSPEX02CL03.citrite.net>
 <5B9A794C02000078001E84E8@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=o9xv=l3=citrix.com=prvs=787a2ff47=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1g0SzT-0005EG-Cr
 for xen-devel@lists.xenproject.org; Thu, 13 Sep 2018 14:53:07 +0000
In-Reply-To: <5B9A794C02000078001E84E8@prv1-mh.provo.novell.com>
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
SkJldWxpY2hAc3VzZS5jb21dCj4gU2VudDogMTMgU2VwdGVtYmVyIDIwMTggMTU6NTEKPiBUbzog
UGF1bCBEdXJyYW50IDxQYXVsLkR1cnJhbnRAY2l0cml4LmNvbT4KPiBDYzogR2VvcmdlIER1bmxh
cCA8R2VvcmdlLkR1bmxhcEBjaXRyaXguY29tPjsgV2VpIExpdQo+IDx3ZWkubGl1MkBjaXRyaXgu
Y29tPjsgS2V2aW4gVGlhbiA8a2V2aW4udGlhbkBpbnRlbC5jb20+OyB4ZW4tZGV2ZWwgPHhlbi0K
PiBkZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZz4KPiBTdWJqZWN0OiBSRTogW1BBVENIIHY4IDcv
N10gdnRkOiBhZGQgbG9va3VwX3BhZ2UgbWV0aG9kIHRvIGlvbW11X29wcwo+IAo+ID4+PiBPbiAx
My4wOS4xOCBhdCAxNjowNCwgPFBhdWwuRHVycmFudEBjaXRyaXguY29tPiB3cm90ZToKPiA+PiAg
LS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0KPiA+PiBGcm9tOiBKYW4gQmV1bGljaCBbbWFpbHRv
OkpCZXVsaWNoQHN1c2UuY29tXQo+ID4+IFNlbnQ6IDEzIFNlcHRlbWJlciAyMDE4IDE0OjU3Cj4g
Pj4gVG86IFBhdWwgRHVycmFudCA8UGF1bC5EdXJyYW50QGNpdHJpeC5jb20+Cj4gPj4gQ2M6IEdl
b3JnZSBEdW5sYXAgPEdlb3JnZS5EdW5sYXBAY2l0cml4LmNvbT47IFdlaSBMaXUKPiA+PiA8d2Vp
LmxpdTJAY2l0cml4LmNvbT47IEtldmluIFRpYW4gPGtldmluLnRpYW5AaW50ZWwuY29tPjsgeGVu
LWRldmVsCj4gPHhlbi0KPiA+PiBkZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZz4KPiA+PiBTdWJq
ZWN0OiBSRTogW1BBVENIIHY4IDcvN10gdnRkOiBhZGQgbG9va3VwX3BhZ2UgbWV0aG9kIHRvIGlv
bW11X29wcwo+ID4+Cj4gPj4gPj4+IE9uIDEzLjA5LjE4IGF0IDE1OjUwLCA8UGF1bC5EdXJyYW50
QGNpdHJpeC5jb20+IHdyb3RlOgo+ID4+ID4gT2suIEknbGwgc3BlbGwgaXQgb3V0IGluIHRoZSBo
ZWFkZXIgaWYgeW91IHRoaW5rIGl0IGlzIG5vbi1vYnZpb3VzLgo+ID4+Cj4gPj4gT2J2aW91cyBv
ciBub3QgLSBkbyB3ZSBfaGF2ZV8gYW55IHN1Y2ggb3V0ZXIgbG9ja2luZyBpbiBwbGFjZSByaWdo
dAo+IG5vdz8KPiA+Pgo+ID4KPiA+IFllcy4gVGhlIGxvY2tpbmcgaXMgZWl0aGVyIHZpYSB0aGUg
UDJNIG9yIGdyYW50IHRhYmxlIGxvY2tzIGZvciBhbGwKPiBjdXJyZW50Cj4gPiB1c2VzIG9yIG1h
cCBhbmQgdW5tYXAgdGhhdCBJIGNhbiBzZWUuCj4gCj4gQnV0IHR3byBkaWZmZXJlbnQgbG9ja3Mg
c3RpbGwgbWVhbnMgbm8gZ3VhcmFudGVlcyBhdCBhbGwuCj4gCgpTbywgYXJlIHlvdSBzYXlpbmcg
dGhlIGN1cnJlbnQgaW1wbGVtZW50YXRpb24gaXMgbm90IGZpdCBmb3IgcHVycG9zZT8gRG8geW91
IHdhbnQgbWUgdG8gYWRkIGxvY2tpbmcgYXQgdGhlIHdyYXBwZXIgbGV2ZWw/CgogIFBhdWwKCj4g
SmFuCj4gCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
WGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0
cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
