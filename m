From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v8 7/7] vtd: add lookup_page method to
 iommu_ops
Date: Fri, 14 Sep 2018 01:58:47 -0600
Message-ID: <5B9B6A3702000078001E87F4@prv1-mh.provo.novell.com>
References: <20180913103153.33377-1-paul.durrant@citrix.com>
 <20180913103153.33377-9-paul.durrant@citrix.com>
 <5B9A662D02000078001E83F4@prv1-mh.provo.novell.com>
 <f69c1a46c5764297b7dfdb8f55e7b1f8@AMSPEX02CL03.citrite.net>
 <5B9A69CF02000078001E8448@prv1-mh.provo.novell.com>
 <0bc9e5bbc5aa4b7ab07d023ffeef570f@AMSPEX02CL03.citrite.net>
 <5B9A6C9A02000078001E849B@prv1-mh.provo.novell.com>
 <33c6c87a30cd471ab3499e297da768ca@AMSPEX02CL03.citrite.net>
 <5B9A794C02000078001E84E8@prv1-mh.provo.novell.com>
 <cb30f0c244a447eca09e639eeb0da13a@AMSPEX02CL03.citrite.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=ck89=l4=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1g0j06-0002aN-IQ
 for xen-devel@lists.xenproject.org; Fri, 14 Sep 2018 07:58:50 +0000
In-Reply-To: <cb30f0c244a447eca09e639eeb0da13a@AMSPEX02CL03.citrite.net>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Paul Durrant <paul.durrant@citrix.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>, Kevin Tian <kevin.tian@intel.com>, Wei Liu <wei.liu2@citrix.com>, george.dunlap@citrix.com
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDEzLjA5LjE4IGF0IDE2OjUzLCA8UGF1bC5EdXJyYW50QGNpdHJpeC5jb20+IHdyb3Rl
Ogo+PiBGcm9tOiBKYW4gQmV1bGljaCBbbWFpbHRvOkpCZXVsaWNoQHN1c2UuY29tXQo+PiBTZW50
OiAxMyBTZXB0ZW1iZXIgMjAxOCAxNTo1MQo+PiAKPj4gPj4+IE9uIDEzLjA5LjE4IGF0IDE2OjA0
LCA8UGF1bC5EdXJyYW50QGNpdHJpeC5jb20+IHdyb3RlOgo+PiA+PiBGcm9tOiBKYW4gQmV1bGlj
aCBbbWFpbHRvOkpCZXVsaWNoQHN1c2UuY29tXQo+PiA+PiBTZW50OiAxMyBTZXB0ZW1iZXIgMjAx
OCAxNDo1Nwo+PiA+Pgo+PiA+PiA+Pj4gT24gMTMuMDkuMTggYXQgMTU6NTAsIDxQYXVsLkR1cnJh
bnRAY2l0cml4LmNvbT4gd3JvdGU6Cj4+ID4+ID4gT2suIEknbGwgc3BlbGwgaXQgb3V0IGluIHRo
ZSBoZWFkZXIgaWYgeW91IHRoaW5rIGl0IGlzIG5vbi1vYnZpb3VzLgo+PiA+Pgo+PiA+PiBPYnZp
b3VzIG9yIG5vdCAtIGRvIHdlIF9oYXZlXyBhbnkgc3VjaCBvdXRlciBsb2NraW5nIGluIHBsYWNl
IHJpZ2h0Cj4+IG5vdz8KPj4gPj4KPj4gPgo+PiA+IFllcy4gVGhlIGxvY2tpbmcgaXMgZWl0aGVy
IHZpYSB0aGUgUDJNIG9yIGdyYW50IHRhYmxlIGxvY2tzIGZvciBhbGwKPj4gY3VycmVudAo+PiA+
IHVzZXMgb3IgbWFwIGFuZCB1bm1hcCB0aGF0IEkgY2FuIHNlZS4KPj4gCj4+IEJ1dCB0d28gZGlm
ZmVyZW50IGxvY2tzIHN0aWxsIG1lYW5zIG5vIGd1YXJhbnRlZXMgYXQgYWxsLgo+PiAKPiAKPiBT
bywgYXJlIHlvdSBzYXlpbmcgdGhlIGN1cnJlbnQgaW1wbGVtZW50YXRpb24gaXMgbm90IGZpdCBm
b3IgcHVycG9zZT8gRG8geW91IAo+IHdhbnQgbWUgdG8gYWRkIGxvY2tpbmcgYXQgdGhlIHdyYXBw
ZXIgbGV2ZWw/CgpXZWxsLCBJIGhhdmVuJ3QgbG9va2VkIGNsb3NlbHkgZW5vdWdoIHRvIGJlIGNl
cnRhaW4sIGJ1dCBJJ20gYWZyYWlkIHRoZXJlCm1pZ2h0IGJlIGFuIGlzc3VlLCBhbmQgaWYgc28g
SSBjZXJ0YWlubHkgdGhpbmsgaXQgbmVlZHMgdGFraW5nIGNhcmUgb2YgYmVmb3JlCndpZGVuaW5n
IHRoZSBwcm9ibGVtIGJ5IGV4cG9zaW5nIChtb3JlIG9mIGl0KSB0byBndWVzdHMuIE9mIGNvdXJz
ZSBpdAptYXkgd2VsbCBiZSB0aGF0IGFkZGl0aW9uIG9mIGFub3RoZXIgbG9ja2luZyBsYXllciBt
YXkgaGF2ZSBhZHZlcnNlCmVmZmVjdHMsIHRvIGV4aXN0aW5nIGNvZGUgYW5kL29yIHlvdXIgYWRk
aXRpb25zLgoKSmFuCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2
ZWw=
