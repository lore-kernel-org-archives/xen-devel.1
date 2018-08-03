From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Re: [PATCH v2 2/5] iommu: introduce dom0-iommu option
Date: Fri, 3 Aug 2018 10:14:26 +0200
Message-ID: <20180803081426.6zh3lqhcjtxdofnf@mac>
References: <20180801110340.67695-1-roger.pau@citrix.com>
 <20180801110340.67695-3-roger.pau@citrix.com>
 <AADFC41AFE54684AB9EE6CBC0274A5D1912915CF@SHSMSX101.ccr.corp.intel.com>
 <5B62BF7B02000078001DA2F8@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=jouf=ks=citrix.com=prvs=7468cef67=roger.pau@srs-us1.protection.inumbo.net>)
 id 1flVG0-0002M8-3e
 for xen-devel@lists.xenproject.org; Fri, 03 Aug 2018 08:16:20 +0000
Content-Disposition: inline
In-Reply-To: <5B62BF7B02000078001DA2F8@prv1-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Kevin Tian <kevin.tian@intel.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>, xen-devel <xen-devel@lists.xenproject.org>, Brian Woods <brian.woods@amd.com>
List-Id: xen-devel@lists.xenproject.org

T24gVGh1LCBBdWcgMDIsIDIwMTggYXQgMDI6MjM6MjNBTSAtMDYwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gPj4+IE9uIDAyLjA4LjE4IGF0IDA5OjQ2LCA8a2V2aW4udGlhbkBpbnRlbC5jb20+IHdy
b3RlOgo+ID4+ICBGcm9tOiBSb2dlciBQYXUgTW9ubmUgW21haWx0bzpyb2dlci5wYXVAY2l0cml4
LmNvbV0KPiA+PiBTZW50OiBXZWRuZXNkYXksIEF1Z3VzdCAxLCAyMDE4IDc6MDQgUE0KPiA+PiAt
LS0gYS9kb2NzL21pc2MveGVuLWNvbW1hbmQtbGluZS5tYXJrZG93bgo+ID4+ICsrKyBiL2RvY3Mv
bWlzYy94ZW4tY29tbWFuZC1saW5lLm1hcmtkb3duCj4gPj4gQEAgLTExNTAsMTIgKzExNTAsMTgg
QEAgZGV0ZWN0aW9uIG9mIHN5c3RlbXMga25vd24gdG8gbWlzYmVoYXZlCj4gPj4gdXBvbiBhY2Nl
c3NlcyB0byB0aGF0IHBvcnQuCj4gPj4gCj4gPj4gID4gYGRvbTAtcGFzc3Rocm91Z2hgCj4gPj4g
Cj4gPj4gKz4gKipXQVJOSU5HOiBUaGlzIGNvbW1hbmQgbGluZSBvcHRpb24gaXMgZGVwcmVjYXRl
ZCwgYW5kIHN1cGVyc2VkZWQKPiA+PiBieQo+ID4+ICs+IF9kb20wLWlvbW11PW5vbmVfIC0gdXNp
bmcgYm90aCBvcHRpb25zIGluIGNvbWJpbmF0aW9uIGlzCj4gPj4gdW5kZWZpbmVkLioqCj4gPj4g
Kwo+ID4gCj4gPiBpbiBwYXRjaCBkZXNjcmlwdGlvbiB5b3Ugc2FpZCAnc3VwZXJzZWRlJy4uLiBp
cyBpdCBiZXR0ZXIgdG8gc2F5IHRoYXQKPiA+IG5ldyBkb20wX2lvbW11IGlzIGZhdm9yZWQgaWYg
Ym90aCBvcHRpb25zIGFyZSBzcGVjaWZpZWQgdGhhbgo+ID4gc2F5aW5nICd1bmRlZmluZWQnPwo+
IAo+IFRoYXQgd291bGQgY29tcGxpY2F0ZSBoYW5kbGluZyAocGVyaGFwcyBqdXN0IHNsaWdodGx5
LCBidXQgYW55d2F5KSwKPiBzaW5jZSB3ZSdkIGhhdmUgdG8gbWFpbnRhaW4gYSBzZWNvbmQgYm9v
bGVhbi4gV2l0aG91dCB0aGF0IHRoZQo+IG9yZGVyIG9uIHRoZSBjb21tYW5kIGxpbmUgZGV0ZXJt
aW5lcyBiZWhhdmlvci4gKEFuZCBJIHNlZSB0aGF0IGluCj4gdGhlIGVuZCB5b3UndmUgZmlndXJl
ZCB0aGF0IG91dC4pCj4gCj4gPj4gQEAgLTExOTgsNiArMTIwNCwzMiBAQCBkZXRlY3Rpb24gb2Yg
c3lzdGVtcyBrbm93biB0byBtaXNiZWhhdmUgdXBvbgo+ID4+IGFjY2Vzc2VzIHRvIHRoYXQgcG9y
dC4KPiA+PiAKPiA+PiAgPj4gRW5hYmxlIElPTU1VIGRlYnVnZ2luZyBjb2RlIChpbXBsaWVzIGB2
ZXJib3NlYCkuCj4gPj4gCj4gPj4gKyMjIyBkb20wLWlvbW11Cj4gPj4gKz4gYD0gTGlzdCBvZiBb
IG5vbmUgfCBzdHJpY3QgfCByZWxheGVkIF1gCj4gPj4gKwo+ID4+ICs+IFN1Yi1vcHRpb25zIGFy
ZSBvZiBib29sZWFuIGtpbmQgYW5kIGNhbiBiZSBwcmVmaXhlZCB3aXRoIGBuby1gIHRvIGVmZmVj
dAo+ID4+IHRoZQo+ID4+ICs+IGludmVyc2UgbWVhbmluZy4KPiA+IAo+ID4gbm90IGltcG9ydGFu
dCBjb21tZW50LCBidXQgZG9lc24ndCAibm8tbm9uZSIgc291bmQgd2VpcmQ/IDotKQo+IAo+IE9u
bHkgcG9zaXRpdmUgKHRydWUpIHZhbHVlcyBzaG91bGQgYmUgcGVybWl0dGVkIGZvciBJIHRoaW5r
IGFsbCBvZgo+IHRoZXNlLiBJIGRpZG4ndCBsb29rIGF0IHRoZSBwYXRjaCB5ZXMsIHNvIHBlcmhh
cHMgdGhhdCdzIGFscmVhZHkKPiB0aGUgY2FzZS4KCkZvciB0aGUgY3VycmVudCBzZXQgb2Ygb3B0
aW9ucyBpbnRyb2R1Y2VkIGluIHRoaXMgcGF0Y2ggbm9uZSwgc3RyaWN0Cm9yIHJlbGF4ZWQgaXQg
ZG9lc24ndCBtYWtlIG11Y2ggc2Vuc2UgdG8gYWxsb3cgdGhlIG5vLSBwcmVmaXguCgpGb3Igb3B0
aW9ucyBhZGRlZCBpbiBsYXRlciBwYXRjaGVzIChpbmNsdXNpdmUgYW5kIHJlc2VydmVkKSBpdCBt
YWtlcwpzZW5zZSB0byBhbGxvdyB0aGUgbm8tIHByZWZpeCwgc28gdGhhdCBhIHVzZXIgY2FuIGRv
Cidkb20wLWlvbW11PW5vLWluY2x1c2l2ZScgaW4gb3JkZXIgdG8gY2hhbmdlIHRoZSBkZWZhdWx0
IHZhbHVlLgoKSSB3aWxsIG1ha2UgaXQgY2xlYXIgd2hpY2ggb3B0aW9ucyBhbGxvdyB0aGUgbm8t
IHByZWZpeCwgYW5kIGFkZCB0aGUKY29kZSB0byBwYXJzZSBzdWNoIHByZWZpeCB3aGVuIGl0J3Mg
bmVlZGVkLgoKUm9nZXIuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRl
dmVs
