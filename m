From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Re: [PATCH v7 3/6] iommu: make iommu_inclusive_mapping
 a suboption of dom0-iommu
Date: Fri, 24 Aug 2018 12:30:22 +0200
Message-ID: <20180824103022.ks7mo54t3trji7vb@mac>
References: <20180822075200.50278-1-roger.pau@citrix.com>
 <20180822075200.50278-4-roger.pau@citrix.com>
 <20180822094528.leahcq53qdfdpes2@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=npre=lh=citrix.com=prvs=76755a058=roger.pau@srs-us1.protection.inumbo.net>)
 id 1ft9MP-0000ZM-Ua
 for xen-devel@lists.xenproject.org; Fri, 24 Aug 2018 10:30:33 +0000
Content-Disposition: inline
In-Reply-To: <20180822094528.leahcq53qdfdpes2@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Wei Liu <wei.liu2@citrix.com>
Cc: Kevin Tian <kevin.tian@intel.com>, Stefano Stabellini <sstabellini@kernel.org>, Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>, xen-devel@lists.xenproject.org, Brian Woods <brian.woods@amd.com>
List-Id: xen-devel@lists.xenproject.org

T24gV2VkLCBBdWcgMjIsIDIwMTggYXQgMTA6NDU6MjhBTSArMDEwMCwgV2VpIExpdSB3cm90ZToK
PiBPbiBXZWQsIEF1ZyAyMiwgMjAxOCBhdCAwOTo1MTo1N0FNICswMjAwLCBSb2dlciBQYXUgTW9u
bmUgd3JvdGU6Cj4gPiBJbnRyb2R1Y2UgYSBuZXcgZG9tMC1pb21tdT1tYXAtaW5jbHVzaXZlIGdl
bmVyaWMgb3B0aW9uIHRoYXQKPiA+IHN1cGVyc2VkZXMgaW9tbXVfaW5jbHVzaXZlX21hcHBpbmcu
IFRoZSBwcmV2aW91cyBiZWhhdmlvciBpcyBwcmVzZXJ2ZWQKPiA+IGFuZCB0aGUgb3B0aW9uIHNo
b3VsZCBvbmx5IGJlIGVuYWJsZWQgYnkgZGVmYXVsdCBvbiBJbnRlbCBoYXJkd2FyZS4KPiA+IAo+
ID4gU2lnbmVkLW9mZi1ieTogUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+
Cj4gPiBSZXZpZXdlZC1ieTogUGF1bCBEdXJyYW50IDxwYXVsLmR1cnJhbnRAY2l0cml4LmNvbT4K
PiA+IFJldmlld2VkLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+Cj4gPiBSZXZp
ZXdlZC1ieTogS2V2aW4gVGlhbiA8a2V2aW4udGlhbkBpbnRlbC5jb20+Cj4gCj4gUmV2aWV3ZWQt
Ynk6IFdlaSBMaXUgPHdlaS5saXUyQGNpdHJpeC5jb20+Cj4gCj4gV2l0aCBvbmUgbml0IGJlbG93
Ogo+IAo+ID4gZGlmZiAtLWdpdCBhL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL2FybS9zbW11LmMg
Yi94ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9hcm0vc21tdS5jCj4gPiBpbmRleCA3NGMwOWIwOTkx
Li5iMTQyNjc3YjhjIDEwMDY0NAo+ID4gLS0tIGEveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvYXJt
L3NtbXUuYwo+ID4gKysrIGIveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvYXJtL3NtbXUuYwo+ID4g
QEAgLTI3MjcsNiArMjcyNyw4IEBAIHN0YXRpYyBpbnQgYXJtX3NtbXVfaW9tbXVfZG9tYWluX2lu
aXQoc3RydWN0IGRvbWFpbiAqZCkKPiA+ICAKPiA+ICBzdGF0aWMgdm9pZCBfX2h3ZG9tX2luaXQg
YXJtX3NtbXVfaW9tbXVfaHdkb21faW5pdChzdHJ1Y3QgZG9tYWluICpkKQo+ID4gIHsKPiA+ICsJ
LyogU2V0IHRvIGZhbHNlIG9wdGlvbnMgbm90IHN1cHBvcnRlZCBvbiBBUk0uICovCj4gCj4gTWlz
c2luZyBhIGNvbW1hIGFmdGVyICJmYWxzZSIuCgpJdCBzZWVtcyB3ZWlyZCB0byBtZSB0byBhZGQg
YSBjb21tYSB0aGVyZSwgYXQgbGVhc3QgaWYgSSB3YXMgdG8gcmVhZAp0aGUgc2VudGVuY2UgSSB3
b24ndCBtYWtlIGEgcGF1c2UgdGhlcmUuCgpUaGFua3MsIFJvZ2VyLgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApY
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
