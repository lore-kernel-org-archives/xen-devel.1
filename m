From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH v7 3/6] iommu: make iommu_inclusive_mapping
 a suboption of dom0-iommu
Date: Wed, 22 Aug 2018 10:45:28 +0100
Message-ID: <20180822094528.leahcq53qdfdpes2@citrix.com>
References: <20180822075200.50278-1-roger.pau@citrix.com>
 <20180822075200.50278-4-roger.pau@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=om3v=lf=citrix.com=prvs=7650e4d92=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1fsPhm-0003Er-Aw
 for xen-devel@lists.xenproject.org; Wed, 22 Aug 2018 09:45:34 +0000
Content-Disposition: inline
In-Reply-To: <20180822075200.50278-4-roger.pau@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Kevin Tian <kevin.tian@intel.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>, xen-devel@lists.xenproject.org, Brian Woods <brian.woods@amd.com>
List-Id: xen-devel@lists.xenproject.org

T24gV2VkLCBBdWcgMjIsIDIwMTggYXQgMDk6NTE6NTdBTSArMDIwMCwgUm9nZXIgUGF1IE1vbm5l
IHdyb3RlOgo+IEludHJvZHVjZSBhIG5ldyBkb20wLWlvbW11PW1hcC1pbmNsdXNpdmUgZ2VuZXJp
YyBvcHRpb24gdGhhdAo+IHN1cGVyc2VkZXMgaW9tbXVfaW5jbHVzaXZlX21hcHBpbmcuIFRoZSBw
cmV2aW91cyBiZWhhdmlvciBpcyBwcmVzZXJ2ZWQKPiBhbmQgdGhlIG9wdGlvbiBzaG91bGQgb25s
eSBiZSBlbmFibGVkIGJ5IGRlZmF1bHQgb24gSW50ZWwgaGFyZHdhcmUuCj4gCj4gU2lnbmVkLW9m
Zi1ieTogUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+Cj4gUmV2aWV3ZWQt
Ynk6IFBhdWwgRHVycmFudCA8cGF1bC5kdXJyYW50QGNpdHJpeC5jb20+Cj4gUmV2aWV3ZWQtYnk6
IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KPiBSZXZpZXdlZC1ieTogS2V2aW4gVGlh
biA8a2V2aW4udGlhbkBpbnRlbC5jb20+CgpSZXZpZXdlZC1ieTogV2VpIExpdSA8d2VpLmxpdTJA
Y2l0cml4LmNvbT4KCldpdGggb25lIG5pdCBiZWxvdzoKCj4gZGlmZiAtLWdpdCBhL3hlbi9kcml2
ZXJzL3Bhc3N0aHJvdWdoL2FybS9zbW11LmMgYi94ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9hcm0v
c21tdS5jCj4gaW5kZXggNzRjMDliMDk5MS4uYjE0MjY3N2I4YyAxMDA2NDQKPiAtLS0gYS94ZW4v
ZHJpdmVycy9wYXNzdGhyb3VnaC9hcm0vc21tdS5jCj4gKysrIGIveGVuL2RyaXZlcnMvcGFzc3Ro
cm91Z2gvYXJtL3NtbXUuYwo+IEBAIC0yNzI3LDYgKzI3MjcsOCBAQCBzdGF0aWMgaW50IGFybV9z
bW11X2lvbW11X2RvbWFpbl9pbml0KHN0cnVjdCBkb21haW4gKmQpCj4gIAo+ICBzdGF0aWMgdm9p
ZCBfX2h3ZG9tX2luaXQgYXJtX3NtbXVfaW9tbXVfaHdkb21faW5pdChzdHJ1Y3QgZG9tYWluICpk
KQo+ICB7Cj4gKwkvKiBTZXQgdG8gZmFsc2Ugb3B0aW9ucyBub3Qgc3VwcG9ydGVkIG9uIEFSTS4g
Ki8KCk1pc3NpbmcgYSBjb21tYSBhZnRlciAiZmFsc2UiLgoKQW5kIGluIGNhc2UgaXQgaXMgbm90
IGNsZWFyIHRvIEp1bGllbiBhbmQgU3RlZmFubywgYW4gYWNrIGZyb20gQVJNIHNpZGUKaXMgbmVl
ZGVkLgoKV2VpLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcK
aHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
