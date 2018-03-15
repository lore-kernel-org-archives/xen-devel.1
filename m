From: George Dunlap <george.dunlap@citrix.com>
Subject: Re: [PATCH v5 16/16] xen: Convert page_to_mfn and
 mfn_to_page to use typesafe MFN
Date: Thu, 15 Mar 2018 18:09:11 +0000
Message-ID: <c5d895cb-ea68-ea55-f0e7-f45fca92def1@citrix.com>
References: <20180314182009.14274-1-julien.grall@arm.com>
 <20180314182009.14274-17-julien.grall@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <20180314182009.14274-17-julien.grall@arm.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: julien.grall@arm.com, xen-devel@lists.xen.org
Cc: Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>, Razvan Cojocaru <rcojocaru@bitdefender.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Paul Durrant <paul.durrant@citrix.com>, Tamas K Lengyel <tamas@tklengyel.com>, Jan Beulich <jbeulich@suse.com>, Shane Wang <shane.wang@intel.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Gang Wei <gang.wei@intel.com>
List-Id: xen-devel@lists.xenproject.org

T24gMDMvMTQvMjAxOCAwNjoyMCBQTSwganVsaWVuLmdyYWxsQGFybS5jb20gd3JvdGU6Cj4gRnJv
bTogSnVsaWVuIEdyYWxsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4KPiAKPiBNb3N0IG9mIHRoZSB1
c2VycyBvZiBwYWdlX3RvX21mbiBhbmQgbWZuX3RvX3BhZ2UgYXJlIGVpdGhlciBvdmVycmlkaW5n
Cj4gdGhlIG1hY3JvcyB0byBtYWtlIHRoZW0gd29yayB3aXRoIG1mbl90IG9yIHVzZSBtZm5feC9f
bWZuIGJlY2F1c2UgdGhlCj4gcmVzdCBvZiB0aGUgZnVuY3Rpb24gdXNlIG1mbl90Lgo+IAo+IFNv
IG1ha2UgcGFnZV90b19tZm4gYW5kIG1mbl90b19wYWdlIHJldHVybiBtZm5fdCBieSBkZWZhdWx0
LiBUaGUgX18qCj4gdmVyc2lvbiBhcmUgbm93IGRyb3BwZWQgYXMgdGhpcyBwYXRjaCB3aWxsIGNv
bnZlcnQgYWxsIHRoZSByZW1haW5pbmcKPiBub24tdHlwZXNhZmUgY2FsbGVycy4KPiAKPiBPbmx5
IHJlYXNvbmFibGUgY2xlYW4tdXBzIGFyZSBkb25lIGluIHRoaXMgcGF0Y2guIFRoZSByZXN0IHdp
bGwgdXNlCj4gX21mbi9tZm5feCBmb3IgdGhlIHRpbWUgYmVpbmcuCj4gCj4gTGFzdGx5LCBkb21h
aW5fcGFnZV90b19tZm4gaXMgYWxzbyBjb252ZXJ0ZWQgdG8gdXNlIG1mbl90IGdpdmVuIHRoYXQK
PiBtb3N0IG9mIHRoZSBjYWxsZXJzIGFyZSBub3cgc3dpdGNoZWQgdG8gX21mbihkb21haW5fcGFn
ZV90b19tZm4oLi4uKSkuCj4gCj4gU2lnbmVkLW9mZi1ieTogSnVsaWVuIEdyYWxsIDxqdWxpZW4u
Z3JhbGxAYXJtLmNvbT4KCldvdyAtLSB3aGF0IGEgbWFtbW90aCBlZmZvcnQuICBUaGFua3MgZm9y
IGRvaW5nIHRoaXMsIEp1bGllbi4KCng4Ni9tbSBiaXRzOgpSZXZpZXdlZC1ieTogR2VvcmdlIER1
bmxhcCA8Z2VvcmdlLmR1bmxhcEBjaXRyaXguY29tPgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL3hlbi1kZXZlbA==
