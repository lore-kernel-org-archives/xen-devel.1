From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v2 05/10] x86/SVM: Add AVIC vmexit handlers
Date: Wed, 30 May 2018 00:33:42 +0100
Message-ID: <453a59cb-3d24-9eeb-0daa-3a7405b5ad03@citrix.com>
References: <20180507210753.2280-1-Janakarajan.Natarajan@amd.com>
 <20180507210753.2280-6-Janakarajan.Natarajan@amd.com>
 <5AFC54C202000078001C35AC@prv1-mh.provo.novell.com>
 <5bbd739a-548e-e317-87e5-896d36a8b72b@amd.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <5bbd739a-548e-e317-87e5-896d36a8b72b@amd.com>
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

Cj4+PiArwqDCoMKgwqDCoMKgwqAgewo+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZ3ByaW50
ayhYRU5MT0dfRVJSLCAiJXM6IEZhaWxlZCB0byBoYW5kbGUgdHJhcCB3cml0ZQo+Pj4gKCUjeClc
biIsCj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgX19mdW5jX18s
IG9mZnNldCk7Cj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBkb21haW5fY3Jhc2goY3Vyci0+
ZG9tYWluKTsKPj4+ICvCoMKgwqDCoMKgwqDCoCB9Cj4+PiArwqDCoMKgIH0KPj4+ICvCoMKgwqAg
ZWxzZQo+Pj4gK8KgwqDCoMKgwqDCoMKgIC8qIEhhbmRsaW5nIEFWSUMgRmF1bHQgKGludGVyY2Vw
dCBiZWZvcmUgdGhlIGFjY2VzcykuICovCj4+PiArwqDCoMKgwqDCoMKgwqAgaHZtX2VtdWxhdGVf
b25lX3ZtX2V2ZW50KEVNVUxfS0lORF9OT1JNQUwsIFRSQVBfaW52YWxpZF9vcCwKPj4+ICvCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIFg4Nl9FVkVOVF9OT19FQyk7Cj4+IFdoYXQncyB0aGUgcmF0aW9uYWxlIGJlaGluZCBoYXZp
bmcgY2hvc2VuIHRoaXMgZnVuY3Rpb24/IEkgZG9uJ3QKPj4gdGhpbmsgaXQgaXMKPj4gc3VwcG9z
ZWQgdG8gYmUgY2FsbGVkIGZyb20gb3V0c2lkZSB0aGUgVk0gZXZlbnQgY29kZS4KPgo+IFdlIHdh
bnRlZCB0byBoYW5kbGUgdGhlIEFWSUMgZmF1bHQgYnkgZW11bGF0aW5nIHRoZSBpbnN0cnVjdGlv
bgo+IGNhdXNpbmcgaXQuCj4gV291bGQgdGhpcyBiZSBiZXR0ZXIgc3VpdGVkID8KCkFsbW9zdC4K
ClRoZSBwdXJwb3NlIG9mIHRoZSB2YWxpZGF0ZSBmdW5jdGlvbiBpcyB0byBmaXggYW4gaW5oZXJl
bnQgcmFjZQpjb25kaXRpb24gd2hpY2ggb2NjdXJzIHdpdGggYSB2bWV4aXQuCgpBZnRlciBhIHZt
ZXhpdCwgcmVyZWFkaW5nIHRoZSBpbnN0cnVjdGlvbiBmb3IgZW11bGF0aW9uIGlzIGluaGVyZW50
bHkKcmFjeSwgYW5kIGEgbWFsaWNpb3VzIFZNIGNvdWxkIHJld3JpdGUgdGhlIGluc3RydWN0aW9u
IHN0cmVhbSB3aGlsZSB0aGUKdm1leGl0IGlzIG9jY3VyaW5nLsKgIEFzIGEgcmVzdWx0LCB3ZSBw
cm92aWRlIGEgdmFsaWRhdGUgZnVuY3Rpb24gdG8KY2hlY2sgdGhhdCB0aGUgaW5zdHJ1Y3Rpb24g
ZGVjb2RlZCBtYXRjaGVzIG9uZSB3aGljaCBwbGF1c2libHkgYnJva2UgZm9yCmVtdWxhdGlvbiBo
ZXJlLgoKVGhlcmVmb3JlLCB5b3Ugd2FudCBhIHZhbGlkYXRlIGZ1bmN0aW9uIHdoaWNoIGNoZWNr
cyB0aGF0IHRoZQppbnN0cnVjdGlvbiBoYXMgYSBtZW1vcnkgb3BlcmFuZCwgYW5kIHRoYXQgaXQg
ZmFsbHMgd2l0aGluIHRoZSA0ayByZWdpb24Kd2hpY2ggbWFwcyB0aGUgQVBJQyByZWdpc3RlcnMu
Cgp+QW5kcmV3CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpo
dHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
