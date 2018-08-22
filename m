From: Julien Grall <julien.grall@arm.com>
Subject: Re: [PATCH 05/34] xen: is_hvm_domain should evaluate to
 0 when !CONFIG_HVM
Date: Wed, 22 Aug 2018 16:11:45 +0100
Message-ID: <97c3ad0f-d138-3216-1dc9-f178ed95bb59@arm.com>
References: <cover.f5351150954129956fcf53a7781206b6295df78d.1534518694.git-series.wei.liu2@citrix.com>
 <32dc160e20e574c7ec736fad43157928de86962e.1534518694.git-series.wei.liu2@citrix.com>
 <5B7AAB4002000078001DFFF7@prv1-mh.provo.novell.com>
 <20180821163127.fmzdxpj5kedmvecl@citrix.com>
 <faa2beb9-f589-a396-5133-2f76c2837349@arm.com>
 <20180821184900.yy256xnosycpxnzf@citrix.com>
 <b7d92bb9-16cd-f917-84f8-617dbeb57e8c@arm.com>
 <alpine.DEB.2.10.1808211159190.16354@sstabellini-ThinkPad-X260>
 <20180821200800.guv2jbbxtwpfbza4@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=cicq=lf=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1fsUnV-0003zW-WA
 for xen-devel@lists.xenproject.org; Wed, 22 Aug 2018 15:11:50 +0000
In-Reply-To: <20180821200800.guv2jbbxtwpfbza4@citrix.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Wei Liu <wei.liu2@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>
Cc: George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Jan Beulich <JBeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

SGkgV2VpLAoKT24gMjEvMDgvMTggMjE6MDgsIFdlaSBMaXUgd3JvdGU6Cj4gT24gVHVlLCBBdWcg
MjEsIDIwMTggYXQgMTE6NTk6MjZBTSAtMDcwMCwgU3RlZmFubyBTdGFiZWxsaW5pIHdyb3RlOgo+
PiBPbiBUdWUsIDIxIEF1ZyAyMDE4LCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4+PiBPbiAwOC8yMS8y
MDE4IDA3OjQ5IFBNLCBXZWkgTGl1IHdyb3RlOgo+Pj4+IE9uIFR1ZSwgQXVnIDIxLCAyMDE4IGF0
IDA3OjMzOjU2UE0gKzAxMDAsIEp1bGllbiBHcmFsbCB3cm90ZToKPj4+Pj4gSGkgV2VpLAo+Pj4+
Pgo+Pj4+PiBPbiAwOC8yMS8yMDE4IDA1OjMxIFBNLCBXZWkgTGl1IHdyb3RlOgo+Pj4+Pj4gT24g
TW9uLCBBdWcgMjAsIDIwMTggYXQgMDU6NTE6MjhBTSAtMDYwMCwgSmFuIEJldWxpY2ggd3JvdGU6
Cj4+Pj4+Pj4+Pj4gT24gMTcuMDguMTggYXQgMTc6MTIsIDx3ZWkubGl1MkBjaXRyaXguY29tPiB3
cm90ZToKPj4+Pj4+Pj4gU2luY2UgaXQgaXMgZGVmaW5lZCBpbiBjb21tb24gaGVhZGVyIGZpbGUs
IGludHJvZHVjZSBDT05GSUdfSFZNIHRvCj4+Pj4+Pj4+IEFybSB0byBhdm9pZCBicmVha2FnZS4K
Pj4+Pj4+Pj4KPj4+Pj4+Pj4gU2lnbmVkLW9mZi1ieTogV2VpIExpdSA8d2VpLmxpdTJAY2l0cml4
LmNvbT4KPj4+Pj4+Pj4gLS0tCj4+Pj4+Pj4+ICAgICB4ZW4vYXJjaC9hcm0vS2NvbmZpZyAgICB8
IDMgKysrCj4+Pj4+Pj4+ICAgICB4ZW4vaW5jbHVkZS94ZW4vc2NoZWQuaCB8IDYgKysrKysrCj4+
Pj4+Pj4+ICAgICAyIGZpbGVzIGNoYW5nZWQsIDkgaW5zZXJ0aW9ucygrKQo+Pj4+Pj4+PiAsCj4+
Pj4+Pj4+IGRpZmYgLS1naXQgYS94ZW4vYXJjaC9hcm0vS2NvbmZpZyBiL3hlbi9hcmNoL2FybS9L
Y29uZmlnCj4+Pj4+Pj4+IGluZGV4IDU4NmJjNjIuLmMwZTk2OWUgMTAwNjQ0Cj4+Pj4+Pj4+IC0t
LSBhL3hlbi9hcmNoL2FybS9LY29uZmlnCj4+Pj4+Pj4+ICsrKyBiL3hlbi9hcmNoL2FybS9LY29u
ZmlnCj4+Pj4+Pj4+IEBAIC01Miw2ICs1Miw5IEBAIGNvbmZpZyBIQVNfSVRTCj4+Pj4+Pj4+ICAg
ICAgICAgICAgIHByb21wdCAiR0lDdjMgSVRTIE1TSSBjb250cm9sbGVyIHN1cHBvcnQiIGlmIEVY
UEVSVCA9ICJ5Igo+Pj4+Pj4+PiAgICAgICAgICAgICBkZXBlbmRzIG9uIEdJQ1YzICYmICFORVdf
VkdJQwo+Pj4+Pj4+PiArY29uZmlnIEhWTQo+Pj4+Pj4+PiArICAgICAgICBkZWZfYm9vbCB5Cj4+
Pj4+Pj4KPj4+Pj4+PiBJJ20gbm90IGNvbnZpbmNlZCB0aGlzIGlzIGEgZ29vZCBpZGVhLCBidXQg
SSdsbCBsZXQgdGhlIEFSTQo+Pj4+Pj4+IG1haW50YWluZXJzCj4+Pj4+Pj4ganVkZ2UuCj4+Pj4+
Pgo+Pj4+Pj4gQW5kcmV3IGRpc2NvdmVyZWQgdGhhdCBodm0gZmxhZyBpcyBub3Qgc2V0IGJ5IHRv
b2xzdGFjayBzbyBBUk0gZ3Vlc3RzCj4+Pj4+PiBhcmUgUFYgZ3Vlc3RzIHRvIFhlbi4gSSB0aGlu
ayB0aGUgYWRkaXRpb24gaGVyZSBjYW4gYmUgb21pdHRlZC4KPj4+Pj4+Cj4+Pj4+PiBIb3dldmVy
IEkgd291bGQgc3RpbGwgbGlrZSB0byBoZWFyIGZyb20gQVJNIG1haW50YWluZXJzIHdoYXQgZ3Vl
c3QgdHlwZQo+Pj4+Pj4gc2hvdWxkIGJlIHNldCBmb3IgQVJNLCBiZWNhdXNlIHNvb25lciBvciBs
YXRlciBJIHdpbGwgbmVlZCB0byBjaGFuZ2UgUFYKPj4+Pj4+IGNvZGUgYXMgd2VsbC4KPj4+Pj4+
Cj4+Pj4+PiBHcmVwcGluZyBmb3IgaXNfe2h2bSxwdn1fKiBpbiBhcmNoL2FybSB5aWVsZHMgbm8g
cmVzdWx0LCBidXQgdGhlbiB0aGVyZQo+Pj4+Pj4gaXMgY29tbW9uIGNvZGUgdGhhdCB3ZSBuZWVk
IHRvIHRha2UgY2FyZSBvZi4KPj4+Pj4KPj4+Pj4gVXNpbmcgUFYgd2FzIG1vcmUgYSBjb252ZW5p
ZW5jZSBhdCB0aGUgdGltZSBiZWNhdXNlIHdhcyBub3QgdGhlcmUuIFRoZQo+Pj4+PiBwbGFuCj4+
Pj4+IGlzIHRvIHN3aXRjaCB0byBQVkggKHNlZSBSRkMgWzFdKS4KPj4+Pj4KPj4+Pj4gSSB3aWxs
IHRyeSB0byBmaW5kIHNvbWUgdGltZXMgdGhpcyB3ZWVrIHRvIHJld29yayB0aGUgcGF0Y2ggYmFz
ZWQgb24gdGhlCj4+Pj4+IGNvbW1lbnRzLgo+Pj4+Pgo+Pj4+PiBDaGVlcnMsCj4+Pj4+Cj4+Pj4+
IFsxXSBodHRwczovL2xpc3RzLnhlbi5vcmcvYXJjaGl2ZXMvaHRtbC94ZW4tZGV2ZWwvMjAxOC0w
Ni9tc2cwMTUzNy5odG1sCj4+Pj4KPj4+PiBZZXMsIHN3aXRjaGluZyB0byBQVkggaW4gdG9vbHN0
YWNrIGlzIGlkZWFsLgo+Pj4+Cj4+Pj4gVGhlIHByb2JsZW0gd2UgZGlzY3VzcyBoZXJlIGlzIGlu
IHRoZSBoeXBlcnZpc29yLiBIeXBlcnZpc29yIG9ubHkgaGFzCj4+Pj4gSFZNIGFuZCBQVi4gV2hh
dCB0eXBlIHNob3VsZCBBUk0gZ3Vlc3RzIGJlPyBJIHRoaW5rIHdpdGggdGhlIG1vdmUgdG8gdXNl
Cj4+Pj4gUFZIIGluIHRvb2xzdGFjaywgdGhlIHR5cGUgaW4gaHlwZXJ2aXNvciBzaG91bGQgYmUg
SFZNIChhcyBvcHBvc2UgdG8gUFYKPj4+PiBub3cpPwo+Pj4KPj4+IEFybSBndWVzdCBhcmUgbXVj
aCBjbG9zZXIgdG8gSFZNIHRoYW4gUFYuIFNvIHRoZSBoeXBlcnZpc29yIHNob3VsZCB1c2UgSFZN
Cj4+PiBoZXJlLgo+PiAgIAo+PiArMQo+IAo+IE9LLiBJbiB0aGF0IGNhc2UsIHdoYXQgZG8geW91
IGd1eXMgdGhpbmsgYWJvdXQgaW50cm9kdWNpbmcgQ09ORklHX0hWTSB0bwo+IEFSTT8KCkkgYW0g
b2sgd2l0aCB0aGF0LiBOb3RlLCB5b3Ugd2lsbCBuZWVkIG15IHBhdGNoIHNlcmllcyAidG9vbHMv
bGlieGw6IApTd2l0Y2ggQXJtIGd1ZXN0IHR5cGUgdG8gUFZIIiBbMV0gdG8gbWFrZSBpdCB3b3Jr
IG9uIEFybS4KCkNoZWVycywKClsxXSAKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9hcmNo
aXZlcy9odG1sL3hlbi1kZXZlbC8yMDE4LTA4L21zZzAxOTAyLmh0bWwKCi0tIApKdWxpZW4gR3Jh
bGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1k
ZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8v
bGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
