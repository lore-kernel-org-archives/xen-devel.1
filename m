From: George Dunlap <george.dunlap@citrix.com>
Subject: Re: [PATCH v14 8/9] mm / iommu: include need_iommu()
 test in iommu_use_hap_pt()
Date: Thu, 4 Oct 2018 17:23:50 +0100
Message-ID: <f3bc516e-4e9c-b857-c0c8-49872f8af055@citrix.com>
References: <20181004104547.32316-1-paul.durrant@citrix.com>
 <20181004104547.32316-9-paul.durrant@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=wqag=mq=citrix.com=prvs=8089523ff=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1g86Pq-0002ZA-C1
 for xen-devel@lists.xenproject.org; Thu, 04 Oct 2018 16:23:54 +0000
In-Reply-To: <20181004104547.32316-9-paul.durrant@citrix.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Paul Durrant <paul.durrant@citrix.com>, xen-devel@lists.xenproject.org
Cc: George Dunlap <george.dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>, Jan Beulich <jbeulich@suse.com>, Jun Nakajima <jun.nakajima@intel.com>
List-Id: xen-devel@lists.xenproject.org

T24gMTAvMDQvMjAxOCAxMTo0NSBBTSwgUGF1bCBEdXJyYW50IHdyb3RlOgo+IFRoZSBuYW1lICdp
b21tdV91c2VfaGFwX3B0JyBzdWdnZXN0cyB0aGF0IHRoYXQgUDJNIHRhYmxlIGlzIGluIHVzZSBh
cyB0aGUKPiBkb21haW4ncyBJT01NVSBwYWdldGFibGUgd2hpY2gsIHByaW9yIHRvIHRoaXMgcGF0
Y2gsIGlzIG5vdCBzdHJpY3RseSB0cnVlCj4gc2luY2UgdGhlIG1hY3JvIGRpZCBub3QgdGVzdCB3
aGV0aGVyIHRoZSBkb21haW4gYWN0dWFsbHkgaGFzIElPTU1VCj4gbWFwcGluZ3MuCj4gCj4gU2ln
bmVkLW9mZi1ieTogUGF1bCBEdXJyYW50IDxwYXVsLmR1cnJhbnRAY2l0cml4LmNvbT4KPiBSZXZp
ZXdlZC1ieTogS2V2aW4gVGlhbiA8a2V2aW4udGlhbkBpbnRlbC5jb20+Cj4gQWNrZWQtYnk6IEp1
bGllbiBHcmFsbCA8anVsaWVuLmdyYWxsQGFybS5jb20+CgpBY2tlZC1ieTogR2VvcmdlIER1bmxh
cCA8Z2VvcmdlLmR1bmxhcEBjaXRyaXguY29tPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3hlbi1kZXZlbA==
