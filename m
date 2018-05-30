From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v2 05/10] x86/SVM: Add AVIC vmexit handlers
Date: Thu, 31 May 2018 00:23:16 +0100
Message-ID: <ce6ab2b6-c306-6372-8026-80945ceab713@citrix.com>
References: <20180507210753.2280-1-Janakarajan.Natarajan@amd.com>
 <20180507210753.2280-6-Janakarajan.Natarajan@amd.com>
 <5AFC54C202000078001C35AC@prv1-mh.provo.novell.com>
 <5bbd739a-548e-e317-87e5-896d36a8b72b@amd.com>
 <453a59cb-3d24-9eeb-0daa-3a7405b5ad03@citrix.com>
 <5B0E51B402000078001C6D63@prv1-mh.provo.novell.com>
 <68346df4-5e97-138a-457e-60504f4aa815@amd.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <68346df4-5e97-138a-457e-60504f4aa815@amd.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: "Natarajan, Janakarajan" <jnataraj@amd.com>, Jan Beulich <JBeulich@suse.com>, Janakarajan Natarajan <Janakarajan.Natarajan@amd.com>
Cc: Kevin Tian <kevin.tian@intel.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Tim Deegan <tim@xen.org>, Ian Jackson <Ian.Jackson@eu.citrix.com>, xen-devel@lists.xen.org, Julien Grall <julien.grall@arm.com>, Jun Nakajima <jun.nakajima@intel.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>
List-Id: xen-devel@lists.xenproject.org

T24gMzAvMDUvMjAxOCAxOTozMCwgTmF0YXJhamFuLCBKYW5ha2FyYWphbiB3cm90ZToKPiBPbiA1
LzMwLzIwMTggMjoyNCBBTSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4+IE9uIDMwLjA1LjE4IGF0
IDAxOjMzLCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3JvdGU6Cj4+Pj4gV291bGQgdGhp
cyBiZSBiZXR0ZXIgc3VpdGVkID8KPj4+IEFsbW9zdC4KPj4+Cj4+PiBUaGUgcHVycG9zZSBvZiB0
aGUgdmFsaWRhdGUgZnVuY3Rpb24gaXMgdG8gZml4IGFuIGluaGVyZW50IHJhY2UKPj4+IGNvbmRp
dGlvbiB3aGljaCBvY2N1cnMgd2l0aCBhIHZtZXhpdC4KPj4+Cj4+PiBBZnRlciBhIHZtZXhpdCwg
cmVyZWFkaW5nIHRoZSBpbnN0cnVjdGlvbiBmb3IgZW11bGF0aW9uIGlzIGluaGVyZW50bHkKPj4+
IHJhY3ksIGFuZCBhIG1hbGljaW91cyBWTSBjb3VsZCByZXdyaXRlIHRoZSBpbnN0cnVjdGlvbiBz
dHJlYW0gd2hpbGUgdGhlCj4+PiB2bWV4aXQgaXMgb2NjdXJpbmcuwqAgQXMgYSByZXN1bHQsIHdl
IHByb3ZpZGUgYSB2YWxpZGF0ZSBmdW5jdGlvbiB0bwo+Pj4gY2hlY2sgdGhhdCB0aGUgaW5zdHJ1
Y3Rpb24gZGVjb2RlZCBtYXRjaGVzIG9uZSB3aGljaCBwbGF1c2libHkgYnJva2UKPj4+IGZvcgo+
Pj4gZW11bGF0aW9uIGhlcmUuCj4+Pgo+Pj4gVGhlcmVmb3JlLCB5b3Ugd2FudCBhIHZhbGlkYXRl
IGZ1bmN0aW9uIHdoaWNoIGNoZWNrcyB0aGF0IHRoZQo+Pj4gaW5zdHJ1Y3Rpb24gaGFzIGEgbWVt
b3J5IG9wZXJhbmQsIGFuZCB0aGF0IGl0IGZhbGxzIHdpdGhpbiB0aGUgNGsKPj4+IHJlZ2lvbgo+
Pj4gd2hpY2ggbWFwcyB0aGUgQVBJQyByZWdpc3RlcnMuCj4+IFRoZSB2YWxpZGF0ZSBob29rIGlz
IGNhbGxlZCByaWdodCBhZnRlciBkZWNvZGUsIGkuZS4gYmVmb3JlIG9wZXJhbmRzCj4+IGhhdmUK
Pj4gYmVlbiBldmFsdWF0ZWQsIHNvIHRoZSBsYXR0ZXIgcGFydCBvZiB3aGF0IHlvdSBzdWdnZXN0
IGNhbm5vdCBiZSBkb25lLgo+Cj4gU28gY2hlY2sgdG8gc2VlIGlmIHRoZXJlIGlzIGEgbWVtb3J5
IG9wZXJhbmQuIFNvbWV0aGluZyBhbG9uZyB0aGUKPiBsaW5lcyBvZjoKPgo+IGJvb2wgaGFzX21l
bW9yeV9vcGVyYW5kKGNvbnN0IHN0cnVjdCB4ODZfZW11bGF0ZV9zdGF0ZSAqc3RhdGUsCj4gwqDC
oMKgIMKgwqDCoCDCoMKgwqAgwqDCoMKgIMKgwqDCoCDCoMKgwqAgwqDCoMKgIMKgwqDCoCDCoMKg
wqAgwqDCoMKgIMKgwqDCoCDCoMKgwqAgwqDCoCBjb25zdCBzdHJ1Y3QKPiB4ODZfZW11bGF0ZV9j
dHh0ICpjdHh0KQo+IHsKPiDCoMKgwqAgwqDCoMKgIGlmICggKHN0YXRlLT5kZXNjICYgRHN0TWFz
aykgPT0gRHN0TWVtICkKPiDCoMKgwqAgwqDCoMKgIMKgwqDCoCDCoMKgwqAgcmV0dXJuIHRydWU7
Cj4KPiDCoMKgwqAgwqDCoMKgIHJldHVybiBmYWxzZTsKPiB9Cgp4ODZfaW5zbl9pc19tZW1fYWNj
ZXNzKCkgb3IgeDg2X2luc25faXNfbWVtX3dyaXRlKCkgKGRlcGVuZGluZyBvbgp3aGV0aGVyIHdl
IGV2ZXIgbmVlZCB0byBlbXVsYXRlIGEgcmVhZCkuCgpIZXJlIGFyZSBzZXZlcmFsIHdlIHByZXBh
cmVkIGVhcmxpZXIsIGFuZCB0aGV5IGFyZSBzYWRseSBtb3JlCmNvbXBsaWNhdGVkIHRoYW4geW91
J2QgaW1hZ2luZS4KCn5BbmRyZXcKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94
ZW4tZGV2ZWw=
