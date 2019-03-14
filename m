From: David Hildenbrand <david@redhat.com>
Subject: Re: xen: Can't insert balloon page into VM userspace
 (WAS Re: [linux-linus bisection] complete test-arm64-arm64-xl-xsm)
Date: Thu, 14 Mar 2019 15:16:37 +0100
Message-ID: <7ab068a3-2eaf-0eb0-cf25-43635e198ef7__16516.154054419$1552573054$gmane$org@redhat.com>
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
 <d3e87824-b3a2-ed8a-d2ca-1a9fd439a204@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=mfUP=RR=redhat.com=david@srs-us1.protection.inumbo.net>)
 id 1h4RA2-0002ME-TX
 for xen-devel@lists.xenproject.org; Thu, 14 Mar 2019 14:16:42 +0000
In-Reply-To: <d3e87824-b3a2-ed8a-d2ca-1a9fd439a204@suse.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Juergen Gross <jgross@suse.com>, Julien Grall <julien.grall@arm.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Matthew Wilcox <willy@infradead.org>
Cc: k.khlebnikov@samsung.com, Stefano Stabellini <sstabellini@kernel.org>, Kees Cook <keescook@chromium.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, "VMware,
 Inc." <pv-drivers@vmware.com>, osstest service owner <osstest-admin@xenproject.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, linux-mm@kvack.org, Julien Freche <jfreche@vmware.com>, Nadav Amit <namit@vmware.com>, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

T24gMTQuMDMuMTkgMTU6MTUsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6Cj4gT24gMTQvMDMvMjAxOSAx
NToxMiwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+PiBIaSwKPj4KPj4gT24gMy8xNC8xOSA4OjM3IEFN
LCBKdWVyZ2VuIEdyb3NzIHdyb3RlOgo+Pj4gT24gMTIvMDMvMjAxOSAyMDo0NiwgRGF2aWQgSGls
ZGVuYnJhbmQgd3JvdGU6Cj4+Pj4gT24gMTIuMDMuMTkgMTk6MjMsIERhdmlkIEhpbGRlbmJyYW5k
IHdyb3RlOgo+Pj4+Cj4+Pj4gSSBndWVzcyBzb21ldGhpbmcgbGlrZSB0aGlzIGNvdWxkIGRvIHRo
ZSB0cmljayBpZiBJIHVuZGVyc3Rvb2QgaXQKPj4+PiBjb3JyZWN0bHk6Cj4+Pj4KPj4+PiBkaWZm
IC0tZ2l0IGEvZHJpdmVycy94ZW4vYmFsbG9vbi5jIGIvZHJpdmVycy94ZW4vYmFsbG9vbi5jCj4+
Pj4gaW5kZXggMzliMjI5ZjllMjU2Li5kMzdkZDViYjdhOGYgMTAwNjQ0Cj4+Pj4gLS0tIGEvZHJp
dmVycy94ZW4vYmFsbG9vbi5jCj4+Pj4gKysrIGIvZHJpdmVycy94ZW4vYmFsbG9vbi5jCj4+Pj4g
QEAgLTYwNCw2ICs2MDQsNyBAQCBpbnQgYWxsb2NfeGVuYmFsbG9vbmVkX3BhZ2VzKGludCBucl9w
YWdlcywgc3RydWN0Cj4+Pj4gcGFnZSAqKnBhZ2VzKQo+Pj4+IMKgwqDCoMKgwqDCoMKgwqAgd2hp
bGUgKHBnbm8gPCBucl9wYWdlcykgewo+Pj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIHBhZ2UgPSBiYWxsb29uX3JldHJpZXZlKHRydWUpOwo+Pj4+IMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIGlmIChwYWdlKSB7Cj4+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgIF9fQ2xlYXJQYWdlT2ZmbGluZShwYWdlKTsKPj4+PiDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcGFnZXNbcGdubysr
XSA9IHBhZ2U7Cj4+Pj4gwqAgI2lmZGVmIENPTkZJR19YRU5fSEFWRV9QVk1NVQo+Pj4+IMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAvKgo+Pj4+IEBAIC02
NDUsOCArNjQ2LDEwIEBAIHZvaWQgZnJlZV94ZW5iYWxsb29uZWRfcGFnZXMoaW50IG5yX3BhZ2Vz
LCBzdHJ1Y3QKPj4+PiBwYWdlICoqcGFnZXMpCj4+Pj4gwqDCoMKgwqDCoMKgwqDCoCBtdXRleF9s
b2NrKCZiYWxsb29uX211dGV4KTsKPj4+Pgo+Pj4+IMKgwqDCoMKgwqDCoMKgwqAgZm9yIChpID0g
MDsgaSA8IG5yX3BhZ2VzOyBpKyspIHsKPj4+PiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCBpZiAocGFnZXNbaV0pCj4+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgaWYgKHBh
Z2VzW2ldKSB7Cj4+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIF9fU2V0UGFnZU9mZmxpbmUocGFnZXNbaV0pOwo+Pj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBiYWxsb29uX2FwcGVuZChwYWdlc1tpXSk7Cj4+
Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfQo+Pj4+IMKgwqDCoMKgwqDCoMKgwqAg
fQo+Pj4+Cj4+Pj4gwqDCoMKgwqDCoMKgwqDCoCBiYWxsb29uX3N0YXRzLnRhcmdldF91bnBvcHVs
YXRlZCAtPSBucl9wYWdlczsKPj4+Pgo+Pj4+Cj4+Pj4gQXQgbGVhc3QgdGhpcyB3YXksIHRoZSBw
YWdlcyBhbGxvY2F0ZWQgKGFuZCB0aHVzIGV2ZW50dWFsbHkgbWFwcGVkIHRvCj4+Pj4gdXNlciBz
cGFjZSkgd291bGQgbm90IGJlIG1hcmtlZCwgYnV0IHRoZSBvdGhlciBvbmVzIHdvdWxkIHJlbWFp
biBtYXJrZWQKPj4+PiBhbmQgY291bGQgYmUgZXhjbHVkZWQgYnkgbWFrZWR1bXB0b29sLgo+Pj4+
Cj4+Pgo+Pj4gSSB0aGluayB0aGlzIHBhdGNoIHNob3VsZCBkbyB0aGUgdHJpY2suIEp1bGllbiwg
Y291bGQgeW91IGdpdmUgaXQgYQo+Pj4gdHJ5PyBPbiB4ODYgSSBjYW4ndCByZXByb2R1Y2UgeW91
ciBwcm9ibGVtIGVhc2lseSBhcyBkb20wIGlzIFBWIHdpdGgKPj4+IHBsZW50eSBvZiB1bnBvcHVs
YXRlZCBwYWdlcyBmb3IgZ3JhbnQgbWVtb3J5IG5vdCBzdWZmZXJpbmcgZnJvbQo+Pj4gbWlzc2lu
ZyAib2ZmbGluZSIgYml0Lgo+Pgo+PiBTdXJlLiBJIG1hbmFnZWQgdG8gZ2V0IHRoZSBjb25zb2xl
IHdvcmtpbmcgd2l0aCB0aGUgcGF0Y2ggc3VnZ2VzdGVkIGJ5Cj4+IERhdmlkLiBGZWVsIGZyZWUg
dG8gYWRkIG15IHRlc3RlZC1ieSBpZiB3aGVuIHlvdSByZXNlbmQgaXQgYXMgaXMuCj4gCj4gRGF2
aWQsIGNvdWxkIHlvdSBwbGVhc2Ugc2VuZCBhIHByb3BlciBwYXRjaCB3aXRoIHlvdXIgU29iPwo+
IAoKWWVzLCBvbiBpdCA6KQoKQ2hlZXJzIQoKPiAKPiBKdWVyZ2VuCj4gCgoKLS0gCgpUaGFua3Ms
CgpEYXZpZCAvIGRoaWxkZW5iCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVu
LWRldmVs
