From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Subject: Re: [PATCH v4 16/16] xen: Convert page_to_mfn and
 mfn_to_page to use typesafe MFN
Date: Wed, 21 Feb 2018 18:20:16 -0500
Message-ID: <9abae25f-897e-19ae-cdb6-5db7b47fa3c4@oracle.com>
References: <20180221140259.29360-1-julien.grall@arm.com>
 <20180221140259.29360-17-julien.grall@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <20180221140259.29360-17-julien.grall@arm.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <julien.grall@arm.com>, xen-devel@lists.xen.org
Cc: Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>, Razvan Cojocaru <rcojocaru@bitdefender.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Tamas K Lengyel <tamas@tklengyel.com>, Jan Beulich <jbeulich@suse.com>, Shane Wang <shane.wang@intel.com>, Gang Wei <gang.wei@intel.com>, Paul Durrant <paul.durrant@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMDIvMjEvMjAxOCAwOTowMiBBTSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IE1vc3Qgb2YgdGhl
IHVzZXJzIG9mIHBhZ2VfdG9fbWZuIGFuZCBtZm5fdG9fcGFnZSBhcmUgZWl0aGVyIG92ZXJyaWRp
bmcKPiB0aGUgbWFjcm9zIHRvIG1ha2UgdGhlbSB3b3JrIHdpdGggbWZuX3Qgb3IgdXNlIG1mbl94
L19tZm4gYmVjYXVzZSB0aGUKPiByZXN0IG9mIHRoZSBmdW5jdGlvbiB1c2UgbWZuX3QuCj4KPiBT
byBtYWtlIHBhZ2VfdG9fbWZuIGFuZCBtZm5fdG9fcGFnZSByZXR1cm4gbWZuX3QgYnkgZGVmYXVs
dC4gVGhlIF9fKgo+IHZlcnNpb24gYXJlIG5vdyBkcm9wcGVkIGFzIHRoaXMgcGF0Y2ggd2lsbCBj
b252ZXJ0IGFsbCB0aGUgcmVtYWluaW5nCj4gbm9uLXR5cGVzYWZlIGNhbGxlcnMuCj4KPiBPbmx5
IHJlYXNvbmFibGUgY2xlYW4tdXBzIGFyZSBkb25lIGluIHRoaXMgcGF0Y2guIFRoZSByZXN0IHdp
bGwgdXNlCj4gX21mbi9tZm5feCBmb3IgdGhlIHRpbWUgYmVpbmcuCj4KPiBMYXN0bHksIGRvbWFp
bl9wYWdlX3RvX21mbiBpcyBhbHNvIGNvbnZlcnRlZCB0byB1c2UgbWZuX3QgZ2l2ZW4gdGhhdAo+
IG1vc3Qgb2YgdGhlIGNhbGxlcnMgYXJlIG5vdyBzd2l0Y2hlZCB0byBfbWZuKGRvbWFpbl9wYWdl
X3RvX21mbiguLi4pKS4KPgo+IFNpZ25lZC1vZmYtYnk6IEp1bGllbiBHcmFsbCA8anVsaWVuLmdy
YWxsQGFybS5jb20+CgpSZXZpZXdlZC1ieTogQm9yaXMgT3N0cm92c2t5IDxib3Jpcy5vc3Ryb3Zz
a3lAb3JhY2xlLmNvbT4KCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1k
ZXZlbA==
