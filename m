From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Re: [PATCH v2 2/2] VT-d: reconcile
 iommu_inclusive_mapping and iommu=dom0-strict
Date: Wed, 13 Jun 2018 10:15:35 +0200
Message-ID: <20180613081535.ok5addptq6crlm5u@mac>
References: <20180612134734.22132-1-paul.durrant@citrix.com>
 <20180612134734.22132-3-paul.durrant@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=v0sd=i7=citrix.com=prvs=695654bf1=roger.pau@srs-us1.protection.inumbo.net>)
 id 1fT0wS-0006ao-Hv
 for xen-devel@lists.xenproject.org; Wed, 13 Jun 2018 08:15:44 +0000
Content-Disposition: inline
In-Reply-To: <20180612134734.22132-3-paul.durrant@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Paul Durrant <paul.durrant@citrix.com>
Cc: Kevin Tian <kevin.tian@intel.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

T24gVHVlLCBKdW4gMTIsIDIwMTggYXQgMDI6NDc6MzRQTSArMDEwMCwgUGF1bCBEdXJyYW50IHdy
b3RlOgo+IFRoZSBkb2N1bWVudGF0aW9uIGZvciB0aGUgaW9tbXVfaW5jbHVzaXZlX21hcHBpbmcg
WGVuIGNvbW1hbmQgbGluZSBvcHRpb24KPiBzdGF0ZXM6Cj4gCj4gIlVzZSB0aGlzIHRvIHdvcmsg
YXJvdW5kIGZpcm13YXJlIGlzc3VlcyBwcm92aWRpbmcgaW5jb3JyZWN0IFJNUlIgZW50cmllcyIK
PiAKPiBVbmZvcnR1bmF0ZWx5IHRoaXMgd29ya2Fyb3VuZCBkb2VzIG5vdCBmdW5jdGlvbiBjb3Jy
ZWN0bHkgaWYgdGhlIGRvbTAtc3RyaWN0Cj4gaW9tbXUgb3B0aW9uIGlzIGFsc28gc3BlY2lmaWVk
Lgo+IAo+IFRoZSBkb2N1bWVudGF0aW9uIGdvZXMgb24gdG8gc2F5Ogo+IAo+ICJSYXRoZXIgdGhh
biBvbmx5IG1hcHBpbmcgUkFNIHBhZ2VzIGZvciBJT01NVSBhY2Nlc3NlcyBmb3IgRG9tMCwgd2l0
aCB0aGlzCj4gIG9wdGlvbiBhbGwgcGFnZXMgdXAgdG8gNEdCLCBub3QgbWFya2VkIGFzIHVudXNh
YmxlIGluIHRoZSBFODIwIHRhYmxlLCB3aWxsCj4gIGdldCBhIG1hcHBpbmcgZXN0YWJsaXNoZWQu
Igo+IAo+IFRoaXMgcGF0Y2ggbW9kaWZpZXMgdGhlIFZULWQgaGFyZHdhcmUgZG9tYWluIGluaXRp
YWxpemF0aW9uIGNvZGUgc3VjaCB0aGF0Cj4gdGhlIHdvcmthcm91bmQgd2lsbCBjb250aW51ZSB0
byBmdW5jdGlvbiBpbiBkb20wLXN0cmljdCBtb2RlLCBieSBtYXBwaW5nCj4gYWxsIHBhZ2VzIG5v
dCBtYXJrZWQgYXMgdW51c2FibGUgKnVubGVzcyogdGhleSBhcmUgUkFNIHBhZ2VzIG5vdCBhc3Np
Z25lZAo+IHRvIGRvbTAuCj4gCj4gU2lnbmVkLW9mZi1ieTogUGF1bCBEdXJyYW50IDxwYXVsLmR1
cnJhbnRAY2l0cml4LmNvbT4KClJldmlld2VkLWJ5OiBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5w
YXVAY2l0cml4LmNvbT4KClRoYW5rcywgUm9nZXIuCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs
