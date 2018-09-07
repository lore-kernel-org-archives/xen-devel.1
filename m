From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v6 08/14] vtd: add lookup_page method to
 iommu_ops
Date: Fri, 07 Sep 2018 09:52:52 -0600
Message-ID: <5B929ED402000078001E679F@prv1-mh.provo.novell.com>
References: <20180823094711.21376-1-paul.durrant@citrix.com>
 <20180823094711.21376-9-paul.durrant@citrix.com>
 <5B925CC402000078001E6538@prv1-mh.provo.novell.com>
 <d40d38f534974523b694e3fcda29cbed@AMSPEX02CL03.citrite.net>
 <5B92919402000078001E66D9@prv1-mh.provo.novell.com>
 <5fcf07dd87514ac0a1f0142f604adbd3@AMSPEX02CL03.citrite.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=p3pn=lv=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1fyJ43-0000Gv-Am
 for xen-devel@lists.xenproject.org; Fri, 07 Sep 2018 15:52:55 +0000
In-Reply-To: <5fcf07dd87514ac0a1f0142f604adbd3@AMSPEX02CL03.citrite.net>
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

Pj4+IE9uIDA3LjA5LjE4IGF0IDE3OjI0LCA8UGF1bC5EdXJyYW50QGNpdHJpeC5jb20+IHdyb3Rl
Ogo+PiBGcm9tOiBKYW4gQmV1bGljaCBbbWFpbHRvOkpCZXVsaWNoQHN1c2UuY29tXQo+PiBTZW50
OiAwNyBTZXB0ZW1iZXIgMjAxOCAxNTo1Ngo+PiAKPj4gPj4+IE9uIDA3LjA5LjE4IGF0IDE0OjM2
LCA8UGF1bC5EdXJyYW50QGNpdHJpeC5jb20+IHdyb3RlOgo+PiA+PiBGcm9tOiBKYW4gQmV1bGlj
aCBbbWFpbHRvOkpCZXVsaWNoQHN1c2UuY29tXQo+PiA+PiBTZW50OiAwNyBTZXB0ZW1iZXIgMjAx
OCAxMjoxMQo+PiA+Pgo+PiA+PiA+Pj4gT24gMjMuMDguMTggYXQgMTE6NDcsIDxwYXVsLmR1cnJh
bnRAY2l0cml4LmNvbT4gd3JvdGU6Cj4+ID4+ID4gVGhpcyBwYXRjaCBhZGRzIGEgbmV3IG1ldGhv
ZCB0byB0aGUgVlQtZCBJT01NVSBpbXBsZW1lbnRhdGlvbiB0bwo+PiBmaW5kCj4+ID4+IHRoZQo+
PiA+PiA+IE1GTiBjdXJyZW50bHkgbWFwcGVkIGJ5IHRoZSBzcGVjaWZpZWQgQkZOIGFsb25nIHdp
dGggYSB3cmFwcGVyCj4+IGZ1bmN0aW9uCj4+ID4+IGluCj4+ID4+ID4gZ2VuZXJpYyBJT01NVSBj
b2RlIHRvIGNhbGwgdGhlIGltcGxlbWVudGF0aW9uIGlmIGl0IGV4aXN0cy4KPj4gPj4KPj4gPj4g
Rm9yIHRoaXMgdG8gZ28gaW4sIEkgdGhpbmsgdGhlIEFNRCBzaWRlIG9mIGl0IHdhbnRzIHRvIGFs
c28gYmUgaW1wbGVtZW50ZWQuCj4+ID4KPj4gPiBXaHk/IEl0IGNhbiBiZSBkb25lIGxhdGVyLiBO
b3RoaW5nIGV4aXN0aW5nIGlzIGdvaW5nIHRvIGJyZWFrIGlmIGl0IGlzIG5vdAo+PiA+IGltcGxl
bWVudGVkLgo+PiAKPj4gSWYgaXQgd2FzIHNvbWV0aGluZyB0aGF0J3MgdGVycmlibHkgZGlmZmlj
dWx0IHRvIGltcGxlbWVudCwgSSdkCj4+IHByb2JhYmx5IGFncmVlLiBCdXQgaW50cm9kdWNpbmcg
UFYgSU9NTVUgZm9yIEludGVsIG9ubHkgKGFuZAo+PiBoZW5jZSBvbmNlIGFnYWluIG1ha2luZyBB
TUQgYSBzZWNvbmQgY2xhc3MgY2l0aXplbikgSSBkb24ndAo+PiByZWFsbHkgbGlrZS4gQW5vdGhl
ciB0aGluZyB3b3VsZCBiZSBpZiB5b3UgaGFkIHRoZSBpbXBsZW1lbnRhdGlvbgo+PiByZWFkeSwg
YnV0IHRoZSBtYWludGFpbmVyKHMpIGRvbid0IHJlc3BvbmQuLi4KPj4gCj4gCj4gSXQncyBhbGwg
dGltZSB0aG91Z2guIFRoZSBmYWN0IGlzIHRoYXQsIGluIFhlblNlcnZlciwgd2UndmUgbmV2ZXIg
aGFkIAo+IFBWLUlPTU1VIGZvciBBTUQuIEl0IHdvdWxkIGJlIHdvbmRlcmZ1bCB0byBoYXZlIGl0
IGZvciBBTUQgdG9vIGFuZCBpbmRlZWQgSSAKPiBtYXkgZmluZCB0aGUgdGltZSB0byBkbyBpdCwg
YnV0IGlzIHRoYXQgcmVhbGx5IGEgcmVhc29uIHRvIGJsb2NrIGludGVncmF0aW9uIAo+IG9mIHRo
ZXNlIHBhdGNoZXMgd2hlbiBubyBhY3R1YWwgcmVncmVzc2lvbiB3aWxsIGJlIGNhdXNlZCBieSBv
ZiB0aGUgbGFjayBvZiAKPiBBTUQgc3VwcG9ydD8KCkZpcnN0IG9mIGFsbCAtIEkgZG9uJ3QgbWVh
biB0byBibG9jayBhbnl0aGluZy4gSSBkZWxpYmVyYXRlbHkgc2FpZAoiSSB0aGluayBpdCB3YW50
cyB0byBiZSIsIG5vdCAiSXQgbmVlZHMgdG8gYmUiLiBCdXQgYmV5b25kIHRoYXQKbXkgc2Vjb25k
IGNsYXNzIGNpdGl6ZW4gc3RhdGVtZW50IHN0YW5kcyAtIGl0J3Mgbm8gZGlmZmVyZW50CmZyb20g
ZS5nLiBpbnRyb2R1Y2luZyBWTVggc3VwcG9ydCwgYnV0IG5vdCBTVk0gb25lLiBUaGF0IGFsc28K
aXMgbm90IHJlc3VsdGluZyBpbiBhbnkgcmVncmVzc2lvbiwgYnV0IHN0aWxsIGlzIG5vdCB2ZXJ5
IGRlc2lyYWJsZS4KCkphbgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVu
LWRldmVs
