From: Paul Durrant <Paul.Durrant@citrix.com>
Subject: Re: [PATCH 6/7] vtd: change lookup_page failure
 semantics
Date: Fri, 21 Sep 2018 10:18:54 +0000
Message-ID: <97f290771d6d4b6da376e8cf962ce31a@AMSPEX02CL03.citrite.net>
References: <20180920141149.1643-1-paul.durrant@citrix.com>
 <20180920141149.1643-7-paul.durrant@citrix.com>
 <5BA4C4FE02000078001EA795@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=i7re=md=citrix.com=prvs=795e8fa7d=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1g3IWX-0001gj-Rn
 for xen-devel@lists.xenproject.org; Fri, 21 Sep 2018 10:18:57 +0000
In-Reply-To: <5BA4C4FE02000078001EA795@prv1-mh.provo.novell.com>
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
Cc: xen-devel <xen-devel@lists.xenproject.org>, Kevin Tian <kevin.tian@intel.com>
List-Id: xen-devel@lists.xenproject.org

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQo+IEZyb206IEphbiBCZXVsaWNoIFttYWlsdG86
SkJldWxpY2hAc3VzZS5jb21dCj4gU2VudDogMjEgU2VwdGVtYmVyIDIwMTggMTE6MTcKPiBUbzog
UGF1bCBEdXJyYW50IDxQYXVsLkR1cnJhbnRAY2l0cml4LmNvbT4KPiBDYzogS2V2aW4gVGlhbiA8
a2V2aW4udGlhbkBpbnRlbC5jb20+OyB4ZW4tZGV2ZWwgPHhlbi0KPiBkZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZz4KPiBTdWJqZWN0OiBSZTogW1hlbi1kZXZlbF0gW1BBVENIIDYvN10gdnRkOiBj
aGFuZ2UgbG9va3VwX3BhZ2UgZmFpbHVyZQo+IHNlbWFudGljcwo+IAo+ID4+PiBPbiAyMC4wOS4x
OCBhdCAxNjoxMSwgPHBhdWwuZHVycmFudEBjaXRyaXguY29tPiB3cm90ZToKPiA+IENvbW1pdCA0
M2QxNjIyYiAidnRkOiBhZGQgbG9va3VwX3BhZ2UgbWV0aG9kIHRvIGlvbW11X29wcyIgYWRkZWQg
YQo+ID4gbG9va3VwIG1ldGhvZCBpbiB0byB0aGUgVlQtZCBJT01NVSBpbXBsZW1lbnRhdGlvbi4K
PiAKPiBXaXRoIHRoaXMgbm90IGhhdmluZyBnb25lIGluIHlldCwgaXMgdGhlcmUgYW55IHJlYXNv
biBub3QgdG8gbWFrZSB0aGUKPiBhZGp1c3RtZW50IHJpZ2h0IHRoZXJlPwo+IAoKTm8sIG90aGVy
IHRoYW4gdGhhdCBjb21taXQgaGF2aW5nIGFsbCB0aGUgbmVjZXNzYXJ5IGFja3MgYW5kIHRodXMg
cG90ZW50aWFsbHkgYmVpbmcgY29tbWl0dGVkIHdoaWxzdCBJIHdhcyB3b3JraW5nIG9uIHRoaXMg
c2VyaWVzLiBXb3VsZCB5b3UgcmF0aGVyIEkgc3VibWl0dGVkIHYxMSBvZiB0aGUgb3RoZXIgc2Vy
aWVzPwoKICBQYXVsCgo+IEphbgo+IAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by94ZW4tZGV2ZWw=
