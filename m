From: Razvan Cojocaru <rcojocaru@bitdefender.com>
Subject: Re: [PATCH V5 3/3] x86/altp2m: fix display frozen when
 switching to a new view early
Date: Wed, 14 Nov 2018 09:43:20 +0200
Message-ID: <1551f603-219f-cbda-be30-ff61f1013461@bitdefender.com>
References: <1541945224-23075-1-git-send-email-rcojocaru@bitdefender.com>
 <1541945224-23075-4-git-send-email-rcojocaru@bitdefender.com>
 <AADFC41AFE54684AB9EE6CBC0274A5D19BE49E46@SHSMSX101.ccr.corp.intel.com>
 <e3e6785e-743c-fc70-5eb7-0f4e5524098f@bitdefender.com>
 <AADFC41AFE54684AB9EE6CBC0274A5D19BE4A686@SHSMSX101.ccr.corp.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=mavx=nz=bitdefender.com=rcojocaru@srs-us1.protection.inumbo.net>)
 id 1gMppk-0007YQ-QZ
 for xen-devel@lists.xenproject.org; Wed, 14 Nov 2018 07:43:32 +0000
In-Reply-To: <AADFC41AFE54684AB9EE6CBC0274A5D19BE4A686@SHSMSX101.ccr.corp.intel.com>
Content-Language: en-US-large
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: "Tian, Kevin" <kevin.tian@intel.com>, "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: George Dunlap <george.dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, "Nakajima, Jun" <jun.nakajima@intel.com>, Jan Beulich <jbeulich@suse.com>
List-Id: xen-devel@lists.xenproject.org

T24gMTEvMTQvMTggOTozNSBBTSwgVGlhbiwgS2V2aW4gd3JvdGU6Cj4+Pj4gKyNpZmRlZiBDT05G
SUdfSFZNCj4+Pj4gKy8qIFRoZXJlJ3MgYWxyZWFkeSBhIG1lbW9yeV90eXBlX2NoYW5nZWQoKSBp
biBhc20vbXRyci5oLiAqLwo+Pj4+ICtzdGF0aWMgdm9pZCBfbWVtb3J5X3R5cGVfY2hhbmdlZChz
dHJ1Y3QgcDJtX2RvbWFpbiAqcDJtKQo+Pj4+ICt7Cj4+Pj4gKyAgICBpZiAoIHAybS0+bWVtb3J5
X3R5cGVfY2hhbmdlZCApCj4+Pj4gKyAgICAgICAgcDJtLT5tZW1vcnlfdHlwZV9jaGFuZ2VkKHAy
bSk7Cj4+Pj4gIH0KPj4+Pgo+Pj4+ICB2b2lkIHAybV9tZW1vcnlfdHlwZV9jaGFuZ2VkKHN0cnVj
dCBkb21haW4gKmQpCj4+PiB3aHkgbWFraW5nIHdob2xlIHAybV9tZW1vcnlfdHlwZV9jaGFuZ2Vk
IHVuZGVyIENPTkZJR19IVk0/Cj4+IEl0IGhhcyBiZWVuIHJlcXVlc3RlZCBieSBKYW4gYW5kIFdl
aSBpbiBWMzoKPj4KPj4gaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9hcmNoaXZlcy9odG1s
L3hlbi1kZXZlbC8yMDE4LQo+PiAxMC9tc2cwMjQ5NS5odG1sCj4+Cj4gdGhlbiBpdCdzIGdvb2Qg
dG8gbWVudGlvbiBpdCBpbiBwYXRjaCBkZXNjcmlwdGlvbi4KPiAKPiBSZXZpZXdlZC1ieTogS2V2
aW4gVGlhbiA8a2V2aW4udGlhbkBpbnRlbC5jb20+CgpXaXRoIEdlb3JnZSdzIGNvbW1lbnRzIHll
c3RlcmRheSB0aGVyZSdsbCBiZSBhdCBsZWFzdCBvbmUgbW9yZSBpdGVyYXRpb24Kb2YgdGhlIHNl
cmllcyAocHJvYmFibHkgbWludXMgdGhlIGZpcnN0IHBhdGNoLCB3aGljaCBzZWVtcyByZWFkeSB0
byBnbwppbikgLSBzbyBJJ2xsIHVwZGF0ZSB0aGUgcGF0Y2ggZGVzY3JpcHRpb24gaW4gdGhlIG5l
eHQgdmVyc2lvbi4KCgpUaGFua3MsClJhenZhbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3hlbi1kZXZlbA==
