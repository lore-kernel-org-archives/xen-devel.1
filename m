From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v2 06/23] x86: don't call vpci function in
 physdev_op when !CONFIG_HAS_VPCI
Date: Tue, 28 Aug 2018 03:08:24 -0600
Message-ID: <5B85110802000078001E27BD@prv1-mh.provo.novell.com>
References: <cover.65253d1128f698146b48c4ff3bba2198f360c7b1.1535285866.git-series.wei.liu2@citrix.com>
 <9ba265aa00b8a2c0a97d192e267b237110c672a4.1535285866.git-series.wei.liu2@citrix.com>
 <5B840AC002000078001E2446@prv1-mh.provo.novell.com>
 <20180828084551.3jtg4olva22mjqkt@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=k/hy=ll=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1fuZzC-0001Ri-0h
 for xen-devel@lists.xenproject.org; Tue, 28 Aug 2018 09:08:30 +0000
In-Reply-To: <20180828084551.3jtg4olva22mjqkt@citrix.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Wei Liu <wei.liu2@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDI4LjA4LjE4IGF0IDEwOjQ1LCA8d2VpLmxpdTJAY2l0cml4LmNvbT4gd3JvdGU6Cj4g
T24gTW9uLCBBdWcgMjcsIDIwMTggYXQgMDg6Mjk6MjBBTSAtMDYwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4+ID4+PiBPbiAyNi4wOC4xOCBhdCAxNDoxOSwgPHdlaS5saXUyQGNpdHJpeC5jb20+IHdy
b3RlOgo+PiA+IC0tLSBhL3hlbi9hcmNoL3g4Ni9waHlzZGV2LmMKPj4gPiArKysgYi94ZW4vYXJj
aC94ODYvcGh5c2Rldi5jCj4+ID4gQEAgLTU1Nyw2ICs1NTcsNyBAQCByZXRfdCBkb19waHlzZGV2
X29wKGludCBjbWQsIFhFTl9HVUVTVF9IQU5ETEVfUEFSQU0odm9pZCkgYXJnKQo+PiA+ICAKPj4g
PiAgICAgICAgICByZXQgPSBwY2lfbW1jZmdfcmVzZXJ2ZWQoaW5mby5hZGRyZXNzLCBpbmZvLnNl
Z21lbnQsCj4+ID4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGluZm8uc3RhcnRf
YnVzLCBpbmZvLmVuZF9idXMsIGluZm8uZmxhZ3MpOwo+PiA+ICsjaWZkZWYgQ09ORklHX0hBU19W
UENJCj4+ID4gICAgICAgICAgaWYgKCAhcmV0ICYmIGhhc192cGNpKGN1cnJkKSApCj4+ID4gICAg
ICAgICAgewo+PiA+ICAgICAgICAgICAgICAvKgo+PiA+IEBAIC01NjcsNiArNTY4LDcgQEAgcmV0
X3QgZG9fcGh5c2Rldl9vcChpbnQgY21kLCBYRU5fR1VFU1RfSEFORExFX1BBUkFNKHZvaWQpIGFy
ZykKPj4gPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGlu
Zm8uc3RhcnRfYnVzLCBpbmZvLmVuZF9idXMsCj4+ID4gICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICBpbmZvLnNlZ21lbnQpOwo+PiA+ICAgICAgICAgIH0KPj4g
PiArI2VuZGlmCj4+IAo+PiBQZXJoYXBzIGJldHRlciB0byBtYWtlIGhhc192cGNpKCkgZXZhbHVh
dGUgdG8gZmFsc2UgaW4gdGhhdCBjYXNlLAo+PiBhbmQgb25jZSBhZ2FpbiByZWx5IG9uIERDRT8K
PiAKPiBCdXQgdGhlbiB0aGF0IGdvZXMgYmFjayB0byB5b3VyIHByZXZpb3VzIGFyZ3VtZW50IHRo
YXQgaXQgY3JlYXRlcwo+IGRpc2Nvbm5lY3Rpb24gYmV0d2VlbiBlbXVsYXRpb25fZmxhZ3Nfb2sg
YW5kIGhhc18qLiBJZiB3ZSB3YW50IHRvIGNoYW5nZQo+IGhhc192cGNpIEkgd291bGQgYWxzbyBu
ZWVkIHRvIGNoYW5nZSBlbXVsYXRpb25fZmxhZ3Nfb2suIElzIHRoYXQgd2hhdAo+IHlvdSBwcmVm
ZXI/CgpIbW0sIEkgc2VlLiBVdGlsaXppbmcgRENFIGhlcmUgc2VlbXMgcHJldHR5IGRlc2lyYWJs
ZS4gUGVyaGFwcwplbXVsYXRpb25fZmxhZ3Nfb2soKSBzaG91bGQgYmUgc3dpdGNoZWQgdG8gdXNl
IGRlcml2ZWQgY29uc3RhbnRzCnJhdGhlciB0aGFuIHRoZSByYXcgcHVibGljIGludGVyZmFjZSBv
bmVzLiBUaGUgSFZNLW9ubHkgb25lcwp0aGVuIHdvdWxkIHNpbXBseSBiZWNvbWUgY29uc3RhbnQg
emVybyB3aGVuICFIVk0sIGFsbG93aW5nCmVtdWxhdGlvbl9mbGFnc19vaygpIGFzIHdlbGwgYXMg
dGhlIGhhc18qKCkgbWFjcm9zIHRvIGJlIGxlZnQgYWxvbmUKYW5kIERDRSBzdGlsbCBiZSB1dGls
aXplZC4KCkphbgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9y
ZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
