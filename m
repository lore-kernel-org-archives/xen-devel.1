From: Razvan Cojocaru <rcojocaru@bitdefender.com>
Subject: Re: [PATCH v5 11/15] mm / iommu: split need_iommu()
 into has_iommu_pt() and sync_iommu_pt()
Date: Fri, 3 Aug 2018 21:18:20 +0300
Message-ID: <d9529c83-14fc-e6e0-89f6-ed2afb19e936@bitdefender.com>
References: <20180803172220.1657-1-paul.durrant@citrix.com>
 <20180803172220.1657-12-paul.durrant@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=uaiv=ks=bitdefender.com=rcojocaru@srs-us1.protection.inumbo.net>)
 id 1fleep-0004Fm-PU
 for xen-devel@lists.xenproject.org; Fri, 03 Aug 2018 18:18:35 +0000
Received: from mx-sr.buh.bitdefender.com (mx-sr.buh.bitdefender.biz
 [10.17.80.103])
 by mx01.bbu.dsd.mx.bitdefender.com (Postfix) with ESMTPS id 82023307FB33
 for <xen-devel@lists.xenproject.org>; Fri,  3 Aug 2018 22:34:49 +0300 (EEST)
Received: from smtp01.buh.bitdefender.com (unknown [10.17.80.75])
 by mx-sr.buh.bitdefender.com (Postfix) with ESMTP id 6DD4E7FE70
 for <xen-devel@lists.xenproject.org>; Fri,  3 Aug 2018 21:18:31 +0300 (EEST)
In-Reply-To: <20180803172220.1657-12-paul.durrant@citrix.com>
Content-Language: en-GB-large
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Paul Durrant <paul.durrant@citrix.com>, xen-devel@lists.xenproject.org
Cc: Kevin Tian <kevin.tian@intel.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Jan Beulich <jbeulich@suse.com>, George Dunlap <george.dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, Tamas K Lengyel <tamas@tklengyel.com>, Jun Nakajima <jun.nakajima@intel.com>, Brian Woods <brian.woods@amd.com>, Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>
List-Id: xen-devel@lists.xenproject.org

T24gMDgvMDMvMjAxOCAwODoyMiBQTSwgUGF1bCBEdXJyYW50IHdyb3RlOgo+IFRoZSBuYW1lICdu
ZWVkX2lvbW11JyBpcyBhIGxpdHRsZSBjb25mdXNpbmcgYXMgaXQgc3VnZ2VzdHMgYSBkb21haW4g
bmVlZHMKPiB0byB1c2UgdGhlIElPTU1VIGJ1dCBzb21ldGhpbmcgbWlnaHQgbm90IGJlIHNldCB1
cCB5ZXQsIHdoZW4gaW4gZmFjdCBpdAo+IGRvZXNuJ3QgYmVjb21lIHRydWUgdW50aWwgSU9NTVUg
bWFwcGluZ3MgZm9yIHRoZSBkb21haW4gaGF2ZSBiZWVuIGNyZWF0ZWQuCj4gCj4gVHdvIGRpZmZl
cmVudCBtZWFuaW5ncyBhcmUgYWxzbyBpbmZlcnJlZCBmcm9tIGl0IGluIHZhcmlvdXMgcGxhY2Vz
IGluIHRoZQo+IGNvZGU6Cj4gCj4gLSBTb21lIGNhbGxlcnMgd2FudCB0byB0ZXN0IHdoZXRoZXIg
YSBkb21haW4gaGFzIElPTU1VIG1hcHBpbmdzCj4gLSBTb21lIGNhbGxlcnMgd2FudCB0byB0ZXN0
IHdoZXRoZXIgdGhleSBuZWVkIHRvIHN5bmNocm9uaXplIHRoZSBkb21haW4ncwo+ICAgUDJNIGFu
ZCBJT01NVSBtYXBwaW5ncwo+IAo+IFRoaXMgcGF0Y2ggdGhlcmVmb3JlIGNyZWF0ZXMgdHdvIG5l
dyBib29sZWFuIGZsYWdzLCAnaGFzX2lvbW11X3B0JyBhbmQKPiAnc3luY19pb21tdV9wdCcgdG8g
Y29udmV5IHRob3NlIG1lYW5pbmdzIHNlcGFyYXRlbHkgYW5kIGNyZWF0ZXMgdGhlCj4gY29ycmVz
cG9uZGluZyBtYWNyb3MuIEFsbCBjYWxsZXJzIG9mIG5lZWRfaW9tbXUoKSBhcmUgdGhlbiBtb2Rp
ZmllZCB0bwo+IHVzZSB0aGUgbWFjcm8gYXBwcm9wcmlhdGUgdG8gd2hhdCB0aGV5IGFyZSB0cnlp
bmcgdG8gdGVzdC4KPiAKPiBOT1RFOiBUaGUgdGVzdCBvZiBuZWVkX2lvbW11KGQpIGluIHRoZSBB
TUQgSU9NTVUgaW5pdGlhbGl6YXRpb24gY29kZSBoYXMKPiAgICAgICBiZWVuIHJlcGxhY2VkIHdp
dGggYSB0ZXN0IG9mIGlvbW11X2RvbTBfc3RyaWN0IHNpbmNlIHRoaXMgbW9yZQo+ICAgICAgIGFj
Y3VyYXRlbHkgcmVmbGVjdHMgdGhlIG1lYW5pbmcgb2YgdGhlIHRlc3QgYW5kIGJyaW5ncyBpdCBp
bnRvCj4gICAgICAgbGluZSB3aXRoIGEgc2ltaWxhciB0ZXN0IGluIHRoZSBJbnRlbCBWVC1kIGNv
ZGUuCj4gCj4gU2lnbmVkLW9mZi1ieTogUGF1bCBEdXJyYW50IDxwYXVsLmR1cnJhbnRAY2l0cml4
LmNvbT4KCkFja2VkLWJ5OiBSYXp2YW4gQ29qb2NhcnUgPHJjb2pvY2FydUBiaXRkZWZlbmRlci5j
b20+CgoKVGhhbmtzLApSYXp2YW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94
ZW4tZGV2ZWw=
