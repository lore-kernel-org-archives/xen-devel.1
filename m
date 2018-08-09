From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v22 1/2] common: add a new mappable resource
 type: XENMEM_resource_grant_table
Date: Thu, 09 Aug 2018 03:08:49 -0600
Message-ID: <5B6C04A102000078001DC5F1@prv1-mh.provo.novell.com>
References: <20180808141620.25471-1-paul.durrant@citrix.com>
 <20180808141620.25471-2-paul.durrant@citrix.com>
 <5B6BFF7602000078001DC5C1@prv1-mh.provo.novell.com>
 <4c17991b1f1c411ca3bde0c95148644b@AMSPEX02CL03.citrite.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=emy9=ky=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1fngw9-0003qR-6w
 for xen-devel@lists.xenproject.org; Thu, 09 Aug 2018 09:08:53 +0000
In-Reply-To: <4c17991b1f1c411ca3bde0c95148644b@AMSPEX02CL03.citrite.net>
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Tim Deegan <tim@xen.org>, george.dunlap@citrix.com, Ian Jackson <Ian.Jackson@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDA5LjA4LjE4IGF0IDExOjA3LCAgd3JvdGU6Cj4+Pj4gT24gMDkuMDguMTggYXQgMTA6
NTUsIDxQYXVsLkR1cnJhbnRAY2l0cml4LmNvbT4gd3JvdGU6Cj4gPj4gRnJvbTogSmFuIEJldWxp
Y2ggW21haWx0bzpKQmV1bGljaEBzdXNlLmNvbV0KPiA+PiBTZW50OiAwOSBBdWd1c3QgMjAxOCAw
OTo0Nwo+ID4+IAo+ID4+ID4+PiBPbiAwOC4wOC4xOCBhdCAxNjoxNiwgPHBhdWwuZHVycmFudEBj
aXRyaXguY29tPiB3cm90ZToKPiA+PiA+IEBAIC0xMDQ2LDYgKzEwOTAsMTYgQEAgc3RhdGljIGlu
dCBhY3F1aXJlX3Jlc291cmNlKAo+ID4+ID4gICAgICAgICAgeGVuX3Bmbl90IGdmbl9saXN0W0FS
UkFZX1NJWkUobWZuX2xpc3QpXTsKPiA+PiA+ICAgICAgICAgIHVuc2lnbmVkIGludCBpOwo+ID4+
ID4KPiA+PiA+ICsgICAgICAgIC8qCj4gPj4gPiArICAgICAgICAgKiBGSVhNRTogVW50aWwgZm9y
ZWlnbiBwYWdlcyBpbnNlcnRlZCBpbnRvIHRoZSBQMk0gYXJlIHByb3Blcmx5Cj4gPj4gPiArICAg
ICAgICAgKiAgICAgICAgcmVmZXJlbmNlIGNvdW50ZWQsIGl0IGlzIHVuc2FmZSB0byBhbGxvdyBt
YXBwaW5nIG9mCj4gPj4gPiArICAgICAgICAgKiAgICAgICAgbm9uLWNhbGxlci1vd25lZCByZXNv
dXJjZSBwYWdlcyB1bmxlc3MgdGhlIGNhbGxlciBpcwo+ID4+ID4gKyAgICAgICAgICogICAgICAg
IHRoZSBoYXJkd2FyZSBkb21haW4uCj4gPj4gPiArICAgICAgICAgKi8KPiA+PiA+ICsgICAgICAg
IGlmICggISh4bWFyLmZsYWdzICYgWEVOTUVNX3JzcmNfYWNxX2NhbGxlcl9vd25lZCkgJiYKPiA+
PiA+ICsgICAgICAgICAgICAgIWlzX2hhcmR3YXJlX2RvbWFpbihjdXJyZCkgKQo+ID4+ID4gKyAg
ICAgICAgICAgIHJldHVybiAtRU9QTk9UU1VQUDsKPiA+PiA+ICsKPiA+PiAKPiA+PiBOb3cgdGhh
dCBJIGxvb2sgYXQgdGhpcyBhZ2FpbiAtIHdvdWxkbid0IHRoaXMgY2hlY2sgYmV0dGVyIGxpdmUg
YWhlYWQKPiA+PiBvZiB0aGUgbWFpbiBzd2l0Y2goKT8gSSBmaW5kIGl0IG9kZCwgZm9yIGV4YW1w
bGUsIHRoYXQgaW4gdGhpcyBjYXNlIHRoZQo+ID4+IGdyYW50IHRhYmxlIHdvdWxkIHN0aWxsIGhh
dmUgZ290IGdyb3duLgo+ID4gCj4gPiBUaGlzIGNhbid0IGxpdmUgYWhlYWQgb2YgdGhlIG1haW4g
c3dpdGNoIGJlY2F1c2UgCj4gPiBYRU5NRU1fcnNyY19hY3FfY2FsbGVyX293bmVkIGlzIHBhc3Nl
ZC1vdXQgZmxhZywgbm90IGEgcGFzc2VkLWluIG9uZS4gCj4gCj4gT2gsIHJpZ2h0LiBFeGNlcHQg
dGhhdCBvbmx5IGFyY2hfYWNxdWlyZV9yZXNvdXJjZSgpIGNvdWxkIGN1cnJlbnRseQo+IHNldCB0
aGUgZmxhZywgYW5kIGhlbmNlIGZyb20gdGhpcyBwYXRjaCdzIHBlcnNwZWN0aXZlIGl0J3Mgbm90
IHZpc2libGUKPiB0aGF0IHRoaXMgaXMgYW4gIm91dCIgZmxhZy4gSSBndWVzcyB5b3UgbWVhbiB0
byBzZXQgdGhlIGZsYWcgaW4KPiBhY3F1aXJlX2dyYW50X3RhYmxlKCkgb3IgbmV4dCB0byB0aGUg
Y2FsbCB0byBpdC4KClJ1YmJpc2ggLSB0aGUgZmxhZyBpcyBzdXBwb3NlZCB0byBiZSBjbGVhciBo
ZXJlLiBJJ20gc29ycnkgZm9yIHRoZSBub2lzZS4KCkphbgoKCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVs
