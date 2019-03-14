From: David Hildenbrand <david@redhat.com>
Subject: Re: xen: Can't insert balloon page into VM userspace
 (WAS Re: [linux-linus bisection] complete test-arm64-arm64-xl-xsm)
Date: Thu, 14 Mar 2019 15:14:56 +0100
Message-ID: <f02aa953-d5d1-4e78-160f-9bca1516379f__27497.5472407945$1552572953$gmane$org@redhat.com>
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
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=mfUP=RR=redhat.com=david@srs-us1.protection.inumbo.net>)
 id 1h4R8R-000261-15
 for xen-devel@lists.xenproject.org; Thu, 14 Mar 2019 14:15:03 +0000
In-Reply-To: <cb525882-b52f-c142-8a6a-e5cb491e05d0@arm.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <julien.grall@arm.com>, Juergen Gross <jgross@suse.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Matthew Wilcox <willy@infradead.org>
Cc: k.khlebnikov@samsung.com, Stefano Stabellini <sstabellini@kernel.org>, Kees Cook <keescook@chromium.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, "VMware,
 Inc." <pv-drivers@vmware.com>, osstest service owner <osstest-admin@xenproject.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, linux-mm@kvack.org, Julien Freche <jfreche@vmware.com>, Nadav Amit <namit@vmware.com>, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

T24gMTQuMDMuMTkgMTU6MTIsIEp1bGllbiBHcmFsbCB3cm90ZToKPiBIaSwKPiAKPiBPbiAzLzE0
LzE5IDg6MzcgQU0sIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6Cj4+IE9uIDEyLzAzLzIwMTkgMjA6NDYs
IERhdmlkIEhpbGRlbmJyYW5kIHdyb3RlOgo+Pj4gT24gMTIuMDMuMTkgMTk6MjMsIERhdmlkIEhp
bGRlbmJyYW5kIHdyb3RlOgo+Pj4KPj4+IEkgZ3Vlc3Mgc29tZXRoaW5nIGxpa2UgdGhpcyBjb3Vs
ZCBkbyB0aGUgdHJpY2sgaWYgSSB1bmRlcnN0b29kIGl0IGNvcnJlY3RseToKPj4+Cj4+PiBkaWZm
IC0tZ2l0IGEvZHJpdmVycy94ZW4vYmFsbG9vbi5jIGIvZHJpdmVycy94ZW4vYmFsbG9vbi5jCj4+
PiBpbmRleCAzOWIyMjlmOWUyNTYuLmQzN2RkNWJiN2E4ZiAxMDA2NDQKPj4+IC0tLSBhL2RyaXZl
cnMveGVuL2JhbGxvb24uYwo+Pj4gKysrIGIvZHJpdmVycy94ZW4vYmFsbG9vbi5jCj4+PiBAQCAt
NjA0LDYgKzYwNCw3IEBAIGludCBhbGxvY194ZW5iYWxsb29uZWRfcGFnZXMoaW50IG5yX3BhZ2Vz
LCBzdHJ1Y3QKPj4+IHBhZ2UgKipwYWdlcykKPj4+ICAgICAgICAgIHdoaWxlIChwZ25vIDwgbnJf
cGFnZXMpIHsKPj4+ICAgICAgICAgICAgICAgICAgcGFnZSA9IGJhbGxvb25fcmV0cmlldmUodHJ1
ZSk7Cj4+PiAgICAgICAgICAgICAgICAgIGlmIChwYWdlKSB7Cj4+PiArICAgICAgICAgICAgICAg
ICAgICAgICBfX0NsZWFyUGFnZU9mZmxpbmUocGFnZSk7Cj4+PiAgICAgICAgICAgICAgICAgICAg
ICAgICAgcGFnZXNbcGdubysrXSA9IHBhZ2U7Cj4+PiAgICNpZmRlZiBDT05GSUdfWEVOX0hBVkVf
UFZNTVUKPj4+ICAgICAgICAgICAgICAgICAgICAgICAgICAvKgo+Pj4gQEAgLTY0NSw4ICs2NDYs
MTAgQEAgdm9pZCBmcmVlX3hlbmJhbGxvb25lZF9wYWdlcyhpbnQgbnJfcGFnZXMsIHN0cnVjdAo+
Pj4gcGFnZSAqKnBhZ2VzKQo+Pj4gICAgICAgICAgbXV0ZXhfbG9jaygmYmFsbG9vbl9tdXRleCk7
Cj4+Pgo+Pj4gICAgICAgICAgZm9yIChpID0gMDsgaSA8IG5yX3BhZ2VzOyBpKyspIHsKPj4+IC0g
ICAgICAgICAgICAgICBpZiAocGFnZXNbaV0pCj4+PiArICAgICAgICAgICAgICAgaWYgKHBhZ2Vz
W2ldKSB7Cj4+PiArICAgICAgICAgICAgICAgICAgICAgICBfX1NldFBhZ2VPZmZsaW5lKHBhZ2Vz
W2ldKTsKPj4+ICAgICAgICAgICAgICAgICAgICAgICAgICBiYWxsb29uX2FwcGVuZChwYWdlc1tp
XSk7Cj4+PiArICAgICAgICAgICAgICAgfQo+Pj4gICAgICAgICAgfQo+Pj4KPj4+ICAgICAgICAg
IGJhbGxvb25fc3RhdHMudGFyZ2V0X3VucG9wdWxhdGVkIC09IG5yX3BhZ2VzOwo+Pj4KPj4+Cj4+
PiBBdCBsZWFzdCB0aGlzIHdheSwgdGhlIHBhZ2VzIGFsbG9jYXRlZCAoYW5kIHRodXMgZXZlbnR1
YWxseSBtYXBwZWQgdG8KPj4+IHVzZXIgc3BhY2UpIHdvdWxkIG5vdCBiZSBtYXJrZWQsIGJ1dCB0
aGUgb3RoZXIgb25lcyB3b3VsZCByZW1haW4gbWFya2VkCj4+PiBhbmQgY291bGQgYmUgZXhjbHVk
ZWQgYnkgbWFrZWR1bXB0b29sLgo+Pj4KPj4KPj4gSSB0aGluayB0aGlzIHBhdGNoIHNob3VsZCBk
byB0aGUgdHJpY2suIEp1bGllbiwgY291bGQgeW91IGdpdmUgaXQgYQo+PiB0cnk/IE9uIHg4NiBJ
IGNhbid0IHJlcHJvZHVjZSB5b3VyIHByb2JsZW0gZWFzaWx5IGFzIGRvbTAgaXMgUFYgd2l0aAo+
PiBwbGVudHkgb2YgdW5wb3B1bGF0ZWQgcGFnZXMgZm9yIGdyYW50IG1lbW9yeSBub3Qgc3VmZmVy
aW5nIGZyb20KPj4gbWlzc2luZyAib2ZmbGluZSIgYml0Lgo+IAo+IFN1cmUuIEkgbWFuYWdlZCB0
byBnZXQgdGhlIGNvbnNvbGUgd29ya2luZyB3aXRoIHRoZSBwYXRjaCBzdWdnZXN0ZWQgYnkgCj4g
RGF2aWQuIEZlZWwgZnJlZSB0byBhZGQgbXkgdGVzdGVkLWJ5IGlmIHdoZW4geW91IHJlc2VuZCBp
dCBhcyBpcy4KPiAKClRoYW5rcywgSSB3aWxsIHNlbmQgYXMgcHJvcGVyIHBhdGNoIGxhdGVyIQoK
Q2hlZXJzIQoKPiBDaGVlcnMsCj4gCgoKLS0gCgpUaGFua3MsCgpEYXZpZCAvIGRoaWxkZW5iCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
