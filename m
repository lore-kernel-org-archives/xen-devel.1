From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH] x86/vtd: fix IOMMU share PT destruction path
Date: Tue, 9 Oct 2018 15:26:29 +0100
Message-ID: <20181009142629.4l3lmkz6mxebdbey@zion.uk.xensource.com>
References: <20181009104217.24098-1-wei.liu2@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=+8ch=mv=citrix.com=prvs=8135aa832=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1g9sy1-0002nZ-Sm
 for xen-devel@lists.xenproject.org; Tue, 09 Oct 2018 14:26:33 +0000
Content-Disposition: inline
In-Reply-To: <20181009104217.24098-1-wei.liu2@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Kevin Tian <kevin.tian@intel.com>, Paul Durrant <Paul.Durrant@citrix.com>, Wei Liu <wei.liu2@citrix.com>, Jan Beulich <JBeulich@suse.com>, Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gVHVlLCBPY3QgMDksIDIwMTggYXQgMTE6NDI6MTdBTSArMDEwMCwgV2VpIExpdSB3cm90ZToK
PiBDb21taXQgMjkxNjk1MWMxICgibW0gLyBpb21tdTogaW5jbHVkZSBuZWVkX2lvbW11KCkgdGVz
dCBpbgo+IGlvbW11X3VzZV9oYXBfcHQoKSIpIGluY2x1ZGVkIG5lZWRfaW9tbXUoKSBpbiBpb21t
dV91c2VfaGFwX3B0IGFuZAo+IDkxZDRlY2E3YWRkICgiIG1tIC8gaW9tbXU6IHNwbGl0IG5lZWRf
aW9tbXUoKSBpbnRvIGhhc19pb21tdV9wdCgpIGFuZAo+IG5lZWRfaW9tbXVfcHRfc3luYygpIikg
bWFkZSB0aGluZ3MgZmluZXIgZ3JhaW4gYnkgc3BsaXRpbmcgbmVlZF9pb21tdQo+IGludG8gdGhy
ZWUgc3RhdGVzLgo+IAo+IFRoZSBkZXN0cnVjdGlvbiBwYXRoIGNhbid0IHVzZSBpb21tdV91c2Vf
aGFwX3B0IGJlY2F1c2UgYXQgdGhlIHBvaW50Cj4gcGxhdGZvcm0gb3AgaXMgY2FsbGVkLCBJT01N
VSBpcyBhbHJlYWR5IHN3aXRjaGVkIHRvIGRpc2FibGVkIHN0YXRlIGFuZAo+IHRoZSBzaGFyZWQg
UFQgdGVzdCB3b3VsZCBhbHdheXMgYmUgZmFsc2UuCj4gCj4gU2lnbmVkLW9mZi1ieTogV2VpIExp
dSA8d2VpLmxpdTJAY2l0cml4LmNvbT4KPiAtLS0KPiAgeGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gv
dnRkL2lvbW11LmMgfCA4ICsrKysrKystCj4gIDEgZmlsZSBjaGFuZ2VkLCA3IGluc2VydGlvbnMo
KyksIDEgZGVsZXRpb24oLSkKPiAKPiBkaWZmIC0tZ2l0IGEveGVuL2RyaXZlcnMvcGFzc3Rocm91
Z2gvdnRkL2lvbW11LmMgYi94ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC92dGQvaW9tbXUuYwo+IGlu
ZGV4IGY5NGI1MjJjNzMuLmQ2NmQ5ZThhZDAgMTAwNjQ0Cj4gLS0tIGEveGVuL2RyaXZlcnMvcGFz
c3Rocm91Z2gvdnRkL2lvbW11LmMKPiArKysgYi94ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC92dGQv
aW9tbXUuYwo+IEBAIC0xNzUyLDcgKzE3NTIsMTMgQEAgc3RhdGljIHZvaWQgaW9tbXVfZG9tYWlu
X3RlYXJkb3duKHN0cnVjdCBkb21haW4gKmQpCj4gICAgICAgICAgeGZyZWUobXJtcnIpOwo+ICAg
ICAgfQo+ICAKPiAtICAgIGlmICggaW9tbXVfdXNlX2hhcF9wdChkKSApCj4gKyAgICBBU1NFUlQo
aGFwX2VuYWJsZWQoZCkpOwoKVGhpcyBuZWVkcyB0byBiZSBtb3ZlZCBpbnRvIHRoZSBwcmVkaWNh
dGUgYmVsb3cgYmVjYXVzZSBQViBkb21haW4gY2FuIGVudGVyIHRoaXMgcGF0aCB0b28uCgo+ICsK
PiArICAgIC8qCj4gKyAgICAgKiBXZSBjYW4ndCB1c2UgaW9tbXVfdXNlX2hhcF9wdCBoZXJlIGJl
Y2F1c2UgdGhlIElPTU1VIHN0YXRlIGlzIGFscmVhZHkKPiArICAgICAqIGNoYW5nZWQgdG8gSU9N
TVVfU1RBVFVTX2Rpc2FibGVkIGF0IHRoaXMgcG9pbnQuCj4gKyAgICAgKi8KPiArICAgIGlmICgg
aW9tbXVfaGFwX3B0X3NoYXJlICkKPiAgICAgICAgICByZXR1cm47Cj4gIAo+ICAgICAgc3Bpbl9s
b2NrKCZoZC0+YXJjaC5tYXBwaW5nX2xvY2spOwo+IC0tIAo+IDIuMTEuMAo+IAoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcg
bGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9q
ZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
