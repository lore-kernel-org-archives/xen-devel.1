From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH 4/4] x86/iommu: add PVH support to the
 inclusive options
Date: Tue, 31 Jul 2018 09:34:51 -0600
Message-ID: <5B60819B02000078001D98EC@prv1-mh.provo.novell.com>
References: <20180727153149.25094-1-roger.pau@citrix.com>
 <20180727153149.25094-5-roger.pau@citrix.com>
 <5B60779E02000078001D9898@prv1-mh.provo.novell.com>
 <20180731151522.gnhoydkm42vloldi@mac>
 <20180731152710.nlqlv5axgsyrtd7g@mac>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=3hbq=kp=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1fkWfo-00006z-R2
 for xen-devel@lists.xenproject.org; Tue, 31 Jul 2018 15:34:56 +0000
In-Reply-To: <20180731152710.nlqlv5axgsyrtd7g@mac>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDMxLjA3LjE4IGF0IDE3OjI3LCA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdyb3RlOgo+
IE9uIFR1ZSwgSnVsIDMxLCAyMDE4IGF0IDA1OjE1OjIyUE0gKzAyMDAsIFJvZ2VyIFBhdSBNb25u
w6kgd3JvdGU6Cj4+IE9uIFR1ZSwgSnVsIDMxLCAyMDE4IGF0IDA4OjUyOjE0QU0gLTA2MDAsIEph
biBCZXVsaWNoIHdyb3RlOgo+PiA+ID4+PiBPbiAyNy4wNy4xOCBhdCAxNzozMSwgPHJvZ2VyLnBh
dUBjaXRyaXguY29tPiB3cm90ZToKPj4gPiA+IC0tLSBhL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdo
L3g4Ni9pb21tdS5jCj4+ID4gPiArKysgYi94ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC94ODYvaW9t
bXUuYwo+PiA+ID4gQEAgLTIwLDYgKzIwLDggQEAKPj4gPiA+ICAjaW5jbHVkZSA8eGVuL3NvZnRp
cnEuaD4KPj4gPiA+ICAjaW5jbHVkZSA8eHNtL3hzbS5oPgo+PiA+ID4gIAo+PiA+ID4gKyNpbmNs
dWRlIDxhc20vYXBpY2RlZi5oPgo+PiA+ID4gKyNpbmNsdWRlIDxhc20vaW9fYXBpYy5oPgo+PiA+
IAo+PiA+IFdoeT8gWW91J3JlIGxvb2tpbmcgZm9yIHRoZSBndWVzdCB2aWV3IG9mIHRoaW5ncywg
d2hpY2ggSSBkb24ndAo+PiA+IHRoaW5rIHlvdSBjYW4gZGVyaXZlIGZyb20gZGVmaW5pdGlvbnMg
aW4gdGhlc2UgdHdvIGhlYWRlcnMuCj4+IAo+PiBJIGNhbiB1c2UgdGhlIGRvbWFpbiBzdGF0ZSBm
b3IgdGhlIGxhcGljIGFuZCB0aGUgaW9hcGljLi4uCj4+IAo+PiA+ID4gKyAgICAvKiAuLi4gb3Ig
dGhlIFBDSWUgTUNGRyByZWdpb25zLiAqLwo+PiA+ID4gKyAgICBmb3IgKCBpID0gMDsgaSA8IHBj
aV9tbWNmZ19jb25maWdfbnVtOyBpKysgKQo+PiA+ID4gKyAgICB7Cj4+ID4gPiArICAgICAgICB1
bnNpZ25lZCBsb25nIGFkZHIgPSBQRk5fRE9XTihwY2lfbW1jZmdfY29uZmlnW2ldLmFkZHJlc3Mp
Owo+PiA+ID4gKwo+PiA+ID4gKyAgICAgICAgaWYgKCBwZm4gPj0gYWRkciArIChwY2lfbW1jZmdf
Y29uZmlnW2ldLnN0YXJ0X2J1c19udW1iZXIgPDwgOCkgJiYKPj4gPiA+ICsgICAgICAgICAgICAg
cGZuIDwgYWRkciArIChwY2lfbW1jZmdfY29uZmlnW2ldLmVuZF9idXNfbnVtYmVyIDw8IDgpICkK
Pj4gPiA+ICsgICAgICAgICAgICByZXR1cm4gZmFsc2U7Cj4+ID4gPiArICAgIH0KPj4gPiAKPj4g
PiBTYW1lIGhlcmUgLSB0aGlzIHdvdWxkIGJldHRlciB1c2UgZG9tYWluIHN0YXRlLgo+PiAKPj4g
Li4uIGJ1dCBwY2kgbWNmZyByZWdpb25zIGFyZSBjdXJyZW50bHkgYWRkZWQgYWZ0ZXIgdGhlIGlv
bW11Cj4+IGluaXRpYWxpemF0aW9uIGluIHRoZSBIVk0gZG9tMCBidWlsZGVyLiBJIGNhbiBzaHVm
ZmxlIHRoYXQgY2FsbCBzbwo+PiB0aGF0IGlvbW11IGluaXRpYWxpemF0aW9uIGlzIHBlcmZvcm1l
ZCBhZnRlciB0aGUgbWNmZyByZWdpb25zIGFyZQo+PiBhZGRlZC4KPiAKPiBTbyB0aGF0J3Mgbm90
IHNvIGVhc3kuIFRoZSBjdXJyZW50IGh2bV9tbWNmZyB1c2VkIHRvIHN0b3JlIHRoZSBNTUNGRwo+
IGRhdGEgaW4gdGhlIGRvbWFpbiBzdHJ1Y3QgaXMgcHJpdmF0ZSB0byBpby5jLCBJIGNvdWxkIG1v
dmUgaXQncwo+IGRlY2xhcmF0aW9uIHRvIGEgaGVhZGVyIGZpbGUsIGJ1dCBtYXliZSBpdCdzIGJl
dHRlciB0byBqdXN0IHVzZQo+IHBjaV9tbWNmZ19jb25maWcgZGlyZWN0bHk/CgpPciBhZGQgYSBo
ZWxwZXIgZnVuY3Rpb24gaW4gdGhhdCBmaWxlPwoKSmFuCgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
