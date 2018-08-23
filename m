From: Razvan Cojocaru <rcojocaru@bitdefender.com>
Subject: Re: [PATCH v6 10/14] mm / iommu: split need_iommu()
 into has_iommu_pt() and need_iommu_pt_sync()
Date: Thu, 23 Aug 2018 14:10:11 +0300
Message-ID: <2a70e9a4-c20c-0d94-a781-06ea7e072a57@bitdefender.com>
References: <20180823094711.21376-1-paul.durrant@citrix.com>
 <20180823094711.21376-11-paul.durrant@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=l0r0=lg=bitdefender.com=rcojocaru@srs-us1.protection.inumbo.net>)
 id 1fsnVR-0001Yz-Mp
 for xen-devel@lists.xenproject.org; Thu, 23 Aug 2018 11:10:25 +0000
Received: from mx-sr.buh.bitdefender.com (mx-sr.buh.bitdefender.biz
 [10.17.80.103])
 by mx01.bbu.dsd.mx.bitdefender.com (Postfix) with ESMTPS id 4644B305FFB6
 for <xen-devel@lists.xenproject.org>; Thu, 23 Aug 2018 14:10:23 +0300 (EEST)
Received: from smtp03.buh.bitdefender.org (smtp.bitdefender.biz [10.17.80.77])
 by mx-sr.buh.bitdefender.com (Postfix) with ESMTP id 0CF557FE70
 for <xen-devel@lists.xenproject.org>; Thu, 23 Aug 2018 14:10:23 +0300 (EEST)
In-Reply-To: <20180823094711.21376-11-paul.durrant@citrix.com>
Content-Language: en-US-large
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

T24gOC8yMy8xOCAxMjo0NyBQTSwgUGF1bCBEdXJyYW50IHdyb3RlOgo+IFRoZSBuYW1lICduZWVk
X2lvbW11KCknIGlzIGEgbGl0dGxlIGNvbmZ1c2luZyBhcyBpdCBzdWdnZXN0cyBhIGRvbWFpbiBu
ZWVkcwo+IHRvIHVzZSB0aGUgSU9NTVUgYnV0IHNvbWV0aGluZyBtaWdodCBub3QgYmUgc2V0IHVw
IHlldCwgd2hlbiBpbiBmYWN0IGl0Cj4gcmVwcmVzZW50cyBhIHRyaS1zdGF0ZSB2YWx1ZSAobm90
IGEgYm9vbGVhbiBhcyBtaWdodCBiZSBleHBlY3RlZCkgd2hlcmUKPiAtMSBtZWFucyAnSU9NTVUg
bWFwcGluZ3MgYmVpbmcgc2V0IHVwJyBhbmQgMSBtZWFucyAnSU9NTVUgbWFwcGluZ3MgaGF2ZQo+
IGJlZW4gZnVsbHkgc2V0IHVwJy4KPiAKPiBUd28gZGlmZmVyZW50IG1lYW5pbmdzIGFyZSBhbHNv
IGluZmVycmVkIGZyb20gdGhlIG1hY3JvIGl0IGluIHZhcmlvdXMKPiBwbGFjZXMgaW4gdGhlIGNv
ZGU6Cj4gCj4gLSBTb21lIGNhbGxlcnMgd2FudCB0byB0ZXN0IHdoZXRoZXIgYSBkb21haW4gaGFz
IElPTU1VIG1hcHBpbmdzIGF0IGFsbAo+IC0gU29tZSBjYWxsZXJzIHdhbnQgdG8gdGVzdCB3aGV0
aGVyIHRoZXkgbmVlZCB0byBzeW5jaHJvbml6ZSB0aGUgZG9tYWluJ3MKPiAgIFAyTSBhbmQgSU9N
TVUgbWFwcGluZ3MKPiAKPiBUaGlzIHBhdGNoIHJlcGxhY2VzIHRoZSAnbmVlZF9pb21tdScgdHJp
LXN0YXRlIHZhbHVlIHdpdGggYSBkZWZpbmVkCj4gZW51bWVyYXRpb24gYW5kIGFkZHMgYSBib29s
ZWFuIGZsYWcgJ25lZWRfc3luYycgdG8gc2VwYXJhdGUgdGhlc2UgbWVhbmluZ3MsCj4gYW5kIHBs
YWNlcyBib3RoIG9mIHRoZXNlIGluIHN0cnVjdCBkb21haW5faW9tbXUsIHJhdGhlciB0aGFuIGRp
cmVjdGx5IGluCj4gc3RydWN0IGRvbWFpbi4KPiBUaGlzIHBhdGNoIGFsc28gY3JlYXRlcyB0d28g
bmV3IGJvb2xlYW4gbWFjcm9zOgo+IAo+IC0gJ2hhc19pb21tdV9wdCgpJyBldmFsdWF0ZXMgdG8g
dHJ1ZSBpZiBhIGRvbWFpbiBoYXMgSU9NTVUgbWFwcGluZ3MsIGV2ZW4KPiAgIGlmIHRoZXkgYXJl
IHN0aWxsIHVuZGVyIGNvbnN0cnVjdGlvbi4KPiAtICduZWVkX2lvbW11X3B0X3N5bmMoKScgZXZh
bHVhdGVzIHRvIHRydWUgaWYgYSBkb21haW4gcmVxdWlyZXMgZXhwbGljaXQKPiAgIHN5bmNocm9u
aXphdGlvbiBvZiB0aGUgUDJNIGFuZCBJT01NVSBtYXBwaW5ncy4KPiAKPiBBbGwgY2FsbGVycyBv
ZiBuZWVkX2lvbW11KCkgYXJlIHRoZW4gbW9kaWZpZWQgdG8gdXNlIHRoZSBtYWNybyBhcHByb3By
aWF0ZQo+IHRvIHdoYXQgdGhleSBhcmUgdHJ5aW5nIHRvIHRlc3QuCj4gCj4gTk9URTogVGhlIHRl
c3Qgb2YgbmVlZF9pb21tdShkKSBpbiB0aGUgQU1EIElPTU1VIGluaXRpYWxpemF0aW9uIGNvZGUg
aGFzCj4gICAgICAgYmVlbiByZXBsYWNlZCB3aXRoIGEgdGVzdCBvZiBpb21tdV9kb20wX3N0cmlj
dCBzaW5jZSB0aGlzIG1vcmUKPiAgICAgICBhY2N1cmF0ZWx5IHJlZmxlY3RzIHRoZSBtZWFuaW5n
IG9mIHRoZSB0ZXN0IGFuZCBicmluZ3MgaXQgaW50bwo+ICAgICAgIGxpbmUgd2l0aCBhIHNpbWls
YXIgdGVzdCBpbiB0aGUgSW50ZWwgVlQtZCBjb2RlLgo+IAo+IFNpZ25lZC1vZmYtYnk6IFBhdWwg
RHVycmFudCA8cGF1bC5kdXJyYW50QGNpdHJpeC5jb20+CgpGb3IgdGhlIHZtX2V2ZW50IHBhcnQ6
CkFja2VkLWJ5OiBSYXp2YW4gQ29qb2NhcnUgPHJjb2pvY2FydUBiaXRkZWZlbmRlci5jb20+CgoK
VGhhbmtzLApSYXp2YW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2
ZWw=
