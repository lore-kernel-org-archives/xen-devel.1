From: Julien Grall <julien.grall@arm.com>
Subject: Re: [PATCH v8 3/6] iommu: make iommu_inclusive_mapping
 a suboption of dom0-iommu
Date: Mon, 10 Sep 2018 12:30:15 +0100
Message-ID: <5890c887-cedb-79e6-6f6c-8661dc491ed1@arm.com>
References: <20180907090739.56652-1-roger.pau@citrix.com>
 <20180907090739.56652-4-roger.pau@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=502m=ly=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1fzKOa-0004LO-6T
 for xen-devel@lists.xenproject.org; Mon, 10 Sep 2018 11:30:20 +0000
In-Reply-To: <20180907090739.56652-4-roger.pau@citrix.com>
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
Cc: Kevin Tian <kevin.tian@intel.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Jan Beulich <jbeulich@suse.com>, Brian Woods <brian.woods@amd.com>
List-Id: xen-devel@lists.xenproject.org

SGkgUm9nZXIsCgpPbiAwNy8wOS8xOCAxMDowNywgUm9nZXIgUGF1IE1vbm5lIHdyb3RlOgo+IElu
dHJvZHVjZSBhIG5ldyBkb20wLWlvbW11PW1hcC1pbmNsdXNpdmUgZ2VuZXJpYyBvcHRpb24gdGhh
dAo+IHN1cGVyc2VkZXMgaW9tbXVfaW5jbHVzaXZlX21hcHBpbmcuIFRoZSBwcmV2aW91cyBiZWhh
dmlvciBpcyBwcmVzZXJ2ZWQKPiBhbmQgdGhlIG9wdGlvbiBzaG91bGQgb25seSBiZSBlbmFibGVk
IGJ5IGRlZmF1bHQgb24gSW50ZWwgaGFyZHdhcmUuCj4gCj4gU2lnbmVkLW9mZi1ieTogUm9nZXIg
UGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+Cj4gUmV2aWV3ZWQtYnk6IFBhdWwgRHVy
cmFudCA8cGF1bC5kdXJyYW50QGNpdHJpeC5jb20+Cj4gUmV2aWV3ZWQtYnk6IEphbiBCZXVsaWNo
IDxqYmV1bGljaEBzdXNlLmNvbT4KPiBSZXZpZXdlZC1ieTogS2V2aW4gVGlhbiA8a2V2aW4udGlh
bkBpbnRlbC5jb20+CgpGb3IgQXJtOgoKQWNrZWQtYnk6IEp1bGllbiBHcmFsbCA8anVsaWVuLmdy
YWxsQGFybS5jb20+CgpDaGVlcnMsCgotLSAKSnVsaWVuIEdyYWxsCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
