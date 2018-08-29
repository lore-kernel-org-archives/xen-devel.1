From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH v2 06/23] x86: don't call vpci function in
 physdev_op when !CONFIG_HAS_VPCI
Date: Wed, 29 Aug 2018 17:23:02 +0100
Message-ID: <20180829162302.enqxdtba5pucfuw6@citrix.com>
References: <cover.65253d1128f698146b48c4ff3bba2198f360c7b1.1535285866.git-series.wei.liu2@citrix.com>
 <9ba265aa00b8a2c0a97d192e267b237110c672a4.1535285866.git-series.wei.liu2@citrix.com>
 <5B840AC002000078001E2446@prv1-mh.provo.novell.com>
 <20180828084551.3jtg4olva22mjqkt@citrix.com>
 <5B85110802000078001E27BD@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=vupe=lm=citrix.com=prvs=7720ea622=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1fv3FL-0003a1-6w
 for xen-devel@lists.xenproject.org; Wed, 29 Aug 2018 16:23:07 +0000
Content-Disposition: inline
In-Reply-To: <5B85110802000078001E27BD@prv1-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gVHVlLCBBdWcgMjgsIDIwMTggYXQgMDM6MDg6MjRBTSAtMDYwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gPj4+IE9uIDI4LjA4LjE4IGF0IDEwOjQ1LCA8d2VpLmxpdTJAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gPiBPbiBNb24sIEF1ZyAyNywgMjAxOCBhdCAwODoyOToyMEFNIC0wNjAwLCBKYW4gQmV1
bGljaCB3cm90ZToKPiA+PiA+Pj4gT24gMjYuMDguMTggYXQgMTQ6MTksIDx3ZWkubGl1MkBjaXRy
aXguY29tPiB3cm90ZToKPiA+PiA+IC0tLSBhL3hlbi9hcmNoL3g4Ni9waHlzZGV2LmMKPiA+PiA+
ICsrKyBiL3hlbi9hcmNoL3g4Ni9waHlzZGV2LmMKPiA+PiA+IEBAIC01NTcsNiArNTU3LDcgQEAg
cmV0X3QgZG9fcGh5c2Rldl9vcChpbnQgY21kLCBYRU5fR1VFU1RfSEFORExFX1BBUkFNKHZvaWQp
IGFyZykKPiA+PiA+ICAKPiA+PiA+ICAgICAgICAgIHJldCA9IHBjaV9tbWNmZ19yZXNlcnZlZChp
bmZvLmFkZHJlc3MsIGluZm8uc2VnbWVudCwKPiA+PiA+ICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICBpbmZvLnN0YXJ0X2J1cywgaW5mby5lbmRfYnVzLCBpbmZvLmZsYWdzKTsKPiA+
PiA+ICsjaWZkZWYgQ09ORklHX0hBU19WUENJCj4gPj4gPiAgICAgICAgICBpZiAoICFyZXQgJiYg
aGFzX3ZwY2koY3VycmQpICkKPiA+PiA+ICAgICAgICAgIHsKPiA+PiA+ICAgICAgICAgICAgICAv
Kgo+ID4+ID4gQEAgLTU2Nyw2ICs1NjgsNyBAQCByZXRfdCBkb19waHlzZGV2X29wKGludCBjbWQs
IFhFTl9HVUVTVF9IQU5ETEVfUEFSQU0odm9pZCkgYXJnKQo+ID4+ID4gICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBpbmZvLnN0YXJ0X2J1cywgaW5mby5lbmRf
YnVzLAo+ID4+ID4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICBpbmZvLnNlZ21lbnQpOwo+ID4+ID4gICAgICAgICAgfQo+ID4+ID4gKyNlbmRpZgo+ID4+IAo+
ID4+IFBlcmhhcHMgYmV0dGVyIHRvIG1ha2UgaGFzX3ZwY2koKSBldmFsdWF0ZSB0byBmYWxzZSBp
biB0aGF0IGNhc2UsCj4gPj4gYW5kIG9uY2UgYWdhaW4gcmVseSBvbiBEQ0U/Cj4gPiAKPiA+IEJ1
dCB0aGVuIHRoYXQgZ29lcyBiYWNrIHRvIHlvdXIgcHJldmlvdXMgYXJndW1lbnQgdGhhdCBpdCBj
cmVhdGVzCj4gPiBkaXNjb25uZWN0aW9uIGJldHdlZW4gZW11bGF0aW9uX2ZsYWdzX29rIGFuZCBo
YXNfKi4gSWYgd2Ugd2FudCB0byBjaGFuZ2UKPiA+IGhhc192cGNpIEkgd291bGQgYWxzbyBuZWVk
IHRvIGNoYW5nZSBlbXVsYXRpb25fZmxhZ3Nfb2suIElzIHRoYXQgd2hhdAo+ID4geW91IHByZWZl
cj8KPiAKPiBIbW0sIEkgc2VlLiBVdGlsaXppbmcgRENFIGhlcmUgc2VlbXMgcHJldHR5IGRlc2ly
YWJsZS4gUGVyaGFwcwo+IGVtdWxhdGlvbl9mbGFnc19vaygpIHNob3VsZCBiZSBzd2l0Y2hlZCB0
byB1c2UgZGVyaXZlZCBjb25zdGFudHMKPiByYXRoZXIgdGhhbiB0aGUgcmF3IHB1YmxpYyBpbnRl
cmZhY2Ugb25lcy4gVGhlIEhWTS1vbmx5IG9uZXMKPiB0aGVuIHdvdWxkIHNpbXBseSBiZWNvbWUg
Y29uc3RhbnQgemVybyB3aGVuICFIVk0sIGFsbG93aW5nCj4gZW11bGF0aW9uX2ZsYWdzX29rKCkg
YXMgd2VsbCBhcyB0aGUgaGFzXyooKSBtYWNyb3MgdG8gYmUgbGVmdCBhbG9uZQo+IGFuZCBEQ0Ug
c3RpbGwgYmUgdXRpbGl6ZWQuCgpJIGhhdmUgd3JpdHRlbiBhIG5ldyBwYXRjaCB0byBpbnRyb2R1
Y2UgYSBzZXQgb2YgaW50ZXJuYWwgZmxhZ3MuIEl0IGRpZAp3b3JrIGFzIGV4cGVjdGVkLgoKQWxz
byBkcm9wcGVkIHRoaXMgcGF0Y2ggZnJvbSB0aGUgcXVldWUuCgpXZWkuCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0
Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qu
b3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
