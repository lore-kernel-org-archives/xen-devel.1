From: Julien Grall <julien.grall@arm.com>
Subject: Re: xen: Can't insert balloon page into VM userspace
 (WAS Re: [linux-linus bisection] complete test-arm64-arm64-xl-xsm)
Date: Thu, 14 Mar 2019 14:12:43 +0000
Message-ID: <cb525882-b52f-c142-8a6a-e5cb491e05d0__23365.6958722108$1552572822$gmane$org@arm.com>
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
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=+3mG=RR=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1h4R6I-0001lz-MS
 for xen-devel@lists.xenproject.org; Thu, 14 Mar 2019 14:12:50 +0000
In-Reply-To: <ec71c03e-987d-2b73-9fe6-2604a3c32017@suse.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Juergen Gross <jgross@suse.com>, David Hildenbrand <david@redhat.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Matthew Wilcox <willy@infradead.org>
Cc: k.khlebnikov@samsung.com, Stefano Stabellini <sstabellini@kernel.org>, Kees Cook <keescook@chromium.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, "VMware,
 Inc." <pv-drivers@vmware.com>, osstest service owner <osstest-admin@xenproject.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, linux-mm@kvack.org, Julien Freche <jfreche@vmware.com>, Nadav Amit <namit@vmware.com>, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

SGksCgpPbiAzLzE0LzE5IDg6MzcgQU0sIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6Cj4gT24gMTIvMDMv
MjAxOSAyMDo0NiwgRGF2aWQgSGlsZGVuYnJhbmQgd3JvdGU6Cj4+IE9uIDEyLjAzLjE5IDE5OjIz
LCBEYXZpZCBIaWxkZW5icmFuZCB3cm90ZToKPj4KPj4gSSBndWVzcyBzb21ldGhpbmcgbGlrZSB0
aGlzIGNvdWxkIGRvIHRoZSB0cmljayBpZiBJIHVuZGVyc3Rvb2QgaXQgY29ycmVjdGx5Ogo+Pgo+
PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy94ZW4vYmFsbG9vbi5jIGIvZHJpdmVycy94ZW4vYmFsbG9v
bi5jCj4+IGluZGV4IDM5YjIyOWY5ZTI1Ni4uZDM3ZGQ1YmI3YThmIDEwMDY0NAo+PiAtLS0gYS9k
cml2ZXJzL3hlbi9iYWxsb29uLmMKPj4gKysrIGIvZHJpdmVycy94ZW4vYmFsbG9vbi5jCj4+IEBA
IC02MDQsNiArNjA0LDcgQEAgaW50IGFsbG9jX3hlbmJhbGxvb25lZF9wYWdlcyhpbnQgbnJfcGFn
ZXMsIHN0cnVjdAo+PiBwYWdlICoqcGFnZXMpCj4+ICAgICAgICAgIHdoaWxlIChwZ25vIDwgbnJf
cGFnZXMpIHsKPj4gICAgICAgICAgICAgICAgICBwYWdlID0gYmFsbG9vbl9yZXRyaWV2ZSh0cnVl
KTsKPj4gICAgICAgICAgICAgICAgICBpZiAocGFnZSkgewo+PiArICAgICAgICAgICAgICAgICAg
ICAgICBfX0NsZWFyUGFnZU9mZmxpbmUocGFnZSk7Cj4+ICAgICAgICAgICAgICAgICAgICAgICAg
ICBwYWdlc1twZ25vKytdID0gcGFnZTsKPj4gICAjaWZkZWYgQ09ORklHX1hFTl9IQVZFX1BWTU1V
Cj4+ICAgICAgICAgICAgICAgICAgICAgICAgICAvKgo+PiBAQCAtNjQ1LDggKzY0NiwxMCBAQCB2
b2lkIGZyZWVfeGVuYmFsbG9vbmVkX3BhZ2VzKGludCBucl9wYWdlcywgc3RydWN0Cj4+IHBhZ2Ug
KipwYWdlcykKPj4gICAgICAgICAgbXV0ZXhfbG9jaygmYmFsbG9vbl9tdXRleCk7Cj4+Cj4+ICAg
ICAgICAgIGZvciAoaSA9IDA7IGkgPCBucl9wYWdlczsgaSsrKSB7Cj4+IC0gICAgICAgICAgICAg
ICBpZiAocGFnZXNbaV0pCj4+ICsgICAgICAgICAgICAgICBpZiAocGFnZXNbaV0pIHsKPj4gKyAg
ICAgICAgICAgICAgICAgICAgICAgX19TZXRQYWdlT2ZmbGluZShwYWdlc1tpXSk7Cj4+ICAgICAg
ICAgICAgICAgICAgICAgICAgICBiYWxsb29uX2FwcGVuZChwYWdlc1tpXSk7Cj4+ICsgICAgICAg
ICAgICAgICB9Cj4+ICAgICAgICAgIH0KPj4KPj4gICAgICAgICAgYmFsbG9vbl9zdGF0cy50YXJn
ZXRfdW5wb3B1bGF0ZWQgLT0gbnJfcGFnZXM7Cj4+Cj4+Cj4+IEF0IGxlYXN0IHRoaXMgd2F5LCB0
aGUgcGFnZXMgYWxsb2NhdGVkIChhbmQgdGh1cyBldmVudHVhbGx5IG1hcHBlZCB0bwo+PiB1c2Vy
IHNwYWNlKSB3b3VsZCBub3QgYmUgbWFya2VkLCBidXQgdGhlIG90aGVyIG9uZXMgd291bGQgcmVt
YWluIG1hcmtlZAo+PiBhbmQgY291bGQgYmUgZXhjbHVkZWQgYnkgbWFrZWR1bXB0b29sLgo+Pgo+
IAo+IEkgdGhpbmsgdGhpcyBwYXRjaCBzaG91bGQgZG8gdGhlIHRyaWNrLiBKdWxpZW4sIGNvdWxk
IHlvdSBnaXZlIGl0IGEKPiB0cnk/IE9uIHg4NiBJIGNhbid0IHJlcHJvZHVjZSB5b3VyIHByb2Js
ZW0gZWFzaWx5IGFzIGRvbTAgaXMgUFYgd2l0aAo+IHBsZW50eSBvZiB1bnBvcHVsYXRlZCBwYWdl
cyBmb3IgZ3JhbnQgbWVtb3J5IG5vdCBzdWZmZXJpbmcgZnJvbQo+IG1pc3NpbmcgIm9mZmxpbmUi
IGJpdC4KClN1cmUuIEkgbWFuYWdlZCB0byBnZXQgdGhlIGNvbnNvbGUgd29ya2luZyB3aXRoIHRo
ZSBwYXRjaCBzdWdnZXN0ZWQgYnkgCkRhdmlkLiBGZWVsIGZyZWUgdG8gYWRkIG15IHRlc3RlZC1i
eSBpZiB3aGVuIHlvdSByZXNlbmQgaXQgYXMgaXMuCgpDaGVlcnMsCgotLSAKSnVsaWVuIEdyYWxs
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
