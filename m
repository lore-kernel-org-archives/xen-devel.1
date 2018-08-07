From: "Tian, Kevin" <kevin.tian@intel.com>
Subject: Re: [PATCH v5 10/15] mm / iommu: include need_iommu()
 test in iommu_use_hap_pt()
Date: Tue, 7 Aug 2018 03:32:23 +0000
Message-ID: <AADFC41AFE54684AB9EE6CBC0274A5D1912AC1F0@SHSMSX101.ccr.corp.intel.com>
References: <20180803172220.1657-1-paul.durrant@citrix.com>
 <20180803172220.1657-11-paul.durrant@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=tozp=kw=intel.com=kevin.tian@srs-us1.protection.inumbo.net>)
 id 1fmsjj-0000lt-Lu
 for xen-devel@lists.xenproject.org; Tue, 07 Aug 2018 03:32:43 +0000
In-Reply-To: <20180803172220.1657-11-paul.durrant@citrix.com>
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
 Jun" <jun.nakajima@intel.com>, George Dunlap <george.dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>
List-Id: xen-devel@lists.xenproject.org

PiBGcm9tOiBQYXVsIER1cnJhbnQgW21haWx0bzpwYXVsLmR1cnJhbnRAY2l0cml4LmNvbV0KPiBT
ZW50OiBTYXR1cmRheSwgQXVndXN0IDQsIDIwMTggMToyMiBBTQo+IAo+IFRoZSBuYW1lICdpb21t
dV91c2VfaGFwX3B0JyBzdWdnZXN0cyB0aGF0IHRoYXQgUDJNIHRhYmxlIGlzIGluIHVzZSBhcwo+
IHRoZQo+IGRvbWFpbidzIElPTU1VIHBhZ2V0YWJsZSB3aGljaCwgcHJpb3IgdG8gdGhpcyBwYXRj
aCwgaXMgbm90IHN0cmljdGx5IHRydWUKPiBzaW5jZSB0aGUgbWFjcm8gZGlkIG5vdCB0ZXN0IHdo
ZXRoZXIgdGhlIGRvbWFpbiBhY3R1YWxseSBoYXMgSU9NTVUKPiBtYXBwaW5ncy4KPiAKPiBTaWdu
ZWQtb2ZmLWJ5OiBQYXVsIER1cnJhbnQgPHBhdWwuZHVycmFudEBjaXRyaXguY29tPgoKUmV2aWV3
ZWQtYnk6IEtldmluIFRpYW4gPGtldmluLnRpYW5AaW50ZWwuY29tPgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApY
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
