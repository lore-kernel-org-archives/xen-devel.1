From: "Natarajan, Janakarajan" <jnataraj@amd.com>
Subject: Re: [PATCH v2 05/10] x86/SVM: Add AVIC vmexit handlers
Date: Wed, 30 May 2018 13:30:48 -0500
Message-ID: <68346df4-5e97-138a-457e-60504f4aa815@amd.com>
References: <20180507210753.2280-1-Janakarajan.Natarajan@amd.com>
 <20180507210753.2280-6-Janakarajan.Natarajan@amd.com>
 <5AFC54C202000078001C35AC@prv1-mh.provo.novell.com>
 <5bbd739a-548e-e317-87e5-896d36a8b72b@amd.com>
 <453a59cb-3d24-9eeb-0daa-3a7405b5ad03@citrix.com>
 <5B0E51B402000078001C6D63@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <5B0E51B402000078001C6D63@prv1-mh.provo.novell.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>, Janakarajan Natarajan <Janakarajan.Natarajan@amd.com>, Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Kevin Tian <kevin.tian@intel.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Tim Deegan <tim@xen.org>, Ian Jackson <Ian.Jackson@eu.citrix.com>, xen-devel@lists.xen.org, Julien Grall <julien.grall@arm.com>, Jun Nakajima <jun.nakajima@intel.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>
List-Id: xen-devel@lists.xenproject.org

T24gNS8zMC8yMDE4IDI6MjQgQU0sIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+IE9uIDMwLjA1LjE4
IGF0IDAxOjMzLCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3JvdGU6Cj4+PiBXb3VsZCB0
aGlzIGJlIGJldHRlciBzdWl0ZWQgPwo+PiBBbG1vc3QuCj4+Cj4+IFRoZSBwdXJwb3NlIG9mIHRo
ZSB2YWxpZGF0ZSBmdW5jdGlvbiBpcyB0byBmaXggYW4gaW5oZXJlbnQgcmFjZQo+PiBjb25kaXRp
b24gd2hpY2ggb2NjdXJzIHdpdGggYSB2bWV4aXQuCj4+Cj4+IEFmdGVyIGEgdm1leGl0LCByZXJl
YWRpbmcgdGhlIGluc3RydWN0aW9uIGZvciBlbXVsYXRpb24gaXMgaW5oZXJlbnRseQo+PiByYWN5
LCBhbmQgYSBtYWxpY2lvdXMgVk0gY291bGQgcmV3cml0ZSB0aGUgaW5zdHJ1Y3Rpb24gc3RyZWFt
IHdoaWxlIHRoZQo+PiB2bWV4aXQgaXMgb2NjdXJpbmcuICBBcyBhIHJlc3VsdCwgd2UgcHJvdmlk
ZSBhIHZhbGlkYXRlIGZ1bmN0aW9uIHRvCj4+IGNoZWNrIHRoYXQgdGhlIGluc3RydWN0aW9uIGRl
Y29kZWQgbWF0Y2hlcyBvbmUgd2hpY2ggcGxhdXNpYmx5IGJyb2tlIGZvcgo+PiBlbXVsYXRpb24g
aGVyZS4KPj4KPj4gVGhlcmVmb3JlLCB5b3Ugd2FudCBhIHZhbGlkYXRlIGZ1bmN0aW9uIHdoaWNo
IGNoZWNrcyB0aGF0IHRoZQo+PiBpbnN0cnVjdGlvbiBoYXMgYSBtZW1vcnkgb3BlcmFuZCwgYW5k
IHRoYXQgaXQgZmFsbHMgd2l0aGluIHRoZSA0ayByZWdpb24KPj4gd2hpY2ggbWFwcyB0aGUgQVBJ
QyByZWdpc3RlcnMuCj4gVGhlIHZhbGlkYXRlIGhvb2sgaXMgY2FsbGVkIHJpZ2h0IGFmdGVyIGRl
Y29kZSwgaS5lLiBiZWZvcmUgb3BlcmFuZHMgaGF2ZQo+IGJlZW4gZXZhbHVhdGVkLCBzbyB0aGUg
bGF0dGVyIHBhcnQgb2Ygd2hhdCB5b3Ugc3VnZ2VzdCBjYW5ub3QgYmUgZG9uZS4KClNvIGNoZWNr
IHRvIHNlZSBpZiB0aGVyZSBpcyBhIG1lbW9yeSBvcGVyYW5kLiBTb21ldGhpbmcgYWxvbmcgdGhl
IGxpbmVzIG9mOgoKYm9vbCBoYXNfbWVtb3J5X29wZXJhbmQoY29uc3Qgc3RydWN0IHg4Nl9lbXVs
YXRlX3N0YXRlICpzdGF0ZSwKIMKgwqDCoCDCoMKgwqAgwqDCoMKgIMKgwqDCoCDCoMKgwqAgwqDC
oMKgIMKgwqDCoCDCoMKgwqAgwqDCoMKgIMKgwqDCoCDCoMKgwqAgwqDCoMKgIMKgwqAgY29uc3Qg
c3RydWN0IAp4ODZfZW11bGF0ZV9jdHh0ICpjdHh0KQp7CiDCoMKgwqAgwqDCoMKgIGlmICggKHN0
YXRlLT5kZXNjICYgRHN0TWFzaykgPT0gRHN0TWVtICkKIMKgwqDCoCDCoMKgwqAgwqDCoMKgIMKg
wqDCoCByZXR1cm4gdHJ1ZTsKCiDCoMKgwqAgwqDCoMKgIHJldHVybiBmYWxzZTsKfQoKVGhhbmtz
LApKYW5hawoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpo
dHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
