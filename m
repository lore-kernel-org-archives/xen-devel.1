From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v7 6/6] x86/iommu: add map-reserved
 dom0-iommu option to map reserved memory ranges
Date: Tue, 28 Aug 2018 09:18:00 -0600
Message-ID: <5B8567A802000078001E2A9B@prv1-mh.provo.novell.com>
References: <20180822075200.50278-1-roger.pau@citrix.com>
 <20180822075200.50278-7-roger.pau@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=k/hy=ll=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1fufkt-0002RI-E1
 for xen-devel@lists.xenproject.org; Tue, 28 Aug 2018 15:18:07 +0000
In-Reply-To: <20180822075200.50278-7-roger.pau@citrix.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Kevin Tian <kevin.tian@intel.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, Paul Durrant <paul.durrant@citrix.com>, Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>, xen-devel <xen-devel@lists.xenproject.org>, Brian Woods <brian.woods@amd.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDIyLjA4LjE4IGF0IDA5OjUyLCA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdyb3RlOgo+
IFNldmVyYWwgcGVvcGxlIGhhdmUgcmVwb3J0ZWQgaGFyZHdhcmUgaXNzdWVzIChtYWxmdW5jdGlv
bmluZyBVU0IKPiBjb250cm9sbGVycykgZHVlIHRvIGlvbW11IHBhZ2UgZmF1bHRzIG9uIEludGVs
IGhhcmR3YXJlLiBUaG9zZSBmYXVsdHMKPiBhcmUgY2F1c2VkIGJ5IG1pc3NpbmcgUk1SUiAoVlRk
KSBlbnRyaWVzIGluIHRoZSBBQ1BJIHRhYmxlcy4gVGhvc2UgY2FuCj4gYmUgd29ya2VkIGFyb3Vu
ZCBvbiBWVGQgaGFyZHdhcmUgYnkgbWFudWFsbHkgYWRkaW5nIFJNUlIgZW50cmllcyBvbgo+IHRo
ZSBjb21tYW5kIGxpbmUsIHRoaXMgaXMgaG93ZXZlciBsaW1pdGVkIHRvIEludGVsIGhhcmR3YXJl
IGFuZCBxdWl0ZQo+IGN1bWJlcnNvbWUgdG8gZG8uCj4gCj4gSW4gb3JkZXIgdG8gc29sdmUgdGhv
c2UgaXNzdWVzIGFkZCBhIG5ldyBkb20wLWlvbW11PW1hcC1yZXNlcnZlZAo+IG9wdGlvbiB0aGF0
IGlkZW50aXR5IG1hcHMgYWxsIHJlZ2lvbnMgbWFya2VkIGFzIHJlc2VydmVkIGluIHRoZSBtZW1v
cnkKPiBtYXAuIE5vdGUgdGhhdCByZWdpb25zIHVzZWQgYnkgZGV2aWNlcyBlbXVsYXRlZCBieSBY
ZW4gKExBUElDLCBJTy1BUElDCj4gb3IgUENJZSBNQ0ZHIHJlZ2lvbnMpIGFyZSBzcGVjaWZpY2Fs
bHkgYXZvaWRlZC4gTm90ZSB0aGF0IHRoaXMgb3B0aW9uCj4gaXMgYXZhaWxhYmxlIHRvIGFsbCBE
b20wIG1vZGVzIChhcyBvcHBvc2VkIHRvIHRoZSBpbmNsdXNpdmUgb3B0aW9uCj4gd2hpY2ggb25s
eSB3b3JrcyBmb3IgUFYgRG9tMCkuCj4gCj4gU2lnbmVkLW9mZi1ieTogUm9nZXIgUGF1IE1vbm7D
qSA8cm9nZXIucGF1QGNpdHJpeC5jb20+Cj4gUmV2aWV3ZWQtYnk6IEtldmluIFRpYW4gPGtldmlu
LnRpYW5AaW50ZWwuY29tPgoKQWNrZWQtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNv
bT4KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4t
ZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczov
L2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
