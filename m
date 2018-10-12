From: "Woods, Brian" <Brian.Woods@amd.com>
Subject: Re: [PATCH v2] amd-iommu: use correct constants in
 amd_iommu_get_next_table_from_pte()...
Date: Fri, 12 Oct 2018 16:59:18 +0000
Message-ID: <20181012165914.GA22686@amd.com>
References: <20180926134407.29963-1-paul.durrant@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=jdua=my=amd.com=brian.woods@srs-us1.protection.inumbo.net>)
 id 1gB0ma-00066Q-2N
 for xen-devel@lists.xenproject.org; Fri, 12 Oct 2018 16:59:24 +0000
In-Reply-To: <20180926134407.29963-1-paul.durrant@citrix.com>
Content-Language: en-US
Content-ID: <4FA243BFFC2F4C4FBA9630FE73C9BFFB@namprd12.prod.outlook.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Paul Durrant <paul.durrant@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Woods,
 Brian" <Brian.Woods@amd.com>, "Suthikulpanit,
 Suravee" <Suravee.Suthikulpanit@amd.com>
List-Id: xen-devel@lists.xenproject.org

T24gV2VkLCBTZXAgMjYsIDIwMTggYXQgMDI6NDQ6MDdQTSArMDEwMCwgUGF1bCBEdXJyYW50IHdy
b3RlOgo+IC4uLmFuZCBjaGFuZ2UgdGhlIG5hbWUgdG8gYW1kX2lvbW11X2dldF9hZGRyZXNzX2Zy
b21fcHRlKCkgc2luY2UgdGhlCj4gYWRkcmVzcyByZWFkIGlzIG5vdCBuZWNlc3NhcmlseSB0aGUg
YWRkcmVzcyBvZiBhIG5leHQgbGV2ZWwgcGFnZSB0YWJsZS4KPiAoSWYgdGhlICduZXh0IGxldmVs
JyBmaWVsZCBpcyBub3QgMSAtIDYgdGhlbiB0aGUgYWRkcmVzcyBpcyBhIHBhZ2UKPiBhZGRyZXNz
KS4KPiAKPiBUaGUgY29uc3RhbnRzIGluIHVzZSBwcmlvciB0byB0aGlzIHBhdGNoIHJlbGF0ZSB0
byBkZXZpY2UgdGFibGUgZW50cmllcwo+IHJhdGhlciB0aGFuIHBhZ2UgdGFibGUgZW50cmllcy4g
QWx0aG91Z2ggdGhleSBkbyBoYXZlIHRoZSBzYW1lIHZhbHVlLCBpdAo+IG1ha2VzIHRoZSBjb2Rl
IGNvbmZ1c2luZyB0byByZWFkLgo+IAo+IFRoaXMgcGF0Y2ggYWxzbyBjaGFuZ2VzIHRoZSBQREUv
UFRFIHBvaW50ZXIgYXJndW1lbnQgdG8gdm9pZCAqLCBhbmQKPiByZW1vdmVzIGFueSB1MzIvdWlu
dDMyX3QgY2FzdHMgaW4gdGhlIGNhbGwgc2l0ZXMuIFVubmVjZXNzYXJ5IGNhc3RzCj4gc3Vycm91
bmRpbmcgY2FsbCBzaXRlcyBhcmUgYWxzbyByZW1vdmVkLgo+IAo+IE5vIGZ1bmN0aW9uYWwgY2hh
bmdlLgo+IAo+IE5PVEU6IFRoZSBwYXRjaCBhbHNvIGFkZHMgZW1hY3MgYm9pbGVycGxhdGUgdG8g
aW9tbXVfbWFwLmMKPiAKPiBTaWduZWQtb2ZmLWJ5OiBQYXVsIER1cnJhbnQgPHBhdWwuZHVycmFu
dEBjaXRyaXguY29tPgoKTm90IHRocmlsbGVkIGFib3V0IGFkZGluZyB0aGUgZW1hY3MgcGFydCBi
dXQgaXQncyBhbGxvd2VkIGluIHRoZSBjb2RpbmcKc3R5bGUgZ3VpZGUgc28uCgpSZXZpZXdkLWJ5
OiBCcmlhbiBXb29kcyA8YnJpYW4ud29vZHNAYW1kLmNvbT4KCi0tIApCcmlhbiBXb29kcwoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1h
aWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54
ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
