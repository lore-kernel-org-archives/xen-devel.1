From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v5 06/15] public / x86: introduce
 __HYPERCALL_iommu_op
Date: Tue, 07 Aug 2018 02:25:13 -0600
Message-ID: <5B69576902000078001DB5F8@prv1-mh.provo.novell.com>
References: <20180803172220.1657-1-paul.durrant@citrix.com>
 <20180803172220.1657-7-paul.durrant@citrix.com>
 <AADFC41AFE54684AB9EE6CBC0274A5D1912AC112@SHSMSX101.ccr.corp.intel.com>
 <039c0ca80877490b9a6e6e6e369b7237@AMSPEX02CL03.citrite.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=hjto=kw=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1fmxIt-0001nn-O5
 for xen-devel@lists.xenproject.org; Tue, 07 Aug 2018 08:25:19 +0000
In-Reply-To: <039c0ca80877490b9a6e6e6e369b7237@AMSPEX02CL03.citrite.net>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <julien.grall@arm.com>, Paul Durrant <paul.durrant@citrix.com>, Kevin Tian <kevin.tian@intel.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Tim Deegan <tim@xen.org>, george.dunlap@citrix.com, Ian Jackson <Ian.Jackson@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>, Daniel de Graaf <dgdegra@tycho.nsa.gov>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDA3LjA4LjE4IGF0IDEwOjEwLCA8UGF1bC5EdXJyYW50QGNpdHJpeC5jb20+IHdyb3Rl
Ogo+PiBGcm9tOiBUaWFuLCBLZXZpbiBbbWFpbHRvOmtldmluLnRpYW5AaW50ZWwuY29tXQo+PiBT
ZW50OiAwNyBBdWd1c3QgMjAxOCAwNDowMAo+PiAKPj4gPiBGcm9tOiBQYXVsIER1cnJhbnQKPj4g
PiBTZW50OiBTYXR1cmRheSwgQXVndXN0IDQsIDIwMTggMToyMiBBTQo+PiA+Cj4+ID4gZGlmZiAt
LWdpdCBhL3hlbi9hcmNoL3g4Ni9pb21tdV9vcC5jIGIveGVuL2FyY2gveDg2L2lvbW11X29wLmMK
Pj4gPiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+PiA+IGluZGV4IDAwMDAwMDAwMDAuLjc0NGMwZmNl
MjcKPj4gPiAtLS0gL2Rldi9udWxsCj4+ID4gKysrIGIveGVuL2FyY2gveDg2L2lvbW11X29wLmMK
Pj4gPiBAQCAtMCwwICsxLDE4NCBAQAo+PiA+Cj4+ICsvKioqKioqKioqKioqKioqKioqKioqKioq
KioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqCj4+ICoqKgo+PiA+ICoqKioqKioqKioq
KioqKioqKgo+PiA+ICsgKiB4ODYvaW9tbXVfb3AuYwo+PiA+ICsgKgo+PiA+ICsgKiBQYXJhdmly
dHVhbGlzZWQgSU9NTVUgZnVuY3Rpb25hbGl0eQo+PiAKPj4gYWx0aG91Z2ggb25seSB4ODYgaXMg
c3VwcG9ydGVkLCBsb2dpYyBpbiB0aGlzIGZpbGUgaXMgdmVuZG9yIGFnbm9zdGljLiBCZXR0ZXIK
Pj4gbW92ZSB0byBhIGNvbW1vbiBwbGFjZSBub3cuLi4KPj4gCj4gCj4gUGVyc29uYWxseSBJIGRv
bid0IGxpa2UgdG8gZXhwYW5kIHNjb3BlIGludG8gYXJjaGl0ZWN0dXJlcyB3aGljaCBJIGhhdmUg
bm8gCj4gZmFjaWxpdHkgdG8gdGVzdC4gIElJVUMgQVJNIGFsc28gdmVyeSBtdWNoIHJlbGllcyBv
biBhbiBpZGVudGl0eSBHRk46QkZOIG1hcCAKPiBzbyB0aGlzIGZ1bmN0aW9uYWxpdHkgaXMgdW5s
aWtlbHkgdG8gZ2V0IHVzZWQgYnkgYW55dGhpbmcgb3RoZXIgdGhhbiB4ODYgZm9yIAo+IHRoZSBm
b3Jlc2VlYWJsZSBmdXR1cmUuCgpXZWxsIC0gbW92aW5nIHRvIGEgY29tbW9uIHBsYWNlIGRvZXNu
J3QgbWVhbiBpdCBuZWVkcyB0byBiZSBidWlsdApmb3IgQVJNLgoKSmFuCgoKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
