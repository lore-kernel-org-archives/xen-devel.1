From: "Tian, Kevin" <kevin.tian@intel.com>
Subject: Re: [PATCH v3 2/2] VT-d: reconcile
 iommu_inclusive_mapping and iommu=dom0-strict
Date: Thu, 21 Jun 2018 07:21:21 +0000
Message-ID: <AADFC41AFE54684AB9EE6CBC0274A5D191220351@SHSMSX101.ccr.corp.intel.com>
References: <20180615163105.19097-1-paul.durrant@citrix.com>
 <20180615163105.19097-3-paul.durrant@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=oob8=jh=intel.com=kevin.tian@srs-us1.protection.inumbo.net>)
 id 1fVtuI-00040g-UF
 for xen-devel@lists.xenproject.org; Thu, 21 Jun 2018 07:21:26 +0000
In-Reply-To: <20180615163105.19097-3-paul.durrant@citrix.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Paul Durrant <paul.durrant@citrix.com>, "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>
List-Id: xen-devel@lists.xenproject.org

PiBGcm9tOiBQYXVsIER1cnJhbnQgW21haWx0bzpwYXVsLmR1cnJhbnRAY2l0cml4LmNvbV0KPiBT
ZW50OiBTYXR1cmRheSwgSnVuZSAxNiwgMjAxOCAxMjozMSBBTQo+IAo+IFRoZSBkb2N1bWVudGF0
aW9uIGZvciB0aGUgaW9tbXVfaW5jbHVzaXZlX21hcHBpbmcgWGVuIGNvbW1hbmQgbGluZQo+IG9w
dGlvbgo+IHN0YXRlczoKPiAKPiAiVXNlIHRoaXMgdG8gd29yayBhcm91bmQgZmlybXdhcmUgaXNz
dWVzIHByb3ZpZGluZyBpbmNvcnJlY3QgUk1SUgo+IGVudHJpZXMiCj4gCj4gVW5mb3J0dW5hdGVs
eSB0aGlzIHdvcmthcm91bmQgZG9lcyBub3QgZnVuY3Rpb24gY29ycmVjdGx5IGlmIHRoZSBkb20w
LQo+IHN0cmljdAo+IGlvbW11IG9wdGlvbiBpcyBhbHNvIHNwZWNpZmllZC4KPiAKPiBUaGUgZG9j
dW1lbnRhdGlvbiBnb2VzIG9uIHRvIHNheToKPiAKPiAiUmF0aGVyIHRoYW4gb25seSBtYXBwaW5n
IFJBTSBwYWdlcyBmb3IgSU9NTVUgYWNjZXNzZXMgZm9yIERvbTAsIHdpdGgKPiB0aGlzCj4gIG9w
dGlvbiBhbGwgcGFnZXMgdXAgdG8gNEdCLCBub3QgbWFya2VkIGFzIHVudXNhYmxlIGluIHRoZSBF
ODIwIHRhYmxlLCB3aWxsCj4gIGdldCBhIG1hcHBpbmcgZXN0YWJsaXNoZWQuIgo+IAo+IFRoaXMg
cGF0Y2ggbW9kaWZpZXMgdGhlIFZULWQgaGFyZHdhcmUgZG9tYWluIGluaXRpYWxpemF0aW9uIGNv
ZGUgc3VjaCB0aGF0Cj4gdGhlIHdvcmthcm91bmQgd2lsbCBjb250aW51ZSB0byBmdW5jdGlvbiBp
biBkb20wLXN0cmljdCBtb2RlLCBieSBtYXBwaW5nCj4gYWxsIHBhZ2VzIG5vdCBtYXJrZWQgYXMg
dW51c2FibGUgKnVubGVzcyogdGhleSBhcmUgUkFNIHBhZ2VzIG5vdAo+IGFzc2lnbmVkCj4gdG8g
ZG9tMC4KPiAKPiBOT1RFOiBUaGlzIHBhdGNoIG1vZGlmaWVzIHRoZSB0ZXN0IGluIGRyaXZlcnMv
cGFzc3Rocm91Z2gvdnRkL2lvbW11LmMKPiBmcm9tCj4gICAgICAgbmVlZF9pb21tdSgpIHRvIGlz
X3B2X2RvbWFpbigpIHNpbmNlIGRvbTAtc3RyaWN0IGltcGxpZXMKPiBuZWVkX2lvbW11KCkKPiAg
ICAgICBzbyB3ZSBubyBsb25nZXIgd2FudCB0byBnYXRlIGludm9jYXRpb24gb2QgdnRkX3NldF9o
d2RvbV9tYXBwaW5nKCkKCm9kLT5vZgoKPiAgICAgICBvbiB0aGF0Lgo+ICAgICAgIEl0IGFsc28g
ZXhwb3J0cyB0aGUgaW9tbXVfZG9tMF9zdHJpY3QgZmxhZyBzbyB0aGF0IHRoZSBpbXBsZW1lbnRh
dGlvbgo+ICAgICAgIG9mIHZ0ZF9zZXRfaHdkb21fbWFwcGluZygpIGNhbiB0ZXN0IGl0IGV4cGxp
Y2l0bHkuIEl0IHdvdWxkIGJlCj4gICAgICAgcG9zc2libGUgdG8gdGVzdCBuZWVkX2lvbW11KCkg
aW5zdGVhZCwgYnV0IGl0IGlzIG1vcmUgaWxsdXN0cmF0aXZlCj4gICAgICAgdG8gdGVzdCB0aGUg
b3JpZ2luYWwgZmxhZyByYXRoZXIgdGhhbiBvbmUgb2YgaXRzIHNpZGUtZWZmZWN0cy4KPiAKPiBT
aWduZWQtb2ZmLWJ5OiBQYXVsIER1cnJhbnQgPHBhdWwuZHVycmFudEBjaXRyaXguY29tPgo+IFJl
dmlld2VkLWJ5OiBSb2dlciBQYXUgTW9ubmUgPHJvZ2VyLnBhdUBjaXRyaXguY29tPgoKQWNrZWQt
Ynk6IEtldmluIFRpYW4gPGtldmluLnRpYW5AaW50ZWwuY29tPgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
