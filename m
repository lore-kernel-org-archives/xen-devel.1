From: Julien Grall <julien.grall@arm.com>
Subject: Re: [PATCH] iommu: specify page_count rather than
 page_order to iommu_map/unmap()...
Date: Fri, 18 Jan 2019 16:06:56 +0000
Message-ID: <7d007837-c160-f312-db92-62e2fa61f419@arm.com>
References: <20190118160328.10455-1-paul.durrant@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Yjae=P2=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1gkWg6-0000Uf-S1
 for xen-devel@lists.xenproject.org; Fri, 18 Jan 2019 16:07:30 +0000
In-Reply-To: <20190118160328.10455-1-paul.durrant@citrix.com>
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
Cc: Kevin Tian <kevin.tian@intel.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Jun Nakajima <jun.nakajima@intel.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Sander Eikelenboom <linux@eikelenboom.it>, Jan Beulich <jbeulich@suse.com>, Chao Gao <chao.gao@intel.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

CgpPbiAxOC8wMS8yMDE5IDE2OjAzLCBQYXVsIER1cnJhbnQgd3JvdGU6Cj4gLi4uYW5kIHJlbW92
ZSBhbGlnbm1lbnQgYXNzZXJ0aW9ucy4KPiAKPiBUZXN0aW5nIHNob3dzIHRoYXQgY2VydGFpbiBj
YWxsZXJzIG9mIGlvbW11X2xlZ2FjeV9tYXAvdW5tYXAoKSBzcGVjaWZ5Cj4gb3JkZXIgPiAwIHJh
bmdlcyB0aGF0IGFyZSBub3Qgb3JkZXIgYWxpZ25lZCB0aHVzIGNhdXNpbmcgb25lIG9mIHRoZQo+
IElTX0FMSUdORUQoKSBhc3NlcnRpb25zIHRvIGZpcmUuCj4gCj4gVGhpcyBwYXRjaCByZW1vdmVz
IHRob3NlIGFzc2VydGlvbnMgYW5kIG1vZGlmaWVzIGlvbW11X21hcC91bm1hcCgpIGFuZAo+IGlv
bW11X2xlZ2FjeV9tYXAvdW5tYXAoKSB0byB0YWtlIGEgcGFnZV9jb3VudCBhcmd1bWVudCByYXRo
ZXIgdGhhbiBhCj4gcGFnZV9vcmRlci4gVXNpbmcgYSBjb3VudCBhY3R1YWxseSBtYWtlcyBtb3Jl
IHNlbnNlIGJlY2F1c2UgdGhlIHZhbGlkCj4gc2V0IG9mIG1hcHBpbmcgb3JkZXJzIGlzIHNwZWNp
ZmljIHRvIHRoZSBJT01NVSBpbXBsZW1lbnRhdGlvbiBhbmQgdG8gaXQKPiBzaG91bGQgYmUgdXAg
dG8gdGhlIGltcGxlbWVudGF0aW9uIHNwZWNpZmljIGNvZGUgdG8gdHJhbnNsYXRlIGEgbWFwcGlu
Zwo+IGNvdW50IGludG8gYW4gb3B0aW1hbCBzZXQgb2YgbWFwcGluZyBvcmRlcnMgKHdoZW4gdGhl
IGNvZGUgaXMgZmluYWxseQo+IG1vZGlmaWVkIHRvIHN1cHBvcnQgb3JkZXJzID4gMCkuCj4gCj4g
U2lnbmVkLW9mZi1ieTogUGF1bCBEdXJyYW50IDxwYXVsLmR1cnJhbnRAY2l0cml4LmNvbT4KPiAt
LS0KPiBSZXBvcnRlZC1ieTogQ2hhbyBHYW8gPGNoYW8uZ2FvQGludGVsLmNvbT4KPiBSZXBvcnRl
ZC1ieTogU2FuZGVyIEVpa2VsZW5ib29tIDxsaW51eEBlaWtlbGVuYm9vbS5pdD4KWW91IHB1dCB0
aG9zZSB0YWdzIGFmdGVyIC0tLS4gRG9uJ3QgeW91IHdhbnQgdGhlbSBpbiB0aGUgZmluYWwgY29t
bWl0PwoKQ2hlZXJzLAoKLS0gCkp1bGllbiBHcmFsbAoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL3hlbi1kZXZlbA==
