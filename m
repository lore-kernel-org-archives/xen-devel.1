From: "Tian, Kevin" <kevin.tian@intel.com>
Subject: Re: [PATCH v5 03/15] iommu: make use of type-safe BFN
 and MFN in exported functions
Date: Tue, 7 Aug 2018 02:45:27 +0000
Message-ID: <AADFC41AFE54684AB9EE6CBC0274A5D1912AC08F@SHSMSX101.ccr.corp.intel.com>
References: <20180803172220.1657-1-paul.durrant@citrix.com>
 <20180803172220.1657-4-paul.durrant@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=tozp=kw=intel.com=kevin.tian@srs-us1.protection.inumbo.net>)
 id 1fms0F-0004ag-DA
 for xen-devel@lists.xenproject.org; Tue, 07 Aug 2018 02:45:43 +0000
In-Reply-To: <20180803172220.1657-4-paul.durrant@citrix.com>
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, "Nakajima,
 Jun" <jun.nakajima@intel.com>, George Dunlap <george.dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>
List-Id: xen-devel@lists.xenproject.org

PiBGcm9tOiBQYXVsIER1cnJhbnQgW21haWx0bzpwYXVsLmR1cnJhbnRAY2l0cml4LmNvbV0KPiBT
ZW50OiBTYXR1cmRheSwgQXVndXN0IDQsIDIwMTggMToyMiBBTQo+IAo+IFRoaXMgcGF0Y2ggbW9k
aWZpZXMgdGhlIGRlY2xhcmF0aW9uIG9mIHRoZSBlbnRyeSBwb2ludHMgdG8gdGhlIElPTU1VCj4g
c3ViLXN5c3RlbSB0byB1c2UgYmZuX3QgYW5kIG1mbl90IGluIHBsYWNlIG9mIHVuc2lnbmVkIGxv
bmcuIEEgc3Vic2VxdWVudAo+IHBhdGNoIHdpbGwgc2ltaWxhcmx5IG1vZGlmeSB0aGUgbWV0aG9k
cyBpbiB0aGUgaW9tbXVfb3BzIHN0cnVjdHVyZS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBQYXVsIER1
cnJhbnQgPHBhdWwuZHVycmFudEBjaXRyaXguY29tPgo+IFJldmlld2VkLWJ5OiBXZWkgTGl1IDx3
ZWkubGl1MkBjaXRyaXguY29tPgoKUmV2aWV3ZWQtYnk6IEtldmluIFRpYW4gPGtldmluLnRpYW5A
aW50ZWwuY29tPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcK
aHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
