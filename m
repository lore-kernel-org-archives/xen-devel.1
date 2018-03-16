From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH 4/7] vtd: add lookup_page method to iommu_ops
Date: Fri, 16 Mar 2018 04:28:43 -0600
Message-ID: <5AABAA6B02000078001B2A13@prv-mh.provo.novell.com>
References: <20180212104714.1922-1-paul.durrant@citrix.com>
 <20180212104714.1922-5-paul.durrant@citrix.com>
 <5AAAB33E02000078001B2592@prv-mh.provo.novell.com>
 <ee62b26d1d5d48999f1cca2ddf4f6103@AMSPEX02CL03.citrite.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2)
 (envelope-from <srs0=krzt=gg=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ewmbT-0006Gx-0x
 for xen-devel@lists.xenproject.org; Fri, 16 Mar 2018 10:28:51 +0000
In-Reply-To: <ee62b26d1d5d48999f1cca2ddf4f6103@AMSPEX02CL03.citrite.net>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Paul Durrant <Paul.Durrant@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Kevin Tian <kevin.tian@intel.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDE2LjAzLjE4IGF0IDExOjE5LCA8UGF1bC5EdXJyYW50QGNpdHJpeC5jb20+IHdyb3Rl
Ogo+PiBGcm9tOiBKYW4gQmV1bGljaCBbbWFpbHRvOkpCZXVsaWNoQHN1c2UuY29tXQo+PiBTZW50
OiAxNSBNYXJjaCAyMDE4IDE2OjU0Cj4+IAo+PiA+Pj4gT24gMTIuMDIuMTggYXQgMTE6NDcsIDxw
YXVsLmR1cnJhbnRAY2l0cml4LmNvbT4gd3JvdGU6Cj4+ID4gVGhpcyBwYXRjaCBhZGRzIGEgbmV3
IG1ldGhvZCB0byB0aGUgVlQtZCBJT01NVSBpbXBsZW1lbnRhdGlvbiB0byBmaW5kCj4+IHRoZQo+
PiA+IE1GTiBjdXJyZW50bHkgbWFwcGVkIGJ5IHRoZSBzcGVjaWZpZWQgQkZOLiBUaGlzIGZ1bmN0
aW9uYWxpdHkgd2lsbCBiZSB1c2VkCj4+ID4gYnkgYSBzdWJzZXF1ZW50IHBhdGNoLgo+PiAKPj4g
SG93IGNvbWUgdGhpcyBpcyBWVC1kIG9ubHk/IFRoZSBzYW1lIGlzIGdvaW5nIHRvIGJlIG5lZWRl
ZCBhdCBsZWFzdAo+PiBmb3IgdGhlIEFNRCBJT01NVS4gQW5kIGlmIHlvdSBkb24ndCBkbyBpdCBm
b3IgQVJNLCB0aGVuIHRoZSBob29rCj4+IHNob3VsZCBiZSB4ODYtc3BlY2lmaWMgZm9yIHRoZSB0
aW1lIGJlaW5nLgo+IAo+IEkgb25seSBoYXZlIFZULWQgaC93IHRvIHRlc3Qgb24gc28gaXQgc2Vl
bWVkIHBydWRlbnQgdG8ga2VlcCBpdCBsaW1pdGVkIHRvIAo+IHRoYXQuIEkgZGlkIGxvb2sgYXQg
ZG9pbmcgYSBzcGVjdWxhdGl2ZSBpbXBsZW1lbnRhdGlvbiBmb3IgQU1EIGJ1dCBpdCB3YXMgbm90
IAo+IHN1ZmZpY2llbnRseSBvYnZpb3VzIHRvIGdpdmUgbWUgY29uZmlkZW5jZS4KPiBJIGRvbid0
IHNlZSBhbnkgcGFydGljdWxhciByZWFzb24gdG8ga2VlcCB0aGUgaG9vayBhcmNoIHNwZWNpZmlj
IHRob3VnaC4uLiAKPiBpdCB3b3VsZCBqdXN0IGNyZWF0ZSBjb2RlIGNodXJuIGxhdGVyLCBhc3N1
bWluZyBzb21lb25lIHdhbnRzIHRvIGRvIFBWLUlPTU1VIAo+IGZvciBBUk0uCgpXZWxsLCB0aGUg
cHJpbWFyeSBjb25jZXJuIC0gYXMgeW91J3JlIGNlcnRhaW5seSBhd2FyZSAtIGlzIHRoZQpkYW5n
bGluZyBOVUxMIHBvaW50ZXIgcmVzdWx0aW5nIGZyb20gdGhlIGxhY2sgb2YgdGhvc2Ugb3RoZXIK
aW1wbGVtZW50YXRpb25zLgoKSmFuCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3hlbi1kZXZlbA==
