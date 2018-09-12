From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v6 08/14] vtd: add lookup_page method to
 iommu_ops
Date: Wed, 12 Sep 2018 02:43:35 -0600
Message-ID: <5B98D1B702000078001E7A8F@prv1-mh.provo.novell.com>
References: <20180823094711.21376-1-paul.durrant@citrix.com>
 <20180823094711.21376-9-paul.durrant@citrix.com>
 <5B925CC402000078001E6538@prv1-mh.provo.novell.com>
 <f341403b1c684f6a82ec85905599178e@AMSPEX02CL03.citrite.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=mhj0=l2=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1g00kN-0005TV-5v
 for xen-devel@lists.xenproject.org; Wed, 12 Sep 2018 08:43:39 +0000
In-Reply-To: <f341403b1c684f6a82ec85905599178e@AMSPEX02CL03.citrite.net>
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
Cc: xen-devel <xen-devel@lists.xenproject.org>, Kevin Tian <kevin.tian@intel.com>, george.dunlap@citrix.com
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDEyLjA5LjE4IGF0IDEwOjMxLCA8UGF1bC5EdXJyYW50QGNpdHJpeC5jb20+IHdyb3Rl
Ogo+PiBGcm9tOiBKYW4gQmV1bGljaCBbbWFpbHRvOkpCZXVsaWNoQHN1c2UuY29tXQo+PiBTZW50
OiAwNyBTZXB0ZW1iZXIgMjAxOCAxMjoxMQo+PiAKPj4gPj4+IE9uIDIzLjA4LjE4IGF0IDExOjQ3
LCA8cGF1bC5kdXJyYW50QGNpdHJpeC5jb20+IHdyb3RlOgo+PiA+IFRoaXMgcGF0Y2ggYWRkcyBh
IG5ldyBtZXRob2QgdG8gdGhlIFZULWQgSU9NTVUgaW1wbGVtZW50YXRpb24gdG8gZmluZAo+PiB0
aGUKPj4gPiBNRk4gY3VycmVudGx5IG1hcHBlZCBieSB0aGUgc3BlY2lmaWVkIEJGTiBhbG9uZyB3
aXRoIGEgd3JhcHBlciBmdW5jdGlvbgo+PiBpbgo+PiA+IGdlbmVyaWMgSU9NTVUgY29kZSB0byBj
YWxsIHRoZSBpbXBsZW1lbnRhdGlvbiBpZiBpdCBleGlzdHMuCj4+IAo+PiBGb3IgdGhpcyB0byBn
byBpbiwgSSB0aGluayB0aGUgQU1EIHNpZGUgb2YgaXQgd2FudHMgdG8gYWxzbyBiZSBpbXBsZW1l
bnRlZC4KPj4gCj4+ID4gLS0tIGEveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvaW9tbXUuYwo+PiA+
ICsrKyBiL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL2lvbW11LmMKPj4gPiBAQCAtMzA1LDYgKzMw
NSwxNyBAQCBpbnQgaW9tbXVfdW5tYXBfcGFnZShzdHJ1Y3QgZG9tYWluICpkLCBiZm5fdAo+PiBi
Zm4pCj4+ID4gICAgICByZXR1cm4gcmM7Cj4+ID4gIH0KPj4gPgo+PiA+ICtpbnQgaW9tbXVfbG9v
a3VwX3BhZ2Uoc3RydWN0IGRvbWFpbiAqZCwgYmZuX3QgYmZuLCBtZm5fdCAqbWZuLAo+PiA+ICsg
ICAgICAgICAgICAgICAgICAgICAgdW5zaWduZWQgaW50ICpmbGFncykKPj4gPiArewo+PiA+ICsg
ICAgY29uc3Qgc3RydWN0IGRvbWFpbl9pb21tdSAqaGQgPSBkb21faW9tbXUoZCk7Cj4+ID4gKwo+
PiA+ICsgICAgaWYgKCAhaW9tbXVfZW5hYmxlZCB8fCAhaGQtPnBsYXRmb3JtX29wcyApCj4+ID4g
KyAgICAgICAgcmV0dXJuIC1FT1BOT1RTVVBQOwo+PiA+ICsKPj4gPiArICAgIHJldHVybiBoZC0+
cGxhdGZvcm1fb3BzLT5sb29rdXBfcGFnZShkLCBiZm4sIG1mbiwgZmxhZ3MpOwo+PiA+ICt9Cj4+
IAo+PiBTaG91bGRuJ3QgdGhpcyBiZSByZXN0cmljdGVkIHRvIFBWIGd1ZXN0cz8gSFZNIG9uZXMg
YXJlbid0IHN1cHBvc2VkCj4+IHRvIGtub3cgYWJvdXQgTUZOcy4KPiAKPiBBZ3JlZWQsIGJ1dCBJ
IHRoaW5rIHRoaXMgaXMgdGhlIHdyb25nIGxldmVsIHRvIGJlIGFwcGx5aW5nIHN1Y2ggYSBjaGVj
azogCj4gaW9tbXVfbWFwX3BhZ2UoKSBpcyBzdXBwbGllZCBhbiBNRk4gcmVnYXJkbGVzcyBvZiB3
aGV0aGVyIHRoZSBkb21haW4gaXMgUFYgb3IgCj4gSFZNLCBzbyBJIHRoaW5rIGl0IGlzIHJlYXNv
bmFibGUgZm9yIGEgbG9va3VwIGZ1bmN0aW9uIHRvIHdvcmsgaW4gdGVybXMgb2YgCj4gTUZOcy4K
CkkgZG9uJ3QgbWluZCBtdWNoIHdoZXJlIHRoZSBjaGVjayBzaXRzLCBidXQgQVNTRVJUKCFpc19o
dm1fZG9tYWluKCkpLAppZiBwbGFjZWQgaGVyZSwgc2hvdWxkIG5vdCB0cmlnZ2VyLgoKSmFuCgoK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZl
bCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlz
dHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
