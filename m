From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH v7 6/6] x86/iommu: add map-reserved
 dom0-iommu option to map reserved memory ranges
Date: Wed, 22 Aug 2018 10:45:50 +0100
Message-ID: <20180822094550.vlnkck2tbhlxmeir@citrix.com>
References: <20180822075200.50278-1-roger.pau@citrix.com>
 <20180822075200.50278-7-roger.pau@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=om3v=lf=citrix.com=prvs=7650e4d92=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1fsPi6-0003Jb-HX
 for xen-devel@lists.xenproject.org; Wed, 22 Aug 2018 09:45:54 +0000
Content-Disposition: inline
In-Reply-To: <20180822075200.50278-7-roger.pau@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Kevin Tian <kevin.tian@intel.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, Paul Durrant <paul.durrant@citrix.com>, Jan Beulich <jbeulich@suse.com>, xen-devel@lists.xenproject.org, Brian Woods <brian.woods@amd.com>
List-Id: xen-devel@lists.xenproject.org

T24gV2VkLCBBdWcgMjIsIDIwMTggYXQgMDk6NTI6MDBBTSArMDIwMCwgUm9nZXIgUGF1IE1vbm5l
IHdyb3RlOgo+IFNldmVyYWwgcGVvcGxlIGhhdmUgcmVwb3J0ZWQgaGFyZHdhcmUgaXNzdWVzICht
YWxmdW5jdGlvbmluZyBVU0IKPiBjb250cm9sbGVycykgZHVlIHRvIGlvbW11IHBhZ2UgZmF1bHRz
IG9uIEludGVsIGhhcmR3YXJlLiBUaG9zZSBmYXVsdHMKPiBhcmUgY2F1c2VkIGJ5IG1pc3Npbmcg
Uk1SUiAoVlRkKSBlbnRyaWVzIGluIHRoZSBBQ1BJIHRhYmxlcy4gVGhvc2UgY2FuCj4gYmUgd29y
a2VkIGFyb3VuZCBvbiBWVGQgaGFyZHdhcmUgYnkgbWFudWFsbHkgYWRkaW5nIFJNUlIgZW50cmll
cyBvbgo+IHRoZSBjb21tYW5kIGxpbmUsIHRoaXMgaXMgaG93ZXZlciBsaW1pdGVkIHRvIEludGVs
IGhhcmR3YXJlIGFuZCBxdWl0ZQo+IGN1bWJlcnNvbWUgdG8gZG8uCj4gCj4gSW4gb3JkZXIgdG8g
c29sdmUgdGhvc2UgaXNzdWVzIGFkZCBhIG5ldyBkb20wLWlvbW11PW1hcC1yZXNlcnZlZAo+IG9w
dGlvbiB0aGF0IGlkZW50aXR5IG1hcHMgYWxsIHJlZ2lvbnMgbWFya2VkIGFzIHJlc2VydmVkIGlu
IHRoZSBtZW1vcnkKPiBtYXAuIE5vdGUgdGhhdCByZWdpb25zIHVzZWQgYnkgZGV2aWNlcyBlbXVs
YXRlZCBieSBYZW4gKExBUElDLCBJTy1BUElDCj4gb3IgUENJZSBNQ0ZHIHJlZ2lvbnMpIGFyZSBz
cGVjaWZpY2FsbHkgYXZvaWRlZC4gTm90ZSB0aGF0IHRoaXMgb3B0aW9uCj4gaXMgYXZhaWxhYmxl
IHRvIGFsbCBEb20wIG1vZGVzIChhcyBvcHBvc2VkIHRvIHRoZSBpbmNsdXNpdmUgb3B0aW9uCj4g
d2hpY2ggb25seSB3b3JrcyBmb3IgUFYgRG9tMCkuCj4gCj4gU2lnbmVkLW9mZi1ieTogUm9nZXIg
UGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+Cj4gUmV2aWV3ZWQtYnk6IEtldmluIFRp
YW4gPGtldmluLnRpYW5AaW50ZWwuY29tPgoKUmV2aWV3ZWQtYnk6IFdlaSBMaXUgPHdlaS5saXUy
QGNpdHJpeC5jb20+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9y
ZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
