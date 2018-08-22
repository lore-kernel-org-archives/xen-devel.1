From: "Tian, Kevin" <kevin.tian@intel.com>
Subject: Re: [PATCH v6 6/6] x86/iommu: add map-reserved
 dom0-iommu option to map reserved memory ranges
Date: Wed, 22 Aug 2018 02:02:09 +0000
Message-ID: <AADFC41AFE54684AB9EE6CBC0274A5D1912D36FE@SHSMSX101.ccr.corp.intel.com>
References: <20180821074944.38773-1-roger.pau@citrix.com>
 <20180821074944.38773-7-roger.pau@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=5ybv=lf=intel.com=kevin.tian@srs-us1.protection.inumbo.net>)
 id 1fsITX-000468-Lv
 for xen-devel@lists.xenproject.org; Wed, 22 Aug 2018 02:02:23 +0000
In-Reply-To: <20180821074944.38773-7-roger.pau@citrix.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Roger Pau Monne <roger.pau@citrix.com>, "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, Paul Durrant <paul.durrant@citrix.com>, Jan Beulich <jbeulich@suse.com>, Brian Woods <brian.woods@amd.com>
List-Id: xen-devel@lists.xenproject.org

PiBGcm9tOiBSb2dlciBQYXUgTW9ubmUgW21haWx0bzpyb2dlci5wYXVAY2l0cml4LmNvbV0NCj4g
U2VudDogVHVlc2RheSwgQXVndXN0IDIxLCAyMDE4IDM6NTAgUE0NCj4gDQo+IFNldmVyYWwgcGVv
cGxlIGhhdmUgcmVwb3J0ZWQgaGFyZHdhcmUgaXNzdWVzIChtYWxmdW5jdGlvbmluZyBVU0INCj4g
Y29udHJvbGxlcnMpIGR1ZSB0byBpb21tdSBwYWdlIGZhdWx0cyBvbiBJbnRlbCBoYXJkd2FyZS4g
VGhvc2UgZmF1bHRzDQo+IGFyZSBjYXVzZWQgYnkgbWlzc2luZyBSTVJSIChWVGQpIGVudHJpZXMg
aW4gdGhlIEFDUEkgdGFibGVzLiBUaG9zZSBjYW4NCj4gYmUgd29ya2VkIGFyb3VuZCBvbiBWVGQg
aGFyZHdhcmUgYnkgbWFudWFsbHkgYWRkaW5nIFJNUlIgZW50cmllcyBvbg0KPiB0aGUgY29tbWFu
ZCBsaW5lLCB0aGlzIGlzIGhvd2V2ZXIgbGltaXRlZCB0byBJbnRlbCBoYXJkd2FyZSBhbmQgcXVp
dGUNCj4gY3VtYmVyc29tZSB0byBkby4NCj4gDQo+IEluIG9yZGVyIHRvIHNvbHZlIHRob3NlIGlz
c3VlcyBhZGQgYSBuZXcgZG9tMC1pb21tdT1tYXAtcmVzZXJ2ZWQNCj4gb3B0aW9uIHRoYXQgaWRl
bnRpdHkgbWFwcyBhbGwgcmVnaW9ucyBtYXJrZWQgYXMgcmVzZXJ2ZWQgaW4gdGhlIG1lbW9yeQ0K
PiBtYXAuIE5vdGUgdGhhdCByZWdpb25zIHVzZWQgYnkgZGV2aWNlcyBlbXVsYXRlZCBieSBYZW4g
KExBUElDLA0KPiBJTy1BUElDIG9yIFBDSWUgTUNGRyByZWdpb25zKSBhcmUgc3BlY2lmaWNhbGx5
IGF2b2lkZWQuIE5vdGUgdGhhdCB0aGlzDQo+IG9wdGlvbiBpcyBhdmFpbGFibGUgdG8gYSBQVkgg
RG9tMCAoYXMgb3Bwb3NlZCB0byB0aGUgaW5jbHVzaXZlIG9wdGlvbg0KPiB3aGljaCBvbmx5IHdv
cmtzIGZvciBQViBEb20wKS4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IFJvZ2VyIFBhdSBNb25uw6kg
PHJvZ2VyLnBhdUBjaXRyaXguY29tPg0KDQpSZXZpZXdlZC1ieTogS2V2aW4gVGlhbiA8a2V2aW4u
dGlhbkBpbnRlbC5jb20+DQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRl
dmVs
