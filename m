From: "Tian, Kevin" <kevin.tian@intel.com>
Subject: Re: [PATCH v5 09/15] vtd: add lookup_page method to
 iommu_ops
Date: Tue, 7 Aug 2018 08:32:38 +0000
Message-ID: <AADFC41AFE54684AB9EE6CBC0274A5D1912AE997@SHSMSX101.ccr.corp.intel.com>
References: <20180803172220.1657-1-paul.durrant@citrix.com>
 <20180803172220.1657-10-paul.durrant@citrix.com>
 <AADFC41AFE54684AB9EE6CBC0274A5D1912AC1B1@SHSMSX101.ccr.corp.intel.com>
 <0a4bee6dd58242f39e71c8e9bf2f89e0@AMSPEX02CL03.citrite.net>
 <5B69587E02000078001DB62F@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=tozp=kw=intel.com=kevin.tian@srs-us1.protection.inumbo.net>)
 id 1fmxQm-0003D0-Vv
 for xen-devel@lists.xenproject.org; Tue, 07 Aug 2018 08:33:29 +0000
In-Reply-To: <5B69587E02000078001DB62F@prv1-mh.provo.novell.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>, Paul Durrant <paul.durrant@citrix.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>, "george.dunlap@citrix.com" <george.dunlap@citrix.com>
List-Id: xen-devel@lists.xenproject.org

PiBGcm9tOiBKYW4gQmV1bGljaCBbbWFpbHRvOkpCZXVsaWNoQHN1c2UuY29tXQo+IFNlbnQ6IFR1
ZXNkYXksIEF1Z3VzdCA3LCAyMDE4IDQ6MzAgUE0KPiAKPiA+Pj4gT24gMDcuMDguMTggYXQgMTA6
MjEsIDxQYXVsLkR1cnJhbnRAY2l0cml4LmNvbT4gd3JvdGU6Cj4gPj4gRnJvbTogVGlhbiwgS2V2
aW4gW21haWx0bzprZXZpbi50aWFuQGludGVsLmNvbV0KPiA+PiBTZW50OiAwNyBBdWd1c3QgMjAx
OCAwNDoyNQo+ID4+Cj4gPj4gPiBGcm9tOiBQYXVsIER1cnJhbnQgW21haWx0bzpwYXVsLmR1cnJh
bnRAY2l0cml4LmNvbV0KPiA+PiA+IFNlbnQ6IFNhdHVyZGF5LCBBdWd1c3QgNCwgMjAxOCAxOjIy
IEFNCj4gPj4gPgo+ID4+ID4gLS0tIGEveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvdnRkL2lvbW11
LmMKPiA+PiA+ICsrKyBiL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL3Z0ZC9pb21tdS5jCj4gPj4g
PiBAQCAtMTgzMCw2ICsxODMwLDM5IEBAIHN0YXRpYyBpbnQgX19tdXN0X2NoZWNrCj4gPj4gPiBp
bnRlbF9pb21tdV91bm1hcF9wYWdlKHN0cnVjdCBkb21haW4gKmQsCj4gPj4gPiAgICAgIHJldHVy
biBkbWFfcHRlX2NsZWFyX29uZShkLCBiZm5fdG9fYmFkZHIoYmZuKSk7Cj4gPj4gPiAgfQo+ID4+
ID4KPiA+PiA+ICtzdGF0aWMgaW50IGludGVsX2lvbW11X2xvb2t1cF9wYWdlKHN0cnVjdCBkb21h
aW4gKmQsIGJmbl90IGJmbiwKPiBtZm5fdAo+ID4+ID4gKm1mbiwKPiA+PiA+ICsgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIHVuc2lnbmVkIGludCAqZmxhZ3MpCj4gPj4KPiA+PiBO
b3QgbG9va2luZyBhdCBsYXRlciBwYXRjaGVzIHlldC4uLiBidXQgaW4gY29uY2VwdCBiZm4gYWRk
cmVzcwo+ID4+IHNwYWNlIGlzIHBlciBkZXZpY2UgaW5zdGVhZCBvZiBwZXIgZG9tYWluLgo+ID4K
PiA+IE5vdCBpbiB0aGlzIGNhc2UuIFhlbiBoYXMgYWx3YXlzIG1haW50YWluZWQgYSBzaW5nbGUg
SU9NTVUgYWRkcmVzcyBwZXIKPiA+IHZpcnR1YWwgbWFjaGluZS4gVGhhdCBpcyB3aGF0IEJGTiBy
ZWZlcnMgdG8uCj4gCj4gTnV0IGlzIHRoYXQgYSBtb2RlbCB3ZSBjYW4gbWFpbnRhaW4gbWlkIGFu
ZCBsb25nIHRlcm0/IEluIHBhcnRpY3VsYXIKPiBvbiBBUk0sIHdoZXJlIEp1bGllbiBoYXMgdG9s
ZCBtZSBhIHNpbmdsZSBzeXN0ZW0gY291bGQgaGF2ZSBtdWx0aXBsZQo+IF9kaWZmZXJlbnRfIElP
TU1VcywgSSBjb3VsZCBlYXNpbHkgc2VlIHRoZSBhZGRyZXNzIHNwYWNlcyBkaXZlcmdpbmcuCj4g
CgptdWx0aXBsZSBJT01NVXMgaXMgYW5vdGhlciB0aGluZy4KCndoYXQgSSBxdWVzdGlvbmVkIGlz
IHRoYXQgZXZlbiBvbmUgSU9NTVUgbmVlZHMgdG8gc3VwcG9ydCBtdWxpdGlwbGUKYWRkcmVzcyBz
cGFjZXMuIFRoYXQgaXMgdGhlIHBvaW50IG9mIGFuIElPTU1VLi4uCgpUaGFua3MKS2V2aW4KCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBt
YWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMu
eGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
