From: Juergen Gross <jgross@suse.com>
Subject: Re: xen: Can't insert balloon page into VM userspace
 (WAS Re: [linux-linus bisection] complete test-arm64-arm64-xl-xsm)
Date: Thu, 14 Mar 2019 15:15:31 +0100
Message-ID: <d3e87824-b3a2-ed8a-d2ca-1a9fd439a204__42411.3279835851$1552572983$gmane$org@suse.com>
References: <E1h3Uiq-0002L6-Ij@osstest.test-lab.xenproject.org>
 <80211e70-5f54-9421-8e8f-2a4fc758ce39@arm.com>
 <46118631-61d4-adb6-6ffc-4e7c62ea3da9@arm.com>
 <20190312171421.GJ19508@bombadil.infradead.org>
 <e0b64793-260d-5e70-0544-e7290509b605@redhat.com>
 <45323ea0-2a50-8891-830e-e1f8a8ed23ea@citrix.com>
 <f4b40d91-9c41-60ed-6b4e-df47af8e5292@oracle.com>
 <9a40e1ff-7605-e822-a1d2-502a12d0fba7@redhat.com>
 <6f8aca6c-355b-7862-75aa-68fe566f76fb@redhat.com>
 <ec71c03e-987d-2b73-9fe6-2604a3c32017@suse.com>
 <cb525882-b52f-c142-8a6a-e5cb491e05d0@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=X/If=RR=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1h4R8x-0002Al-97
 for xen-devel@lists.xenproject.org; Thu, 14 Mar 2019 14:15:35 +0000
In-Reply-To: <cb525882-b52f-c142-8a6a-e5cb491e05d0@arm.com>
Content-Language: de-DE
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <julien.grall@arm.com>, David Hildenbrand <david@redhat.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Matthew Wilcox <willy@infradead.org>
Cc: k.khlebnikov@samsung.com, Stefano Stabellini <sstabellini@kernel.org>, Kees Cook <keescook@chromium.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, "VMware,
 Inc." <pv-drivers@vmware.com>, osstest service owner <osstest-admin@xenproject.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, linux-mm@kvack.org, Julien Freche <jfreche@vmware.com>, Nadav Amit <namit@vmware.com>, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

T24gMTQvMDMvMjAxOSAxNToxMiwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IEhpLAo+IAo+IE9uIDMv
MTQvMTkgODozNyBBTSwgSnVlcmdlbiBHcm9zcyB3cm90ZToKPj4gT24gMTIvMDMvMjAxOSAyMDo0
NiwgRGF2aWQgSGlsZGVuYnJhbmQgd3JvdGU6Cj4+PiBPbiAxMi4wMy4xOSAxOToyMywgRGF2aWQg
SGlsZGVuYnJhbmQgd3JvdGU6Cj4+Pgo+Pj4gSSBndWVzcyBzb21ldGhpbmcgbGlrZSB0aGlzIGNv
dWxkIGRvIHRoZSB0cmljayBpZiBJIHVuZGVyc3Rvb2QgaXQKPj4+IGNvcnJlY3RseToKPj4+Cj4+
PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy94ZW4vYmFsbG9vbi5jIGIvZHJpdmVycy94ZW4vYmFsbG9v
bi5jCj4+PiBpbmRleCAzOWIyMjlmOWUyNTYuLmQzN2RkNWJiN2E4ZiAxMDA2NDQKPj4+IC0tLSBh
L2RyaXZlcnMveGVuL2JhbGxvb24uYwo+Pj4gKysrIGIvZHJpdmVycy94ZW4vYmFsbG9vbi5jCj4+
PiBAQCAtNjA0LDYgKzYwNCw3IEBAIGludCBhbGxvY194ZW5iYWxsb29uZWRfcGFnZXMoaW50IG5y
X3BhZ2VzLCBzdHJ1Y3QKPj4+IHBhZ2UgKipwYWdlcykKPj4+IMKgwqDCoMKgwqDCoMKgwqAgd2hp
bGUgKHBnbm8gPCBucl9wYWdlcykgewo+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgcGFnZSA9IGJhbGxvb25fcmV0cmlldmUodHJ1ZSk7Cj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCBpZiAocGFnZSkgewo+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgIF9fQ2xlYXJQYWdlT2ZmbGluZShwYWdlKTsKPj4+IMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBwYWdlc1twZ25vKytdID0g
cGFnZTsKPj4+IMKgICNpZmRlZiBDT05GSUdfWEVOX0hBVkVfUFZNTVUKPj4+IMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAvKgo+Pj4gQEAgLTY0NSw4ICs2
NDYsMTAgQEAgdm9pZCBmcmVlX3hlbmJhbGxvb25lZF9wYWdlcyhpbnQgbnJfcGFnZXMsIHN0cnVj
dAo+Pj4gcGFnZSAqKnBhZ2VzKQo+Pj4gwqDCoMKgwqDCoMKgwqDCoCBtdXRleF9sb2NrKCZiYWxs
b29uX211dGV4KTsKPj4+Cj4+PiDCoMKgwqDCoMKgwqDCoMKgIGZvciAoaSA9IDA7IGkgPCBucl9w
YWdlczsgaSsrKSB7Cj4+PiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBpZiAocGFnZXNb
aV0pCj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBpZiAocGFnZXNbaV0pIHsKPj4+
ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBfX1NldFBhZ2VP
ZmZsaW5lKHBhZ2VzW2ldKTsKPj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCBiYWxsb29uX2FwcGVuZChwYWdlc1tpXSk7Cj4+PiArwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCB9Cj4+PiDCoMKgwqDCoMKgwqDCoMKgIH0KPj4+Cj4+PiDCoMKgwqDC
oMKgwqDCoMKgIGJhbGxvb25fc3RhdHMudGFyZ2V0X3VucG9wdWxhdGVkIC09IG5yX3BhZ2VzOwo+
Pj4KPj4+Cj4+PiBBdCBsZWFzdCB0aGlzIHdheSwgdGhlIHBhZ2VzIGFsbG9jYXRlZCAoYW5kIHRo
dXMgZXZlbnR1YWxseSBtYXBwZWQgdG8KPj4+IHVzZXIgc3BhY2UpIHdvdWxkIG5vdCBiZSBtYXJr
ZWQsIGJ1dCB0aGUgb3RoZXIgb25lcyB3b3VsZCByZW1haW4gbWFya2VkCj4+PiBhbmQgY291bGQg
YmUgZXhjbHVkZWQgYnkgbWFrZWR1bXB0b29sLgo+Pj4KPj4KPj4gSSB0aGluayB0aGlzIHBhdGNo
IHNob3VsZCBkbyB0aGUgdHJpY2suIEp1bGllbiwgY291bGQgeW91IGdpdmUgaXQgYQo+PiB0cnk/
IE9uIHg4NiBJIGNhbid0IHJlcHJvZHVjZSB5b3VyIHByb2JsZW0gZWFzaWx5IGFzIGRvbTAgaXMg
UFYgd2l0aAo+PiBwbGVudHkgb2YgdW5wb3B1bGF0ZWQgcGFnZXMgZm9yIGdyYW50IG1lbW9yeSBu
b3Qgc3VmZmVyaW5nIGZyb20KPj4gbWlzc2luZyAib2ZmbGluZSIgYml0Lgo+IAo+IFN1cmUuIEkg
bWFuYWdlZCB0byBnZXQgdGhlIGNvbnNvbGUgd29ya2luZyB3aXRoIHRoZSBwYXRjaCBzdWdnZXN0
ZWQgYnkKPiBEYXZpZC4gRmVlbCBmcmVlIHRvIGFkZCBteSB0ZXN0ZWQtYnkgaWYgd2hlbiB5b3Ug
cmVzZW5kIGl0IGFzIGlzLgoKRGF2aWQsIGNvdWxkIHlvdSBwbGVhc2Ugc2VuZCBhIHByb3BlciBw
YXRjaCB3aXRoIHlvdXIgU29iPwoKCkp1ZXJnZW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby94ZW4tZGV2ZWw=
