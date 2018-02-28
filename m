From: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Subject: Re: [PATCH v3] build: remove shim related targets
Date: Wed, 28 Feb 2018 13:02:54 +0000
Message-ID: <20180228130254.pisdymntg33pscm2@MacBook-Pro-de-Roger.local>
References: <20180221122218.37777-1-roger.pau@citrix.com>
 <5A969A6D02000078001ACA01@prv-mh.provo.novell.com>
 <20180228114722.pe3qegstcejubini@MacBook-Pro-de-Roger.local>
 <5A96AEA202000078001ACB31@prv-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=j/eq=fw=citrix.com=prvs=5902857c7=roger.pau@srs-us1.protection.inumbo.net>)
 id 1er1PZ-0002B6-JJ
 for xen-devel@lists.xenproject.org; Wed, 28 Feb 2018 13:04:45 +0000
Content-Disposition: inline
In-Reply-To: <5A96AEA202000078001ACB31@prv-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

T24gV2VkLCBGZWIgMjgsIDIwMTggYXQgMDU6Mjk6MDZBTSAtMDcwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gPj4+IE9uIDI4LjAyLjE4IGF0IDEyOjQ3LCA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdy
b3RlOgo+ID4gT24gV2VkLCBGZWIgMjgsIDIwMTggYXQgMDQ6MDI6NTNBTSAtMDcwMCwgSmFuIEJl
dWxpY2ggd3JvdGU6Cj4gPj4gPj4+IE9uIDIxLjAyLjE4IGF0IDEzOjIyLCA8cm9nZXIucGF1QGNp
dHJpeC5jb20+IHdyb3RlOgo+ID4+ID4gLS0tIGEvdG9vbHMvZmlybXdhcmUvTWFrZWZpbGUKPiA+
PiA+ICsrKyBiL3Rvb2xzL2Zpcm13YXJlL01ha2VmaWxlCj4gPj4gPiBAQCAtOCw2ICs4LDcgQEAg
ZW5kaWYKPiA+PiA+ICAjIGh2bWxvYWRlciBpcyBhIDMyLWJpdCBwcm90ZWN0ZWQgbW9kZSBiaW5h
cnkuCj4gPj4gPiAgVEFSR0VUICAgICAgOj0gaHZtbG9hZGVyL2h2bWxvYWRlcgo+ID4+ID4gIElO
U1RfRElSIDo9ICQoREVTVERJUikkKFhFTkZJUk1XQVJFRElSKQo+ID4+ID4gK0RFQkdfRElSIDo9
ICQoREVTVERJUikkKERFQlVHX0RJUikkKFhFTkZJUk1XQVJFRElSKQo+ID4+IAo+ID4+IFRoaXMg
aXMgc2NyZXdpbmcgdXAgbXkgYnVpbGQsIGFuZCBsb29raW5nIGFnYWluIEkgY2FuJ3Qgc2VlIGhv
dwo+ID4+IHRoaXMgY2FuIGJlIHJpZ2h0OiBCb3RoICQoWEVORklSTVdBUkVESVIpIGFuZCAkKERF
QlVHX0RJUikKPiA+PiBhcmUgc3VwcG9zZWQgdG8gYmUgJHtwcmVmaXh9LWFibGUsIHlldCB0aGVy
ZSBjbGVhcmx5IHNob3VsZCBub3QKPiA+PiBiZSBhbiBpbmZpeCByZXN1bHRpbmcgZnJvbSB0aGUg
Y29uc3RydWN0aW9uIG9mIHRoaXMgcGF0aC4KPiA+IAo+ID4gQnkgYmVpbmcgcHJlZml4YWJsZSB5
b3UgbWVhbiB0aGF0IGJvdGggWEVORklSTVdBUkVESVIgYW5kIERFQlVHX0RJUgo+ID4gY2FuIGJl
IHJlbGF0aXZlIHBhdGhzPwo+IAo+IEJvdGggc2hvdWxkIGJlIHBvc3NpYmxlIHRvIGxpdmUgaW4g
L3Vzci9saWIgb3IgL3Vzci9sb2NhbC9saWIsCj4gZm9yIGV4YW1wbGUuCgpJJ20gYWZyYWlkIEkg
ZG9uJ3Qgc2VlIHRoZSBpc3N1ZSwgY291bGQgeW91IHByb3ZpZGUgdGhlIHZhbHVlcyBvZgpERVNU
RElSLCBERUJVR19ESVIgYW5kIFhFTkZJUk1XQVJFRElSIHRoYXQgYXJlIGNhdXNpbmcgdGhlIGlz
c3VlPwoKSXMgdGhpcyBiZWNhdXNlIHlvdSBlbmQgdXAgd2l0aCBzb21ldGhpbmcgbGlrZToKCi91
c3IvbG9jYWwvbGliL2RlYnVnL3Vzci9sb2NhbC8uLi4gaW4gdGhlIGRlYnVnIHBhdGg/Cgo+ID4+
IEluIHRoYXQgY29udGV4dCBJIHdvbmRlciB3aHkgREVCVUdfRElSIGlzIHNldCBpbgo+ID4+IHtT
dGRHTlUsU3VuT1N9Lm1rIGluc3RlYWQgb2YgaGF2aW5nIGEgdGVtcGxhdGUgaW4KPiA+PiBQYXRo
cy5tay5pbi4KPiA+IAo+ID4gVGhlbiB5b3Ugd291bGQgaGF2ZSB0byBydW4gY29uZmlndXJlIGJl
Zm9yZSBpbnN0YWxsaW5nIHRoZSBoeXBlcnZpc29yLAo+ID4gYmVjYXVzZSB0aGUgaW5zdGFsbCBo
eXBlcnZpc29yIHRhcmdldCB1c2VzIERFQlVHX0RJUi4KPiAKPiBJIGRvbid0IHRoaW5rIHNvLCBu
by4gVGhlIGh5cGVydmlzb3Igc3VidHJlZSBpcyAoZm9yIG5vdykgZmluZSB0bwo+IHVzZSB3aGF0
ZXZlciB7U3RkR05VLFN1bk9TfS5tayBzYXksIGJ1dCB0aGUgdG9vbHMvIHN1YnRyZWUKPiBzaG91
bGRuJ3QgdXNlIGFueSBoYXJkLWNvZGVkIHBhdGhzLgoKT2gsIHNvIHlvdSBtZWFuIHRvIGtlZXAg
dGhlIGN1cnJlbnQgREVCVUdfRElSIGluIHtTdGRHTlUsU3VuT1N9Lm1rIGJ1dAphZGQgYSB0ZW1w
bGF0ZSB0byBQYXRocy5tay5pbiBmb3IgdGhlIHRvb2xzPyBUaGF0IHNlZW1zIGZpbmUuCgpSb2dl
ci4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1k
ZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8v
bGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
