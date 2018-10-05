From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH] fix uninitialized variable error in
 do_poll()
Date: Fri, 05 Oct 2018 05:22:29 -0600
Message-ID: <5BB7497502000078001EEC9A@prv1-mh.provo.novell.com>
References: <5BB738FA02000078001EEB89@prv1-mh.provo.novell.com>
 <20181005102855.vldsq4kolbs2diuy@zion.uk.xensource.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=vier=mr=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1g8OBk-0006BW-RC
 for xen-devel@lists.xenproject.org; Fri, 05 Oct 2018 11:22:32 +0000
In-Reply-To: <20181005102855.vldsq4kolbs2diuy@zion.uk.xensource.com>
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDA1LjEwLjE4IGF0IDEyOjI4LCA8d2VpLmxpdTJAY2l0cml4LmNvbT4gd3JvdGU6Cj4g
T24gRnJpLCBPY3QgMDUsIDIwMTggYXQgMDQ6MTI6MTBBTSAtMDYwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4+IE5vdyB0aGF0IENPTkZJR19IVk0gY2FuIChhbmQgc2hvdWxkKSBiZSB0dXJuZWQgb2Zm
IGZvciB0aGUgc2hpbSwgZ2NjIDguMgo+PiBhcHBhcmVudGx5IGlzIG5vIGxvbmdlciBzdXJlIHRo
YXQgInBvcnQiIGlzIGluZGVlZCBpbml0aWFsaXplZCBhdAo+PiAKPj4gICAgIGlmICggc2NoZWRf
cG9sbC0+bnJfcG9ydHMgPT0gMSApCj4+ICAgICAgICAgdi0+cG9sbF9ldnRjaG4gPSBwb3J0Owo+
PiAKPj4gSXQgZG9lc24ndCBsb29rIHRvIGJlIGltcG9zc2libGUgZm9yIHRoZSBjb21waWxlciB0
byBwcm92ZSBpdCBpcyBub3QsCj4+IGJ1dCB3ZSBhbHNvIGNhbid0IHJlbHkgb24gdGhhdCB0byBi
ZSB0aGUgY2FzZS4gQWRkIGFuIGluaXRpYWxpemVyLgo+PiAKPj4gU2lnbmVkLW9mZi1ieTogSmFu
IEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgo+IAo+IFRCSCBJIGZhaWwgdG8gc2VlIGhvdyBD
T05GSUdfSFZNIHdvdWxkIGFmZmVjdCBkb19wb2xsLiBBbHNvIHRoZXJlIGlzCj4gYWxyZWFkeSBi
dWlsZCB0ZXN0IHdpdGggZ2NjIDguMiB3aGljaCBuZXZlciBkaXNjb3ZlcmVkIHRoZSBpc3N1ZSB5
b3UKPiBkZXNjcmliZWQuCgpJIGNhbid0IGV4cGxhaW4gdGhlIHN1ZGRlbiBkaWFnbm9zdGljIHRv
byAod2l0aG91dCB0YWtpbmcgYXBhcnQgd2hhdApleGFjdGx5IHRoZSBjb21waWxlciBkb2VzKSwg
YnV0IHRoZSBzYW1lIGNvbmZpZyAoanVzdCB3aXRoIEhWTT15KQpidWlsdCBmaW5lIGJlZm9yZS4g
V2l0aG91dCBhbnkgZnVydGhlciBpbnNpZ2h0ICh3aGljaCBJIGRvbid0IHRoaW5rIGlzCndvcnRo
IHRoZSB0aW1lKSBJIGRvbid0IHNlZSBob3cgSSBjb3VsZCBpbXByb3ZlIHRoZSBkZXNjcmlwdGlv
bi4KCkphbgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpo
dHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
