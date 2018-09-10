From: Julien Grall <julien.grall@arm.com>
Subject: Re: [PATCH v8 6/6] x86/iommu: add map-reserved
 dom0-iommu option to map reserved memory ranges
Date: Mon, 10 Sep 2018 12:31:15 +0100
Message-ID: <fc22526e-0831-b633-97b4-f167da6fe9c7@arm.com>
References: <20180907090739.56652-1-roger.pau@citrix.com>
 <20180907090739.56652-7-roger.pau@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=502m=ly=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1fzKPY-0004QP-9C
 for xen-devel@lists.xenproject.org; Mon, 10 Sep 2018 11:31:20 +0000
In-Reply-To: <20180907090739.56652-7-roger.pau@citrix.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Roger Pau Monne <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
Cc: Kevin Tian <kevin.tian@intel.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Paul Durrant <paul.durrant@citrix.com>, Jan Beulich <jbeulich@suse.com>, Brian Woods <brian.woods@amd.com>
List-Id: xen-devel@lists.xenproject.org

SGkgUm9nZXIsCgpPbiAwNy8wOS8xOCAxMDowNywgUm9nZXIgUGF1IE1vbm5lIHdyb3RlOgo+IFNl
dmVyYWwgcGVvcGxlIGhhdmUgcmVwb3J0ZWQgaGFyZHdhcmUgaXNzdWVzIChtYWxmdW5jdGlvbmlu
ZyBVU0IKPiBjb250cm9sbGVycykgZHVlIHRvIGlvbW11IHBhZ2UgZmF1bHRzIG9uIEludGVsIGhh
cmR3YXJlLiBUaG9zZSBmYXVsdHMKPiBhcmUgY2F1c2VkIGJ5IG1pc3NpbmcgUk1SUiAoVlRkKSBl
bnRyaWVzIGluIHRoZSBBQ1BJIHRhYmxlcy4gVGhvc2UgY2FuCj4gYmUgd29ya2VkIGFyb3VuZCBv
biBWVGQgaGFyZHdhcmUgYnkgbWFudWFsbHkgYWRkaW5nIFJNUlIgZW50cmllcyBvbgo+IHRoZSBj
b21tYW5kIGxpbmUsIHRoaXMgaXMgaG93ZXZlciBsaW1pdGVkIHRvIEludGVsIGhhcmR3YXJlIGFu
ZCBxdWl0ZQo+IGN1bWJlcnNvbWUgdG8gZG8uCj4gCj4gSW4gb3JkZXIgdG8gc29sdmUgdGhvc2Ug
aXNzdWVzIGFkZCBhIG5ldyBkb20wLWlvbW11PW1hcC1yZXNlcnZlZAo+IG9wdGlvbiB0aGF0IGlk
ZW50aXR5IG1hcHMgYWxsIHJlZ2lvbnMgbWFya2VkIGFzIHJlc2VydmVkIGluIHRoZSBtZW1vcnkK
PiBtYXAuIE5vdGUgdGhhdCByZWdpb25zIHVzZWQgYnkgZGV2aWNlcyBlbXVsYXRlZCBieSBYZW4g
KExBUElDLCBJTy1BUElDCj4gb3IgUENJZSBNQ0ZHIHJlZ2lvbnMpIGFyZSBzcGVjaWZpY2FsbHkg
YXZvaWRlZC4gTm90ZSB0aGF0IHRoaXMgb3B0aW9uCj4gaXMgYXZhaWxhYmxlIHRvIGFsbCBEb20w
IG1vZGVzIChhcyBvcHBvc2VkIHRvIHRoZSBpbmNsdXNpdmUgb3B0aW9uCj4gd2hpY2ggb25seSB3
b3JrcyBmb3IgUFYgRG9tMCkuCj4gCj4gU2lnbmVkLW9mZi1ieTogUm9nZXIgUGF1IE1vbm7DqSA8
cm9nZXIucGF1QGNpdHJpeC5jb20+Cj4gUmV2aWV3ZWQtYnk6IEtldmluIFRpYW4gPGtldmluLnRp
YW5AaW50ZWwuY29tPgo+IFJldmlld2VkLWJ5OiBXZWkgTGl1IDx3ZWkubGl1MkBjaXRyaXguY29t
Pgo+IEFja2VkLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+CgpGb3IgQXJtIGJp
dHM6CgpBY2tlZC1ieTogSnVsaWVuIEdyYWxsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4KCkNoZWVy
cywKCi0tIApKdWxpZW4gR3JhbGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94
ZW4tZGV2ZWw=
